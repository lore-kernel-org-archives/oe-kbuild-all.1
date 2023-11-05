Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E1528F5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 20:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qzxh7/os"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699217161; x=1730753161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2IT+8e51dJQk83fm0+FMRCAqycQCaVaVBtDevA7/lTA=;
  b=Qzxh7/oslCN9XFacXy2HhV3cRBYrgnMDhsr/ORAIT5+ltZa7TLbVYWcH
   UiWPVdtURGr+IMlyAOJFTScThCOn4mxc3VToa/gkXKcWr2vDOBoBXGgT6
   CJk93f890iq2ajPTojxyWjius0YwkZQwusJlzq47ZScluKv8D2ScX4yMP
   iL9nUHS/evUpHFUdhmt+vm7Q21x7BYV1lsv8gFRrJwYw1SCZz+uZ5aQpL
   BLqZx7q9UiNeEhoz4ferscAU6w9aOAQGqaEZMQoat3tSJJdtVBifldFCh
   /2pLsEz1ymW+/FZJsNreVCyuqLM2L5JWht5pnhnntVvoiUsiByH685n06
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="392042056"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="392042056"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 12:46:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="1093586447"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="1093586447"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Nov 2023 12:45:58 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzk0K-0005mG-2N;
	Sun, 05 Nov 2023 20:45:56 +0000
Date: Mon, 6 Nov 2023 04:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 18/22] mm/swapfile.c:775:5: warning:
 no previous prototype for 'scan_swap_map_slots'
Message-ID: <202311060449.o2LFLg1E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   f40707abde2eb5cd21cf8848f33aefb7e394ad1a
commit: 06c2766cbc9923d67d45fc191c467b5e2685175d [18/22] ANDROID: mm: export symbols used in vendor hook android_vh_get_swap_page()
config: i386-buildonly-randconfig-001-20231101 (https://download.01.org/0day-ci/archive/20231106/202311060449.o2LFLg1E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060449.o2LFLg1E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060449.o2LFLg1E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/swapfile.c:102:26: warning: no previous prototype for 'swap_type_to_swap_info' [-Wmissing-prototypes]
     102 | struct swap_info_struct *swap_type_to_swap_info(int type)
         |                          ^~~~~~~~~~~~~~~~~~~~~~
>> mm/swapfile.c:775:5: warning: no previous prototype for 'scan_swap_map_slots' [-Wmissing-prototypes]
     775 | int scan_swap_map_slots(struct swap_info_struct *si,
         |     ^~~~~~~~~~~~~~~~~~~
>> mm/swapfile.c:993:5: warning: no previous prototype for 'swap_alloc_cluster' [-Wmissing-prototypes]
     993 | int swap_alloc_cluster(struct swap_info_struct *si, swp_entry_t *slot)
         |     ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


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
