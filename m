Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F6623507F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 23:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753745879; cv=none; b=iaZ5KZ6aFGNNf1SAjWXDrex2xPoCj7lxIeAWjgQIl2Lc1lebhekwux0vTyGUodCHHk25UXbx+YtPgoBJTPfP1F2KUHPZlPVWbquRZ7KSPTLeOhMApUkjkvQCIJcr3ilIYqIyh7sdAD5Mm6ZxPtE6e6sjlmBQ2oiLPev6E9wk+Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753745879; c=relaxed/simple;
	bh=d5USwsfIDWjUBX0yYghQYpQ7tSx0AvWQrT43SCi54vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPTthVKe4YPOIc2dztiTX3j0RmKvxDpO6IX9aJy7uuJBUXWmK9wypa0X6nyZBwnkGmvihorr8+JkihtEOuzZcXuSDZom34qzCHfO1EVNEjTPDKghw1VeDi69ppAPl16cdDODBeX95eVQYCJA8uo3Zz95PSjpr7TLBjGUaYglQA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mepl0Yku; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mepl0Yku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753745878; x=1785281878;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d5USwsfIDWjUBX0yYghQYpQ7tSx0AvWQrT43SCi54vY=;
  b=mepl0YkuL7ghHW+OrAFG35gILlhBWtTgbPQMe36D6NFYF5tAK4j+5/Sb
   CGoK5KT/ULq9PLfpU1JM8ffZSIxBuGyO6zMqTRVOMuVAjDnrr/zBE0p0f
   sBKQYPD/0zvbdrf+3r392YsiLx4co1rKy4rRlfKMY799GlWTf4Fp1Ekln
   0VnLk97OBz3pmwsqByXNsSY6SS/ObBdYZpda9KfWumxvoeUKiNfvKpxe4
   ktTrypIV7fqeoxtF3KBdACG2/tcKaXFf5T1LDRuS8n5v4NzI853xXlcIo
   kYS8TfF1vfmLnejaDZ0Z7gg1j+GYJjbFlfcCCNvxUFh4appCwFowVHmkS
   Q==;
X-CSE-ConnectionGUID: MCde+7QZTbanLNeJDgLqUw==
X-CSE-MsgGUID: fP8j4B9wQX+e9pQloU8I9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="78557786"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="78557786"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 16:37:56 -0700
X-CSE-ConnectionGUID: gPjxMOclSPOq9M8U0Ti/9w==
X-CSE-MsgGUID: t41SLsw+RuOpoDAEchBjlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="162113820"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jul 2025 16:37:52 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugXPi-0000pH-0i;
	Mon, 28 Jul 2025 23:37:50 +0000
Date: Tue, 29 Jul 2025 07:36:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Tran <trannamatk@gmail.com>, lee@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, pavel@kernel.org, rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Nam Tran <trannamatk@gmail.com>
Subject: Re: [PATCH v12 2/4] leds: add basic support for TI/National
 Semiconductor LP5812 LED Driver
Message-ID: <202507290749.YxykcKRV-lkp@intel.com>
References: <20250728065814.120769-3-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728065814.120769-3-trannamatk@gmail.com>

Hi Nam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f09079bd04a924c72d555cd97942d5f8d7eca98c]

url:    https://github.com/intel-lab-lkp/linux/commits/Nam-Tran/dt-bindings-leds-add-TI-National-Semiconductor-LP5812-LED-Driver/20250728-150224
base:   f09079bd04a924c72d555cd97942d5f8d7eca98c
patch link:    https://lore.kernel.org/r/20250728065814.120769-3-trannamatk%40gmail.com
patch subject: [PATCH v12 2/4] leds: add basic support for TI/National Semiconductor LP5812 LED Driver
config: hexagon-randconfig-r073-20250729 (https://download.01.org/0day-ci/archive/20250729/202507290749.YxykcKRV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1b4db78d2eaa070b3f364a2d2b2b826a5439b892)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507290749.YxykcKRV-lkp@intel.com/

New smatch warnings:
drivers/leds/rgb/leds-lp5812.c:920 lp5812_probe() warn: inconsistent indenting

Old smatch warnings:
drivers/leds/rgb/leds-lp5812.c:467 lp5812_multicolor_brightness() error: uninitialized symbol 'ret'.

vim +920 drivers/leds/rgb/leds-lp5812.c

   903	
   904	static int lp5812_probe(struct i2c_client *client)
   905	{
   906		struct lp5812_chip *chip;
   907		struct device_node *np = dev_of_node(&client->dev);
   908		struct lp5812_led *led;
   909		int ret;
   910	
   911		if (!np)
   912			return -EINVAL;
   913	
   914		chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
   915		if (!chip)
   916			return -ENOMEM;
   917	
   918		chip->cfg = i2c_get_match_data(client);
   919		ret = lp5812_of_populate_pdata(&client->dev, np, chip);
 > 920			if (ret)
   921				return ret;
   922	
   923		led = devm_kcalloc(&client->dev, chip->num_channels, sizeof(*led), GFP_KERNEL);
   924		if (!led)
   925			return -ENOMEM;
   926	
   927		chip->client = client;
   928		mutex_init(&chip->lock);
   929		i2c_set_clientdata(client, led);
   930	
   931		ret = lp5812_init_device(chip);
   932		if (ret)
   933			return ret;
   934	
   935		ret = lp5812_register_leds(led, chip);
   936		if (ret)
   937			goto err_out;
   938	
   939		ret = lp5812_register_sysfs(chip);
   940		if (ret)
   941			goto err_out;
   942	
   943		return 0;
   944	
   945	err_out:
   946		lp5812_deinit_device(chip);
   947		return ret;
   948	}
   949	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
