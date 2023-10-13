Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFA0A29
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 01:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/vQs2lF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697161727; x=1728697727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UG9ES++WKqZ59RHEQppR8nkySGPfKN7aCc09saMvjvM=;
  b=b/vQs2lFLP3F+hvAjeeZh+wOvqqop6Om2MrSDvmKj+TcwZHlB+pK3jnq
   SL8zf8dB1yBpbNUPcIgnrF7BzIhGx49oqJkBFE3+TtKd8wb46VtTinzHj
   npmjDqYbkXjwVeigS3VLXoyul8lp3boM6XxwRSIIcTXeTDn9p+O4uo1Pf
   Xh4YHuUHfmHNJiNUtlbVxkvPnu3Tun6Cg/QoBg0knxytVZKUvDio7790S
   e5S0SZ/VWNPi4zr69kCe426Nau1Tw4oba9KDneMG+Nedwyz3V/+obN3T0
   CN0kX0UfLGq+T6Gg+P+NnVIhEVmckbXUKME/Dg16+FRz9g6IOkTAkXM3Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="365339911"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="365339911"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 18:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845225114"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="845225114"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Oct 2023 18:48:45 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr7IA-0004Cj-2j;
	Fri, 13 Oct 2023 01:48:42 +0000
Date: Fri, 13 Oct 2023 09:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 303/30000] include/drm/drm_of.h:64:12:
 warning: 'drm_of_component_probe_with_match' defined but not used
Message-ID: <202310130927.ZGGJJwMk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 36b8a992d5edfe911dff5c38a7535be141122853 [303/30000] MLK-16290 drm: Add drm_of_component_probe_with_match() helper
config: parisc-randconfig-002-20231013 (https://download.01.org/0day-ci/archive/20231013/202310130927.ZGGJJwMk-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130927.ZGGJJwMk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130927.ZGGJJwMk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:99,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from drivers/gpu/drm/etnaviv/etnaviv_drv.c:7:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
   arch/parisc/include/asm/pgtable.h:91:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   arch/parisc/include/asm/pgtable.h:316:34: note: in expansion of macro 'set_pte_at'
     316 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:201:9: note: in expansion of macro 'pte_clear'
     201 |         pte_clear(mm, address, ptep);
         |         ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
   arch/parisc/include/asm/pgtable.h:91:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   include/asm-generic/pgtable.h:629:9: note: in expansion of macro 'set_pte_at'
     629 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |         ^~~~~~~~~~
   In file included from drivers/gpu/drm/etnaviv/etnaviv_drv.c:16:
   include/drm/drm_of.h: At top level:
>> include/drm/drm_of.h:64:12: warning: 'drm_of_component_probe_with_match' defined but not used [-Wunused-function]
      64 | static int drm_of_component_probe_with_match(struct device *dev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_of_component_probe_with_match +64 include/drm/drm_of.h

    63	
  > 64	static int drm_of_component_probe_with_match(struct device *dev,
    65				   struct component_match *match,
    66				   int (*compare_of)(struct device *, void *),
    67				   const struct component_master_ops *m_ops)
    68	{
    69		return -EINVAL;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
