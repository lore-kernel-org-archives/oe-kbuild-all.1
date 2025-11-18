Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61053324B39
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 03:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763436273; cv=none; b=pVEcY5/Fv/D/fxv2oLkovWeryhx3Sw5gxxlIRZXRrhVIP+8BluQsx+OLrZrzjfebq0QdqWCLP6+BYVLvebUAQlN9e9xVGcHmrQoxeed7AyzEsSXtsochrYW0s3619THaiBB/2FECCB/X3jfqURCdHNeN8+Dq5UZgOLOKwJjZbOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763436273; c=relaxed/simple;
	bh=DkzjDx6Y585OJjB7dB8moTxtMUAdqfLGsenciVaWu+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Be/FzKxy0QfeiGeGZjzLcdgx5KAAq6+QEC0HSfDmiT7DwaXXHpdh6+m7UfxeqxfGODAXOECOJYNdLXS0pPDKkXs1AKBMa+equbsIrgh7pEF6GB3AeoNThC5ifOTc7bUZcg+95BZj3Kx/cBsP0xVrMDXsdSZnchq8u0ior2rrgsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHZTkRMT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHZTkRMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763436271; x=1794972271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DkzjDx6Y585OJjB7dB8moTxtMUAdqfLGsenciVaWu+0=;
  b=lHZTkRMTSu2TH9nDgQ2CIpApDHrPTWrtuzVcaMi/e+dqbKDXVQglQ0Cq
   9IO2bHKiZhLB9Kh+D9JMDjI/fnrOrIcCiQ7RJxLgz+S+TaeHP2rJVkkIk
   09bgJgeWCyiM+GM6pAQ4Qxvo6qTmX+rrBSpG5cYpLGCKvbhrio/n9qgWE
   MimvFfrr6tyT580LYDna+efUB3VBt8+doz3OVuBvnajB1AFXLg5cYO6vl
   p5u/HpQqvL7Wqp5V5fTOjXHswd85ybXsTaX95GZHoTMKhCyrw9D0JvIFd
   3r2AtMPKoDutEoTGDHpdRYu+k95eLWIi7x9BWHb8SNQ61mw1n1Hsr2xq3
   g==;
X-CSE-ConnectionGUID: zTXyVGuoSJGOBVKjIWNBew==
X-CSE-MsgGUID: ZD7KpWm5QRCzp9Df9mc1Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="68054105"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="68054105"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 19:24:30 -0800
X-CSE-ConnectionGUID: M1bf4BwwSVivNrw/188h0g==
X-CSE-MsgGUID: VgPqxrUWSb2CfbGeY8m2ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="191421212"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Nov 2025 19:24:29 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLCKR-0001Hn-0P;
	Tue, 18 Nov 2025 03:24:27 +0000
Date: Tue, 18 Nov 2025 11:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangjian <zhangjian496@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3214/3214] mm/gmem_phys.c:18:1: sparse: sparse:
 symbol 'hnode_lock' was not declared. Should it be static?
Message-ID: <202511181114.4QpjxRoN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4bd802eb810aced0425a9fbdedbf306c0c1e0fda
commit: ef19106bc1b493f2eb9d312de86f3cc0896b218a [3214/3214] gmem: introduce hnode for free peer-shared free page management
config: x86_64-randconfig-r111-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181114.4QpjxRoN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181114.4QpjxRoN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181114.4QpjxRoN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/gmem_phys.c:18:1: sparse: sparse: symbol 'hnode_lock' was not declared. Should it be static?

vim +/hnode_lock +18 mm/gmem_phys.c

    16	
    17	
  > 18	DEFINE_SPINLOCK(hnode_lock);
    19	static nodemask_t hnode_map;
    20	struct hnode *hnodes[MAX_NUMNODES];
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
