Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADC515AAA7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 21:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712094321; cv=none; b=LSQ32KrLHncof6KrMPlrQz2dWs/UHogbI7el2usPrxXz2mv6WyMna8GDaSj26KqSjxiHavSjgsdHqBEH1/uihjvBzU0XiDYHtZJSROMxjJoWpXx9Z3tjzBRtcYE0J1F5JaB1RQH/JQbLCuAy75qK08ZzORlb3AtNA2G7d+4DmbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712094321; c=relaxed/simple;
	bh=jRUngY48enX4/b+vuvl/kTOIYINiScUBghv29cEahDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cx3XSbkUHkgrwa2cuaLnz2zzBcPEmoNscFpvf7L1wYFDceWMzXCJXuo0nBrdQdAC8bNik8fHfPk1QkJmp4zbWWi879cvv3yCCMo1Rk6SBfDG70+5kFEXKuMdftULYDeMTbyR456TTutIxIpxB+Im7Jch2SaKxsUiFd1zGUA1Gi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsZHcKxq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsZHcKxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712094319; x=1743630319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jRUngY48enX4/b+vuvl/kTOIYINiScUBghv29cEahDs=;
  b=dsZHcKxqgUdCZdFRD1UtnswHbxJNQcZ7gnDcwOFLWczdf48lECPN5WnI
   2DkTTz71qKFZGO9zR5EvwsqcHeOGCDi+aw21ygS8R3Up1kEg/GJt7aXNj
   2uID6E3NIuM9l+qFfZcbVgiEJUsRe11V7F/TklWNeKi7VHOOHDgDS3Elq
   xGDIh8qNFJG3TuxDM/JnguYR3PuQetk5j2hz6PfGhCZahfoRrOJLD4HTQ
   mKxIkXGCJKdCBuZ9cIuMFNMKwebJMmoC6tu45MdeSWRndSXXPpitKWlud
   1qy9LuXFZWqG1pUsNJ+NX0QGnshmOWxORqcBMbBhn1lvu/WBwSIxCdMhJ
   w==;
X-CSE-ConnectionGUID: JTLkY6eNT5KZD3+L85Zzsw==
X-CSE-MsgGUID: +UI6m+eZS8eC8Y0SPPIECA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29774686"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="29774686"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 14:45:18 -0700
X-CSE-ConnectionGUID: tjareW3hSkS/E9r4v5y3UQ==
X-CSE-MsgGUID: h0TBTAISTSWWoXSv1DhGrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="22899426"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Apr 2024 14:45:17 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrlwQ-0001ZB-2t;
	Tue, 02 Apr 2024 21:45:14 +0000
Date: Wed, 3 Apr 2024 05:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xianglai Li <lixianglai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7130/7265] arch/loongarch/kvm/vcpu.c:68:37:
 error: 'struct sched_info' has no member named 'run_delay'
Message-ID: <202404030537.GbaKR7zc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   448a7c1b3e0654d6b6801c216e7c265445a83a2f
commit: faa35b0fcdefb1e5f2d05b0eeac12be32e69e566 [7130/7265] LoongArch: KVM: Add steal time support in kvm side
config: loongarch-randconfig-002-20240403 (https://download.01.org/0day-ci/archive/20240403/202404030537.GbaKR7zc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404030537.GbaKR7zc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404030537.GbaKR7zc-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kvm/vcpu.c: In function 'kvm_update_stolen_time':
>> arch/loongarch/kvm/vcpu.c:68:37: error: 'struct sched_info' has no member named 'run_delay'
      68 |         steal += current->sched_info.run_delay -
         |                                     ^
   arch/loongarch/kvm/vcpu.c:70:55: error: 'struct sched_info' has no member named 'run_delay'
      70 |         vcpu->arch.st.last_steal = current->sched_info.run_delay;
         |                                                       ^
--
   arch/loongarch/kvm/exit.c: In function 'kvm_save_notify':
>> arch/loongarch/kvm/exit.c:764:63: error: 'struct sched_info' has no member named 'run_delay'
     764 |                 vcpu->arch.st.last_steal = current->sched_info.run_delay;
         |                                                               ^


vim +68 arch/loongarch/kvm/vcpu.c

    33	
    34	static void kvm_update_stolen_time(struct kvm_vcpu *vcpu)
    35	{
    36		struct kvm_steal_time __user *st;
    37		struct gfn_to_hva_cache *ghc;
    38		struct kvm_memslots *slots;
    39		gpa_t gpa;
    40		u64 steal;
    41		u32 version;
    42	
    43		ghc = &vcpu->arch.st.cache;
    44		gpa = vcpu->arch.st.guest_addr;
    45		if (!(gpa & KVM_STEAL_PHYS_VALID))
    46			return;
    47	
    48		gpa &= KVM_STEAL_PHYS_MASK;
    49		slots = kvm_memslots(vcpu->kvm);
    50		if (slots->generation != ghc->generation || gpa != ghc->gpa) {
    51			if (kvm_gfn_to_hva_cache_init(vcpu->kvm, ghc, gpa,
    52						sizeof(*st))) {
    53				ghc->gpa = INVALID_GPA;
    54				return;
    55			}
    56		}
    57	
    58		st = (struct kvm_steal_time __user *)ghc->hva;
    59		unsafe_get_user(version, &st->version, out);
    60		if (version & 1)
    61			version += 1;
    62		version += 1;
    63		unsafe_put_user(version, &st->version, out);
    64		/* Make sure st->version is written first */
    65		smp_wmb();
    66	
    67		unsafe_get_user(steal, &st->steal, out);
  > 68		steal += current->sched_info.run_delay -
    69			vcpu->arch.st.last_steal;
    70		vcpu->arch.st.last_steal = current->sched_info.run_delay;
    71		unsafe_put_user(steal, &st->steal, out);
    72	
    73		/* Make sure st->steal is written first */
    74		smp_wmb();
    75		version += 1;
    76		unsafe_put_user(version, &st->version, out);
    77	out:
    78		mark_page_dirty_in_slot(vcpu->kvm, ghc->memslot, gpa_to_gfn(ghc->gpa));
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
