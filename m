Content-Type: multipart/mixed; boundary="===============9062767702387821309=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH brauner] net-sysfs: net_rx_queue_change_owner() can be static
Date: Fri, 14 Feb 2020 06:07:50 +0800
Message-ID: <20200213220747.GA50182@9560152b1213>
In-Reply-To: <202002140651.3Ri4hWg4%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9062767702387821309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 7911cab5a7fd ("net-sysfs: add queue_change_owner()")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 net-sysfs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/net-sysfs.c b/net/core/net-sysfs.c
index 53db98be619873..0f973210a50f5e 100644
--- a/net/core/net-sysfs.c
+++ b/net/core/net-sysfs.c
@@ -997,7 +997,7 @@ net_rx_queue_update_kobjects(struct net_device *dev, in=
t old_num, int new_num)
 #endif
 }
 =

-int net_rx_queue_change_owner(struct net_device *dev, int num)
+static int net_rx_queue_change_owner(struct net_device *dev, int num)
 {
 #ifdef CONFIG_SYSFS
 	int i;
--===============9062767702387821309==--

