Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31DB367B64
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 16:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.37.86.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779209612; cv=none; b=DLDPCl3DWVs7Td/ov+kuDBnx6v3I1c743keyXSZBowQZIsxZ/qeutAVllUE+IiPeY13NI64VqHQfQLtiFuRKoGmwve0P/2xuHR3hHEm7Dq4TvScfXoryDqQZSkyI/dEPZ6kdPX9d5ALBQp+MjUtBiVJx9qx81HnyNyOcZc3PYCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779209612; c=relaxed/simple;
	bh=Txj5mNdB8zv4/ryJ8ss0YW7ncjB2gT3ONeMgCnZ8xgI=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-Reply-To:
	 References:Message-Id:Date; b=JmjFZ5iTq10nye/+4Gs3iGd7I+NZen7IiwVc0JVbMn28EVmSD3KstnQeCdujcNVIKFXEuPpOhwj5BbIj+mgtSicMEA04Zr/6oQMUy3/1YQroc7P5CgE2J7Lpx8kpovNXkXpL0tdPAlM76Au2SwztBOx5jnPGhBuwRDA8jLinygg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b=eEcc4hok; arc=none smtp.client-ip=173.37.86.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b="eEcc4hok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1796; q=dns/txt;
  s=iport01; t=1779209610; x=1780419210;
  h=mime-version:from:to:cc:subject:in-reply-to:references:
   message-id:date;
  bh=SyZKYOskO1Cq1Gu2LsXL1+3IJ/q4trzN69Jvba9x7Z4=;
  b=eEcc4hok+esGUOL2jSOxEtm1hQW3xHXgKaeY9nuTfjVkbvyUEShT7LgU
   VIvaT0FMM2qTdwuOmNaOjldJMkTL4yGYue3nF0XCBZnHswFGWoIfnD5/8
   sCKPe2FQo6jjKlJleC9vF40aDCHbGtKLEQE8W6pduOdsnpT2M3Idz9q1f
   5lDtQWBFXvojD/g5BAZr1qSzKRy2GwKKwdZBUIrg9FKWlqKMBStGATIUM
   mi2WjB7dIaJaQuMg3tVXQUsvKuxnZNigWuufe6eE8eYzva4/gy0Eg0J/H
   6v8vOdPQsQjsB9Z5/DU7Jws1O23RVStc6ejlD1kcfWD7f9i6BwMrh06Ny
   g==;
X-CSE-ConnectionGUID: GmFU0ivGSaeGXIcC2xfmqw==
X-CSE-MsgGUID: zjSDMwA5QrSqOwjGjG07YQ==
X-IPAS-Result: =?us-ascii?q?A0B4AwDllAxq/43/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZyXkNJBIsbgVSJW5g8hV6Bfw8BAQEPRA0EAQGFBgKNMgImNAkOAQIEAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBA3kQGQMDAQIvTggGE?=
 =?us-ascii?q?4MDgnMDEa95eIE0gQHeQYFkAQUGFAGBOAGFPoMaAYVdGAGEeycVBoFJRIFHA?=
 =?us-ascii?q?4I9dh6DbFmGJASDMIFdjRqCQiwBVRMXCwcFgWYDgQYyPDIdgSM+FzNHERsHB?=
 =?us-ascii?q?YFLgTdyaoEEhF54IywDS4ErcAoDC209NxQbi3ocD4IwgQ4sgg2lKg+haoQmj?=
 =?us-ascii?q?B6VOk2XZpMEAS6HZZBzjgmVZzKFH4FoPIFZMxoIGxWDIhNAGQ+OLRaIc8MLR?=
 =?us-ascii?q?zICAToBAQcCBw0DC4FokACBfQEB?=
IronPort-Data: A9a23:+d1c3q3slWB/EGU8ofbD5d1wkn2cJEfYwER7XKvMYLTBsI5bpzZSm
 msaXj+Eb/+DazD9fN5wOoqz8ENXvcXcndRnQQJv3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX4
 rsen+WFYAX7g2MtYzpPg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGI0QYANUZ5MlMCGxhx
 d0TA2odYBWamLfjqF67YrEEasULNsLnOsYb/3pn1zycVapgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiZC/FMEg9/5JYWmuaznXD6azRwo1OOrq1x6G/WpOB0+OS9aoaLJYHUFK25mG6Kp
 Fnq2nvQXygAD8W41jiq8F302d72yHaTtIU6UefQGuRRqFmQ3kQSDgEbUR2wpvzRokSkXNVZK
 kE8+Sc0q6U2skuxQbHVWBD9o3SZvxoQHtNUF8U+6RqR0ezQ4gCEFi4IQyApQNgnstImAD8nz
 FmEm/v3CjF19r6YU3SQ8vGTtzzaBMQOBXUJaSlBSU4O5MPu5dlvyBnOVd1kVqWyi7UZBA3N/
 txDlwBm7517sCLB//zjlbwbq1pAfqT0czM=
IronPort-HdrOrdr: A9a23:OAAFM6kwblBLs+bCC4V3LlImFmvpDfIG3DAbv31ZSRFFG/FwWf
 rBoB1773XJYVkqKRQdcLy7VJVoBEm9yXcX2+Qs1MmZLWvbUQKTRekI0WKh+UyCJ8SUzI9gPM
 lbHJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uq0uEiWpRGsddB8ATMHf9LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AcxBGhWq7HdaVlozP79QXJI7mUe8gXECFzWn/GEa?=
 =?us-ascii?q?1JlZIQ5bPWVGV4bwxxg=3D=3D?=
X-Talos-MUID: 9a23:S/V+fgY3dGUGL+BTpT3XqBR9HZpR+Z+3L18Pvpcp45a1DHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,243,1770595200"; 
   d="scan'208,223";a="482467569"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 May 2026 16:52:05 +0000
Received: from [127.0.1.1] (vxr-slurm-252.cisco.com [172.26.228.175])
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTP id 4813518000193;
	Tue, 19 May 2026 16:52:05 +0000 (GMT)
Content-Type: multipart/mixed; boundary="===============7072976810522956900=="
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nishanth Sampath Kumar <nissampa@cisco.com>
To: Mark Brown <broonie@kernel.org>
Cc: lkp@intel.com, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, nissampa@cisco.com
Subject: [PATCH] regmap-i2c: fix sparse warning in regmap_smbus_word_write_reg16
In-Reply-To: <202605161621.mY5zFh4D-lkp@intel.com>
References: <202605161621.mY5zFh4D-lkp@intel.com>
Message-Id: <20260519165205.4813518000193@rcdn-l-core-04.cisco.com>
Date: Tue, 19 May 2026 16:52:05 +0000 (GMT)
X-Outbound-Client-TLS: NONE;vxr-slurm-252.cisco.com [172.26.228.175]
X-Outbound-SMTP-Client: 172.26.228.175, vxr-slurm-252.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com

--===============7072976810522956900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From 12085a8445d18202a59e3558118f74db32673b17 Mon Sep 17 00:00:00 2001
From: Nishanth Sampath Kumar <nissampa@cisco.com>
Date: Tue, 19 May 2026 09:41:53 -0700
Subject: [PATCH] regmap-i2c: fix sparse warning in
 regmap_smbus_word_write_reg16

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
index 31e30dfced19..9102d8b20896 100644
--- a/drivers/base/regmap/regmap-i2c.c
+++ b/drivers/base/regmap/regmap-i2c.c
@@ -337,7 +337,7 @@ static int regmap_smbus_word_write_reg16(void *context, const void *data,
 	val = ((u8 *)data)[2];
 
 	return i2c_smbus_write_word_data(i2c, addr_hi,
-					 cpu_to_le16(((u16)val << 8) | addr_lo));
+					(u16)(((u16)val << 8) | addr_lo));
 }
 
 static const struct regmap_bus regmap_smbus_byte_word_reg16 = {
-- 
2.25.1


--===============7072976810522956900==--
