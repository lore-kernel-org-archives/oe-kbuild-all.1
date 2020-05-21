Content-Type: multipart/mixed; boundary="===============7516955660752650565=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: kbuild-all@lists.01.org
Subject: Re: [linux-nvme:nvme-5.8 26/33] io-cmd-bdev.c:undefined reference to `t10_pi_type1_crc'
Date: Thu, 21 May 2020 21:47:02 +0200
Message-ID: <20200521194702.GA23114@lst.de>
In-Reply-To: <202005220306.P96iFPve%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7516955660752650565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ok, looks like the previous fix wasn't enough.  It seems like we
need to fold this in, similar to sd and the nvme host driver:

diff --git a/drivers/nvme/target/Kconfig b/drivers/nvme/target/Kconfig
index d7f48c0fb311f..4474952d64c6b 100644
--- a/drivers/nvme/target/Kconfig
+++ b/drivers/nvme/target/Kconfig
@@ -4,6 +4,7 @@ config NVME_TARGET
 	tristate "NVMe Target support"
 	depends on BLOCK
 	depends on CONFIGFS_FS
+	select BLK_DEV_INTEGRITY_T10 if BLK_DEV_INTEGRITY
 	select SGL_ALLOC
 	help
 	  This enabled target side support for the NVMe protocol, that is
--===============7516955660752650565==--

