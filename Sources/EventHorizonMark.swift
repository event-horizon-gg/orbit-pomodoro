import SwiftUI
import AppKit

/// The Event Horizon logo, drawn from the watermark's alpha in the current theme's accent.
struct EventHorizonMark: View {
    var tint: Color
    var opacity: Double = 0.13
    private static let image: NSImage? = {
        let url = Bundle.main.url(forResource: "event-horizon-watermark", withExtension: "png")
            // Unbundled builds: read it straight from the repo.
            ?? URL(fileURLWithPath: #filePath).deletingLastPathComponent().deletingLastPathComponent().appendingPathComponent("Assets/Brand/event-horizon-watermark.png")
        guard let image = NSImage(contentsOf: url) else { return nil }
        image.isTemplate = true
        return image
    }()

    var body: some View {
        if let image = Self.image {
            Image(nsImage: image).renderingMode(.template).resizable().interpolation(.high).aspectRatio(contentMode: .fit)
                .foregroundStyle(tint).opacity(opacity).allowsHitTesting(false).accessibilityHidden(true)
        }
    }
}
