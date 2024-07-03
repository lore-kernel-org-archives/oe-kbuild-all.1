Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD1B3B298
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 04:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719982456; cv=none; b=Q9jCbM/OU+R4tkobG3JcK8riZdYNp35VAm9tupJav3esq3vuhx5k9gRIY1SN2g3A8CmONszPXcw/HqbOAttbpk+0Jix41Dimr7P9rpjt4gEAj6g1TnYuGe9KDcKYPKnPZk8EX4bMXXRmDiJKRDi1e/Q6ktZ6mK3ufrQmvQbEDRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719982456; c=relaxed/simple;
	bh=WCn2LP7wcxMyOZ+GxSLYN4ns60f8Ddfvo2XLEg58Stg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZet1yEhV1id4DLMIBFSAl7pWsnLZuNVLhCRN2yb/+c6oTL/aXBA9BtM5FQvgfx/3XIY/T+WxufyhG6tfzwJHWXudilYNIOaT3SZRKTrkpPKOWZUadkcV42VhRetHBvaVtQR70C4BA5+8r4IvWzQpIfcHderU1mptWUKmG1QxEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emo54dTi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emo54dTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719982455; x=1751518455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WCn2LP7wcxMyOZ+GxSLYN4ns60f8Ddfvo2XLEg58Stg=;
  b=emo54dTidfeohELalxSejUK+1kRwa8JUCBvHrIv6OCXsgLZURmNw7QUy
   mFR1Kti5xqQN2OXyVvNIh97cmWY7ff8wAG5qKvonNf2PlTycPZmlHMkLM
   BJywKg75qW1hSvNpZ6YPUyXhapqimS6bkgtxPRLezMtJBBh5uxS9yzcXX
   lbsvvR+OcGgOf1IItyWkJjXkARlubogmv+tnfN8F7j2zrcsvE0EhwkWMC
   W/SxrjEhlt9LZ1m67mqF2XMpNIJBeg3tsE3++FfRjVUbHTw63uRlgrN2B
   jaLZ5Xg3ea5s0Lt0yS4LeLlsdoONJo4zQu9c0g3//mGoKXxFwJmJ9VF3l
   w==;
X-CSE-ConnectionGUID: ERiBXnrIRPyUshdRL8L4gw==
X-CSE-MsgGUID: MslXvvPFRZ29tAMug2DYWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17328673"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="17328673"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 21:53:47 -0700
X-CSE-ConnectionGUID: E9X1pnmeRJm6O2h7SbUpmw==
X-CSE-MsgGUID: olhAg6n3QwelGtvZ861LWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="46132719"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jul 2024 21:53:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOrzz-000PHp-2O;
	Wed, 03 Jul 2024 04:53:43 +0000
Date: Wed, 3 Jul 2024 12:53:33 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Vdovydchenko <xzeol@yahoo.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 2/2] hwmon: add MP5920 driver
Message-ID: <202407031245.ZIvUCyeR-lkp@intel.com>
References: <20240702115252.981416-3-xzeol@yahoo.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702115252.981416-3-xzeol@yahoo.com>

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on next-20240702]
[cannot apply to robh/for-next krzk-dt/for-next linus/master v6.10-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Vdovydchenko/dt-bindings-hwmon-Add-MPS-mp5920/20240702-202656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240702115252.981416-3-xzeol%40yahoo.com
patch subject: [PATCH v4 2/2] hwmon: add MP5920 driver
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240703/202407031245.ZIvUCyeR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031245.ZIvUCyeR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031245.ZIvUCyeR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/pmbus/mp5920.c: In function 'mp5920_probe':
>> drivers/hwmon/pmbus/mp5920.c:49:62: warning: field precision specifier '.*' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Wformat=]
      49 |                 return dev_err_probe(dev, -ENODEV, "Model '%.*s' not supported\n",
         |                                                            ~~^~
         |                                                              |
         |                                                              int
      50 |                                      sizeof(buf), buf);
         |                                      ~~~~~~~~~~~              
         |                                      |
         |                                      long unsigned int


vim +49 drivers/hwmon/pmbus/mp5920.c

    33	
    34	static int mp5920_probe(struct i2c_client *client)
    35	{
    36		struct device *dev =  &client->dev;
    37		int ret;
    38		u8 buf[I2C_SMBUS_BLOCK_MAX];
    39	
    40		if (!i2c_check_functionality(client->adapter,
    41					     I2C_FUNC_SMBUS_READ_WORD_DATA))
    42			return -ENODEV;
    43	
    44		ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
    45		if (ret < 0)
    46			return dev_err_probe(dev, ret, "Failed to read PMBUS_MFR_MODEL\n");
    47	
    48		if (ret != 6 || strncmp(buf, "MP5920", 6)) {
  > 49			return dev_err_probe(dev, -ENODEV, "Model '%.*s' not supported\n",
    50					     sizeof(buf), buf);
    51		}
    52	
    53		return pmbus_do_probe(client, &mp5920_info);
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
