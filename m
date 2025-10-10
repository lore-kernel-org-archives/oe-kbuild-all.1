Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8F8175D53
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 19:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760124859; cv=none; b=gcmywaYd6Lu53DXix51OGVBpYBSg0xgvFBmjxAp3wDtx4DCJb7QzTsfq9JjBDxWZzdODlfrhvoBMKsIPA3Zbe4KyQJE60d2vz8cQgl49yXPyateikjZFzCYR/TWVctFS2nnWeTJpgqs6CMIubCkAdFdZR+gKwao4+jgG9NNtWa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760124859; c=relaxed/simple;
	bh=AK2MgN1BQedEnBz3CUjcXYa9Ikvl0nDR18gY6obbivM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Prpkzi12X7TgmFYcwWLLqAZvHfiV9csnQroz2ceZ9fRdoLjU69PIFFA7xEKTMga7GNVYmn3MqLk5AzE8CfRoFZ6BEw93CL01U1SDjZchI3bIMJxjRVD6ondoIGRoc0olXmprcudKDC3fTYWWBoTpkSSf0ZImlt6TGKQn4Ndfl9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGyP+G+8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGyP+G+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760124858; x=1791660858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AK2MgN1BQedEnBz3CUjcXYa9Ikvl0nDR18gY6obbivM=;
  b=jGyP+G+8aAGyVYRDq5os3C5DDi2a6fDubwBRsdn9frUQbJlJFGXkoah1
   ATSjXSgI7dOsAINuDz1uZ39ZwyAx3n5LUX/zq2o34pWTiTnViVZ9mK1nt
   2RWgd60kd0DYGTVF+AeGhLfVkajeDoYzy9HPoIuC2iAQj7Tlhjl5/Y/jw
   GEDBcPyIADRgD9ch5ds1uQiEGTpXX2pDaYKqwjGEL9V1bAovaBc5YbyaV
   YS4h1/JwQGEozXpavc/HijyHg8Jbp63ssfVvJBB/XBTHS7XKErA2HbsWQ
   ePuPehJMGrRZcv4/o4eXdIFNO3m5WkO+CjypbX6JMNDwtuJmHVW4aQAK0
   g==;
X-CSE-ConnectionGUID: LtzR5dcdRDWNOiIvboTnaQ==
X-CSE-MsgGUID: P/AwKcXGS2KQXpd/y3rlJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62292173"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62292173"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 12:34:17 -0700
X-CSE-ConnectionGUID: mwLo7gp4SBmP3JlixyUPGw==
X-CSE-MsgGUID: BRNEBoe2TgW14PNDy5u1Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="181475549"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Oct 2025 12:34:15 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7IsX-000367-1r;
	Fri, 10 Oct 2025 19:34:13 +0000
Date: Sat, 11 Oct 2025 03:33:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740] mm/mem_reliable.c:272:5:
 sparse: sparse: symbol 'reliable_debug_handler' was not declared. Should it
 be static?
Message-ID: <202510110340.ruwgNuQn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0e7e343932646d9a28d9b5f8b025d781051fa52a
commit: 851a3ff0b4de68403c9a344c3d5378aa590705b7 [1740/1740] mm: Introduce proc interface to control memory reliable features
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20251011/202510110340.ruwgNuQn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110340.ruwgNuQn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110340.ruwgNuQn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mem_reliable.c:52:14: sparse: sparse: restricted gfp_t degrades to integer
   mm/mem_reliable.c:199:5: sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it be static?
>> mm/mem_reliable.c:272:5: sparse: sparse: symbol 'reliable_debug_handler' was not declared. Should it be static?
   mm/mem_reliable.c:199:5: warning: no previous prototype for 'reliable_limit_handler' [-Wmissing-prototypes]
     199 | int reliable_limit_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/mem_reliable.c:272:5: warning: no previous prototype for 'reliable_debug_handler' [-Wmissing-prototypes]
     272 | int reliable_debug_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~

vim +/reliable_debug_handler +272 mm/mem_reliable.c

   271	
 > 272	int reliable_debug_handler(struct ctl_table *table, int write,
   273		void __user *buffer, size_t *length, loff_t *ppos)
   274	{
   275		unsigned long old_ctrl_bits, new_ctrl_bits;
   276		static DEFINE_MUTEX(reliable_debug_mutex);
   277		int ret;
   278	
   279		mutex_lock(&reliable_debug_mutex);
   280		old_ctrl_bits = mem_reliable_ctrl_bits;
   281		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   282		if (ret == 0 && write) {
   283			if (mem_reliable_ctrl_bits > (1 << CTRL_BITS_SHIFT) - 1) {
   284				mem_reliable_ctrl_bits = old_ctrl_bits;
   285				mutex_unlock(&reliable_debug_mutex);
   286	
   287				return -EINVAL;
   288			}
   289	
   290			new_ctrl_bits = mem_reliable_ctrl_bits;
   291			mem_reliable_ctrl_bits = old_ctrl_bits;
   292			if (!!test_bit(MEM_RELIABLE_ALL, &new_ctrl_bits))
   293				mem_reliable_parse_ctrl_bits(new_ctrl_bits);
   294			else
   295				mem_reliable_disable_all();
   296		}
   297	
   298		mutex_unlock(&reliable_debug_mutex);
   299	
   300		return ret;
   301	}
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
