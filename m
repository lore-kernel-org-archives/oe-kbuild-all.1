Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED651B81CA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 04:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763873455; cv=none; b=MDY4iQyCZ+S8twj3xIKNxQLfnYIOjvVQ8Zd+LDUECszR5KPKH6DjkTH+J8/YoDVPBfhQFXk5AjSFe8WEF7NgeY88GMZvap/mTlb8D2eDavVyFREwWj8c7/NnWBRDBXHQJYvPija+bpJCbO2Noz373y5YUay9p0fmoyhV+isl6TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763873455; c=relaxed/simple;
	bh=qpqkIIIsZ7xwTM1cRIOwGEgdenILIdU8L+rTPQ9HFWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EDfPjNwxoZvZnM0IZTEwHjKgZ2XQfsLhUthSZp0JKvstsukfp24gulCq90UqHyoFZ7n5y+zrwhN74qwImfwf/tdCba22NdsaYt/vh1jNL7PJ8Jd3rRhiLdn0hk+m1z4sJTlZ8YbDI4MeqpvRtVmZJtLj1C/k/AdRF3wimBvyKcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKcLrkVc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKcLrkVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763873454; x=1795409454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qpqkIIIsZ7xwTM1cRIOwGEgdenILIdU8L+rTPQ9HFWM=;
  b=BKcLrkVcs0Pf2H8MUQT/issecmBcfqXT9Hd6HeWcVjQWAdtxBwfb29/1
   pYubxbnBlw42niYpaf41L/1gNyIt2Us4FMVAgoZZh72UecEMgKgJfoEOk
   djCChda74KV4i9Etg7rZ/nXUK5BRdqizQg18auBX+CJyg7h/34pnSNFX4
   prLYnwe6R0gRHuI6vr3AsD1FDCo6/Lk86A0pmp+NGp35bsa2IQjPbcwwy
   u+DwfnJZcR9mHSPo03kbYSCKHVMkjAgmWyDEWOT3xBszRlu/SUmxLMoAr
   jpY/DcEw/6tTCVVa21T8F9qS89nZJVT2yzP4NRv9r2jhwEvCEptiBorYE
   Q==;
X-CSE-ConnectionGUID: b5f7FXg1S2KxLGBojQobDQ==
X-CSE-MsgGUID: M5x5tM/rR4mvmx4me3iSAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="69531963"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="69531963"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 20:50:54 -0800
X-CSE-ConnectionGUID: Qx0Hu6GTQWyARFqkH/6Baw==
X-CSE-MsgGUID: hK88TpNxRRaIWtJfPnKwEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="192143560"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Nov 2025 20:50:52 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN23l-00083N-24;
	Sun, 23 Nov 2025 04:50:49 +0000
Date: Sun, 23 Nov 2025 12:50:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740] mm/mem_reliable.c:272:5:
 sparse: sparse: symbol 'reliable_debug_handler' was not declared. Should it
 be static?
Message-ID: <202511231249.SCHd8IbF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6c5657aecca1857be6ea39f789159c9acfde2f9e
commit: 851a3ff0b4de68403c9a344c3d5378aa590705b7 [1740/1740] mm: Introduce proc interface to control memory reliable features
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20251123/202511231249.SCHd8IbF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231249.SCHd8IbF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231249.SCHd8IbF-lkp@intel.com/

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
