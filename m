Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90B313B2AB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Feb 2024 23:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708039652; cv=none; b=s4d0tyVr/ynReBMKdHN9iIod8oLgGyq4NXEdsZRrqFkrWWjlf+z4XYLjMPF2ypHMqr/iCPNFT3T1Tys+80M5EeHH2ohbbBnFBc7jv3IarUo1nX14mvKyKRMnsgebrxFHH07HtsX/lE0gqNtal+EaUo/Ye6mbO2yfLGCyT1zwUZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708039652; c=relaxed/simple;
	bh=dqRJllxHJk02vellC/FB414Kijah5BlIS+1zh/OGRh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rkdB0ZISAKLsqqlnjjX1SJHsaSUfyKpOnRPM7bZM+4jixQet/sMrwHdtFlA5X6LQXziXrXT6m94Hu7PB/GDpGXA0e88YPA4tgxp3qspiB7lBpMElqjY4pl/d4p9eCKWjPBcOeVN+wdSGqjUC+Q4XekPEcS3iXtz69tZKw39ECpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jAQUfxAo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jAQUfxAo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708039647; x=1739575647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dqRJllxHJk02vellC/FB414Kijah5BlIS+1zh/OGRh0=;
  b=jAQUfxAoEaGTtdjPMRtDXU8uRojBl2ztmn7L8M4MkG9OeBmjn0fIKASK
   Cg0TTf5gw98C2ur/dCZyCFWN/+rJUf8jxpXN+1maSjknqVjbgCyNXsrqO
   +xHmB83BwynL2cirhnoYdsMmbk6RqZ/chbOuUOBIQipEm9dWLaPEaSuum
   2vyRe16BS/MnTikMfrdmbfO0XfmyI5bflD+MbsmneMNX8OjF1cwkjkjIf
   VZVS3LqMgHz+pTR2BzakVqYEUsaD+xpq3shTVNY+KnAwBcXYRCp0qKfkF
   rGSpStQe2Xkur+eNDYoYTLMyMKVqTKHEb00/HG6lkssdyFLy+2H/4NjhY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="5991617"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="5991617"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 15:27:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="912251969"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="912251969"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 15 Feb 2024 15:27:24 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ral8U-0000qK-10;
	Thu, 15 Feb 2024 23:27:22 +0000
Date: Fri, 16 Feb 2024 07:26:51 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org,
	Robert Hu <robert.hu@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	Danmei Wei <danmei.wei@intel.com>
Subject: [kvm:kvm-coco-queue 33/42] include/linux/kvm_host.h:2404:1: warning:
 no return statement in function returning non-void
Message-ID: <202402160740.fAyQeAi2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git kvm-coco-queue
head:   3428d62d5effe9bed1b9084ea8f7722761441ec0
commit: 08d58c22e8f1aa52e0732113e4af634302af9f06 [33/42] KVM: guest_memfd: add API to undo kvm_gmem_get_uninit_pfn
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240216/202402160740.fAyQeAi2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402160740.fAyQeAi2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402160740.fAyQeAi2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/events/intel/core.c:17:
   include/linux/kvm_host.h: In function 'kvm_gmem_undo_get_pfn':
>> include/linux/kvm_host.h:2404:1: warning: no return statement in function returning non-void [-Wreturn-type]
    2404 | {}
         | ^


vim +2404 include/linux/kvm_host.h

  2400	
  2401	static inline int kvm_gmem_undo_get_pfn(struct kvm *kvm,
  2402					        struct kvm_memory_slot *slot, gfn_t gfn,
  2403					        int order)
> 2404	{}
  2405	#endif /* CONFIG_KVM_PRIVATE_MEM */
  2406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
