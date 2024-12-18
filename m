Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E03D35974
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 04:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734497889; cv=none; b=am6qkaG1seHAr5TDjXFU61ce4R9c1gAUqF4L80cecr62gp7YR9+CFSRyiEBanFjVcu0LSQqeRqaXXlyuP1EM2Rb2D2TZFRNEXCXRUrrNa4XvLzUuSSKxqASYaOJ4xKxWyjSQBUsAUipC4f9F1SAi/BbKcRmuybseU8G667qqqE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734497889; c=relaxed/simple;
	bh=4Nu5wAo3/RMd4frrRTI0h7VgOzhAB0QHOhoKVIuGDHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mJHNaFAJqhUD1DKah1UWxsFbdqMAxImodWnsdEPzlZQz83nO+lCJ9r32AV8/0eOLmOfFtHhUtBpTdH+nePxNG1iVqdBpoJgovx/DwprA7Ulxzcc4/fxAw7tVMPiDUwMaT38Jio3zh7dgF7QVEyBtGp/7ou6NVblLlvgxILCjNmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cINNUzlG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cINNUzlG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734497887; x=1766033887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Nu5wAo3/RMd4frrRTI0h7VgOzhAB0QHOhoKVIuGDHM=;
  b=cINNUzlGQbanLO1uztZ5n/xvRdwGMoX3REEyQKm1XO/W0kM4zh/zzVPX
   b3+Lv6uMjY4qEaIFBalJYmTsB2lRvYsLgG5u5ktpcZ+v8ZLyYsYxasW+C
   hZy191nu2xydW8kDq4T7vlevcndwUI9pE7t+oTEuT6hqNphCVdZGyWpP8
   FnugV5VexBOMhDFwiPHfum/sjDS2MIYmGfbuzaRZTCJ9VbE5VUjM8O2br
   /WyMLpUSvET7iS1aaTOT5/I/tF1gDOIP+nPhZ8kcWi+RJnklJWsBHx3md
   Pn6AWD4V8VAnR7sPHI8x2BmFaRJGzA3yQzEiJXJfiX7J34667VvbU3Y0l
   A==;
X-CSE-ConnectionGUID: x5+zYZWoQd2Qy9L0pw3j9g==
X-CSE-MsgGUID: ZrV0iNKBQTG5yLwmhIAf7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34859834"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="34859834"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 20:58:06 -0800
X-CSE-ConnectionGUID: cLPbBlU5Qt2L06vRanlasA==
X-CSE-MsgGUID: 74tvC72US++GnBZK/C445g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102356894"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Dec 2024 20:58:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNm8J-000G6I-0Y;
	Wed, 18 Dec 2024 04:58:03 +0000
Date: Wed, 18 Dec 2024 12:57:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Kooran Paul, Princy" <princy.kooran.paul@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [intel-lts:6.12/linux 827/985]
 drivers/gpu/drm/i915/gt/iov/intel_iov_query.c:523:25: warning: variable
 'vf_regs' set but not used
Message-ID: <202412181220.syu10Ryh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   cc39c53db6bcd7f04407f1cae883e5d0af6db765
commit: d1d592bf75f7753518169d36bcc2dd9d196e27e3 [827/985] drm/i915: SR-IOV Enabling and Support
config: x86_64-buildonly-randconfig-001-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181220.syu10Ryh-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181220.syu10Ryh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181220.syu10Ryh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gt/iov/intel_iov_query.c:17:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_guc_print.h:9:
   In file included from drivers/gpu/drm/i915/gt/intel_gt.h:9:
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:21:
   In file included from drivers/gpu/drm/i915/i915_pmu.h:11:
   In file included from include/linux/perf_event.h:18:
   In file included from include/uapi/linux/bpf_perf_event.h:11:
   In file included from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1:
   In file included from include/uapi/asm-generic/bpf_perf_event.h:4:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gt/iov/intel_iov_query.c:523:25: warning: variable 'vf_regs' set but not used [-Wunused-but-set-variable]
     523 |         struct vf_runtime_reg *vf_regs = iov->vf.runtime.regs;
         |                                ^
   5 warnings generated.


vim +/vf_regs +523 drivers/gpu/drm/i915/gt/iov/intel_iov_query.c

   520	
   521	static void vf_show_runtime_info(struct intel_iov *iov)
   522	{
 > 523		struct vf_runtime_reg *vf_regs = iov->vf.runtime.regs;
   524		unsigned int size = iov->vf.runtime.regs_size;
   525	
   526		GEM_BUG_ON(!intel_iov_is_vf(iov));
   527	
   528		for (; size--; vf_regs++) {
   529			IOV_DEBUG(iov, "RUNTIME reg[%#x] = %#x\n",
   530				  vf_regs->offset, vf_regs->value);
   531		}
   532	}
   533	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
