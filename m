Content-Type: multipart/mixed; boundary="===============3666936986268488096=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH thomash] drm/i915: i915_gem_ttm_obj_ops can be static
Date: Thu, 20 May 2021 15:50:48 +0800
Message-ID: <20210520075047.GA11757@78af2acee5b5>
In-Reply-To: <202105201555.B8qPUapX-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3666936986268488096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

drivers/gpu/drm/i915/gem/i915_gem_ttm.c:569:38: warning: symbol 'i915_gem_t=
tm_obj_ops' was not declared. Should it be static?

Fixes: ed0bde777934 ("drm/i915: Use ttm mmap handling for ttm bo's.")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 i915_gem_ttm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915=
/gem/i915_gem_ttm.c
index a94ee2b62fa3a..68fe64401c67f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -566,7 +566,7 @@ static const struct vm_operations_struct vm_ops_ttm =3D=
 {
 	.close =3D i915_gem_mmap_vm_close,
 };
 =

-const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops =3D {
+static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops =3D {
 	.name =3D "i915_gem_object_ttm",
 	.flags =3D I915_GEM_OBJECT_HAS_IOMEM,
=20
--===============3666936986268488096==--

