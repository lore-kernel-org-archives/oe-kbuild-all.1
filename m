Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D15222585
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765021655; cv=none; b=rNEeSK6Rw6cko/F2L07t0dB1v4CBeyQx3xzK1W1xbhVZPRQm0+CrqnVWSHUeijtLoW2ptt36MfEuBogldTUeV94HtFKvX5SMADDWmD5guqfo7tosIZ/wnqgM4VdRKTqxyKqfnefXHNJZeNnfmVPHlQa8bdBxy0NiJwMT7kt5aOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765021655; c=relaxed/simple;
	bh=UkzToL0nPD/JbmjdH04jK0cPyDscaYY26YYk3EV5Fos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CNS0Ww2apPgAto1rOPs97/ftbrcD7wgRmNqACZ9j+C/5ZwDFMUMbC3emaGae0oEPzt47Lw+5IBXOk4KaSSL5jMjz5usH8RgRVtm9RhL8b9FJrZfLrPJZSHSoBLUgHwnhWRqf6XR6eKUavw257XCHbI+EKKTro4z+cksehUvHFSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+ECCdEF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+ECCdEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765021653; x=1796557653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UkzToL0nPD/JbmjdH04jK0cPyDscaYY26YYk3EV5Fos=;
  b=I+ECCdEFrHq4NaSclb3GkZdWevVTgNO64EqbZkqQ0AZMvYV1GL1/RhfN
   BFsYPYy8bOSqKt3jg3b7LPzDSDT2fqyjiddTSzUy6QobXYl8pCn+Rl8jb
   dOXmiGtRd2jCWFULhkGaSQVVDy+NFxWJodeE+zbcL27JQIPiP1AqSXS/8
   ziowertKvtelAVwFJLuOYZDy3F2NrWUscFxT+5TvaFB2K2iho1EckJCTJ
   PT/f59vX3rc9IuYVNNny5s/5fJwySToxrkPDYuuFbQuCXnufK9pJkyQvu
   tU3jhMrcjkOivFpfOyUAqPnxWIQH6DRDh3yQ32tGX442ynNbKA13xnwRJ
   Q==;
X-CSE-ConnectionGUID: X858U269SZyRMbTq/6kCKQ==
X-CSE-MsgGUID: 6PGb1TmESgiYxppZmXuZJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66935565"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="66935565"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 03:47:32 -0800
X-CSE-ConnectionGUID: KYAK6+yRTp6CcCe+W0J1LQ==
X-CSE-MsgGUID: SXo3dkC6TWq6W3uYjMDp+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="232890092"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Dec 2025 03:47:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRql6-00000000HpR-3wRC;
	Sat, 06 Dec 2025 11:47:28 +0000
Date: Sat, 6 Dec 2025 19:47:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 12/12] arch/arm64/kvm/pkvm.c:687:6:
 warning: variable 'pages' set but not used
Message-ID: <202512061938.Azufl6kB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   029c3b29942fa7c9965736a5ab9030f41c9c02d3
commit: 312ab0333e80d95c4c1f17fa07ceb344cec5313d [12/12] ANDROID: KVM: On guest exit ask Trustzone to relinquish the borrowed pages
config: arm64-randconfig-001-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061938.Azufl6kB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061938.Azufl6kB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061938.Azufl6kB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/pkvm.c: In function '__pkvm_pgtable_stage2_unmap':
>> arch/arm64/kvm/pkvm.c:687:6: warning: variable 'pages' set but not used [-Wunused-but-set-variable]
     u64 pages, nr_busy;
         ^~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for XFRM_OFFLOAD
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_XFRM_OFFLOAD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/pages +687 arch/arm64/kvm/pkvm.c

   679	
   680	static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 end)
   681	{
   682		struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
   683		pkvm_handle_t handle = kvm->arch.pkvm.handle;
   684		struct mm_struct *mm = current->mm;
   685		struct kvm_pinned_page *ppage;
   686		struct pkvm_mapping *mapping;
 > 687		u64 pages, nr_busy;
   688		int ret;
   689	
   690		if (!handle)
   691			return 0;
   692	
   693		for_each_mapping_in_range_safe(pgt, start, end, mapping) {
   694			int ret;
   695	
   696			WARN_ON(kvm_vm_is_protected(kvm));
   697	
   698			ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle,
   699							mapping->gfn, mapping->nr_pages);
   700	
   701			if (WARN_ON(ret))
   702				return ret;
   703	
   704			pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
   705			kfree(mapping);
   706		}
   707	
   708	retry:
   709		pages = 0;
   710		nr_busy = 0;
   711		ppage = kvm_pinned_pages_iter_first(&kvm->arch.pkvm.pinned_pages, start, end);
   712		while (ppage) {
   713			struct kvm_pinned_page *next = kvm_pinned_pages_iter_next(ppage, start, end);
   714	
   715			WARN_ON(!kvm_vm_is_protected(kvm));
   716			ret = __reclaim_dying_page(ppage, handle);
   717			cond_resched();
   718			if (ret == -EBUSY) {
   719				nr_busy++;
   720				ppage = next;
   721				continue;
   722			}
   723			WARN_ON(ret);
   724			unpin_user_pages_dirty_lock(&ppage->page, 1, true);
   725			account_locked_vm(mm, 1 << ppage->order, false);
   726			kvm_pinned_pages_remove(ppage, &kvm->arch.pkvm.pinned_pages);
   727			kfree(ppage);
   728			ppage = next;
   729		}
   730	
   731		if (nr_busy) {
   732			do {
   733				ret = kvm_call_hyp_nvhe(__pkvm_reclaim_dying_guest_ffa_resources,
   734							kvm->arch.pkvm.handle);
   735				WARN_ON(ret && ret != -EAGAIN);
   736				cond_resched();
   737			} while (ret == -EAGAIN);
   738			goto retry;
   739		}
   740	
   741		return 0;
   742	}
   743	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
