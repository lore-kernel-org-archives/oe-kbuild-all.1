Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1C8360ED5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 06:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779345477; cv=none; b=bfSHNgD0vMGUXV1GNyDAzVjZ2lTgtnEYbdZNqDlaUUwhWuF3hnAdz24HBoWirb+MYEz/MWGpSnTSCCCJ/ku1R8l47GLbT8o5ulRkO7dEfX5ZOPazFL4iVk5Ih/BRs+n+vIzSHzA0alzgg9s2VRlfpNBu2O5A0shAImHa41R9ta8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779345477; c=relaxed/simple;
	bh=VWLyWjm04DTUYpJ7WWsU16IGC2+D6aXWyvh9X27bStA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VW0jZaCWBUtPFlsBC8UeBpE/YFxZvBNARatnDuHpgCFAcYHgYmjaa3UgYEkN/jeFSAnmZKtrOFAnj/LPDqL7Oww1yjbVGkwsDSsO3NwwTI4tTJQNELOEz3lDOgVHIsq1VHarzk5g1Y6e4K40oru8z93ucdEfUui51/nH4RRevl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ku7bEisR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ku7bEisR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso29272515e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 23:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779345473; x=1779950273; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ahhx+Q7bAbhezZQFMJmiRABaqwf0Ndg5KLiWrpMPDr4=;
        b=ku7bEisRbkhSv4qF8Z9713RegCCsXxGzqSLIE7AekdX9Km1XTngssTiR6ycdCxKFOI
         OHAVBfIuL4mdscn1P5muAHm5M+v/xcuvWRIwukM1hF2HriClkox+MH2Vqc1ia9/qFQm7
         1+1hZ2yjklvaVIemznPXMCADcPWIHgi1ci3lnJhvDDNQncK3UGeatrWgJtJFBKW8gi22
         qRKeyHY+dWy1gvFxY1V5FfUTdeHEJcEkrrDLOOlqv8lp9K45ITDReEbAvbtT2cgIALAU
         SITr679YkxeNW17RpS/+M7QPk3ZfMIh1jS/lpJwCY1Q0eMRVuYZZMY8rASaOgrwHjNo4
         gO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779345473; x=1779950273;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ahhx+Q7bAbhezZQFMJmiRABaqwf0Ndg5KLiWrpMPDr4=;
        b=CoNydbbNn+5jHnk5afCf1NnzTH4nQHFsN/zjHd2uCUuW5bTHR4o9rkSU37SIbSrl1j
         y/KQ5ebIcTsfClg1AFT2URoIGUWmBb+J3sdBv9Eva9pyrqhVXkLtOPkUmmAGqhEQTDRs
         YEfNLrr4x4QyXFdde1ZwwtTOrMHD19dJt9QqcLSnQ5kv8FHYv8cdauFENVm7OQMuMPRU
         9dfI5LDky2f6S5sH3RdcgxssZuky2AS52R3XaYMluQE3CBen5GuJpW2mnm5BZHK/z+g1
         L/wipHnffvpOFtCk4DYEm66T6KeivJGmNaL+3Uqc7UHTQ6lr9CrxyyAStfgtILQrAUxz
         5wmw==
X-Forwarded-Encrypted: i=1; AFNElJ+Upnqw2BdT5X1dGoL+NmaSUWM8uWxZecQ/DtgmjAyyIiIBUgvkNcSiMMhvmQmjENDY2WP8P+8BrNWMkvwy@lists.linux.dev
X-Gm-Message-State: AOJu0YwfpFes9a4JReY4m+tm/NCfpVupHn46Ae+JetiDy0v/HXlc3E37
	BWKOCDW+759l1+Wx5jmguIrHa8mmd6S8OUKNZcrHIx2Ov7Rt0u/Cco3Y
X-Gm-Gg: Acq92OFj5X3eVCnPHZmFzWvSwNmtvul1IPs2tQlf+OG24thuWw23DCxdqXaMUEILdL4
	eWa1UpKJViIaS8odbzfTDmTljf6vmg+JHKcmVM5iVueIdLgR4XBtguUsvfiU7D7BlHIJ0tiRN2d
	Bt+7PnD9H1RFJl1XGcXED0bvDP+nq9QKnkqwbfldNHfMr0NT5qdksNwkM2sN0WTelF13Wh3Y+ue
	bLpe2WrI07yq8fM66tjcXxhMiHdNe3E6oaWKTa6Psl/99qMqu59WmGZ8pRdjz1wNWqe34N1/+nV
	fZKg8XRyEu8alyqE7szC/J88JzNOa7fTV5US3UJq8/b0bEEtMkY/Yx0qSttmU1fXfqclsmBRUnW
	slRuLfFR9CNVEh01jRpY4AR3/3cHiNz5sC6Hy1OK4qBudeU6krxI6U9qWFDsu7+dxvrOCzuvpPK
	+NgVUA9LJaHCTW/uXXXL35Bv0=
X-Received: by 2002:a05:600c:4c27:b0:48e:6f39:f7be with SMTP id 5b1f17b1804b1-4903605f44amr10071075e9.10.1779345473371;
        Wed, 20 May 2026 23:37:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7dd9e6sm299931f8f.16.2026.05.20.23.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 23:37:52 -0700 (PDT)
Date: Thu, 21 May 2026 09:37:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 12/17]
 drivers/leds/rgb/leds-lp5860-core.c:119 lp5860_iterate_subleds() warn:
 passing zero to 'dev_err_probe'
Message-ID: <202605210624.3gcr3prk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   25025253476a64c186592d952c27f24bc3490e42
commit: 3daf2c4ef82b30d4cb017508f6857438ca44da41 [12/17] leds: Add support for TI LP5860 LED driver chip
config: x86_64-randconfig-161-20260521 (https://download.01.org/0day-ci/archive/20260521/202605210624.3gcr3prk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605210624.3gcr3prk-lkp@intel.com/

smatch warnings:
drivers/leds/rgb/leds-lp5860-core.c:119 lp5860_iterate_subleds() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +119 drivers/leds/rgb/leds-lp5860-core.c

3daf2c4ef82b30d Steffen Trumtrar 2026-05-05   97  static int lp5860_iterate_subleds(struct lp5860_led *led, struct led_init_data *init_data)
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05   98  {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05   99  	struct fwnode_handle *led_node = NULL;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  100  	struct fwnode_handle *multi_led = init_data->fwnode;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  101  	int subled = 0;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  102  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  103  	fwnode_for_each_child_node(multi_led, led_node) {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  104  		u32 channel;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  105  		u32 color_index;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  106  		int ret;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  107  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  108  		ret = fwnode_property_read_u32(led_node, "color", &color_index);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  109  		if (ret) {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  110  			dev_err_probe(led->chip->dev, ret,
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  111  				      "%pfwP: Cannot read 'color' property. Skipping.\n", led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  112  			fwnode_handle_put(led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  113  			return ret;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  114  		}
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  115  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  116  		ret = fwnode_property_read_u32(led_node, "reg", &channel);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  117  		if (ret < 0 || channel > LP5860_MAX_LED) {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  118  			dev_err_probe(led->chip->dev, ret,
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05 @119  				      "%pfwP: 'reg' property is missing. Skipping.\n", led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  120  			fwnode_handle_put(led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  121  			return ret;

Need to set an error code if channel > LP5860_MAX_LED.

3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  122  		}
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  123  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  124  		led->mc_cdev.subled_info[subled].color_index = color_index;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  125  		led->mc_cdev.subled_info[subled].channel = channel;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  126  		ret = lp5860_led_init(led, init_data->fwnode, channel);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  127  		if (ret) {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  128  			dev_err_probe(led->chip->dev, ret,
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  129  				      "%pfwP: Failed to init LED\n", led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  130  			fwnode_handle_put(led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  131  			return ret;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  132  		}
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  133  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  134  		subled++;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  135  	}
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  136  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  137  	return 0;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  138  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

