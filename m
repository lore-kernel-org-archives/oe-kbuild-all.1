Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626845;
	b=jl6gA3Arr2VDi0Zu5JI1T8hvCDSaZ79IiKHNVHZx2DBvxUd3Bnvl4IjayWP5+w04UV0C
	 930jm34xXlMOgljncTorbI+4YMZTmOQMW9Sup7SQEFZ5HCDnX1cj9zKsDUAPz3nA+ogJz
	 tiytPZOAiqGTQCbsXPvCXQl+sGN+tW+0LEAosYZaNU8P0MfwKiYrzIX0oY2fXuYP7+9OQ
	 CHtX8kH9sLzjy+OarjH60WxOGRfZjp0Qx8Wtvv9sGoK+I4sCxr4xG9Q+qIZUN+kBHFPof
	 zCr32b6tiVkEb3nqya5U2zS9A23msjJUhlmysD4FtjOB52EIjC+OpBvQRhMenIODAyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626845;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=CPBuTUCAZ0jTawPcRMdbp6pYdGYyHZfNWRiqoST6rnQ=;
	b=LAwpeYu+EqilR0QebGee8knDzk/1b77nw/ZrOoxg5XFxVfRN3V6O9rJ9HcDsva+nHu1o
	 MS7JmDjYoZF8bjZNXfS5iVPNqIfUT31P1PLfYMilDmRnG551VWb7BQ3az6bs9Vz4EAmYq
	 74xSVTXaZ1s2vTvfkJy+0fC71PTJMbf1C9GaLoRikXhcSR57SZ+DIVg0570znXRIJ+hSP
	 na7NHRpmJse1Lk94sY9YIh2IsY79zIC0adBi6/Fd2CgNr/Oxu4BAlBZrB9wqO9hWX2EQX
	 Ka5Q9L4r0kfkPvimgzb79kjclJQSY0baJh6MswtYGYG5khXLYTvd24vZa18ydEl9AeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="P2/YSIc1";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFAE606A89D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 03:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFFAE606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P2/YSIc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794626844; x=1826162844;
  h=date:from:to:cc:subject:message-id;
  bh=vdpVwxYcMrFCJcNRNPZiOjr0aPQn5ESgpJ6zxbH8ZIk=;
  b=P2/YSIc1smLILvezFt5HnCYRqq1NFUokaHbKovDmFjJ7kl/uVVz8/T2p
   eIXLd8k97sRDB66x8D52b0RFMaT9s9t6hSGtr1/v2/UsjqJi8dThPoe2N
   pKeXd85eVxkVtkOYP6BFAjiTPrkdnTcoBDqPxTOLm6/r56t1Nh8sVNFtt
   GUVnqEwMEE6YWHvMEXh9lPz+ysyZRlyQoJHZXXD7eKQfsKJAkEgebbSOw
   zN2gHf33OwBHDIfm3pX6xKHInN7PWghba/OCrNbxIqn7WEAnR45iyeZe8
   WkFtzu1245PHDvP4a03XSDhnEqotZtNvHVqJbD/XRjxb+R2/bE7BPIC6p
   w==;
X-CSE-ConnectionGUID: tJegmqyATgqWBk4k797cqA==
X-CSE-MsgGUID: UzhxDYFlS8yih5uDBNaQ3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3335698"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3335698"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 19:27:23 -0800
X-CSE-ConnectionGUID: mJPDea23TliFpE+7JRqBRQ==
X-CSE-MsgGUID: 9Q25gTZaQd6n78ETEquXKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9166581"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 13 Nov 2026 19:27:22 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS4QC-000000001Tr-0x69;
	Sat, 14 Nov 2026 03:27:20 +0000
Date: Sat, 14 Nov 2026 04:27:05 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 2/2]
 arch/arm64/kvm/hyp/nvhe/switch.c:265:17: warning: no previous prototype for
 'hyp_panic'
Message-ID: <202611140407.5YOzXo9l-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Andrew,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   2bb8202ab6272d47b6e380f53f01ff95f6fdc50e
commit: b75a28595ecb8f53975c48464b330b3d68780e57 [2/2] UPSTREAM: KVM: arm64: Use BUG and BUG_ON in nVHE hyp
config: arm64-randconfig-2001-20261114 (https://download.01.org/0day-ci/archive/20261114/202611140407.5YOzXo9l-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140407.5YOzXo9l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140407.5YOzXo9l-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/switch.c:265:17: warning: no previous prototype for 'hyp_panic' [-Wmissing-prototypes]
     265 | void __noreturn hyp_panic(void)
         |                 ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:287:17: warning: no previous prototype for 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
     287 | asmlinkage void kvm_unexpected_el2_exception(void)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hyp_panic +265 arch/arm64/kvm/hyp/nvhe/switch.c

09cf57eba304246 David Brazdil 2020-06-25  264  
6a0259ed29bba83 Andrew Scull  2020-09-15 @265  void __noreturn hyp_panic(void)
09cf57eba304246 David Brazdil 2020-06-25  266  {
09cf57eba304246 David Brazdil 2020-06-25  267  	u64 spsr = read_sysreg_el2(SYS_SPSR);
09cf57eba304246 David Brazdil 2020-06-25  268  	u64 elr = read_sysreg_el2(SYS_ELR);
96d389ca10110d7 Rob Herring   2020-10-28  269  	u64 par = read_sysreg_par();
6a0259ed29bba83 Andrew Scull  2020-09-15  270  	struct kvm_cpu_context *host_ctxt;
6a0259ed29bba83 Andrew Scull  2020-09-15  271  	struct kvm_vcpu *vcpu;
09cf57eba304246 David Brazdil 2020-06-25  272  
14ef9d04928b61d Marc Zyngier  2020-09-30  273  	host_ctxt = &this_cpu_ptr(&kvm_host_data)->host_ctxt;
6a0259ed29bba83 Andrew Scull  2020-09-15  274  	vcpu = host_ctxt->__hyp_running_vcpu;
6a0259ed29bba83 Andrew Scull  2020-09-15  275  
a2e102e20fd69ce Andrew Scull  2020-09-15  276  	if (vcpu) {
09cf57eba304246 David Brazdil 2020-06-25  277  		__timer_disable_traps(vcpu);
09cf57eba304246 David Brazdil 2020-06-25  278  		__deactivate_traps(vcpu);
501a67a25dd459a Andrew Scull  2020-09-15  279  		__load_host_stage2();
09cf57eba304246 David Brazdil 2020-06-25  280  		__sysreg_restore_state_nvhe(host_ctxt);
09cf57eba304246 David Brazdil 2020-06-25  281  	}
09cf57eba304246 David Brazdil 2020-06-25  282  
af22b193436b997 Andrew Scull  2021-02-19  283  	__hyp_do_panic(host_ctxt, spsr, elr, par);
09cf57eba304246 David Brazdil 2020-06-25  284  	unreachable();
09cf57eba304246 David Brazdil 2020-06-25  285  }
e9ee186bb735bfc James Morse   2020-08-21  286  

:::::: The code at line 265 was first introduced by commit
:::::: 6a0259ed29bba83653a36fabcdf6b06aecd78596 KVM: arm64: Remove hyp_panic arguments

:::::: TO: Andrew Scull <ascull@google.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
