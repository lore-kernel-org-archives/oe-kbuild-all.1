Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA151E495
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 11:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737719076; cv=none; b=dA0CuL1gDFfVobsZHzEPoDP4da7OSIlEyPb+egMu1KXkVWwTzth2cnk9/ac196wWLjPgzfwNTlfnqxjRde9hHmn0cAgR3uF/3AEZKViTx3HnMjCV8p8VwMFCXDhknZRHZY3UQt7QpG9uQdscwB/a0CxqvllokPcGg5lFWaNBkwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737719076; c=relaxed/simple;
	bh=35naRzx3RqHGNBBi4SU9R4p7JITXRIUbc+Q4a4PEUkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OcEGcXs+4QGJfQMmwJ7l9Q6WleFu4ZQMgsLdY2GhBMihUf4gX5u2Mi2n2G16WL1FKU5cscXRNatk5woV4iiMGwffMWgrNjItjusjzUmAwfBSh+2jPcVEhi5R1mT+hTeXRF7RABHFx3Z6WHIQLPNvBQN7JcVUsZ+44dPQX9xn0Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXwXGTmt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXwXGTmt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737719074; x=1769255074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=35naRzx3RqHGNBBi4SU9R4p7JITXRIUbc+Q4a4PEUkk=;
  b=aXwXGTmtPCgWLuSlsT4pdIZ0ZYec+IeuW+zEXoCdlKk2OjS/fzsL9avG
   jpYRzrHLt+HukNrl8iySSFfT9vYHmHQz5CFMdTdDIb92druy5wrWR3ObN
   MWU45kZNKavRYeAPatWK79lMUCbU0otwceRIxpkWcBRjpJNTwdjrtJyQ4
   hxMloyHcGxfescoGeiErsXn2j7+k8AxK9STf+ZFpre+f5bUZKYD5zsMvp
   mHcQLbXXrytiAdXQ4doFV7LeoSTkDlKogX5i75qIXnd6kULKX2V6nEsbx
   OR23ET0lzOsHoX06Zg/5OHpAO8CAxWoJQegH+wev4jXH3Pa4HCcT4NfEs
   Q==;
X-CSE-ConnectionGUID: Zon40M1hQ+yXi2LV0CgDjQ==
X-CSE-MsgGUID: iu78L6OJS+eXAL2XJTISNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38280803"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="38280803"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 03:44:34 -0800
X-CSE-ConnectionGUID: fL9eZmMcSrekahyyBM+42w==
X-CSE-MsgGUID: nLCA0YZhQnG9VsbSs+IRjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="112758568"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Jan 2025 03:44:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbI6w-000ccd-23;
	Fri, 24 Jan 2025 11:44:30 +0000
Date: Fri, 24 Jan 2025 19:43:49 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:compat_get_cpumask 6/8] include/linux/cpumask.h:631:29:
 error: conflicting types for 'cpumask_clear'; have 'void(struct cpumask *,
 long unsigned int)'
Message-ID: <202501241932.dgCSxI1D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux compat_get_cpumask
head:   fcdaaa19ef642222d180bc0ac83bcc1fcc90ddfe
commit: 6f976707ef5fdb55383287e3a0960eadefda5184 [6/8] compat: add compat_get_cpumask
config: i386-buildonly-randconfig-003-20250124 (https://download.01.org/0day-ci/archive/20250124/202501241932.dgCSxI1D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501241932.dgCSxI1D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241932.dgCSxI1D-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
>> include/linux/cpumask.h:631:29: error: conflicting types for 'cpumask_clear'; have 'void(struct cpumask *, long unsigned int)'
     631 | static __always_inline void cpumask_clear(struct cpumask *dstp, unsigned long cpu)
         |                             ^~~~~~~~~~~~~
   include/linux/cpumask.h:620:29: note: previous definition of 'cpumask_clear' with type 'void(struct cpumask *)'
     620 | static __always_inline void cpumask_clear(struct cpumask *dstp)
         |                             ^~~~~~~~~~~~~
   include/linux/cpumask.h: In function 'zalloc_cpumask_var':
>> include/linux/cpumask.h:1003:9: error: too few arguments to function 'cpumask_clear'
    1003 |         cpumask_clear(*mask);
         |         ^~~~~~~~~~~~~
   include/linux/cpumask.h:631:29: note: declared here
     631 | static __always_inline void cpumask_clear(struct cpumask *dstp, unsigned long cpu)
         |                             ^~~~~~~~~~~~~
   include/linux/cpumask.h: In function 'zalloc_cpumask_var_node':
   include/linux/cpumask.h:1010:9: error: too few arguments to function 'cpumask_clear'
    1010 |         cpumask_clear(*mask);
         |         ^~~~~~~~~~~~~
   include/linux/cpumask.h:631:29: note: declared here
     631 | static __always_inline void cpumask_clear(struct cpumask *dstp, unsigned long cpu)
         |                             ^~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/crypto.h:17:
   include/linux/mm_types.h: In function 'mm_init_cpumask':
>> include/linux/mm_types.h:1089:9: error: too few arguments to function 'cpumask_clear'
    1089 |         cpumask_clear((struct cpumask *)cpu_bitmap);
         |         ^~~~~~~~~~~~~
   include/linux/cpumask.h:631:29: note: declared here
     631 | static __always_inline void cpumask_clear(struct cpumask *dstp, unsigned long cpu)
         |                             ^~~~~~~~~~~~~
   In file included from arch/x86/include/asm/sigframe.h:8,
                    from arch/x86/kernel/asm-offsets.c:18:
   include/linux/compat.h: At top level:
>> include/linux/compat.h:955:32: warning: 'struct cpumask_t' declared inside parameter list will not be visible outside of this definition or declaration
     955 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |                                ^~~~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2212155603
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=2212155603
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=2212155603
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=2212155603
   make: Target 'prepare' not remade because of errors.


vim +631 include/linux/cpumask.h

   624	
   625	/**
   626	 * cpumask_clear_from - clear all cpus (< nr_cpu_ids) in a cpumask,
   627	 *			starting from a given one
   628	 * @dstp: the cpumask pointer
   629	 * @cpu: CPU to begin with
   630	 */
 > 631	static __always_inline void cpumask_clear(struct cpumask *dstp, unsigned long cpu)
   632	{
   633		bitmap_clear(cpumask_bits(dstp), cpu, large_cpumask_bits);
   634	}
   635	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
