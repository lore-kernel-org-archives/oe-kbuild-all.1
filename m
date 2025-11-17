Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DF5285C89
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 20:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763412293; cv=none; b=bIbO/KPKe5nrMaEc/Cf4KypM0TSl988u+16QfI09WhONOgYTNJR/kdnFYUUJubZUIl9hOCyIf4uGr9dB5s2kDfwroa+q3CcDOqrG6bobdzj9UneILWlLbmSwosvsuFfgCI6l42VIv1/wsSo/xXiuLYglX84w5yBZ+KNJuKdoeOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763412293; c=relaxed/simple;
	bh=zWQ1gW6riLwfHlAVakiDdEXtmyHl8/IAV6asZRlbjIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n5Y8dH9HbjR3xHKROXyR8ftJzITtmZgX6nWHiiaPiGF+V62ZqxHAbGzU9Lis0zNi+h3EzcrLaHNcKdeGhYQaFH0KL0eR9zjJwtZGzpdoHfwEYRi0XhuwFuRtEkepdDROCIL6pihzyAZjQUk7XFyBeRM4wNpA/iBlpyb5yBbhYmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvgUBG6l; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvgUBG6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763412291; x=1794948291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zWQ1gW6riLwfHlAVakiDdEXtmyHl8/IAV6asZRlbjIo=;
  b=TvgUBG6l4sWgV2FKwJ0TL+OBDytVGJOLQq0RO1L/YwSQOeciH20J1KH7
   q8B+ANkFfBcKwNp19VVzkMNhUjfQx9pMGRkbQZLalWGeJfdrC1Nc/DR3e
   kzlBZDFQB8ejrKyQEghvncktsW1c/8iMcZ2rvvSNEXbmu7vSwmrOgvalS
   uyBiN4cKGhuZiAfJM2fdWWPiDwTRrnlsKoW5H18RdPDbYoZKX0kL7hafX
   dP+kHOLbeNmqzW4L4VwMBthCIg6l4M65tyQnq4ghzQ1mhUpss/84coi3j
   mvpqQ8yPsToBbZmHuuTCywJowcKgFr7e6qiuP8/lBG+YF4utNKTuzDFLI
   Q==;
X-CSE-ConnectionGUID: yUmX9egAQ0qDwyLjEix46w==
X-CSE-MsgGUID: 5dDWMkDBRSe2wlVP2TFzqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65462711"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="65462711"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 12:44:50 -0800
X-CSE-ConnectionGUID: Nsa+/dliQAiUpAFb5elKew==
X-CSE-MsgGUID: p/72uGFRSb2aZZpRA1J1lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="190784450"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Nov 2025 12:44:49 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL65e-000139-2S;
	Mon, 17 Nov 2025 20:44:46 +0000
Date: Tue, 18 Nov 2025 04:44:23 +0800
From: kernel test robot <lkp@intel.com>
To: Saravana Kannan <saravanak@google.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [robh:dt/linus 6/6] drivers/base/core.c:269:23: error: implicit
 declaration of function 'get_device_from_fwnode'; did you mean
 'get_dev_from_fwnode'?
Message-ID: <202511180428.kMB29iNY-lkp@intel.com>
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
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20251118/202511180428.kMB29iNY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180428.kMB29iNY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180428.kMB29iNY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/base/core.c: In function 'fw_devlink_refresh_fwnode':
>> drivers/base/core.c:269:23: error: implicit declaration of function 'get_device_from_fwnode'; did you mean 'get_dev_from_fwnode'? [-Wimplicit-function-declaration]
     269 |                 dev = get_device_from_fwnode(fwnode);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       get_dev_from_fwnode
>> drivers/base/core.c:269:21: error: assignment to 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     269 |                 dev = get_device_from_fwnode(fwnode);
         |                     ^


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
