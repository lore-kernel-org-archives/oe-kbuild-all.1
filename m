Content-Type: multipart/mixed; boundary="===============1097061108160966665=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH android-goldfish] EDAC: dev_attr_legacy_ch6_dimm_label can be static
Date: Fri, 01 Jan 2021 08:24:13 +0800
Message-ID: <20210101002413.GA20609@5b84d970701b>
In-Reply-To: <202101010816.gvjaSUpn-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1097061108160966665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: a788b724f44f ("EDAC: Correct channel count limit")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 edac_mc_sysfs.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/edac_mc_sysfs.c b/drivers/edac/edac_mc_sysfs.c
index 0d98023bf1f78f..fc7275c648095e 100644
--- a/drivers/edac/edac_mc_sysfs.c
+++ b/drivers/edac/edac_mc_sysfs.c
@@ -321,9 +321,9 @@ DEVICE_CHANNEL(ch4_dimm_label, S_IRUGO | S_IWUSR,
 	channel_dimm_label_show, channel_dimm_label_store, 4);
 DEVICE_CHANNEL(ch5_dimm_label, S_IRUGO | S_IWUSR,
 	channel_dimm_label_show, channel_dimm_label_store, 5);
-DEVICE_CHANNEL(ch6_dimm_label, S_IRUGO | S_IWUSR,
+static DEVICE_CHANNEL(ch6_dimm_label, S_IRUGO | S_IWUSR,
 	channel_dimm_label_show, channel_dimm_label_store, 6);
-DEVICE_CHANNEL(ch7_dimm_label, S_IRUGO | S_IWUSR,
+static DEVICE_CHANNEL(ch7_dimm_label, S_IRUGO | S_IWUSR,
 	channel_dimm_label_show, channel_dimm_label_store, 7);
 =

 /* Total possible dynamic DIMM Label attribute file table */
@@ -351,9 +351,9 @@ DEVICE_CHANNEL(ch4_ce_count, S_IRUGO,
 		   channel_ce_count_show, NULL, 4);
 DEVICE_CHANNEL(ch5_ce_count, S_IRUGO,
 		   channel_ce_count_show, NULL, 5);
-DEVICE_CHANNEL(ch6_ce_count, S_IRUGO,
+static DEVICE_CHANNEL(ch6_ce_count, S_IRUGO,
 		   channel_ce_count_show, NULL, 6);
-DEVICE_CHANNEL(ch7_ce_count, S_IRUGO,
+static DEVICE_CHANNEL(ch7_ce_count, S_IRUGO,
 		   channel_ce_count_show, NULL, 7);
 =

 /* Total possible dynamic ce_count attribute file table */
--===============1097061108160966665==--

