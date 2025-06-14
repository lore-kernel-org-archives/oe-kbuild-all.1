Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46E51B413D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 21:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749937360; cv=none; b=CPI4OQBV64MoWNPU7r74kWaMg1W+uIUKPQKK+k1Whvsw/Tq1WmMMlhmGixFiLMHqzXjLpcWiSUlVUuRKBB2NA+84HJ2lOc6rDkFRVEUyIs9KUa2DImV1+r1tNO41HKKf9cz0briI/bFgE2jxGh22ZjBW8Olb3g5j5j6mgRYmL1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749937360; c=relaxed/simple;
	bh=oeEZM2jq112NcqymilfFOurd87tdvBGr1gTHHvDM6lA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g94clubhDIVErszUksHtLPxBfGvPvnA8rzAa22DI9MwxrzpDUkSIwk1y5Q0BnUMprRySVascXToXCsgXNNy24qIF56QrBZSnQrDDCbLgPogemdEeviGbyc6VmPaYZtvTDp3TOqSzN8yHfHtW0T26F5fJuCBIIRSLF3kFT3DRgSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPlmhfWt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPlmhfWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749937359; x=1781473359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oeEZM2jq112NcqymilfFOurd87tdvBGr1gTHHvDM6lA=;
  b=SPlmhfWtH8dqrRdee6W0NWPVSbbYTxZgWH67nNfFwlc+9Qtbb7l5R2D5
   fJD4iNWBNkx2eZcsg7yZRaedykB021jVXXLInDRBUxkRyWyTp4SEZIM0x
   Y+nbwI0zncmnxn3GUyR3qCw1UFKgEX3A/ncsherdxtZYD1R3QP6CTTvkn
   WxtEE0nyt324QkBaBrlanxxXBX6XLJYy5kOMfYE6RvBT955WQR1rnQ6YP
   wfzfNQOPVFI3xwZaqEGW0yBZeSwmFyaVGWXywyvH/HtxQVYqJ/BfVt92j
   r3zSmVj03Vg5qGn1EtquxJp0LR+cCnSV8NcHbd5WXSnXvWGRbEjtr9K9X
   Q==;
X-CSE-ConnectionGUID: VknTHJnhTEeRJI7MmHFXEw==
X-CSE-MsgGUID: VEB+64dqQBaf70DKh8m3Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="55925780"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="55925780"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 14:42:37 -0700
X-CSE-ConnectionGUID: jRKRu7JmTh6FC0ATGxMTTg==
X-CSE-MsgGUID: CgZHwBvZQiipnnFg+7qJDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="147961228"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Jun 2025 14:42:36 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQYe1-000Dsw-12;
	Sat, 14 Jun 2025 21:42:33 +0000
Date: Sun, 15 Jun 2025 05:41:59 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-bandwidth-control 13/15]
 kernel/sched/core.c:8448:17: error: implicit declaration of function
 'scx_tg_init'; did you mean 'scs_init'?
Message-ID: <202506150526.zW9AsnQX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-bandwidth-control
head:   077814f57f8acce13f91dc34bbd2b7e4911fbf25
commit: 49668b4d8b790ac182e57d3bab3ac65b5f561192 [13/15] sched_ext, sched/core: Don't call scx_group_set_weight() prematurely from sched_create_group()
config: i386-buildonly-randconfig-002-20250615 (https://download.01.org/0day-ci/archive/20250615/202506150526.zW9AsnQX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150526.zW9AsnQX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150526.zW9AsnQX-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'sched_init':
>> kernel/sched/core.c:8448:17: error: implicit declaration of function 'scx_tg_init'; did you mean 'scs_init'? [-Werror=implicit-function-declaration]
    8448 |                 scx_tg_init(&root_task_group);
         |                 ^~~~~~~~~~~
         |                 scs_init
   kernel/sched/core.c:8448:30: error: 'root_task_group' undeclared (first use in this function); did you mean 'task_group'?
    8448 |                 scx_tg_init(&root_task_group);
         |                              ^~~~~~~~~~~~~~~
         |                              task_group
   kernel/sched/core.c:8448:30: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +8448 kernel/sched/core.c

  8447	
> 8448			scx_tg_init(&root_task_group);
  8449		}
  8450	
  8451		init_defrootdomain();
  8452	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
