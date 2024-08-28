Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEAE171CD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 00:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724806649; cv=none; b=gMzKL6apICDQHQRWtOhD8mQEvXk23d8B49x0zOJKjQSB1ZrwyH+yqv7r/THuu4V5B129qUrjkXKsCxRdd7nR7a+AA28r3yC+6Kg43Tn0saSUbcsb2yh/YCr9RASCICQrNYNincAM5PeKEUqgKJvzVNvFf/9BnqRrfCsHsJIxm/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724806649; c=relaxed/simple;
	bh=5jKEOV4KVXWO5GuKVPemH/SXuX4KM4Ods+DiGp1Zvzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eqVUOGXzytDtsu/GLIbpJzbqLmbj2F+J4NoLaXVWpdtGxahrGkG1od7/qzbwTkRyIMSX6dSIkhm4r+7aKkYmEabjq8yRB+YFKQ1oCwOI9qu/Bwzvo/T+2nTb7m1tmSPXkoWeYozIacIC8p3XbmV2egmG5NprjTDGSuGR092yhv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mq4BnWa0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mq4BnWa0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724806647; x=1756342647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5jKEOV4KVXWO5GuKVPemH/SXuX4KM4Ods+DiGp1Zvzk=;
  b=mq4BnWa0STkJe4AvWmCRO54jtHFKf/6TfHFX90/yCxOTvS2CxoRPKcSc
   HTeUh1fXZs7A6sypLVyHXI5e8q5AgQO7AnBYZ3kF8FA7SKoQf3NoO0Vr0
   h7bP6hAAxSrKtmXzFDeIEdwdySJPBCkR83vuNrFbFjQgU0iLYnxAedTMN
   x9XllEU18BXRobOZnlRhOIPfPKBcUpAsjTH0SHdqDwyRbO6Ily0YxWNSm
   nA4buYnWQ2iDxCqzaVllMAslhSfmbVtqrPkOPxM1UkHA0qpBpEQRwCkjk
   /dPbThBJzvB8ojWyq/1hjOOglAeJD+TwIae6m+Ax1j5uy2AT4QwhMB89p
   w==;
X-CSE-ConnectionGUID: GHSWDfNbQi+3FaCntbTfNA==
X-CSE-MsgGUID: BXBxN9hWRla8xlhvcVOA/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="26215702"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="26215702"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 17:57:27 -0700
X-CSE-ConnectionGUID: NgGzT+LZSfeb0RV4z5q3Ow==
X-CSE-MsgGUID: FVs/CPLJSyeLNNttlEBxag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="67416155"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Aug 2024 17:57:27 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj700-000KHc-13;
	Wed, 28 Aug 2024 00:57:24 +0000
Date: Wed, 28 Aug 2024 08:56:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Zhang <yu.c.zhang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 27225/30000] arch/x86/kvm/x86.c:893:6: warning:
 no previous prototype for 'kvm_post_set_cr0'
Message-ID: <202408280830.Hi3clUWN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b32a887db4e5c4c061e61977efabbc1d5e867aa7
commit: 1686d271f795f8756b49151978b95b095c0598ad [27225/30000] KVM: x86: Introduce kvm_post_set_cr0 to post handle the CR0 emulation
config: x86_64-buildonly-randconfig-005-20240828 (https://download.01.org/0day-ci/archive/20240828/202408280830.Hi3clUWN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408280830.Hi3clUWN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408280830.Hi3clUWN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:893:6: warning: no previous prototype for 'kvm_post_set_cr0' [-Wmissing-prototypes]
     893 | void kvm_post_set_cr0(struct kvm_vcpu *vcpu, unsigned long old_cr0, unsigned long cr0)
         |      ^~~~~~~~~~~~~~~~


vim +/kvm_post_set_cr0 +893 arch/x86/kvm/x86.c

   892	
 > 893	void kvm_post_set_cr0(struct kvm_vcpu *vcpu, unsigned long old_cr0, unsigned long cr0)
   894	{
   895		unsigned long update_bits = X86_CR0_PG | X86_CR0_WP;
   896	
   897		if ((cr0 ^ old_cr0) & X86_CR0_PG) {
   898			kvm_clear_async_pf_completion_queue(vcpu);
   899			kvm_async_pf_hash_reset(vcpu);
   900		}
   901	
   902		if ((cr0 ^ old_cr0) & update_bits)
   903			kvm_mmu_reset_context(vcpu);
   904	
   905		if (((cr0 ^ old_cr0) & X86_CR0_CD) &&
   906		    kvm_arch_has_noncoherent_dma(vcpu->kvm) &&
   907		    !kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_CD_NW_CLEARED))
   908			kvm_zap_gfn_range(vcpu->kvm, 0, ~0ULL);
   909	}
   910	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
