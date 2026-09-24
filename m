Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7946127E049
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263292; cv=none; b=n7k/05hhr9yked1M4wwdpj0+HA+wmGZvNCfVWvSp6qNhyn+/sNUWIpPhJnFo/LW8lFVw1kBWJ5f3ZDunY8D6XsEtM4lXaFqlQGvSajg1QXGgcJxIV7SbLjDEpY2uUu5WDahy0Yfhb0sGYy4+HFUK5vHsnfz53DV802EwgmdlUyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263292; c=relaxed/simple;
	bh=F0z70JKE60s3V148jMO3xE93FOxYm9Onl9Du4/kMc/Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dKsPNpDp64djIlkp9KvnBGWBy8Mu7NkpbI8r8+M4C1JAOUfcfqZxf5KFB/nkGVE6Hager7dxgZN/a9ynnjwLkGj7aCOV35rPN+vNQ9JadZi99PSFV26MMFzxrCjwAOSbzzXc5NO/nKRR6OldqYhCb90gfPUMdg+rVXdq9lnBy84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0itXLOI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0itXLOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790263290; x=1821799290;
  h=date:from:to:cc:subject:message-id;
  bh=F0z70JKE60s3V148jMO3xE93FOxYm9Onl9Du4/kMc/Y=;
  b=T0itXLOIu2tfn7KV3ntPt63Kzwt1w0U/9usQQhwYxJQD6gvsYGAsXwwW
   8yfURGcx5lRYVKTNIM5KzOFJJmWElxsiN4h0WhYMzAaKEJqrxtQp0YMJf
   tBvtopGT423HpWm46gK/XTc6YVkToSEymGJj8aBO0uEvn62+ip56ZveJH
   xwlk7PuGdzlDGoZaPwbPMIIdqbfn02kXc+92iavyXymijruTplQd4JMo1
   wTF0pAGYiDf53gLoZszjys/pAzVbquKeykAVDhnyNBPBMrnA6R+NEpP/N
   gspwoXHZbLgmYRJZB4BeC1eUsRv1HAsrRorXYeHLtFiodood/CddDZ/iE
   w==;
X-CSE-ConnectionGUID: wEPxiahSTzWXIx9xDdBR8w==
X-CSE-MsgGUID: a2BGw7wtS06U8BHin1CYXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="116563978"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="116563978"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 08:21:30 -0700
X-CSE-ConnectionGUID: G+cRSdWPRFiJlIW18ydYgw==
X-CSE-MsgGUID: BsjP+bO+TGy6FY68bSB//w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="273624081"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 24 Sep 2026 08:21:29 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9lGI-000000000Lu-0eOc;
	Thu, 24 Sep 2026 15:21:26 +0000
Date: Thu, 24 Sep 2026 17:21:02 +0200
From: kernel test robot <lkp@intel.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sean Christopherson <seanjc@google.com>,
 Nikolay Borisov <nik.borisov@suse.com>
Subject: [sean-jc:tdx/triple_fault_on_pending_sept 12/95]
 arch/x86/kvm/vmx/main.c:899 vt_handle_exit() warn: inconsistent indenting
Message-ID: <202609241705.WTOMl4Oc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux tdx/triple_fault_on_pending_sept
head:   bdd6b6c0176b2b8645c34a3326f6aa5b9cb66d14
commit: 213bbf18f07aed935e21df322fa61a84a19f9169 [12/95] KVM: VMX: Consolidate the exit handler for VMX and TDX
config: i386-randconfig-2200-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241705.WTOMl4Oc-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241705.WTOMl4Oc-lkp@intel.com/

smatch warnings:
arch/x86/kvm/vmx/main.c:899 vt_handle_exit() warn: inconsistent indenting

vim +899 arch/x86/kvm/vmx/main.c

   882	
   883	static int vt_handle_exit(struct kvm_vcpu *vcpu,
   884				  enum exit_fastpath_completion fastpath)
   885	{
   886		int ret;
   887	
   888	#ifdef CONFIG_KVM_INTEL_TDX
   889		if (is_td_vcpu(vcpu))
   890			ret = tdx_handle_exit(vcpu, fastpath);
   891		else
   892	#endif
   893			ret = vmx_handle_exit(vcpu, fastpath);
   894	
   895		/*
   896		 * Exit to user space when bus lock detected to inform that there is
   897		 * a bus lock in guest.
   898		 */
 > 899		if (vmx_get_exit_reason(vcpu).bus_lock_detected) {
   900			if (ret > 0) {
   901				vcpu->run->exit_reason = KVM_EXIT_X86_BUS_LOCK;
   902				ret = 0;
   903			}
   904	
   905			vcpu->run->flags |= KVM_RUN_X86_BUS_LOCK;
   906		}
   907		return ret;
   908	}
   909	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
