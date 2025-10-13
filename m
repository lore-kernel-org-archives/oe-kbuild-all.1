Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCB31E8332
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 13:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760363848; cv=none; b=Sp7KwgvsNvpwyOxmoJpMxQA/xw56eelUC5pKu0O3rta7EUiJWnGkG5HrUqo0db9Uix1Pr/5Jx9dhT5m+Z2+OoLSbXjV53olzffBAaxfkjxTrtwVfc5pwynTL+1fg3KS3pQvb6Yc7jKkuxkvS/yE68MfmQ807FAgK6vf11S27pyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760363848; c=relaxed/simple;
	bh=2ytmKdc8RqHmSGhC1Ril+imo1M7HY+r4D+fBAnif8YA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lC2kwQaQ6gLxIo/7GoWOHL6lm7FmfXoQj2lDXhUVjgongjwvJIcZecI7i3j16QWKIuFbkPh1w6JqduJ1WBJ5/1CZNfQFuSDhLGZVX/Brr1LjRIDIr5xSSEj8eI+jjFizMt/xebNOAs2N5lVSF6HV6bM8oM6rVipz+6+UXj4bjec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AwXS5Tm+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwXS5Tm+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760363847; x=1791899847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ytmKdc8RqHmSGhC1Ril+imo1M7HY+r4D+fBAnif8YA=;
  b=AwXS5Tm+12DP7qqzm1JuHz9G0MtGRIwpfN4Hfj30dvWev4nF2uclUrkZ
   SS6GjgSFLG9goelXESjz0itmybZnHqN0wWHfnblU/q9Lc+k0GSph/sVZY
   Zp22bNXT/asSkG/fOrvhqHxO9+bICrE6EBfDPwP0WgvokhAbRDkf0aGpK
   +k1brNKSNErMv6qOEnZ2MMScXbSRZqr8pXcGrxbEWzDvQXkv1wf2W55x3
   FMDrvQSknZJWMRbFT43d656IiPhpCAaVE1QGwG6AeocfJtTMoLdmLeprH
   oPmgJ0/TK7zGLuR2deVDL5bSkB+TbXHmdOS3IzPjYl/GwgnnbGp8niBie
   w==;
X-CSE-ConnectionGUID: CcP0t+GKRZK2N9mrVaat/w==
X-CSE-MsgGUID: TrCrwCFBRvK8rnL89uV5cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66326712"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66326712"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 06:57:26 -0700
X-CSE-ConnectionGUID: PgROEOLlQMaIFtvnKsgWTg==
X-CSE-MsgGUID: dlwghr6DRuecvBjG5oyGdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="180748619"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 13 Oct 2025 06:57:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8J3C-0000Tt-0P;
	Mon, 13 Oct 2025 13:57:22 +0000
Date: Mon, 13 Oct 2025 21:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3227/3227] arch/x86/kvm/x86.c:8661:5: warning:
 no previous prototype for function '__kvm_vcpu_halt'
Message-ID: <202510132118.GCFTQYLt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   990be7492566e0cfb03f18b813b905a67bf29ef1
commit: c499a3120204c834ff963c43d90a5ff33194b34c [3227/3227] KVM: SVM: Add support for booting APs in an SEV-ES guest
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251013/202510132118.GCFTQYLt-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251013/202510132118.GCFTQYLt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510132118.GCFTQYLt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/x86.c:809:5: warning: no previous prototype for function 'kvm_read_guest_page_mmu' [-Wmissing-prototypes]
     809 | int kvm_read_guest_page_mmu(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
         |     ^
   arch/x86/kvm/x86.c:809:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     809 | int kvm_read_guest_page_mmu(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
         | ^
         | static 
>> arch/x86/kvm/x86.c:8661:5: warning: no previous prototype for function '__kvm_vcpu_halt' [-Wmissing-prototypes]
    8661 | int __kvm_vcpu_halt(struct kvm_vcpu *vcpu, int state, int reason)
         |     ^
   arch/x86/kvm/x86.c:8661:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    8661 | int __kvm_vcpu_halt(struct kvm_vcpu *vcpu, int state, int reason)
         | ^
         | static 
   2 warnings generated.


vim +/__kvm_vcpu_halt +8661 arch/x86/kvm/x86.c

  8660	
> 8661	int __kvm_vcpu_halt(struct kvm_vcpu *vcpu, int state, int reason)
  8662	{
  8663		++vcpu->stat.halt_exits;
  8664		if (lapic_in_kernel(vcpu)) {
  8665			vcpu->arch.mp_state = state;
  8666			return 1;
  8667		} else {
  8668			vcpu->run->exit_reason = reason;
  8669			return 0;
  8670		}
  8671	}
  8672	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
