Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0853330676
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 13:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257161; cv=none; b=Uo3WsbPRvq6cynwH0KlBVNdQPzw9WRFY2KuFsjntMxge3IKJRxFoIFqXseIqiFhdlRb6Kw4aAYpSZa74FbtJHXzJgL7HPKHsHBCZ0HB56DbrPkJ5becDlbVJWxSH/brvRZNycYJXZkx27n/NTX2VlLgG2WJX1HtDE+FlQp/nbSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257161; c=relaxed/simple;
	bh=Q4DMe6udOxkGyzvb8BBBa14qugZDHVyIaZ9M34UwcOg=;
	h=Date:From:Cc:Subject:Message-ID; b=eJkSCug2GUBzKT2HV7Q/qNm9lLFxlF06lyEbFuIfWRRgwy0jQFRdTqby5bdUla9WE6FNuQTfFx5P9TMkCBJmlfBmu88lvIbW9C3GpbvhToe122ibSBZEU0ILQZkISIfSOTSK5IgbmP3siaPCFfLan50vldnAGEXZW+G+OvLbFgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbhYXOLD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbhYXOLD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790257155; x=1821793155;
  h=date:from:cc:subject:message-id;
  bh=Q4DMe6udOxkGyzvb8BBBa14qugZDHVyIaZ9M34UwcOg=;
  b=DbhYXOLDSJpHYHyUyDh/VGJ3Oi+tY4BjndoFRw5K3DEPdg8ibnSol+Y3
   NiSXlHqiwJoE4X4uTOvhETS227hxTDGIdaivcQRDkuftqIVsTFmodRKkC
   KuAuLz+3PvuWqYdTAgQM25qtk00Irn0zUDpxfg6rylvPi3RPJ7DZu61hy
   ANmbJvxZ7z/uvtlxmYQny+RK2jJuCYPx0GUaaHPXD9dpZNmopr29QWy07
   QH15VMx71K+HtpKkySxmJ91s2+k8rnbmd8wqiYM9A6UdU0e0+4gguLnoc
   PUmuwAwomVSIpA9BaFGamHIDON4rRP6aC1SrpfpjqEAX3tpLF9dc4YVcK
   A==;
X-CSE-ConnectionGUID: AMG3eRGtQ7eCvEIJK80n2Q==
X-CSE-MsgGUID: eytEPPIVQaGwONAkLqJ+Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="108522537"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="108522537"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 06:39:11 -0700
X-CSE-ConnectionGUID: yk127oExR/aXhJgRdra1cA==
X-CSE-MsgGUID: 7mfT1HQzTKewAcBp2wwLpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="301961222"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 24 Sep 2026 06:39:10 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9jfH-000000000Kw-43Lw;
	Thu, 24 Sep 2026 13:39:07 +0000
Date: Thu, 24 Sep 2026 15:38:16 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: [intel-tdx:v7.3-rc4_tdx_connect_phase2.for_upstream 8/44]
 include/linux/device/trust.h:35:61: error: invalid use of undefined type
 'struct module'
Message-ID: <202609241546.VygTNKX1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/tdx.git v7.3-rc4_tdx_connect_phase2.for_upstream
head:   69fd611d89afafa408b11f0e1304297433d3d471
commit: fa72ad859365251f835846b18b5c1beb2fd36de9 [8/44] device core: Initial device trust infrastructure
config: sparc-randconfig-2000-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241546.VygTNKX1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241546.VygTNKX1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241546.VygTNKX1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/percpu.h:5,
                    from include/linux/prandom.h:13,
                    from kernel/sched/sched.h:8,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/device/trust.h: In function 'module_driver_trust':
>> include/linux/device/trust.h:35:61: error: invalid use of undefined type 'struct module'
      35 |         pr_warn("module: %s: trust= support disabled\n", mod->name);
         |                                                             ^~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:564:9: note: in expansion of macro 'printk'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/device/trust.h:35:9: note: in expansion of macro 'pr_warn'
      35 |         pr_warn("module: %s: trust= support disabled\n", mod->name);
         |         ^~~~~~~
   make[3]: *** [scripts/Makefile.build:185: kernel/sched/rq-offsets.s] Error 1 shuffle=3302653350
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2 shuffle=3302653350
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3302653350
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3302653350
   make: Target 'prepare' not remade because of errors.


vim +35 include/linux/device/trust.h

    28	
    29	#ifdef CONFIG_DEVICE_TRUST
    30	void module_driver_trust(struct module *mod, const char *val);
    31	void module_driver_trust_init(struct module *mod, bool distrust);
    32	#else
    33	static inline void module_driver_trust(struct module *mod, const char *val)
    34	{
  > 35		pr_warn("module: %s: trust= support disabled\n", mod->name);
    36	}
    37	static inline void module_driver_trust_init(struct module *mod, bool distrust)
    38	{
    39	}
    40	#endif
    41	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
