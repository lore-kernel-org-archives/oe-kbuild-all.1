Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173EB2D594F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 13:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859692; cv=none; b=A6Ky4teEO5I6ninCe+zxa8YngebnaVH9oDK9ceghx7IgGBppA5Ka4swWu4hkp/4g9sw4Koumq4ayr/cK5NyNYhXQ8NW8bn1tuFPp3+q3gPqRNYs6WIGxkQ2zU2Q9Bbq3ib1KAEFxru9Vthx56XUGnItIVbVMJicCs/Y7weY9wk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859692; c=relaxed/simple;
	bh=15T93qPlkuSfVWhDDq4Mn1dJqAOhw4anS03ja+UfInY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y02OVCs/qLPS/0JL+4pEvhOAsI3/AKC/K1ckfjY/LT/Ncv6g+RqdZ+9HDAXYAy7tnC57FDMn4gDyxDB34gUFY6AvwM4xVaDiXDR2hqn7sobgRFbIXOvH+x2M11XVisVvRJpw+/N3NZiUoUDaHHI0RE/HtB34YwhHwi2qUsmxgXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nv6My+V+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nv6My+V+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790859690; x=1822395690;
  h=date:from:to:cc:subject:message-id;
  bh=15T93qPlkuSfVWhDDq4Mn1dJqAOhw4anS03ja+UfInY=;
  b=Nv6My+V+Mc5tbcmJYBs9rLrpbO3ACAbCfkwoYbH9SPaWQEPRnx2DR0Yt
   biRFJewXcEiDb6qglYEsdPDlVq3jnhmArF0Rpky15igBDjZsNXZGKDPfv
   6lozzGyrRWbnWnLfZcJwuMOd3+iIkJ0CJOP9VA/GddOLP6L5Tx0jAZ/ly
   bPTabeLo8T9HpYOTEEG5Q5Wj/sBrwzjHn4fJk11yJy1r8zBzd4x38mAc6
   fzgMS1ZarlrFYX0fnrV1gANdE9I+LIngaGcZZmVMcXvXlybAGoLEZwkfj
   tl5vzbzlwkCEaR/zGp0cfsM6mogwxy4S10MJlr2ACPMp3ugg8BkwGZi1J
   g==;
X-CSE-ConnectionGUID: MyDLSl6OQayS1URwHEYFIQ==
X-CSE-MsgGUID: hxVX/TdCQxS6EjUsvYZ61g==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90670412"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="90670412"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 06:01:30 -0700
X-CSE-ConnectionGUID: SmTKwIlMQb6CNTr7xaXZvQ==
X-CSE-MsgGUID: jOsYOXY3SmKICHMTPyByyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="274073142"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 01 Oct 2026 06:01:28 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCGPc-0000000006J-3tec;
	Thu, 01 Oct 2026 13:01:24 +0000
Date: Thu, 01 Oct 2026 15:00:38 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 9/9] mm/vmscan.c:4372:6:
 warning: no previous prototype for function 'isolate_folio'
Message-ID: <202610011432.V4leVHDj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi yipeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   f82d63769e69a466e16c4895f07a627665651cea
commit: 0e47a7391b3e2e57c4769f14a7be0ba7b56b10ca [9/9] ANDROID: mm: export isolate_folio and reclaim_pages
config: x86_64-randconfig-r2202-20261001 (https://download.01.org/0day-ci/archive/20261001/202610011432.V4leVHDj-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610011432.V4leVHDj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610011432.V4leVHDj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> mm/vmscan.c:4372:6: warning: no previous prototype for function 'isolate_folio' [-Wmissing-prototypes]
    4372 | bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
         |      ^
   mm/vmscan.c:4372:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4372 | bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
         | ^
         | static 
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && 64BIT [=y]


vim +/isolate_folio +4372 mm/vmscan.c

  4371	
> 4372	bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
  4373	{
  4374		bool success;
  4375	
  4376		/* swap constrained */
  4377		if (!(sc->gfp_mask & __GFP_IO) &&
  4378		    (folio_test_dirty(folio) ||
  4379		     (folio_test_anon(folio) && !folio_test_swapcache(folio))))
  4380			return false;
  4381	
  4382		/* raced with release_pages() */
  4383		if (!folio_try_get(folio))
  4384			return false;
  4385	
  4386		/* raced with another isolation */
  4387		if (!folio_test_clear_lru(folio)) {
  4388			folio_put(folio);
  4389			return false;
  4390		}
  4391	
  4392		/* see the comment on MAX_NR_TIERS */
  4393		if (!folio_test_referenced(folio))
  4394			set_mask_bits(&folio->flags, LRU_REFS_MASK | LRU_REFS_FLAGS, 0);
  4395	
  4396		/* for shrink_folio_list() */
  4397		folio_clear_reclaim(folio);
  4398		folio_clear_referenced(folio);
  4399	
  4400		success = lru_gen_del_folio(lruvec, folio, true);
  4401		VM_WARN_ON_ONCE_FOLIO(!success, folio);
  4402	
  4403		return true;
  4404	}
  4405	EXPORT_SYMBOL_GPL(isolate_folio);
  4406	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
