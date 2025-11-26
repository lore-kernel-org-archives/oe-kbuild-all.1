Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D51730E0E9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 17:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764179058; cv=none; b=E/MYbJHMKHkomTdaWImKL2xAZXAOSqthbcXS8BgDZ05uS5PqtIQLinatQuD90BhNnlPuD/9a8bCu/4KgtnD9dDbizt6dlKCrGCc9lALVWqWHb/jyIZjdWRvzEzqqI1wAolWHJ8t6vXUQh4iJcvF15ItjtsKf7Wlb8NUxJ8t5nbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764179058; c=relaxed/simple;
	bh=HukSlaC3YqWgFkEITxhejGlqAC914HhI1Cxg5vCqPyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qbBe+tzcUPZvsAy9bt1uo6G3xLNocTKqm9Gw0NM32x6oJUY1fNPY7WEv66ZOldc3mDm4kMChZj1MjoL0qpJkiCQvxt0xcBAi4g+L3PC2NSryd1bRKFRNv+p9CyymLaPeo7iW8KH6N8BP8ymWROwaVgxMCreF8z5vOdXH+ooHplM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOZwYCJL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOZwYCJL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764179056; x=1795715056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HukSlaC3YqWgFkEITxhejGlqAC914HhI1Cxg5vCqPyE=;
  b=MOZwYCJLf20FvYCtVUK99s0Q+D7RDGgOJPRDEudprDbddn/tUYjd55hN
   D2tsCjdgBATUJC+Z9t2I5g8Z8p72laJvx4gPMaNSJ3BvWGX9aIYYMRGxT
   G50bb4QGozOqO8aNjpVhIquzpLmOukimSv1s5pub/HoWo1MjSIfByFd1H
   mNIv7/PSPXalQbHNxgqoy5ajw34GBkgeV0DtH0PvaDk0XSTmPJE4gtI6L
   yJOcAl/CbwrAhoQlwjs/ug/zDh7c0ta0XGtK6waSEiKLOn6cbd4AeIYVP
   X7c286BQZoneWrlbP6PrmZUEzr177rXHzGJ9yKZoLqdL0lZlAd8q+VR1/
   A==;
X-CSE-ConnectionGUID: FW4L5O1ZSjKI1s351jXfUA==
X-CSE-MsgGUID: bx0UGZ/KR/i3xPwkTOvAMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70089460"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="70089460"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 09:44:16 -0800
X-CSE-ConnectionGUID: V91XnvlnQB+gg3SqhoMh6g==
X-CSE-MsgGUID: CHhPU59GS5W3Lv5bslND6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192634072"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Nov 2025 09:44:11 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOJYn-000000003Cb-1Z5z;
	Wed, 26 Nov 2025 17:44:09 +0000
Date: Thu, 27 Nov 2025 01:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <dw@davidwei.uk>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [cilium:pr/netkit-iouring6 1/2] net/core/netdev-genl.c:1123:5:
 warning: no previous prototype for function 'netdev_nl_bind_queue_doit'
Message-ID: <202511270139.ui1077f4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-iouring6
head:   7bfb4fc5f460441d05b483647e4f4c59c4afaeb1
commit: f54fd4a1c99a85d283ce07ebc4505d09a28b28f5 [1/2] net: Add bind-queue operation
config: i386-randconfig-r072-20251127 (https://download.01.org/0day-ci/archive/20251127/202511270139.ui1077f4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270139.ui1077f4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270139.ui1077f4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/netdev-genl.c:1123:5: warning: no previous prototype for function 'netdev_nl_bind_queue_doit' [-Wmissing-prototypes]
    1123 | int netdev_nl_bind_queue_doit(struct sk_buff *skb, struct genl_info *info)
         |     ^
   net/core/netdev-genl.c:1123:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1123 | int netdev_nl_bind_queue_doit(struct sk_buff *skb, struct genl_info *info)
         | ^
         | static 
   1 warning generated.


vim +/netdev_nl_bind_queue_doit +1123 net/core/netdev-genl.c

  1122	
> 1123	int netdev_nl_bind_queue_doit(struct sk_buff *skb, struct genl_info *info)
  1124	{
  1125		return -EOPNOTSUPP;
  1126	}
  1127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
