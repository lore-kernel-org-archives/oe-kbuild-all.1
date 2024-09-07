Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8084815F3FF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 17:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725728835; cv=none; b=ceQe899hJY39T4dolB+ih3sVXIIRGaDtVhqdipo/4Ugu6w/3aJb3Mhx7FBpkXLi++ebPsFvFak3tAh275w8YggcKyfh7vUXEC832AKciVW+lkOMxtm4faBhYsaHkr4H+XGRZEH7MVefRZcsEHKh4wG7mtB/xBOukOXqFe8IRoYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725728835; c=relaxed/simple;
	bh=yG9OOlrN1qvjyQKeGaZPJxzYMue09TQbLbZSwo/rmP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqGHOzM9OkXP7n2aMDliqkVQxvsm/Qs0Aytvqyq3zSsHdkYUVbW+GdTnRsqwAi6iL4ksUyzYTigLI/nZxWu9Wq9LYF7dG8lD6PS7wsUfZ+CXrNOdbSODIznlz597TwweJjmtPgsr+64RHUJpHvasO5A3R5fMyjeUdcdueI34HGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxkUQ4U2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxkUQ4U2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725728833; x=1757264833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yG9OOlrN1qvjyQKeGaZPJxzYMue09TQbLbZSwo/rmP4=;
  b=PxkUQ4U2kMKBm7QdrXjHzk+U2VkTiMM1Bb9Yexe7ZKCx+W8d7AU2cn9Z
   EkvNvTM3xhMRbzm7i1vwg0DPpL3KeJHogn/9uNLV9q9CMe7dog/3cn410
   mvO0dBhh8b3SfvgZABJyMOXPiqshy5ARM2YZBfy7IuC9Il+NIT6qTdqDG
   EDz3npi4+w6ylmdlCuy9OJf7y3VVPY2jgM/AgaopGOwpey77mF5CAtNwP
   kqHL+fZsefxs7oDrqZo8u4GjdnszBU2lryEy+9PzMLoCpTXslMvmw4CnI
   7aGcJwg6mXdOTpw3TZorhifAZnQEDm239KliFG5OpBFe7smNFnXVEOYvS
   A==;
X-CSE-ConnectionGUID: XwX4iBXrSE+pu9Y9ftSnUg==
X-CSE-MsgGUID: m3sGcxN9SFKbra3+OsI8Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="35063166"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="35063166"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 10:07:00 -0700
X-CSE-ConnectionGUID: D9rZoCdIT6WdwFty6dlMDw==
X-CSE-MsgGUID: RAq325l3QMy2AbzdTvrVNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="70820032"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Sep 2024 10:06:59 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smytl-000ClJ-0M;
	Sat, 07 Sep 2024 17:06:57 +0000
Date: Sun, 8 Sep 2024 01:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/2] usb: misc: onboard_usb_dev: add Microchip usb5744
 SMBus programming support
Message-ID: <202409080045.SSIeS90P-lkp@intel.com>
References: <1725620423-1758964-3-git-send-email-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1725620423-1758964-3-git-send-email-radhey.shyam.pandey@amd.com>

Hi Radhey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b831f83e40a24f07c8dcba5be408d93beedc820f]

url:    https://github.com/intel-lab-lkp/linux/commits/Radhey-Shyam-Pandey/usb-misc-onboard_dev-extend-platform-data-to-add-power-on-delay-field/20240906-190218
base:   b831f83e40a24f07c8dcba5be408d93beedc820f
patch link:    https://lore.kernel.org/r/1725620423-1758964-3-git-send-email-radhey.shyam.pandey%40amd.com
patch subject: [PATCH v5 2/2] usb: misc: onboard_usb_dev: add Microchip usb5744 SMBus programming support
config: alpha-randconfig-r131-20240907 (https://download.01.org/0day-ci/archive/20240908/202409080045.SSIeS90P-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20240908/202409080045.SSIeS90P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080045.SSIeS90P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/misc/onboard_usb_dev.c: In function 'onboard_dev_5744_i2c_init':
>> drivers/usb/misc/onboard_usb_dev.c:347:1: warning: no return statement in function returning non-void [-Wreturn-type]
     347 | }
         | ^


vim +347 drivers/usb/misc/onboard_usb_dev.c

   311	
   312	static int onboard_dev_5744_i2c_init(struct i2c_client *client)
   313	{
   314	#if IS_ENABLED(CONFIG_I2C)
   315		struct device *dev = &client->dev;
   316		int ret;
   317	
   318		/*
   319		 * Set BYPASS_UDC_SUSPEND bit to ensure MCU is always enabled
   320		 * and ready to respond to SMBus runtime commands.
   321		 * The command writes 5 bytes to memory and single data byte in
   322		 * configuration register.
   323		 */
   324		char wr_buf[7] = {USB5744_CREG_MEM_ADDR, 5,
   325				  USB5744_CREG_WRITE, 1,
   326				  USB5744_CREG_RUNTIMEFLAGS2,
   327				  USB5744_CREG_RUNTIMEFLAGS2_LSB,
   328				  USB5744_CREG_BYPASS_UDC_SUSPEND};
   329	
   330		ret = i2c_smbus_write_block_data(client, 0, sizeof(wr_buf), wr_buf);
   331		if (ret)
   332			return dev_err_probe(dev, ret, "BYPASS_UDC_SUSPEND bit configuration failed\n");
   333	
   334		ret = i2c_smbus_write_word_data(client, USB5744_CMD_CREG_ACCESS,
   335						USB5744_CMD_CREG_ACCESS_LSB);
   336		if (ret)
   337			return dev_err_probe(dev, ret, "Configuration Register Access Command failed\n");
   338	
   339		/* Send SMBus command to boot hub. */
   340		ret = i2c_smbus_write_word_data(client, USB5744_CMD_ATTACH,
   341						USB5744_CMD_ATTACH_LSB);
   342		if (ret < 0)
   343			return dev_err_probe(dev, ret, "USB Attach with SMBus command failed\n");
   344	
   345		return ret;
   346	#endif
 > 347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
