'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"main.dart.wasm": "7b64fb0a348d96e27cfa3d22243ecffe",
"main.dart.js": "5f6ae71733b348f050609d16c4772b49",
"main.dart.mjs": "90369e5ece0589a0736867473e434b69",
"assets/FontManifest.json": "ad1a2b33dc8645a9ec31ed1b1f6b573a",
"assets/AssetManifest.bin": "6a5f90ec57d5d87dc47683b6e971a867",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/flutter_feather_icons/fonts/feather.ttf": "40469726c5ed792185741388e68dd9e8",
"assets/assets/toseef_resume.pdf": "12628e3abb14f9a2839b7e4603ada2b3",
"assets/assets/images/legacy2.png": "5cc2d2d4193292bc5f286c8f9b48e908",
"assets/assets/images/zeeve3.gif": "d186c2f2663fdfb3f9c6e52ed6a91e9c",
"assets/assets/images/ecoShift1.gif": "5c058116dd199e35438590e30915eeb6",
"assets/assets/images/phaeton3.gif": "8f57305ee61600479dc0d059c7f3a7e6",
"assets/assets/images/legacy1.png": "7198606201dbdd8c4fafc7bf94b3d58c",
"assets/assets/images/parallax3.gif": "eaede65ae0b7107ad2d4c068cd4806bd",
"assets/assets/images/dcomm4.gif": "91e9a15fe797f82443ac83c4e4eadfe5",
"assets/assets/images/legacy3.png": "bdd4bfdc80114f8a907fe34564795eb4",
"assets/assets/images/ecoShift.png": "69d4080209b82b3f632f05339de5ca5a",
"assets/assets/images/zeeve1.jpg": "b393321db1f5a0a23852a02b3dd932e2",
"assets/assets/images/dcomm2.png": "76e5ba7edbe27430f8692748c0162360",
"assets/assets/images/ecoShift2.gif": "6efdde5f51b618a6213dd9d29356b7e7",
"assets/assets/images/zeeve2.gif": "c1fd84859d4d9f4e834f9197c318ae9b",
"assets/assets/images/me.jpg": "2a2e0b4611046c6f4c880589f168a16b",
"assets/assets/images/parallax1.gif": "b61dcd876fa28848b9d8c50d45bc3d46",
"assets/assets/images/parallax2.gif": "4a48d627d1c8b52824e3d6ed8bde4918",
"assets/assets/images/phaeton1.png": "67a157b63de6e9f52d03a9d933f5e32e",
"assets/assets/images/dcomm3.gif": "720b322fe96c3dbc6b4444ea4436686e",
"assets/assets/images/dcomm5.gif": "50eed33a06861716dac36e69f9be29fd",
"assets/assets/images/dcomm1.png": "898209b6bc3f174e1ecc07bca228879b",
"assets/assets/images/phaeton2.gif": "1496cbfb36697c39230d452e63ee65bc",
"assets/assets/display/display4.gif": "040ce1cd7cf724beb5771d2a376093e0",
"assets/assets/display/display2.gif": "832c70d0c46b2c59207299501cce4c3b",
"assets/assets/display/display5.gif": "879eb5afb0688a82c8d105cf5858fe18",
"assets/assets/display/display3.gif": "3be78366bd5e56af94788da4f7bf5143",
"assets/assets/display/display1.gif": "23b0934e7d7fd97c672cb53c7bb1bab4",
"assets/NOTICES": "048378cbcd0399b569b2519f8545c0e6",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "3cd5d7e2089bb1ca2f300d787b9305d4",
"assets/AssetManifest.bin.json": "2fe12f4aba98da1a5271810e8d81e22b",
"index.html": "743b97d19c36fd4b3477173d441cf6b6",
"/": "743b97d19c36fd4b3477173d441cf6b6",
"manifest.json": "8d081ed45db522871abe143393b7f4d1",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.ico": "1d9ae4716f6fe362eede9408947369e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"version.json": "aecefeef61b02d8aac6534e516201efa",
"flutter_bootstrap.js": "e28e0c8e3c3b04e1ab4d3606c42a8bad"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"main.dart.wasm",
"main.dart.mjs",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
