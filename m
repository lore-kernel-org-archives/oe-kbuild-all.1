Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228F54C9D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 12:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724157037; cv=none; b=WeQLUwWhI8l9VdL81ddjrEYYSoKT6Od2rY29FLWuSS0JdW8oXgvFaR0eT5y1jZwNppebEimleeGYFL9CVplcOjWPsCsbe5Pn+iVoSutbKt3qhMZvKhjgMj1HPL/YQYTlvLMURBYIJMs2VNZ/250M7TVQ0B4vfh4fEyL7zz/39Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724157037; c=relaxed/simple;
	bh=c/bHAPSQN507SAHdGQGbNPoAswwdD9iIWkHoZqXvczY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DuKvIU0X/hxfFXyDHAWxYy8iluETyHYv+mqXVl0kUAiNmH6Py696UUSGL0NiUoF9co/DHI/CU34HGZQdQE4y5x/jNNvcdO3W7kmGHMsAKLKn6XlHC+7qJlAjAtSjOVAQwuRemBYhDvJe0XHUZUARXUo6vpr34pxR2PRwlFudWiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqSe30jx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqSe30jx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724157035; x=1755693035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/bHAPSQN507SAHdGQGbNPoAswwdD9iIWkHoZqXvczY=;
  b=FqSe30jxC5YFYbaRJfXA65+8ULLOYlPHf1h+NS90vItKt/E84OeEFAaK
   1JVYiRmEmlSHu93R7hxZLKfKE03IwWM4V6dzo/8A1p4cDU92LQh+XUiyN
   GhFcMINnhk80txP41NsBtceXqpXLUBEF7Y1VDVpUIQ3ekxNyKJu+YJhs6
   F6unUBGT+KdQ8+PS36bMvpGO5rnb5lwT/VRajFAxldcV0O+8817zBIHNL
   eCN/RrRQkC2Mgu0C9lYgfIxCRF4D73Si/1wGHi+CzEIzuCeDxoVrji7cT
   +S+0tmO9+aWe5VyUTc72TmctGLydALxMN1t4P/UActjUOhH6nO5jFF+tO
   Q==;
X-CSE-ConnectionGUID: ErWkwA/RTjmG6GQfXduInQ==
X-CSE-MsgGUID: KvVVf4wUQg+AlkZWfwR8Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33839955"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="33839955"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 05:30:34 -0700
X-CSE-ConnectionGUID: vXuFx+WZQ5qxlp93OAtbwA==
X-CSE-MsgGUID: Y1v3WEWWR9G1JM0Ds9qmkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="60769175"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Aug 2024 05:30:34 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgO0N-000AAU-26;
	Tue, 20 Aug 2024 12:30:31 +0000
Date: Tue, 20 Aug 2024 20:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned-rebase 24/42] xfs_zone_gc.o:undefined reference
 to `__udivdi3'
Message-ID: <202408202009.8W28pwD8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned-rebase
head:   3c96db98f4feb088091259cb1cebca37b8460585
commit: af9be69e6bf368cc4270beff5c0e200dc493b00b [24/42] xfs: support zoned RT devices
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20240820/202408202009.8W28pwD8-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408202009.8W28pwD8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408202009.8W28pwD8-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: fs/xfs/xfs_zone_gc.o: in function `xfs_zone_reclaim_pick':
>> xfs_zone_gc.o:(.text+0x182c): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
