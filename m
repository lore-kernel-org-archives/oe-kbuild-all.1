Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DB92701D1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 14:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748357309; cv=none; b=Hl/t9GM7mw8cFIyif0yu3CAN+i97arnEjGSQp8dSUgduM1fDHseZfM3fIx7wX7Mc7yo7bQhnUO/2yepNrbsCw3+THyycfvX3Dw2C9xlUNwttv+c6B6uhGZF28xKPW660nPoQjSnb6Hd/or3JsANPyrv70jCIY3efGyPthVynEQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748357309; c=relaxed/simple;
	bh=e3OVFoqrQXCaH2exVVsEx95fBWDGg2BXDopz3qajXr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F0+NJs/9UuqorBHA1laXOXk03Jh+kwth8VItRVNl51J7TbyFmFpARI0b5pDPVZa64tkDxqVoZ0pd+HWfXjVnYUI/L+ounON9aqXDmjhZC5WZQMqgqw9XwhtiYNUIeU5Hv4zHoLX522UAxBRGFy8FbmlS1NzFTdG7JD47comWegc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aSXScAAi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aSXScAAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748357307; x=1779893307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e3OVFoqrQXCaH2exVVsEx95fBWDGg2BXDopz3qajXr8=;
  b=aSXScAAieneDCZDS/NrivJv+lvkx5fZk+8BNbPvk9V76MdtTMOpclvmj
   idEAJ0/Eo+w++qKKcvD7QguSgV3OLgyd/ghpyjU/e44naKnugkJ2Seij9
   Bn8Sc5nml+dJEKB7OVpBkRdKf6Y/PEXbyAchkk39++RBC4S2kpYlmag7G
   nwKotN/kbnYvpYiQDlNmDSCs7BYvYjAS/7STX/az8xGHIzy+f5FD4lSAi
   BscpMjGnysCa4PY88iJLtA29ytCTeYWo/vbLCHw2huQbf4v5VhfXUlsdG
   jYo7IjZeo+gD6iMm+0+RZolFYGmclbORkD40q8H/bQgF5CjuJu7FxwIxW
   A==;
X-CSE-ConnectionGUID: cfPnxknATgCfZd3kZMhtPw==
X-CSE-MsgGUID: wylDTJ5XSxKnuLsABshsZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50508128"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="50508128"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 07:48:26 -0700
X-CSE-ConnectionGUID: QuJezz3bTMaEFA813Cznxw==
X-CSE-MsgGUID: +Dav0+sGSdCDdBJ09osAkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="173806030"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 May 2025 07:48:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJvbL-000THq-1m;
	Tue, 27 May 2025 14:48:23 +0000
Date: Tue, 27 May 2025 22:47:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2304/2304] mm/page_cache_limit.c:35:5: warning:
 no previous prototype for 'cache_reclaim_enable_handler'
Message-ID: <202505272226.RcAmWtpx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ze,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c81824893b87edffa39389711d160c2dd5a03e1e
commit: 621647ce254f1d347ae9bc3d328c09cbb2732487 [2304/2304] mm: support periodical memory reclaim
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250527/202505272226.RcAmWtpx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505272226.RcAmWtpx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505272226.RcAmWtpx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_cache_limit.c:35:5: warning: no previous prototype for 'cache_reclaim_enable_handler' [-Wmissing-prototypes]
      35 | int cache_reclaim_enable_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/page_cache_limit.c:51:5: warning: no previous prototype for 'cache_reclaim_sysctl_handler' [-Wmissing-prototypes]
      51 | int cache_reclaim_sysctl_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cache_reclaim_enable_handler +35 mm/page_cache_limit.c

    34	
  > 35	int cache_reclaim_enable_handler(struct ctl_table *table, int write,
    36				void *buffer, size_t *length, loff_t *ppos)
    37	{
    38		int ret;
    39	
    40		ret = proc_dointvec_minmax(table, write, buffer, length, ppos);
    41		if (ret || !write)
    42			return ret;
    43	
    44		if (should_periodical_reclaim())
    45			schedule_delayed_work(&shepherd, round_jiffies_relative(
    46				(unsigned long)vm_cache_reclaim_s * HZ));
    47	
    48		return 0;
    49	}
    50	
  > 51	int cache_reclaim_sysctl_handler(struct ctl_table *table, int write,
    52			void *buffer, size_t *length, loff_t *ppos)
    53	{
    54		int ret;
    55	
    56		ret = proc_dointvec_minmax(table, write, buffer, length, ppos);
    57		if (ret || !write)
    58			return ret;
    59	
    60		if (should_periodical_reclaim())
    61			mod_delayed_work(system_unbound_wq, &shepherd,
    62					round_jiffies_relative(
    63					(unsigned long)vm_cache_reclaim_s * HZ));
    64	
    65		return ret;
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
