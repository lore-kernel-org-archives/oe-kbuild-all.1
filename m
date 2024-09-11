Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE7913B580
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 09:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726045260; cv=none; b=PeG57dcDUt4sBsVWKKbdUQfq0kchwE6CnANjTaXX7NNRnLSsO0+HOYFsJ7p27x93P/yWdjOMl0Gu8hxUxQsmzc6jZUu8rlXAKGiUPPpw1chv3Yf+duQc6SN5pkgbUhTKZTKdNyH8jQ4443TvF9LiVOWc8l83tfLTr4cYS5l4nfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726045260; c=relaxed/simple;
	bh=uqiM4HTIeki0G5VSYPgGjJaGSq6yTVsGa9mMEydZmu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IKppWcmjRvggcH8qZyBLYdYrn05cEl295eSREcfWsVnuStvvVP2CZmcLHSWpQF/7seZVYSIdlQ5H10x4xecWikqzxg5ajTixSqh1OSrkJ9PajOvbsLY6rSt39i+OJfr0zCxBBYk8rkGRn/yNXs2xzL6hWF46b7J2tJFA6hbbly0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFdZIpWB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFdZIpWB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726045259; x=1757581259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uqiM4HTIeki0G5VSYPgGjJaGSq6yTVsGa9mMEydZmu4=;
  b=gFdZIpWBGGixXpu5vWvHF7tje5l6lvl5FPKygpmF+CzhCs5TkxXkQNSP
   mE6SKBK1OxFelKHoXbeUUtIcQDILULv5nCX9opXC+f6QVYn4qayElPbOK
   eJIeIrWmptxDgNrP5NcB3EGHlbbHm1dmFZT+XR9dDk9HH3erMDL6eJsDV
   YSNVV9yBWqXzTMZOmWjEokHdl/5CvDd12cBxK9N4cxWS8zwc+8u4wGmjB
   WMf9ZHyh59yCnFyuo4Qk4pod/Pqit04eWECQWV0pVCRQkrH4QM8H2txYg
   yKJtdMEZX3qiFQ1Yv0IoVaj7GcxqG44yBFQHwrkvytVK0hR97ALaGRpk4
   A==;
X-CSE-ConnectionGUID: rnrYt1jJSHeIA6z1VlQ0sQ==
X-CSE-MsgGUID: QorbWAQpQhu/Vvh2chi19w==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24657024"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="24657024"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 02:00:45 -0700
X-CSE-ConnectionGUID: KKo3hjlSQWqQA+Bh+spUSg==
X-CSE-MsgGUID: 9YZ0KE6QQk+0A/8SGskStg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="67008839"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Sep 2024 02:00:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soJDL-0003Gy-0T;
	Wed, 11 Sep 2024 09:00:39 +0000
Date: Wed, 11 Sep 2024 16:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 777/13927]
 arch/loongarch/kernel/legacy_boot.c:439:25-27: WARNING !A || A && B is
 equivalent to !A || B
Message-ID: <202409111619.Ho8mrUHm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   63fb41399626bd7c0b102eec56b5790ef3909db6
commit: db5bb24abc8dd120fd81b7ce21819e96578d011e [777/13927] LoongArch: Old BPI compatibility
config: loongarch-randconfig-r061-20240911 (https://download.01.org/0day-ci/archive/20240911/202409111619.Ho8mrUHm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111619.Ho8mrUHm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/legacy_boot.c:439:25-27: WARNING !A || A && B is equivalent to !A || B

vim +439 arch/loongarch/kernel/legacy_boot.c

   423	
   424	static struct fwnode_handle * __init parse_isa_base(u64 *cpu_addr)
   425	{
   426		struct device_node *np;
   427		const __be32 *ranges = NULL;
   428		int len;
   429		struct device_node *node;
   430	
   431		for_each_node_by_name(np, "isa") {
   432			node = of_node_get(np);
   433	
   434			if (!node)
   435				break;
   436	
   437			ranges = of_get_property(node, "ranges", &len);
   438	
 > 439			if (!ranges || (ranges && len > 0))
   440				break;
   441		}
   442		if (ranges) {
   443			ranges += 2;
   444			*cpu_addr = of_translate_address(np, ranges);
   445			return &np->fwnode;
   446		}
   447	
   448		return NULL;
   449	}
   450	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
