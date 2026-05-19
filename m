Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05FA2765D7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 17:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.37.86.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779210521; cv=none; b=ayW+tZKm3LD3HmfvuK8+SNILOSvhR+iSvbPRUPVrSOaRL+ZJXHiAu/WwIRfjAxt095ro1kIWbrjVmNe9yc0UCE565GAAlS78Ng0iSOWlJDbl0P2F5svvGBVEOdLpfPZQ+jpQaXzq1DMQ1aFCkJNiOVgpySHvx0qj5TNl0GjcpNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779210521; c=relaxed/simple;
	bh=HTLscKF1radXHuDpoDeAEMuuNcCrUrEkXJ2dE9bQCMA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cvuCNyKBMAw9QS7rzskvq8FW28/3mvrGArbuEfRmtvvfH0vGNxl1omnSnHjXyHWULdjrUNzuwFQzuVI/KTk2OEBnzDpef4e1Px3jCdnDmpSnMUfQ7EZTE8D6ss0BCegOKe1ij/28GdnfNo7QYVFMDzwUThu5ucm4hrKPz5cRXYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b=Z/LnCfrx; arc=none smtp.client-ip=173.37.86.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b="Z/LnCfrx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1356; q=dns/txt;
  s=iport01; t=1779210520; x=1780420120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0rlBJbeYpA4G3SRKPRCjjseXbirO3GPXQLVu28f2aJ4=;
  b=Z/LnCfrxZw9oTnOJuWlTYBMvRHMmOEQmUPYUMHi6mtla7FF4MXXAndss
   RuDifw8qcP5tCLIeaW9VNxD/1YYshtT58PAX70p3AzSvmt7Try8s0mL33
   238kWLFKTkk/dOyauIuyNrsLueBvH8ZvBgP3K2ZEJgSWETNkTucazSrVT
   ikPlQ/Q72C6BqgHkod9fHihtFjaVJ4v/hTI25J5RMHRwP+WqTnnCnpqII
   FvMp0ThA706ptxOWcbu+2TS8bT7oUXaUgqVo12Vbad7tnd/xcDtlCvGTM
   TX6FAKdspLU0UgLSdrPnKKwrE80Y4rYFoOGfme/d7JqU9VXpd1H2EAFzR
   A==;
X-CSE-ConnectionGUID: jhktkEBMSKWuRGHK29aHWw==
X-CSE-MsgGUID: fQMnxFUMR3aKdmgYrF3W3w==
X-IPAS-Result: =?us-ascii?q?A0BDAgBVmAxq/5X/Ja1aHgEBCxIMggULgldyX0JJBK8Gh?=
 =?us-ascii?q?V6Bfw8BAQEPRA0EAQGFBgKNMgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZbAgEDMgFGEFErKxmDAgGCcwIBEa92giyBAYR92USBZ?=
 =?us-ascii?q?AEFBhQBgTiNXHMBhHsnFQaBSUSEB3Yeg2yBBoV3BIMwjndIgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAzUSKhUyPDIdgSM+F3oRGwcFgUuBN3JqgQSEXngjLANLgSt6AwsYD?=
 =?us-ascii?q?UgRLDcUGwQ+bgeKQxwPgjCBDiyCDaYVoQ6EJowelToaM6pqAS6HZZBzjgmVZ?=
 =?us-ascii?q?zI3hGiBaDyBWTMaCBsVgyITQBkPji0WiHPDNiQ1AgE6AQEHAgcNAwuBaJAAg?=
 =?us-ascii?q?X0BAQ?=
IronPort-Data: A9a23:2YGx+6lhnzhfe7G+L3kUfE3o5gyOJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeWW+BP6qPYzT0cotwaom/p0NV6pPWnYNjHAtlr38wH1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+Za31GONgWYubDpJsvPb83uDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FY8Y+fp0LEtrz
 t8nNQoiTjPZ1uuW/63uH4GAhux7RCXqFJkUtnclyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaz/7C7pm9Ausrn/+aCZRrUqcjaE2+GPUigd21dABNfKJKobWGpsLwB/wS
 mTu8V3cBAE0CfmlkjOm/nejt/XhxhygR9dHfFG/3rsw6LGJ/UQXCwU+VF2nrP3/gUm7M/pVM
 UsT/Csjhas/7kqmSp/6RRLQiHmJ+x0WRttUH6gz7AWlzqvP/x3fAmkCUy4HZNE43OcyRDo3x
 hqKksnvCDhHrrKYUzSe+62SoDf0PjIaRVLufgceRgcDpt2mq4Ypg1eWFJBoEbW+iZv+HjSYL
 y22kRXSTo471aYjv5hXN3ie695wjvAlljII2zg=
IronPort-HdrOrdr: A9a23:OBp/hKHoyF4TftSXpLqEyseALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AkMNd52oAbne4QZvgj/mQtG3mUcIlcWHe4V31GGy?=
 =?us-ascii?q?HFFxGaJ7PGFawx7wxxg=3D=3D?=
X-Talos-MUID: 9a23:LeWAnwmZScB/sqp3XERtdnpsDeJu84qTLXpWmLYKvsa1LwIrBGyC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,243,1770595200"; 
   d="scan'208";a="482476661"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 May 2026 17:08:39 +0000
Received: from sjc-ads-2636.cisco.com (sjc-ads-2636.cisco.com [171.70.32.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 79254180001C1;
	Tue, 19 May 2026 17:08:39 +0000 (GMT)
Received: by sjc-ads-2636.cisco.com (Postfix, from userid 470863)
	id 1B06FCB4400; Tue, 19 May 2026 10:08:39 -0700 (PDT)
From: Nishanth Sampath Kumar <nissampa@cisco.com>
To: broonie@kernel.org
Cc: lkp@intel.com,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	nissampa@cisco.com
Subject: [PATCH] regmap-i2c: fix sparse warning in regmap_smbus_word_write_reg16
Date: Tue, 19 May 2026 10:08:36 -0700
Message-Id: <20260519170836.1344260-1-nissampa@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <202605161621.mY5zFh4D-lkp@intel.com>
References: <202605161621.mY5zFh4D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2636.cisco.com [171.70.32.71];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.32.71, sjc-ads-2636.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com

i2c_smbus_write_word_data() expects a plain u16, but cpu_to_le16()
returns __le16 (a sparse-restricted endian type), causing:

  drivers/base/regmap/regmap-i2c.c:340: sparse: incorrect type in
  argument 3 (different base types)
    expected unsigned short [usertype] value
    got restricted __le16 [usertype]

SMBus already defines byte ordering internally, so cpu_to_le16() is
wrong here. Replace it with a plain (u16) cast.

Fixes: bad4bd28abf4 ("regmap-i2c: add SMBus byte/word reg16 bus for adapters lacking I2C_FUNC_I2C")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605161621.mY5zFh4D-lkp@intel.com/
Signed-off-by: Nishanth Sampath Kumar <nissampa@cisco.com>
---
 drivers/base/regmap/regmap-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap-i2c.c b/drivers/base/regmap/regmap-i2c.c
index 31e30dfced19..ae441fc63127 100644
--- a/drivers/base/regmap/regmap-i2c.c
+++ b/drivers/base/regmap/regmap-i2c.c
@@ -337,7 +337,7 @@ static int regmap_smbus_word_write_reg16(void *context, const void *data,
 	val = ((u8 *)data)[2];
 
 	return i2c_smbus_write_word_data(i2c, addr_hi,
-					 cpu_to_le16(((u16)val << 8) | addr_lo));
+					 ((u16)val << 8) | addr_lo));
 }
 
 static const struct regmap_bus regmap_smbus_byte_word_reg16 = {
-- 
2.25.1

