Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F9B361DBC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 12:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555772; cv=none; b=EE+tucfXxbMn9aY6YF2g+cS+qXB0/rNo91jIAWEYcPt62aQksef8sHRDh7QKJgZZFeE04cQ5sNvj2QBP27xMYyIpZq0OMtd0Twlr5LdE+eTfHTIHvCShk8KCAsTj3AvdbjdmiZChzOigr2/XLgmc+zgvTnjBH35fnhIKLFxt0Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555772; c=relaxed/simple;
	bh=EnMfEZ4QkIAdynBjiahHjs3Z6HB/axdMWtZKOM/vCas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AMUXB9Cae6B1WS2jaFFufshirh7BS3GKCMpiO1AswB9TGEEtO54Y6N/0Ux0CDKc7lGfE9JqtB53VbzS8VisxRfAUARINWqmonEazWEDzOPj6sS6Jkaw9hFDZgzEMa4w0VQJ7u6bh3TsHEEAsBX3oZ94iSp1pcrXXOO6vplvNphc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tVxdLG4y; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tVxdLG4y"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso34936455e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 04:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763555765; x=1764160565; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=12KHTdCj9uQ2KXxVz6vWKPRafgjTPXAyRlFxqpBHLk0=;
        b=tVxdLG4yLcCW5O4pS+P+g2h2Efj1IApFDer0Mn/5dMF3cax1YpSXvrpJFdxPeJ7bok
         4MYRqcikPL3mdgEQdoDUhQIkfdjG08qEJv5hbGQI0HtVwl6769AisyaEWEqm6jI5v6Vm
         GLgid8z4fGu1BLRTGRvEZg+HEWNwdYbV4zM0vJ4ob3FPKuIP1UPovHVHj4mc22tVy58d
         2YHmGo+8QNGtLtW4E21IIvjIXp0QJg9NdVAI7Emt8DzM252w0cFZ8UuVPYVJhF36iyK2
         vBwaDOJsMADHUESc60OW2pyieUi4rjm2F3mmNp/sx0dXJPCfNjcEAPtylwRHHvigINdT
         4aOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763555765; x=1764160565;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12KHTdCj9uQ2KXxVz6vWKPRafgjTPXAyRlFxqpBHLk0=;
        b=c3mx5cf9cfH3TkWmXasvLUpqeWrlpG/Aj0dVRqQvjsKKPjKcC/y1g4ml1XqGUdMBye
         RgUM8Vv8JTiqK73w1ox30fD/F1UH6szyDYC74OQovYwjbGHP1+0VVmUCtR7VsyKD3Fb5
         itYEnhZAP1e72005iFKyFC0o8zBc72/Q7xCOfK9SB5NLEsULMEhVibLqPuQZvd3RS7lJ
         QYAmY3olMO+BcFaSKBnG4KJCq5A2fLKdEwc5fdrWODJbkC6SdDG4Pni2HrNeCllVKT/2
         gXndMsBLg7N0dFJaXoN+9SclwVxDGqlKJtdTm3/qcpshRZketP1b6pqjDY7+u/Si4GFJ
         7xIA==
X-Forwarded-Encrypted: i=1; AJvYcCVjPP5dlBemAK+RLb4Zjtp4CtSlZn0tvb4r5wmkQiLK0XNIkHoU+iAU9V8zaJcPylcQEdBw1WBZyvJhXb75@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5jl74UZNLzxJy9ha3ttZGh16cpfZvegQARnnkcHEfQ8O/o4Rt
	r0J55k7KaYPJm/7C4BSVGqBeupG9h96H8ecYBC4L1VMIcPOrC+uGk6M8+2CXfXICPMKq9hDNA5C
	lONRK
X-Gm-Gg: ASbGncuYWS5rLcoM5Us61Ob7YtusZECkZfdaG0HE527e+sIBXO/lWNNuVYfgD3/P+xu
	NEGkcq2AEahjwOKSFVBfl0NMoQ1Qen4zB9aaxJ3iOp0mmBHDSzk4Cq+Up0gUkEPOoET5i81ZTqt
	AGsx09Vfx6AAzjFEUoXxOVfW2QgwSPuG+IMWEfO8RJK4GvFHKGzhDYaAShShGZFNI8WUcGWIeQt
	Ye4USLE+ItTV0TfngF7XwxZnbrsHGvp+N7UnGV5FpTiLaPtGekVMoKee2ZRr9nNlnmQ3g8WTKd+
	lRnWfWrqr2fHQz8J/CAogP+5Wem0iiDxfvhLjFC9uu1l3KXj/vDRiTv8Q7jfiaABLEYQc7bTkfV
	d0NIY4JsSDgmzIcJorZvCRBPH7T4qG5hyvD0/S37xN16rh+ezQgihXjgtLEJ61DCnet/fNKHUHY
	DBZKFGqXg/X2muYCo5cuNTVUBBoXWF4F6qOedoAg==
X-Google-Smtp-Source: AGHT+IFWB53ZXOS4PvwKC7P6NjsFE5FiZi+2vXWb0i5n9X/h6mk/TDgvGSLdIXDkxsKDnEKsOWeDPg==
X-Received: by 2002:a05:600c:8b22:b0:477:7a1a:4b81 with SMTP id 5b1f17b1804b1-4778fe57115mr186037325e9.9.1763555764772;
        Wed, 19 Nov 2025 04:36:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42c9628ebacsm24992839f8f.30.2025.11.19.04.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:36:04 -0800 (PST)
Date: Wed, 19 Nov 2025 15:36:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Frank Wunderlich <frank-w@public-files.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-rc_new 42/108]
 drivers/net/phy/as21xxx.c:1176 aeon_c45_an_config_aneg() error:
 uninitialized symbol 'changed'.
Message-ID: <202511151513.Hnqzn6wc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-rc_new
head:   eb43ba8536a5d22d51b0f384a239728b30ede362
commit: d16e92f56bf7e04bc87f39d34d70b47969767b11 [42/108] net: phy: as21: try the driver from mtk-sdk
config: nios2-randconfig-r071-20251114 (https://download.01.org/0day-ci/archive/20251115/202511151513.Hnqzn6wc-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511151513.Hnqzn6wc-lkp@intel.com/

New smatch warnings:
drivers/net/phy/as21xxx.c:1176 aeon_c45_an_config_aneg() error: uninitialized symbol 'changed'.

Old smatch warnings:
drivers/net/phy/as21xxx.c:549 aeon_ipc_send_cmd() warn: unsigned 'val' is never less than zero.
drivers/net/phy/as21xxx.c:557 aeon_ipc_send_cmd() warn: unsigned 'val' is never less than zero.

vim +/changed +1176 drivers/net/phy/as21xxx.c

830877d89edcd83 Christian Marangi 2025-05-17  1148  
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1149  static int aeon_c45_an_config_aneg(struct phy_device *phydev)
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1150  {
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1151  	int changed, ret;

changed is never initialized to false, only true.

d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1152  	u32 adv;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1153  	linkmode_and(phydev->advertising, phydev->advertising,
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1154  		     phydev->supported);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1155  	//changed = genphy_config_eee_advert(phydev);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1156  	adv = linkmode_adv_to_mii_adv_t(phydev->advertising);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1157  	ret = phy_modify_mmd(phydev, MDIO_MMD_AN, MDIO_AN_ADVERTISE,
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1158  				  ADVERTISE_ALL | ADVERTISE_100BASE4 |
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1159  					  ADVERTISE_PAUSE_CAP |
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1160  					  ADVERTISE_PAUSE_ASYM,
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1161  				  adv);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1162  	if (ret < 0)
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1163  		return ret;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1164  	if (ret > 0)
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1165  		changed = 1;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1166  	adv = linkmode_adv_to_mii_10gbt_adv_t(phydev->advertising);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1167  	ret = phy_modify_mmd(phydev, MDIO_MMD_AN, MDIO_AN_10GBT_CTRL,
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1168  				  MDIO_AN_10GBT_CTRL_ADV10G |
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1169  					  MDIO_AN_10GBT_CTRL_ADV5G |
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1170  					  MDIO_AN_10GBT_CTRL_ADV2_5G,
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1171  				  adv);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1172  	if (ret < 0)
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1173  		return ret;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1174  	if (ret > 0)
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1175  		changed = 1;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11 @1176  	return changed;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1177  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

