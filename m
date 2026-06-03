Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155193A9624
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 16:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780505990; cv=none; b=HKON+6drlTJMWWUA/6h4Zg0lwxTZZCMIdcSXpxXmkIKs2ryxvrtcAgDb8MifaD/8Nlj1D6aNeXlkWeJjTNrouwwV9KRobOVcXzY8LYlLQoA8Nlsc1jPOkQECm5KArLszDyA13ngz7SWm3gYotv+bzALdE3u70JO8nPbegbuRUTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780505990; c=relaxed/simple;
	bh=v386T1vsDDAAs5Ni3Z2/P9ic1iWO3kLaIa5oGNiIo20=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fFSHvM7HLxExG11l8dE/web+hGEfbwhYygIIWX5eG5Gy/Kiknrbx+9sVItc/+uO2FCIOoB9m4gzAekNCGD447B83RXmb3EquVdgLBdn+nK4ThIs4/RWcQNfGmjqH6LZz9xtgv3ve9KFDTX2NWcwFpQzSv4K2333ma7bF571wKU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FgHJwnek; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FgHJwnek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780505989; x=1812041989;
  h=date:from:to:cc:subject:message-id;
  bh=v386T1vsDDAAs5Ni3Z2/P9ic1iWO3kLaIa5oGNiIo20=;
  b=FgHJwnekiSd6NsTzmoV0GSVt6ByrBFudHyi9ytpilZubXCGsTO4SgA0V
   9O1SlArYuxRDbc+sUHm5zdb4DpaOiQBALti+s274/jlOYtOOrYaXyft4K
   zp5xw7YO6WeorMQ9IaYDzKYzi+EYZVi8XZdWP7EsGQ8BcZm6gkjBtxGvI
   4Y5Ak9oE1yF5IkmwOyQV5bLrjYH9iyTHH5sHdVzvnQuR2AktRUaBgMuI8
   8AvoZKn1LyEn/l1nmMPLhREBHADZyycai1O4k3qBzWHZtHoilzgGOOLgs
   Yqe47AYN1dSPhoIPzQUDU98iNq5phaOlCixq+Y3L35lLL7c6Xt2WjOJjc
   g==;
X-CSE-ConnectionGUID: 6dDrNuj4RWyLj1qAXP9Ssw==
X-CSE-MsgGUID: xpjc5SnFT/eb0KB1iRViRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81450242"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="81450242"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 09:59:48 -0700
X-CSE-ConnectionGUID: O1ru58sdTP+PktzFs6O6UA==
X-CSE-MsgGUID: 954JLIGuQo2vqCBVXId5GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="239819328"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jun 2026 09:59:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUowQ-00000000Dg6-46x4;
	Wed, 03 Jun 2026 16:59:43 +0000
Date: Thu, 04 Jun 2026 00:58:58 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Nathan Chancellor <nathan@kernel.org>
Subject: [linux-next:master 9857/10263]
 include/linux/property.h:226:undefined reference to `devm_clk_hw_register'
Message-ID: <202606040044.XTS61C9j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Arnd,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
commit: 0bf6bc1fe82a9307fa772e64c3adb89e98390f72 [9857/10263] err.h: use __always_inline on all error pointer helpers
config: sh-randconfig-001-20260603 (https://download.01.org/0day-ci/archive/20260604/202606040044.XTS61C9j-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606040044.XTS61C9j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606040044.XTS61C9j-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/media/i2c/tc358746.o: in function `fwnode_handle_put':
>> include/linux/property.h:226:(.text+0x1b04): undefined reference to `devm_clk_hw_register'
>> sh4-linux-ld: include/linux/property.h:226:(.text+0x1b0c): undefined reference to `devm_of_clk_add_hw_provider'
>> sh4-linux-ld: include/linux/property.h:226:(.text+0x1b10): undefined reference to `of_clk_hw_simple_get'


vim +226 include/linux/property.h

77fc5151f9c0e6 Jonathan Cameron  2024-02-17  215  
77fc5151f9c0e6 Jonathan Cameron  2024-02-17  216  /**
77fc5151f9c0e6 Jonathan Cameron  2024-02-17  217   * fwnode_handle_put - Drop reference to a device node
77fc5151f9c0e6 Jonathan Cameron  2024-02-17  218   * @fwnode: Pointer to the device node to drop the reference to.
77fc5151f9c0e6 Jonathan Cameron  2024-02-17  219   *
77fc5151f9c0e6 Jonathan Cameron  2024-02-17  220   * This has to be used when terminating device_for_each_child_node() iteration
77fc5151f9c0e6 Jonathan Cameron  2024-02-17  221   * with break or return to prevent stale device node references from being left
77fc5151f9c0e6 Jonathan Cameron  2024-02-17  222   * behind.
77fc5151f9c0e6 Jonathan Cameron  2024-02-17  223   */
77fc5151f9c0e6 Jonathan Cameron  2024-02-17  224  static inline void fwnode_handle_put(struct fwnode_handle *fwnode)
77fc5151f9c0e6 Jonathan Cameron  2024-02-17  225  {
77fc5151f9c0e6 Jonathan Cameron  2024-02-17 @226  	fwnode_call_void_op(fwnode, put);
77fc5151f9c0e6 Jonathan Cameron  2024-02-17  227  }
8a0662d9ed2968 Rafael J. Wysocki 2014-11-04  228  

:::::: The code at line 226 was first introduced by commit
:::::: 77fc5151f9c0e6068f1567b73d33e75a0c35333d device property: Move fwnode_handle_put() into property.h

:::::: TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
