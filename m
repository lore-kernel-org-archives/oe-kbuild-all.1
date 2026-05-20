Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97CA3438A6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 15:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.37.86.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289942; cv=none; b=Fc8YPfow9zED2i805MGYybgXhmsYBefLakPoWIdILxvHXjBAEZPrseF1uLI6DREK78CN0wgyk1AbTxrzc+y/wAnxXR2IQ6NzAntCVIKnLedamVmjSfNLRT0ff847rKK3nqwBXXh2F9DBHWIec0frgcfnwmzaqzEXxCDFurOpYwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289942; c=relaxed/simple;
	bh=0MDpWjDkz/t20dRRHbcNfHUS5R5SYW013Lg3UHXYy4w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kevZJwMeZo1kKXVM5F7lculWD3SKdrwPFA94+1JbzS7dkNf391xqZzk3i3ocAKBo6SBCcE4TnS1sOIaItvmyjV+mmSfr30W3MliYrDb9aZ5pQw16AudMsFXCMJZneMYzpndXohGfFAeNjw7mTfS/xnWGkXW78GAlyQsXP/PTjMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b=YGKsYgOD; arc=none smtp.client-ip=173.37.86.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b="YGKsYgOD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1355; q=dns/txt;
  s=iport01; t=1779289940; x=1780499540;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+mezfWoQHdVj0OF2VhL7dPuQGNw7CvxzaNnAn1zoIfY=;
  b=YGKsYgODcm0JqHzoT1hXJd6RGulW5sE4u71/0nntmarW0k4sL1IJ96ri
   4gw9VTKCALQme8ghs4o5y97vtPZ8sVX6MXk3I4kA/mQRGy42q7TJ4aSkA
   VFMjLfuFvnBN/+20JuiKXtrA7EqAGMArk63opAo9NDkz4Z3nU+8a+TEuu
   BxpW5zNujggcyGnwpe1FeAYGHX3Nw8YM9xklHUUXZZoDErlwkxH2fu28/
   G3+wEWXwx+2D0nfJl0v9JU+UxBaxGfjvsCPOiTS4SjZjOAJ89qu7r6a9U
   mVEnrNRfe3FFlQnUWKoLYYYQqlCKI1O8KlsR7nmFp7e+V8by2061VICUr
   Q==;
X-CSE-ConnectionGUID: 9qedllIwSYiClfwfd5VNAQ==
X-CSE-MsgGUID: VvjWl5MYSqOkJK9KgKz6Kw==
X-IPAS-Result: =?us-ascii?q?A0BAAgAvzg1q/4z/Ja1aHgEBCxIMggULgldyX0JJBK8Hh?=
 =?us-ascii?q?V+Bfw8BAQEPRA0EAQGFBo00AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8Nhl02AUaBDESDAgGCcwIBEbMNgiyBAYR92USBZAEFBhQBg?=
 =?us-ascii?q?TiNXHMBhHsnFQaBSUSEB3Yeg2yBBoV3BIMujntIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhUyPDIdgSM+F3oRGwcFgUuBN3JqgQSEV3gjLANOgS2BCAMLGA1IESw3F?=
 =?us-ascii?q?BsEPm4Hik4cD4IxgQ4sgg2mFaEOhCaMHpU6GjOqai6HZZByjgmVZzI3hGiBa?=
 =?us-ascii?q?DyBWTMaCBsVgyITQBkPji0WiHPDXCQ1AgE6AQEHAgcNAwuBaJAAgX0BAQ?=
IronPort-Data: A9a23:bronO6xQAkmJOjtmHHR6t+c4xyrEfRIJ4+MujC+fZmUNrF6WrkUOm
 2NLCG/VP67fZTb9edh/Od7l/UgB6MfTz9I1TgNppFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4iaT/H3Ygf/hWYpaDpMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBAvMIEc/sdoOlBP3
 vgWNz4BMy6lrtvjldpXSsE07igiBNPgMIVavjRryivUSK59B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cO3WjOX9PYH46tOGpnWL2diVRgFmUvqEwpWPUyWSd1ZCxYIaNIYbVHJg9ckCwm
 HzEwGCkJyAhLfuc6xnU0X2PlLHsgnauMG4VPPjinhJwu3WXxXQ7CRsKWF/9qv684ma0QdVYL
 U0Z0ikjt64/8AqsVNaVdxq15X2Oox8YV59ZF+kS7ACW1rGS5wefG3hCQjNfAPQitckrVXkp2
 0WPktfBGzNiqvuWRGib+7PSqim9URX5NkcYbiMCCA9A6N75rcRr1VTET81oF+i+idid9SzM/
 g1mZRMW39075fPnHY3ilbwbq1pAfqT0czM=
IronPort-HdrOrdr: A9a23:jOh28KjBiqAGUsCpzlan4c8BNXBQXuwji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gcSVbSO09QYKcemsAJsQiDtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AVwRtPmhIbz53lyjSEvF5XheY0DJuI2TQwHPUAlC?=
 =?us-ascii?q?DOGdCTLOKR1PNxoVNqp87?=
X-Talos-MUID: 9a23:kQ/pYQZhOrjqX+BTiSHuuzU/EfZT+oOtKmNcspolqZenKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,244,1770595200"; 
   d="scan'208";a="484032715"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 May 2026 15:11:11 +0000
Received: from sjc-ads-2636.cisco.com (sjc-ads-2636.cisco.com [171.70.32.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id A9976180001F3;
	Wed, 20 May 2026 15:11:11 +0000 (GMT)
Received: by sjc-ads-2636.cisco.com (Postfix, from userid 470863)
	id 4F656CB4400; Wed, 20 May 2026 08:11:11 -0700 (PDT)
From: Nishanth Sampath Kumar <nissampa@cisco.com>
To: broonie@kernel.org
Cc: lkp@intel.com,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	nissampa@cisco.com
Subject: [PATCH v2] regmap-i2c: fix sparse warning in regmap_smbus_word_write_reg16
Date: Wed, 20 May 2026 08:11:09 -0700
Message-Id: <20260520151109.2380894-1-nissampa@cisco.com>
X-Mailer: git-send-email 2.35.6
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2636.cisco.com [171.70.32.71];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.32.71, sjc-ads-2636.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com

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

