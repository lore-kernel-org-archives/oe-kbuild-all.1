Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAE9248F66
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 22:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.37.86.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779228432; cv=none; b=o88sFk1LYBePoAhh4KBxzrIeWG/hR7ESuxhvOM5azAKIlyhCoUOfWUad35g9Fke14dhgIp9P/dZJiTrbIX+pSk5RCuhDJlNMTj5V3eVYGZNpqUCYTZnAN1V1T4X/5WGURKSd6pRFkhNReuY4NTG1VabXa6rPO6te4GAhsJLbSus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779228432; c=relaxed/simple;
	bh=0MDpWjDkz/t20dRRHbcNfHUS5R5SYW013Lg3UHXYy4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RHi/xdIAkTxYX/jJUXYCT/932IIcA+7ZT8L4LETfboA4eRW5NodVTkrDE5xnVam6aqBJ9dAfxCMeKVAdxXzOOV9Ync/LsfYPwOD4u3wsvo+x/rTIq6F4rNkR95L2SW6w5zI4arPcz27GeCXlJQ4oqhhlGJzdi9J4FmcwsDXhqk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b=Z83dWv80; arc=none smtp.client-ip=173.37.86.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b="Z83dWv80"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1355; q=dns/txt;
  s=iport01; t=1779228429; x=1780438029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+mezfWoQHdVj0OF2VhL7dPuQGNw7CvxzaNnAn1zoIfY=;
  b=Z83dWv80tRWoEQ6rMA55KPM+U50cawjlSseinCwhX36R34dSLiIM71XH
   bWBkulakg1y2KLRRd86QiuRlM7t6mTHYznqOajeFgfP4oHlNKjwlH0iIE
   6xNGMRK8om2NVpo65+ZR3PAnEg7oIdPeTnzjsOwB2xiinKsutKoNfY99q
   DM4XHoQEunZHktuCmKlap3gTkgpAt7mrphxVom+TQrSEc29onnAEAm6t7
   K1on19nQ0qn95m8xJ2E9dHYzZs9WICxQ7eI3UyGA0J3Zo/RUwG1RxQdpH
   ZVJ5WVHQBc+Swt6ABRnDAtp6pqBGX+rOCpagYqjlHWaoMXMHs7ycRLYa9
   Q==;
X-CSE-ConnectionGUID: XECD+3vNQwKgQXt06OLPQg==
X-CSE-MsgGUID: AwNqOutKTBKQeoZkTfvPGA==
X-IPAS-Result: =?us-ascii?q?A0BDAgCK3gxq/5L/Ja1aglmCV3JfQkkErwaFXoF/DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUGAo0xAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhlsCAQMyAUYQUSsrGYMCAYJzAgERsiWCLIEBhH3ZRIFkAQUGFAGBO?=
 =?us-ascii?q?I1ccwGEeycVBoFJRIQHdh6DbIEGhXcEgzCPAkiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFTI8Mh2BIz4XehEbBwWBS4E3cmqBBIReeCIsA0uBK4EJAwsYDUgRLDcUG?=
 =?us-ascii?q?wQ+bgeKTBwPgjGBDiyCDaYVoQ6EJowelToaM6prLodlkHOOCZVnMjeEaIFoP?=
 =?us-ascii?q?IFZMxoIGxWDIhNAGQ+OLRaIc8MHJDUCAToBAQcCBw0DC4FokACBfQEB?=
IronPort-Data: A9a23:hkvUN6iw4LIcGiYMuhm39idIX161bxEKZh0ujC45NGQN5FlHY01je
 htvXzqObPiKNmajc4h3YY6x8kIF6pGHyt9rGgc+pXwxRHxjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeEULOZ82QsaDxMtvvS8EgHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUo181bQjpQ0
 8UHCz80Xgzb2cWS+Iu0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbEuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgl/5JEWxI9EglH5ciZDoVeNrII84nPYy0p6172F3N/9JozRGZoKxBjIz
 o7A103mJAg9KcC89RCmy3+rtOzzkz3Dd6tHQdVU8dYv2jV/3Fc7DB4OfVq9vfS9zEW5Xrp3I
 VYT/SwvoIAx+VatQ927WAe3yFaDs1sfUcdRF+F/4QWJ4q7V+BqCQGwFSCNRLtArqqceQT0sy
 0/MnN7zAzFrmKOaRGjb9bqOqz62fy8PIgc/iTQsVwAJ5Zzn5Yo0lB+KFoclG6+uhdqzEjb1q
 9yXkBUDa3wopZZj/82GEZrv2VpAerChotYJ2zjq
IronPort-HdrOrdr: A9a23:B3l/nK8tuo34+RKoYb5uk+D6I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYKcemvAJsQlzuQzW2gYzRLeDU=
X-Talos-CUID: 9a23:ixh3vm3W5v+5GdBttUy1z7xfKu0OXj6G0lHpPGy3MFZ1EOOybWep9/Yx
X-Talos-MUID: 9a23:sxvkigUFYlMXgLHq/BbzoihFKdtL346NMU0Ko5Y6tde8GgUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,243,1770595200"; 
   d="scan'208";a="483477268"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 May 2026 22:05:59 +0000
Received: from sjc-ads-2636.cisco.com (sjc-ads-2636.cisco.com [171.70.32.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 86BBA18000496;
	Tue, 19 May 2026 22:05:59 +0000 (GMT)
Received: by sjc-ads-2636.cisco.com (Postfix, from userid 470863)
	id 2A086CB4400; Tue, 19 May 2026 15:05:59 -0700 (PDT)
From: Nishanth Sampath Kumar <nissampa@cisco.com>
To: broonie@kernel.org
Cc: lkp@intel.com,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	nissampa@cisco.com
Subject: [PATCH v2] regmap-i2c: fix sparse warning in regmap_smbus_word_write_reg16
Date: Tue, 19 May 2026 15:05:57 -0700
Message-Id: <20260519220557.1574954-1-nissampa@cisco.com>
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
X-Outbound-Node: rcdn-l-core-09.cisco.com

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
index 31e30dfced19..51a04961faf7 100644
--- a/drivers/base/regmap/regmap-i2c.c
+++ b/drivers/base/regmap/regmap-i2c.c
@@ -337,7 +337,7 @@ static int regmap_smbus_word_write_reg16(void *context, const void *data,
 	val = ((u8 *)data)[2];
 
 	return i2c_smbus_write_word_data(i2c, addr_hi,
-					 cpu_to_le16(((u16)val << 8) | addr_lo));
+					 ((u16)val << 8) | addr_lo);
 }
 
 static const struct regmap_bus regmap_smbus_byte_word_reg16 = {
-- 
2.25.1

