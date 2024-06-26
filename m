Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9528E1BF31
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 02:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719367276; cv=none; b=FQZCk7l/cL9W3QFm18C8XLuu/c0y7c8BVZZNZ8KhIvU0Y9i8YSUCeG9gfk88flwNUOZpOToc66cfYE1WjT5uCLTR5FK4FoYm9THFd1CkXXt9SKXHtL9KMnsmx9i3aJtOhNQbd8GC4JlUNo5QCdBMqIIryBGvZ7Tugsnk9yDjacM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719367276; c=relaxed/simple;
	bh=Y4AMdkRPUy85KIAZrLEuYHML8ji04WWwk9c2g6l0sL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZ4l6ukzd5l58byXA8kUb+Xi8mKij+iJk68OnIwg6QP+AzNPdj8ulAOx//M8jNz/gGhHdbC+wxYFwxc9zjJi1k9Guzlrd3CzHZwKCdzV9+QJteOEW4l1Z+wL7sNVmNjJMZKeFV30cFhbCJbwrNntT/6iVWiUBtfxAp+9WJ0+E0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=erl/kLgL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="erl/kLgL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719367275; x=1750903275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y4AMdkRPUy85KIAZrLEuYHML8ji04WWwk9c2g6l0sL0=;
  b=erl/kLgLvQ0aQ/L4K5ToEEoGB+9yIs91HOKlHQXl/PFr5x7EMlJGkRFJ
   hivlY6Xcayo1Si472c6acVg25FglSm1vzZAjFOfXtIrMEaTv/pxUy/D1Z
   NREGgbbQEN38d/ehXBuGKgjIyVZ4pxqW3it6x+CwfFQrLt+Eu1cfzZz9b
   FiL5b8mBfMBuME7m3KXfnSSjPhOpD0vpxbnZoLXEcYMUO53c6AeOipZrG
   AWtK+IEqe4BLBENEjdtpIRBb/wtXWm8R/O2I3a9f8EXVjL8IO3xxax/sB
   uFyDpUJ5U9MBMPC4Qjrsl3Nt7oTilaq4FXY/KLZQgPSNku/L/xcc65nY0
   A==;
X-CSE-ConnectionGUID: scYQtr9qS929wgVHih+t6Q==
X-CSE-MsgGUID: ZgO1/2F9Th6wlo0+iVMzeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27820569"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="27820569"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 19:01:14 -0700
X-CSE-ConnectionGUID: ABcjg3EGRx2z6xUo8XR+VQ==
X-CSE-MsgGUID: VR19q7WlSzOzToTsjtbh6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="49010543"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Jun 2024 19:01:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMHyA-000EtH-2P;
	Wed, 26 Jun 2024 02:01:10 +0000
Date: Wed, 26 Jun 2024 10:01:00 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Yan <andyshrk@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: rockchip: Fix the i2c address of es8316 on
 Cool Pi 4B
Message-ID: <202406260921.srQ7V5GB-lkp@intel.com>
References: <20240623083413.2051412-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240623083413.2051412-1-andyshrk@163.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.10-rc5]
[cannot apply to rockchip/for-next next-20240625]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Yan/arm64-dts-rockchip-Fix-the-i2c-address-of-es8316-on-Cool-Pi-4B/20240625-183831
base:   linus/master
patch link:    https://lore.kernel.org/r/20240623083413.2051412-1-andyshrk%40163.com
patch subject: [PATCH] arm64: dts: rockchip: Fix the i2c address of es8316 on Cool Pi 4B
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240626/202406260921.srQ7V5GB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260921.srQ7V5GB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406260921.srQ7V5GB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts:291.25-305.4: Warning (i2c_bus_reg): /i2c@fec90000/audio-codec@11: I2C bus unit address format error, expected "10"

vim +/10 +291 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts

3f5d336d64d6344 Andy Yan 2023-12-12  286  
3f5d336d64d6344 Andy Yan 2023-12-12  287  &i2c7 {
3f5d336d64d6344 Andy Yan 2023-12-12  288  	pinctrl-0 = <&i2c7m0_xfer>;
3f5d336d64d6344 Andy Yan 2023-12-12  289  	status = "okay";
3f5d336d64d6344 Andy Yan 2023-12-12  290  
3f5d336d64d6344 Andy Yan 2023-12-12 @291  	es8316: audio-codec@11 {
3f5d336d64d6344 Andy Yan 2023-12-12  292  		compatible = "everest,es8316";
64f107f19c7217b Andy Yan 2024-06-23  293  		reg = <0x10>;
3f5d336d64d6344 Andy Yan 2023-12-12  294  		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
3f5d336d64d6344 Andy Yan 2023-12-12  295  		assigned-clock-rates = <12288000>;
3f5d336d64d6344 Andy Yan 2023-12-12  296  		clocks = <&cru I2S0_8CH_MCLKOUT>;
3f5d336d64d6344 Andy Yan 2023-12-12  297  		clock-names = "mclk";
3f5d336d64d6344 Andy Yan 2023-12-12  298  		#sound-dai-cells = <0>;
3f5d336d64d6344 Andy Yan 2023-12-12  299  
3f5d336d64d6344 Andy Yan 2023-12-12  300  		port {
3f5d336d64d6344 Andy Yan 2023-12-12  301  			es8316_p0_0: endpoint {
3f5d336d64d6344 Andy Yan 2023-12-12  302  				remote-endpoint = <&i2s0_8ch_p0_0>;
3f5d336d64d6344 Andy Yan 2023-12-12  303  			};
3f5d336d64d6344 Andy Yan 2023-12-12  304  		};
3f5d336d64d6344 Andy Yan 2023-12-12  305  	};
3f5d336d64d6344 Andy Yan 2023-12-12  306  };
3f5d336d64d6344 Andy Yan 2023-12-12  307  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
