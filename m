Content-Type: multipart/mixed; boundary="===============6616767213463971875=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH drm-drm-intel] drm/i915/region: __i915_gem_object_create_stolen() can be static
Date: Fri, 15 Jan 2021 21:19:08 +0800
Message-ID: <20210115131907.GA157975@7f33d48570d8>
In-Reply-To: <202101152108.M87RvDa7-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6616767213463971875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 97d553963250 ("drm/i915/region: convert object_create into object_in=
it")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 i915_gem_stolen.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i=
915/gem/i915_gem_stolen.c
index 27d95bddbf4d228..b221492531efa3d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -621,9 +621,9 @@ static const struct drm_i915_gem_object_ops i915_gem_ob=
ject_stolen_ops =3D {
 	.release =3D i915_gem_object_release_stolen,
 };
 =

-int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
-				    struct drm_i915_gem_object *obj,
-				    struct drm_mm_node *stolen)
+static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
+					   struct drm_i915_gem_object *obj,
+					   struct drm_mm_node *stolen)
 {
 	static struct lock_class_key lock_class;
 	unsigned int cache_level;
@@ -646,10 +646,10 @@ int __i915_gem_object_create_stolen(struct intel_memo=
ry_region *mem,
 	return 0;
 }
 =

-int _i915_gem_object_stolen_init(struct intel_memory_region *mem,
-				 struct drm_i915_gem_object *obj,
-				 resource_size_t size,
-				 unsigned int flags)
+static int _i915_gem_object_stolen_init(struct intel_memory_region *mem,
+					struct drm_i915_gem_object *obj,
+					resource_size_t size,
+					unsigned int flags)
 {
 	struct drm_i915_private *i915 =3D mem->i915;
 	struct drm_mm_node *stolen;
--===============6616767213463971875==--

