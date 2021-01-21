Content-Type: multipart/mixed; boundary="===============0653879309496504099=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH drm-drm-misc] drm/ttm: ttm_global_mutex can be static
Date: Fri, 22 Jan 2021 01:53:22 +0800
Message-ID: <20210121175321.GA50714@ceb9c3f5c2ea>
In-Reply-To: <202101220146.vwgtH7ex-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0653879309496504099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 8af8a109b34f ("drm/ttm: device naming cleanup")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 ttm_device.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_dev=
ice.c
index ac0903c9e60ae79..9dee362390f7ed2 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -36,8 +36,8 @@
 /**
  * ttm_global_mutex - protecting the global state
  */
-DEFINE_MUTEX(ttm_global_mutex);
-unsigned ttm_glob_use_count;
+static DEFINE_MUTEX(ttm_global_mutex);
+static unsigned ttm_glob_use_count;
 struct ttm_global ttm_glob;
 EXPORT_SYMBOL(ttm_glob);
=20
--===============0653879309496504099==--

