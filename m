Content-Type: multipart/mixed; boundary="===============3912544141473916112=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] drm/mm: insert_hole_addr() can be static
Date: Sat, 02 May 2020 05:29:39 +0800
Message-ID: <20200501212939.GA90115@3f1446aad593>
In-Reply-To: <20200430095839.6474-1-nirmoy.das@amd.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3912544141473916112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 drm_mm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index effc6e5cac459..89df90a6052d1 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -245,7 +245,7 @@ RB_DECLARE_CALLBACKS_MAX(static, augment_callbacks,
 			 struct drm_mm_node, rb_hole_addr,
 			 u64, subtree_max_hole, HOLE_SIZE)
 =

-void insert_hole_addr(struct rb_root *root, struct drm_mm_node *node)
+static void insert_hole_addr(struct rb_root *root, struct drm_mm_node *nod=
e)
 {
 	struct rb_node **link =3D &root->rb_node, *rb_parent =3D NULL;
 	u64 start =3D HOLE_ADDR(node), subtree_max_hole =3D node->subtree_max_hol=
e;
--===============3912544141473916112==--

