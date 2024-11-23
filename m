Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AAA57CBE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 03:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732331522; cv=none; b=h7E6RzxLoRkVuTROQ+iysBZNL6KRnqGsLis2zFxneq53yxWsw64/00r+WbTeDwj/cJ6hbLGaTBUWW52cxPjBTDOC6oExSTwGo/ml1qq+lcvUJps7xpuUuN98X80lNq1sdJ+dRd5msmYQpmnx0kcTC82ckcNvlvvgG2MkQDtKBx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732331522; c=relaxed/simple;
	bh=my0sdPbCbL8tbsUq7oPzvstqctD2sVWOdIYw0qX9VXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7qS7+CqIzAEm7w7Jnp1TuO9m88+NWv7xfMfdo3NO6r6EstsJ2mqS/nCAleRCJDJ1T/bIWBvoGaXc6m+S6cNqHD42ATX5LYFZyaBvKmdl9smhQRVKj5yYk3DcRasm0OdFMWC3utM/l9+uaiHcJgqr406sHvPSD6uHwIwYTXYXTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vn9rEw7V; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vn9rEw7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732331521; x=1763867521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=my0sdPbCbL8tbsUq7oPzvstqctD2sVWOdIYw0qX9VXU=;
  b=Vn9rEw7V8BiouJRnLk0h3zwSHZbCuZCwbC+nYk5yZmrP8cAd2QblZ2Iy
   cridtF0pMjIfptkTluK+8MR6Rm1vc11mxJsbpk1SMNmnlzbSy3LZSh7Dh
   pifN1GkNg3iL/IxgvLc9NsB1n8n7xBA9rxpIn26Imy13tBg2z/gn617L+
   HtJAYUrKbaQKX9a5kDqZMRj4G31n1PhaJ747W5wfdG6rbJbxmrwbGJxsp
   vGg6fzxqhtyrgH7Bp3T4i08VvwhmueU6G7zvbit1HKYWCLu7CcgduOyOT
   k+JjKQEf7m0lZNLdK/W0EUW6bYYAe1XWf2A/HwMG7gGYnUMy/Hv/h98FA
   Q==;
X-CSE-ConnectionGUID: GMK/FhF4ThOWvDB3SqiUSw==
X-CSE-MsgGUID: q2tGUTl2Tj6hpAQQzqQNsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="50015381"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="50015381"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 19:12:01 -0800
X-CSE-ConnectionGUID: x0paM7rRQPiyVYKCEYUY0w==
X-CSE-MsgGUID: WgtPotOpRRyTBS+VLlxiJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="95804544"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Nov 2024 19:11:57 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEgYs-0004NL-28;
	Sat, 23 Nov 2024 03:11:54 +0000
Date: Sat, 23 Nov 2024 11:11:38 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radu Sabau <radu.sabau@analog.com>,
	Uwe =?unknown-8bit?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051,
 adp1055 and ltp8800
Message-ID: <202411231030.hhgCtzrl-lkp@intel.com>
References: <20241120035826.3920-3-cedricjustine.encarnacion@analog.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120035826.3920-3-cedricjustine.encarnacion@analog.com>

Hi Cedric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.12 next-20241122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Encarnacion/dt-bindings-hwmon-pmbus-adp1050-Add-bindings-for-adp1051-adp1055-and-ltp8800/20241121-144856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20241120035826.3920-3-cedricjustine.encarnacion%40analog.com
patch subject: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051, adp1055 and ltp8800
config: loongarch-randconfig-r111-20241122 (https://download.01.org/0day-ci/archive/20241123/202411231030.hhgCtzrl-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241123/202411231030.hhgCtzrl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231030.hhgCtzrl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/pmbus/adp1050.c:88:39: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct pmbus_driver_info *info @@     got struct pmbus_driver_info const *[assigned] info @@
   drivers/hwmon/pmbus/adp1050.c:88:39: sparse:     expected struct pmbus_driver_info *info
   drivers/hwmon/pmbus/adp1050.c:88:39: sparse:     got struct pmbus_driver_info const *[assigned] info

vim +88 drivers/hwmon/pmbus/adp1050.c

    79	
    80	static int adp1050_probe(struct i2c_client *client)
    81	{
    82		const struct pmbus_driver_info *info;
    83	
    84		info = device_get_match_data(&client->dev);
    85		if (!info)
    86			return -ENODEV;
    87	
  > 88		return pmbus_do_probe(client, info);
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
