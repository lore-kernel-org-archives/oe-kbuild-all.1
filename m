Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A221CF96
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 06:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747636857; cv=none; b=Q93Jto30lCEQguhAm+Qj98RBQ8S9/PKePBWztQRyT/4/Hi3Fd782EkSsOZPv1H7gmHsOEDHxlmcWRFBhOIhr6eRSX3S2W9T48yT5aECywT9S5ttbZXD1xinIr5MBElcRRhhOd6WVsJzV1CzHeHFgSEvE3TF1MJYJFh9ssMYkswU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747636857; c=relaxed/simple;
	bh=PUC04+x5mqcBXRhcM55mScq4xFOwR7ujzndoP1dB0wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m9eaZnuD95It9VytXDv7rXiz/ixZ2krT0efR+MsxFA/vDGmqfBMqnGx45i/Z7bcguzY887ytHM7wPYrPbgLbSbl3vublXfonF6e16gPIiBYsgo40sM1txd9ae84webT+EunZuT2qY7Hjs8Q/u1v8/kJWrPc+EvlcYgG1ZdokR80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SyFGofPq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SyFGofPq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747636855; x=1779172855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PUC04+x5mqcBXRhcM55mScq4xFOwR7ujzndoP1dB0wc=;
  b=SyFGofPqzuqtt5NsbYGOhA3s+ZtGqiMnmo1GFziC9Zvy8LSxlQjOYnl8
   SWzB4E0hYNDwBB07dijqeqjOSEkDcIDifJTXFSPc1cOw8nGqkVPZlcz9J
   hnsM5tgDL0M5/zO0NincOR3rC8lumX1hJHWLKw6megM6yPLbQIB4/W2Ok
   OEPmmzPLs9oi6Hv7LAM198s7WmM9Xf2qq4LThn8eoCGpYv+V0xLodM53Z
   L3goMBD6P3ArcVFDD6q8Tsfe9fWXn1dqEBjUotA/ijhvHPjc4BidjfUHg
   8rLq8eHGvQBCvRgg9xiFvb67BN/F2gEw/l7oQVkIDmw6nmzbbc4hJBcS2
   w==;
X-CSE-ConnectionGUID: LpnWDMACQK2zuE+k4f+3Cw==
X-CSE-MsgGUID: e8JHo3J7T8KQEmgN9lFd3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="60175429"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="60175429"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 23:40:55 -0700
X-CSE-ConnectionGUID: MERj+iosR6Wf55TYu0/6VQ==
X-CSE-MsgGUID: YlXwW8tXQ72b3gTTWX7Sng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="176390621"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 May 2025 23:40:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGuB9-000LDj-28;
	Mon, 19 May 2025 06:40:51 +0000
Date: Mon, 19 May 2025 14:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:ackerley-1g-master 54/75] arch/x86/kvm/x86.c:12987:46:
 error: 'struct kvm_memory_slot' has no member named 'gmem'
Message-ID: <202505191427.OTzMXtag-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git ackerley-1g-master
head:   773f26b5bef6e4d3094a33605165a5c6ab9aa0f0
commit: 14fe211354da093607d2f5327908f3e55752c3ff [54/75] KVM: x86: Set disallow_lpage on base_gfn and guest_memfd pgoff misalignment
config: i386-buildonly-randconfig-005-20250519 (https://download.01.org/0day-ci/archive/20250519/202505191427.OTzMXtag-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505191427.OTzMXtag-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505191427.OTzMXtag-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/x86.c: In function 'kvm_should_allow_lpage_for_slot':
>> arch/x86/kvm/x86.c:12987:46: error: 'struct kvm_memory_slot' has no member named 'gmem'
   12987 |                         slot->base_gfn ^ slot->gmem.pgoff, level);
         |                                              ^~


vim +12987 arch/x86/kvm/x86.c

 12959	
 12960	static inline bool
 12961	kvm_should_allow_lpage_for_slot(struct kvm_memory_slot *slot, int level)
 12962	{
 12963		bool gfn_and_userspace_addr_aligned;
 12964		unsigned long ugfn;
 12965	
 12966		ugfn = slot->userspace_addr >> PAGE_SHIFT;
 12967	
 12968		/*
 12969		 * If addresses are not aligned wrt each other, then large page mapping
 12970		 * cannot be allowed for the slot since page tables only allow guest to
 12971		 * host translations to function at fixed levels.
 12972		 */
 12973		gfn_and_userspace_addr_aligned =
 12974			kvm_is_level_aligned(slot->base_gfn ^ ugfn, level);
 12975	
 12976		/*
 12977		 * If slot->userspace_addr is 0 (disabled), 0 is always aligned so the
 12978		 * check is deferred to gmem.pgoff.
 12979		 */
 12980		if (!gfn_and_userspace_addr_aligned)
 12981			return false;
 12982	
 12983		if (kvm_slot_has_gmem(slot)) {
 12984			bool gfn_and_gmem_pgoff_aligned;
 12985	
 12986			gfn_and_gmem_pgoff_aligned = kvm_is_level_aligned(
 12987				slot->base_gfn ^ slot->gmem.pgoff, level);
 12988	
 12989			return gfn_and_gmem_pgoff_aligned;
 12990		}
 12991	
 12992		return true;
 12993	}
 12994	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
