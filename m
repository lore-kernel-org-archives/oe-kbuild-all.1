Content-Type: multipart/mixed; boundary="===============5442702717761955370=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] drm/ttm: ttm_pool_apply_caching() can be static
Date: Mon, 26 Oct 2020 03:01:24 +0800
Message-ID: <20201025190124.GA72848@3000059d93ee>
In-Reply-To: <20201025154100.16400-6-christian.koenig@amd.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5442702717761955370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kernel test robot <lkp@intel.com>
---
 ttm_pool.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 86bd173d93a52..a7818b3cd7c6e 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -151,8 +151,8 @@ static void ttm_pool_free_page(struct ttm_pool *pool, e=
num ttm_caching caching,
 }
 =

 /* Apply a new caching to an array of pages */
-int ttm_pool_apply_caching(struct page **first, struct page **last,
-			   enum ttm_caching caching)
+static int ttm_pool_apply_caching(struct page **first, struct page **last,
+				  enum ttm_caching caching)
 {
 #ifdef CONFIG_X86
 	unsigned int num_pages =3D last - first;
--===============5442702717761955370==--

