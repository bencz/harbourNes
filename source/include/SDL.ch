#ifndef HB_SDL_CH_
#define HB_SDL_CH_

#define SDL_QUIT           0x100
#define SDL_KEYDOWN        0x300
#define SDL_KEYUP          0x301

********************************************************************************
********************************************************************************
********************************************************************************

#define SDL_WINDOW_FULLSCREEN     0x00000001         /**< fullscreen window */
#define SDL_WINDOW_OPENGL         0x00000002             /**< window usable with OpenGL context */
#define SDL_WINDOW_SHOWN          0x00000004              /**< window is visible */
#define SDL_WINDOW_HIDDEN         0x00000008             /**< window is not visible */
#define SDL_WINDOW_BORDERLESS     0x00000010         /**< no window decoration */
#define SDL_WINDOW_RESIZABLE      0x00000020          /**< window can be resized */
#define SDL_WINDOW_MINIMIZED      0x00000040          /**< window is minimized */
#define SDL_WINDOW_MAXIMIZED      0x00000080          /**< window is maximized */
#define SDL_WINDOW_INPUT_GRABBED  0x00000100      /**< window has grabbed input focus */
#define SDL_WINDOW_INPUT_FOCUS    0x00000200        /**< window has input focus */
#define SDL_WINDOW_MOUSE_FOCUS    0x00000400        /**< window has mouse focus */
#define SDL_WINDOW_FULLSCREEN_DESKTOP  ( SDL_WINDOW_FULLSCREEN | 0x00001000 )
#define SDL_WINDOW_FOREIGN        0x00000800            /**< window not created by SDL */
#define SDL_WINDOW_ALLOW_HIGHDPI  0x00002000      /**< window should be created in high-DPI mode if supported.
                                                     On macOS NSHighResolutionCapable must be set true in the
                                                     application's Info.plist for this to have any effect. */
#define SDL_WINDOW_MOUSE_CAPTURE  0x00004000      /**< window has mouse captured (unrelated to INPUT_GRABBED) */
#define SDL_WINDOW_ALWAYS_ON_TOP  0x00008000      /**< window should always be above others */
#define SDL_WINDOW_SKIP_TASKBAR   0x00010000      /**< window should not be added to the taskbar */
#define SDL_WINDOW_UTILITY        0x00020000      /**< window should be treated as a utility window */
#define SDL_WINDOW_TOOLTIP        0x00040000      /**< window should be treated as a tooltip */
#define SDL_WINDOW_POPUP_MENU     0x00080000      /**< window should be treated as a popup menu */
#define SDL_WINDOW_VULKAN         0x10000000       /**< window usable for Vulkan surface */


********************************************************************************
********************************************************************************
********************************************************************************

#define SDL_WINDOWPOS_UNDEFINED_MASK    0x1FFF0000u
#define SDL_WINDOWPOS_UNDEFINED_DISPLAY(X)  (SDL_WINDOWPOS_UNDEFINED_MASK|(X))
#define SDL_WINDOWPOS_UNDEFINED         SDL_WINDOWPOS_UNDEFINED_DISPLAY(0)
#define SDL_WINDOWPOS_ISUNDEFINED(X)  (((X)&0xFFFF0000) == SDL_WINDOWPOS_UNDEFINED_MASK)

********************************************************************************
********************************************************************************
********************************************************************************

#define SDL_RENDERER_SOFTWARE       0x00000001         /**< The renderer is a software fallback */
#define SDL_RENDERER_ACCELERATED    0x00000002      /**< The renderer uses hardware
                                                     acceleration */
#define SDL_RENDERER_PRESENTVSYNC   0x00000004     /**< Present is synchronized
                                                     with the refresh rate */
#define SDL_RENDERER_TARGETTEXTURE  0x00000008     /**< The renderer supports
                                                     rendering to texture */
                                                     
********************************************************************************
********************************************************************************
********************************************************************************

#define SDL_DEFINE_PIXELFORMAT(type, order, layout, bits, bytes) ((1 << 28) | ((type) << 24) | ((order) << 20) | ((layout) << 16) | ((bits) << 8) | ((bytes) << 0))
     
#define SDL_PIXELFORMAT_ARGB8888 SDL_DEFINE_PIXELFORMAT(6, 3, 6, 32, 4)

#define SDL_TEXTUREACCESS_STATIC     0   /**< Changes rarely, not lockable */
#define SDL_TEXTUREACCESS_STREAMING  1   /**< Changes frequently, lockable */
#define SDL_TEXTUREACCESS_TARGET     2
    
#endif 