Content-Type: multipart/mixed; boundary="===============1545106220941991243=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] dma-buf: system_heap: sys_uncached_heap can be static
Date: Tue, 06 Oct 2020 05:21:17 +0800
Message-ID: <20201005212117.GA34870@c357f605a08d>
In-Reply-To: <20201003040257.62768-8-john.stultz@linaro.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1545106220941991243==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kernel test robot <lkp@intel.com>
---
 system_heap.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/sy=
stem_heap.c
index 952f1fd9dacfda..fa17959d81795d 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -22,7 +22,7 @@
 #include <linux/vmalloc.h>
 =

 struct dma_heap *sys_heap;
-struct dma_heap *sys_uncached_heap;
+static struct dma_heap *sys_uncached_heap;
 =

 struct system_heap_buffer {
 	struct dma_heap *heap;
--===============1545106220941991243==--

