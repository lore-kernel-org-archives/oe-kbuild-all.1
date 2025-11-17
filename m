Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F9E2F12DF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 20:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763411632; cv=none; b=TXv3tK0uW+ixAYq9mrA7SSFnzF1yimqvM0Jl/v8NO7OzijbQeZmH8PvFvo3bld3+PYZEGDMuSlDNw9U0H1eBnomBSvnCyG5m9Dw3JMVeSCMDUMaafzbJwmMN1SsC37+BL5UhnrsZsukn8UPe6ZmFZywaLXCB/oTZa2ZCNYZwu1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763411632; c=relaxed/simple;
	bh=hhkKUN1Pi1Dm6HOk/f99LxNe32uEwrs+nmmSYxY0+c8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AdhXK5lECc7TCdQ1E72nbEVDb+9NaAfYErFHhjAzW8Pdr/82nNRRmsfcOxpT0h39CypOjFyO2EonGqOy1xac4RRTibXSzCwDNHVdid+HWPObh8fr1ddAXDGVbj3YyWJuzFtM3vY8+ECZgbyQDvX/bGyRuHulph/u26nTWWQP3y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHmMseWJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHmMseWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763411631; x=1794947631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hhkKUN1Pi1Dm6HOk/f99LxNe32uEwrs+nmmSYxY0+c8=;
  b=ZHmMseWJikEBxZX+gHGlmIr62kwxeN52VTVt9XoP2rKiLuaEjVdHDyz2
   nQm4jjk7Gl1ITFHpCBQmcH806Hu2fY0PWsykeIHpRMFA67GPO9C3gya01
   g5l/ilDX4fAxockZFmTqEyoZDQLrJuEbHqB3UATpTTIVpJUem2+cwFxXx
   tkGhPDtx0eNy6xDohLiii2MgS5PrHibYTrNKH8dORmm57Ib08HLtIkkO2
   WLu8W+C2iDDj0aBVskqjmIX9YPIOjMtx+MP+b9qalpW2sdj7cdwIV6kAm
   8Y14DU3or1Y+USXCcmsYgFOomVtwSr856bRIxLzSeBLGfBs1DEuy9H3WG
   w==;
X-CSE-ConnectionGUID: kjy5BkMGS86LZYW7dKBiBw==
X-CSE-MsgGUID: IYEAybvzQaiFWAZYx/ta0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65130062"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="65130062"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 12:33:50 -0800
X-CSE-ConnectionGUID: ImKxAi5eRtiFOPvVvSpcsQ==
X-CSE-MsgGUID: Dx1XHXRCQ2OAqBvxS7cPtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="190703490"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Nov 2025 12:33:48 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL5uz-00012V-1T;
	Mon, 17 Nov 2025 20:33:45 +0000
Date: Tue, 18 Nov 2025 04:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: Saravana Kannan <saravanak@google.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [robh:dt/linus 6/6] drivers/base/core.c:269:21: warning: assignment
 to 'struct device *' from 'int' makes pointer from integer without a cast
Message-ID: <202511180433.AD7q8jGr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/linus
head:   227c4e0e70fe3a1c47b96295af364e512882cef7
commit: 227c4e0e70fe3a1c47b96295af364e512882cef7 [6/6] of: dynamic: Fix overlayed devices not probing because of fw_devlink
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20251118/202511180433.AD7q8jGr-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180433.AD7q8jGr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180433.AD7q8jGr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/core.c: In function 'fw_devlink_refresh_fwnode':
   drivers/base/core.c:269:23: error: implicit declaration of function 'get_device_from_fwnode'; did you mean 'get_dev_from_fwnode'? [-Werror=implicit-function-declaration]
     269 |                 dev = get_device_from_fwnode(fwnode);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       get_dev_from_fwnode
>> drivers/base/core.c:269:21: warning: assignment to 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     269 |                 dev = get_device_from_fwnode(fwnode);
         |                     ^
   cc1: some warnings being treated as errors


vim +269 drivers/base/core.c

   248	
   249	/**
   250	 * fw_devlink_refresh_fwnode - Recheck the tree under this firmware node
   251	 * @fwnode: The fwnode under which the fwnode tree has changed
   252	 *
   253	 * This function is mainly meant to adjust the supplier/consumer dependencies
   254	 * after a fwnode tree overlay has occurred.
   255	 */
   256	void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode)
   257	{
   258		struct device *dev;
   259	
   260		/*
   261		 * Find the closest ancestor fwnode that has been converted to a device
   262		 * that can bind to a driver (bus device).
   263		 */
   264		fwnode_handle_get(fwnode);
   265		do {
   266			if (fwnode->flags & FWNODE_FLAG_NOT_DEVICE)
   267				continue;
   268	
 > 269			dev = get_device_from_fwnode(fwnode);
   270			if (!dev)
   271				continue;
   272	
   273			if (dev->bus)
   274				break;
   275	
   276			put_device(dev);
   277		} while ((fwnode = fwnode_get_next_parent(fwnode)));
   278	
   279		/*
   280		 * If none of the ancestor fwnodes have (yet) been converted to a device
   281		 * that can bind to a driver, there's nothing to fix up.
   282		 */
   283		if (!fwnode)
   284			return;
   285	
   286		WARN(device_is_bound(dev) && dev->links.status != DL_DEV_DRIVER_BOUND,
   287		     "Don't multithread overlaying and probing the same device!\n");
   288	
   289		/*
   290		 * If the device has already bound to a driver, then we need to redo
   291		 * some of the work that was done after the device was bound to a
   292		 * driver. If the device hasn't bound to a driver, running thing too
   293		 * soon would incorrectly pick up consumers that it shouldn't.
   294		 */
   295		if (dev->links.status == DL_DEV_DRIVER_BOUND)
   296			fw_devlink_pickup_dangling_consumers(dev);
   297	
   298		put_device(dev);
   299		fwnode_handle_put(fwnode);
   300	}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
