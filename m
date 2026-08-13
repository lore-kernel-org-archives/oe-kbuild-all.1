Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B500C3321C2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 01:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786585264; cv=none; b=ccIlZKK537W9RIz6MNYlwUW75bWZMvUqyutvzv4eaybji9l363DzIx8hrfcoo3AUw+f8pSROmGDYo3xgi8kKxdDZ/0IjMEDgjSlo6PPEI9BjkfhAJJkurNlXoy78ge1OB1DKx4ONzRZG6yWAu0u4rbIz9psRljCStoaECT7dqQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786585264; c=relaxed/simple;
	bh=4JSNAZYpZNr4CTjTYG5Pyw/Np7Ahvfax20/qkBbZmD8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hCGDmsnGdKMJ3WlnnNZx9qn8ShwurkqBXmj9iZ09Ra7za8+18gup5ZfGYASJzOlp+T++W8eTa0ZkFhE+rsBLdcUXba7IDa5Akmhxk4okABWxvous7zWiRZISQrP5tZK6EZWf6Y+cHFRk+Hx0wm/6QseHwlOyS/H71JcVxrAXiso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvFVoHGF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvFVoHGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786585262; x=1818121262;
  h=date:from:to:cc:subject:message-id;
  bh=4JSNAZYpZNr4CTjTYG5Pyw/Np7Ahvfax20/qkBbZmD8=;
  b=jvFVoHGF9LDIgBlW0Ol8lhls1AIMhcNIKHYaC+NJgK5HVGJ0Wgs42V3C
   Vz7QRfXnSaoDG15IInKyZM1U9eQHVrk984JpCjgmzF0ahiVltOqWrhHfg
   njznNNrrR4oOyNOx4yuLbIiPHuHdH4EBK1h/ePOa025Gji0vYi4iMQEJu
   3I3aks8jnonB/GukYBJyu5Z6cnCOgmsFhe3pWcVjz3woXYyTTOOFg208r
   p7zus9T9PwMc2bq8GQYEs6x77gxDjJur+U1q19hxH/+uUMsp/xBNCagLJ
   D9xtM8eMzAedOYVIbDm1kUeUCDV132AMj7apjiMqeb+TsFckknbnu5MHJ
   g==;
X-CSE-ConnectionGUID: 5vH+FmlaSsiyxTUKTDB9/g==
X-CSE-MsgGUID: wH+zr06yRlCMKvqAr89W1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98513453"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="98513453"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 18:41:01 -0700
X-CSE-ConnectionGUID: cCQ6EMvAShKCKUToy4Q+MQ==
X-CSE-MsgGUID: 31caVciFRMyB4RYBlumkJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="263341984"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Aug 2026 18:40:59 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuKRE-00000000SPG-48TI;
	Thu, 13 Aug 2026 01:40:57 +0000
Date: Thu, 13 Aug 2026 09:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 272/272]
 mm/swapfile.c:775:5: warning: no previous prototype for function
 'scan_swap_map_slots'
Message-ID: <202608130957.kLP9LhAK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bing,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   9c40f45d2c22f05e45bc48b1d7be869adf7e473a
commit: 06c2766cbc9923d67d45fc191c467b5e2685175d [272/272] ANDROID: mm: export symbols used in vendor hook android_vh_get_swap_page()
config: x86_64-randconfig-r072-20260813 (https://download.01.org/0day-ci/archive/20260813/202608130957.kLP9LhAK-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6ea395e4fe4db26920d57779ddae98eac6ba945d)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130957.kLP9LhAK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130957.kLP9LhAK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:34:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      34 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:357:9: note: previous definition is here
     357 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   mm/swapfile.c:102:26: warning: no previous prototype for function 'swap_type_to_swap_info' [-Wmissing-prototypes]
     102 | struct swap_info_struct *swap_type_to_swap_info(int type)
         |                          ^
   mm/swapfile.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     102 | struct swap_info_struct *swap_type_to_swap_info(int type)
         | ^
         | static 
>> mm/swapfile.c:775:5: warning: no previous prototype for function 'scan_swap_map_slots' [-Wmissing-prototypes]
     775 | int scan_swap_map_slots(struct swap_info_struct *si,
         |     ^
   mm/swapfile.c:775:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     775 | int scan_swap_map_slots(struct swap_info_struct *si,
         | ^
         | static 
>> mm/swapfile.c:993:5: warning: no previous prototype for function 'swap_alloc_cluster' [-Wmissing-prototypes]
     993 | int swap_alloc_cluster(struct swap_info_struct *si, swp_entry_t *slot)
         |     ^
   mm/swapfile.c:993:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     993 | int swap_alloc_cluster(struct swap_info_struct *si, swp_entry_t *slot)
         | ^
         | static 
   4 warnings generated.
--
   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:34:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      34 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:357:9: note: previous definition is here
     357 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> mm/swap_slots.c:93:6: warning: no previous prototype for function 'check_cache_active' [-Wmissing-prototypes]
      93 | bool check_cache_active(void)
         |      ^
   mm/swap_slots.c:93:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      93 | bool check_cache_active(void)
         | ^
         | static 
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +/scan_swap_map_slots +775 mm/swapfile.c

   774	
 > 775	int scan_swap_map_slots(struct swap_info_struct *si,
   776				       unsigned char usage, int nr,
   777				       swp_entry_t slots[])
   778	{
   779		struct swap_cluster_info *ci;
   780		unsigned long offset;
   781		unsigned long scan_base;
   782		unsigned long last_in_cluster = 0;
   783		int latency_ration = LATENCY_LIMIT;
   784		int n_ret = 0;
   785		bool scanned_many = false;
   786	
   787		/*
   788		 * We try to cluster swap pages by allocating them sequentially
   789		 * in swap.  Once we've allocated SWAPFILE_CLUSTER pages this
   790		 * way, however, we resort to first-free allocation, starting
   791		 * a new cluster.  This prevents us from scattering swap pages
   792		 * all over the entire swap partition, so that we reduce
   793		 * overall disk seek times between swap pages.  -- sct
   794		 * But we do now try to find an empty cluster.  -Andrea
   795		 * And we let swap pages go all over an SSD partition.  Hugh
   796		 */
   797	
   798		si->flags += SWP_SCANNING;
   799		/*
   800		 * Use percpu scan base for SSD to reduce lock contention on
   801		 * cluster and swap cache.  For HDD, sequential access is more
   802		 * important.
   803		 */
   804		if (si->flags & SWP_SOLIDSTATE)
   805			scan_base = this_cpu_read(*si->cluster_next_cpu);
   806		else
   807			scan_base = si->cluster_next;
   808		offset = scan_base;
   809	
   810		/* SSD algorithm */
   811		if (si->cluster_info) {
   812			if (!scan_swap_map_try_ssd_cluster(si, &offset, &scan_base))
   813				goto scan;
   814		} else if (unlikely(!si->cluster_nr--)) {
   815			if (si->pages - si->inuse_pages < SWAPFILE_CLUSTER) {
   816				si->cluster_nr = SWAPFILE_CLUSTER - 1;
   817				goto checks;
   818			}
   819	
   820			spin_unlock(&si->lock);
   821	
   822			/*
   823			 * If seek is expensive, start searching for new cluster from
   824			 * start of partition, to minimize the span of allocated swap.
   825			 * If seek is cheap, that is the SWP_SOLIDSTATE si->cluster_info
   826			 * case, just handled by scan_swap_map_try_ssd_cluster() above.
   827			 */
   828			scan_base = offset = si->lowest_bit;
   829			last_in_cluster = offset + SWAPFILE_CLUSTER - 1;
   830	
   831			/* Locate the first empty (unaligned) cluster */
   832			for (; last_in_cluster <= si->highest_bit; offset++) {
   833				if (si->swap_map[offset])
   834					last_in_cluster = offset + SWAPFILE_CLUSTER;
   835				else if (offset == last_in_cluster) {
   836					spin_lock(&si->lock);
   837					offset -= SWAPFILE_CLUSTER - 1;
   838					si->cluster_next = offset;
   839					si->cluster_nr = SWAPFILE_CLUSTER - 1;
   840					goto checks;
   841				}
   842				if (unlikely(--latency_ration < 0)) {
   843					cond_resched();
   844					latency_ration = LATENCY_LIMIT;
   845				}
   846			}
   847	
   848			offset = scan_base;
   849			spin_lock(&si->lock);
   850			si->cluster_nr = SWAPFILE_CLUSTER - 1;
   851		}
   852	
   853	checks:
   854		if (si->cluster_info) {
   855			while (scan_swap_map_ssd_cluster_conflict(si, offset)) {
   856			/* take a break if we already got some slots */
   857				if (n_ret)
   858					goto done;
   859				if (!scan_swap_map_try_ssd_cluster(si, &offset,
   860								&scan_base))
   861					goto scan;
   862			}
   863		}
   864		if (!(si->flags & SWP_WRITEOK))
   865			goto no_page;
   866		if (!si->highest_bit)
   867			goto no_page;
   868		if (offset > si->highest_bit)
   869			scan_base = offset = si->lowest_bit;
   870	
   871		ci = lock_cluster(si, offset);
   872		/* reuse swap entry of cache-only swap if not busy. */
   873		if (vm_swap_full() && si->swap_map[offset] == SWAP_HAS_CACHE) {
   874			int swap_was_freed;
   875			unlock_cluster(ci);
   876			spin_unlock(&si->lock);
   877			swap_was_freed = __try_to_reclaim_swap(si, offset, TTRS_ANYWAY);
   878			spin_lock(&si->lock);
   879			/* entry was freed successfully, try to use this again */
   880			if (swap_was_freed)
   881				goto checks;
   882			goto scan; /* check next one */
   883		}
   884	
   885		if (si->swap_map[offset]) {
   886			unlock_cluster(ci);
   887			if (!n_ret)
   888				goto scan;
   889			else
   890				goto done;
   891		}
   892		WRITE_ONCE(si->swap_map[offset], usage);
   893		inc_cluster_info_page(si, si->cluster_info, offset);
   894		unlock_cluster(ci);
   895	
   896		swap_range_alloc(si, offset, 1);
   897		slots[n_ret++] = swp_entry(si->type, offset);
   898	
   899		/* got enough slots or reach max slots? */
   900		if ((n_ret == nr) || (offset >= si->highest_bit))
   901			goto done;
   902	
   903		/* search for next available slot */
   904	
   905		/* time to take a break? */
   906		if (unlikely(--latency_ration < 0)) {
   907			if (n_ret)
   908				goto done;
   909			spin_unlock(&si->lock);
   910			cond_resched();
   911			spin_lock(&si->lock);
   912			latency_ration = LATENCY_LIMIT;
   913		}
   914	
   915		/* try to get more slots in cluster */
   916		if (si->cluster_info) {
   917			if (scan_swap_map_try_ssd_cluster(si, &offset, &scan_base))
   918				goto checks;
   919		} else if (si->cluster_nr && !si->swap_map[++offset]) {
   920			/* non-ssd case, still more slots in cluster? */
   921			--si->cluster_nr;
   922			goto checks;
   923		}
   924	
   925		/*
   926		 * Even if there's no free clusters available (fragmented),
   927		 * try to scan a little more quickly with lock held unless we
   928		 * have scanned too many slots already.
   929		 */
   930		if (!scanned_many) {
   931			unsigned long scan_limit;
   932	
   933			if (offset < scan_base)
   934				scan_limit = scan_base;
   935			else
   936				scan_limit = si->highest_bit;
   937			for (; offset <= scan_limit && --latency_ration > 0;
   938			     offset++) {
   939				if (!si->swap_map[offset])
   940					goto checks;
   941			}
   942		}
   943	
   944	done:
   945		set_cluster_next(si, offset + 1);
   946		si->flags -= SWP_SCANNING;
   947		return n_ret;
   948	
   949	scan:
   950		spin_unlock(&si->lock);
   951		while (++offset <= READ_ONCE(si->highest_bit)) {
   952			if (data_race(!si->swap_map[offset])) {
   953				spin_lock(&si->lock);
   954				goto checks;
   955			}
   956			if (vm_swap_full() &&
   957			    READ_ONCE(si->swap_map[offset]) == SWAP_HAS_CACHE) {
   958				spin_lock(&si->lock);
   959				goto checks;
   960			}
   961			if (unlikely(--latency_ration < 0)) {
   962				cond_resched();
   963				latency_ration = LATENCY_LIMIT;
   964				scanned_many = true;
   965			}
   966		}
   967		offset = si->lowest_bit;
   968		while (offset < scan_base) {
   969			if (data_race(!si->swap_map[offset])) {
   970				spin_lock(&si->lock);
   971				goto checks;
   972			}
   973			if (vm_swap_full() &&
   974			    READ_ONCE(si->swap_map[offset]) == SWAP_HAS_CACHE) {
   975				spin_lock(&si->lock);
   976				goto checks;
   977			}
   978			if (unlikely(--latency_ration < 0)) {
   979				cond_resched();
   980				latency_ration = LATENCY_LIMIT;
   981				scanned_many = true;
   982			}
   983			offset++;
   984		}
   985		spin_lock(&si->lock);
   986	
   987	no_page:
   988		si->flags -= SWP_SCANNING;
   989		return n_ret;
   990	}
   991	EXPORT_SYMBOL_GPL(scan_swap_map_slots);
   992	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
