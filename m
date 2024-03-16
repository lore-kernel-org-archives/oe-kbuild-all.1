Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB1E4C9A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 18:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710615003; cv=none; b=nfifdoDzXTC8X+YANCK/53gd0ybAEgMvt2D8ukEv7k7xtddIjtBwdILddP406H8Fix2nNpHq5VmmWe06YXHg5754gcnDdwwdG3GnM2lQuI7Ea1vs9NAoy8zQYPOL2KSm9KTd1AfPAIQdR/iKSt6rjhbYeJqYPJVq9S9H1uJqnqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710615003; c=relaxed/simple;
	bh=jnMRyrp6d7fEG6i2LlAiONvuBzLJlNc03JKXA+Prbwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c/sV+vxHdhRhW7zice98BqpsyzXFkM4PbDukO/a81oHU0TveJJZgfQhILWrHKMeArOfGlHfAVCgTcstpy1j/AVjL2JPhCv1rHJgAUst8zuJsyHPYvluhFVp/f1pIzmPOm1w5rrni/MKFQo/4LPoZSo7EsU71R1wO78BWhG7DZTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gCZEh4mP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gCZEh4mP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710615000; x=1742151000;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jnMRyrp6d7fEG6i2LlAiONvuBzLJlNc03JKXA+Prbwo=;
  b=gCZEh4mPJVXTAmqRuDYid/0byY1rbQq0cS/0ZqDG7/lM9Rze9lCz+Juq
   ERDOEvoa1tIb3bzSM3PaPjI/qxOWBM4HaaVHRZbDPc9/qwF1t9g97FQhF
   /RCYIgqTxFXAqf2KDX8tVTlZ/KFhoEkd86Xkf3z+4KYyv1NLao436VeiJ
   Wf5RJT7m3B/xv3ZJtoXRWZ2jM9XPrraK3LSFf2vs/F8wBfoF+U3jjWho1
   01z9yFIQuq5w3kwm0i4Rquigbrv/ddAevcFhUJ7d62Uul8TvlT3LHP29a
   MuUr4AeXlyi3wiHhuJMPJKjL6DdP6hM7k4H8Ats3HCWLP98PoWvovp0O/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="9282411"
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="9282411"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 11:49:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="12957698"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Mar 2024 11:49:58 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlZ6R-000Fi1-2N;
	Sat, 16 Mar 2024 18:49:55 +0000
Date: Sun, 17 Mar 2024 02:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 19590/21873] arch/x86/kvm/vmx.c:4410
 vmx_set_msr() warn: inconsistent indenting
Message-ID: <202403170252.zy8ebb02-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8e3c931720c17228aca23307a3580b068ef80099
commit: 4c9a908c6bde35918222640d774f08f825abfa3f [19590/21873] KVM: x86/speculation: Disable Fill buffer clear within guests
config: x86_64-randconfig-161-20240303 (https://download.01.org/0day-ci/archive/20240317/202403170252.zy8ebb02-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403170252.zy8ebb02-lkp@intel.com/

smatch warnings:
arch/x86/kvm/vmx.c:4410 vmx_set_msr() warn: inconsistent indenting

vim +4410 arch/x86/kvm/vmx.c

cae501397a25dc arch/x86/kvm/vmx.c Jan Kiszka            2014-01-04  4224  
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4225  /*
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4226   * Writes msr value into into the appropriate "register".
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4227   * Returns 0 on success, non-0 otherwise.
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4228   * Assumes vcpu_load() was already called.
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4229   */
8fe8ab46be06fc arch/x86/kvm/vmx.c Will Auld             2012-11-29  4230  static int vmx_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4231  {
a2fa3e9f52d875 drivers/kvm/vmx.c  Gregory Haskins       2007-07-27  4232  	struct vcpu_vmx *vmx = to_vmx(vcpu);
26bb0981b3ff00 arch/x86/kvm/vmx.c Avi Kivity            2009-09-07  4233  	struct shared_msr_entry *msr;
2cc51560aed0ed drivers/kvm/vmx.c  Eddie Dong            2007-05-21  4234  	int ret = 0;
8fe8ab46be06fc arch/x86/kvm/vmx.c Will Auld             2012-11-29  4235  	u32 msr_index = msr_info->index;
8fe8ab46be06fc arch/x86/kvm/vmx.c Will Auld             2012-11-29  4236  	u64 data = msr_info->data;
2cc51560aed0ed drivers/kvm/vmx.c  Eddie Dong            2007-05-21  4237  
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4238  	switch (msr_index) {
3bab1f5dda3443 drivers/kvm/vmx.c  Avi Kivity            2006-12-29  4239  	case MSR_EFER:
8fe8ab46be06fc arch/x86/kvm/vmx.c Will Auld             2012-11-29  4240  		ret = kvm_set_msr_common(vcpu, msr_info);
2cc51560aed0ed drivers/kvm/vmx.c  Eddie Dong            2007-05-21  4241  		break;
16175a796d0618 arch/x86/kvm/vmx.c Avi Kivity            2009-03-23  4242  #ifdef CONFIG_X86_64
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4243  	case MSR_FS_BASE:
2fb92db1ec08f3 arch/x86/kvm/vmx.c Avi Kivity            2011-04-27  4244  		vmx_segment_cache_clear(vmx);
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4245  		vmcs_writel(GUEST_FS_BASE, data);
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4246  		break;
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4247  	case MSR_GS_BASE:
2fb92db1ec08f3 arch/x86/kvm/vmx.c Avi Kivity            2011-04-27  4248  		vmx_segment_cache_clear(vmx);
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4249  		vmcs_writel(GUEST_GS_BASE, data);
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4250  		break;
44ea2b1758d88a arch/x86/kvm/vmx.c Avi Kivity            2009-09-06  4251  	case MSR_KERNEL_GS_BASE:
678e315e78a780 arch/x86/kvm/vmx.c Sean Christopherson   2018-07-23  4252  		vmx_write_guest_kernel_gs_base(vmx, data);
44ea2b1758d88a arch/x86/kvm/vmx.c Avi Kivity            2009-09-06  4253  		break;
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4254  #endif
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4255  	case MSR_IA32_SYSENTER_CS:
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4256  		vmcs_write32(GUEST_SYSENTER_CS, data);
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4257  		break;
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4258  	case MSR_IA32_SYSENTER_EIP:
f5b42c3324494e drivers/kvm/vmx.c  Avi Kivity            2007-03-06  4259  		vmcs_writel(GUEST_SYSENTER_EIP, data);
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4260  		break;
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4261  	case MSR_IA32_SYSENTER_ESP:
f5b42c3324494e drivers/kvm/vmx.c  Avi Kivity            2007-03-06  4262  		vmcs_writel(GUEST_SYSENTER_ESP, data);
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4263  		break;
0dd376e7099757 arch/x86/kvm/vmx.c Liu, Jinsong          2014-02-24  4264  	case MSR_IA32_BNDCFGS:
691bd4340bef49 arch/x86/kvm/vmx.c Haozhong Zhang        2017-07-04  4265  		if (!kvm_mpx_supported() ||
d6321d493319bf arch/x86/kvm/vmx.c Radim Krčmář          2017-08-05  4266  		    (!msr_info->host_initiated &&
d6321d493319bf arch/x86/kvm/vmx.c Radim Krčmář          2017-08-05  4267  		     !guest_cpuid_has(vcpu, X86_FEATURE_MPX)))
93c4adc7afedf9 arch/x86/kvm/vmx.c Paolo Bonzini         2014-03-05  4268  			return 1;
fd8cb433734eeb arch/x86/kvm/vmx.c Yu Zhang              2017-08-24  4269  		if (is_noncanonical_address(data & PAGE_MASK, vcpu) ||
4531662d1abf6c arch/x86/kvm/vmx.c Jim Mattson           2017-05-23  4270  		    (data & MSR_IA32_BNDCFGS_RSVD))
93c4adc7afedf9 arch/x86/kvm/vmx.c Paolo Bonzini         2014-03-05  4271  			return 1;
0dd376e7099757 arch/x86/kvm/vmx.c Liu, Jinsong          2014-02-24  4272  		vmcs_write64(GUEST_BNDCFGS, data);
0dd376e7099757 arch/x86/kvm/vmx.c Liu, Jinsong          2014-02-24  4273  		break;
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4274  	case MSR_IA32_SPEC_CTRL:
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4275  		if (!msr_info->host_initiated &&
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4276  		    !guest_cpuid_has(vcpu, X86_FEATURE_SPEC_CTRL))
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4277  			return 1;
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4278  
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4279  		/* The STIBP bit doesn't fault even if it's not advertised */
9f65fb29374ee3 arch/x86/kvm/vmx.c Konrad Rzeszutek Wilk 2018-05-09  4280  		if (data & ~(SPEC_CTRL_IBRS | SPEC_CTRL_STIBP | SPEC_CTRL_SSBD))
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4281  			return 1;
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4282  
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4283  		vmx->spec_ctrl = data;
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4284  
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4285  		if (!data)
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4286  			break;
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4287  
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4288  		/*
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4289  		 * For non-nested:
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4290  		 * When it's written (to non-zero) for the first time, pass
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4291  		 * it through.
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4292  		 *
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4293  		 * For nested:
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4294  		 * The handling of the MSR bitmap for L2 guests is done in
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4295  		 * nested_vmx_merge_msr_bitmap. We should not touch the
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4296  		 * vmcs02.msr_bitmap here since it gets completely overwritten
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4297  		 * in the merging. We update the vmcs01 here for L1 as well
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4298  		 * since it will end up touching the MSR anyway now.
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4299  		 */
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4300  		vmx_disable_intercept_for_msr(vmx->vmcs01.msr_bitmap,
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4301  					      MSR_IA32_SPEC_CTRL,
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4302  					      MSR_TYPE_RW);
d28b387fb74da9 arch/x86/kvm/vmx.c KarimAllah Ahmed      2018-02-01  4303  		break;
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4304  	case MSR_IA32_PRED_CMD:
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4305  		if (!msr_info->host_initiated &&
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4306  		    !guest_cpuid_has(vcpu, X86_FEATURE_SPEC_CTRL))
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4307  			return 1;
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4308  
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4309  		if (data & ~PRED_CMD_IBPB)
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4310  			return 1;
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4311  
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4312  		if (!data)
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4313  			break;
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4314  
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4315  		wrmsrl(MSR_IA32_PRED_CMD, PRED_CMD_IBPB);
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4316  
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4317  		/*
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4318  		 * For non-nested:
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4319  		 * When it's written (to non-zero) for the first time, pass
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4320  		 * it through.
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4321  		 *
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4322  		 * For nested:
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4323  		 * The handling of the MSR bitmap for L2 guests is done in
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4324  		 * nested_vmx_merge_msr_bitmap. We should not touch the
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4325  		 * vmcs02.msr_bitmap here since it gets completely overwritten
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4326  		 * in the merging.
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4327  		 */
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4328  		vmx_disable_intercept_for_msr(vmx->vmcs01.msr_bitmap, MSR_IA32_PRED_CMD,
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4329  					      MSR_TYPE_W);
15d45071523d89 arch/x86/kvm/vmx.c Ashok Raj             2018-02-01  4330  		break;
468d472f3f6510 arch/x86/kvm/vmx.c Sheng Yang            2008-10-09  4331  	case MSR_IA32_CR_PAT:
335ce4d43d2262 arch/x86/kvm/vmx.c Paolo Bonzini         2019-09-17  4332  		if (!kvm_pat_valid(data))
4566654bb9be9e arch/x86/kvm/vmx.c Nadav Amit            2014-09-18  4333  			return 1;
368d6c8df82ddf arch/x86/kvm/vmx.c Sean Christopherson   2019-09-17  4334  
368d6c8df82ddf arch/x86/kvm/vmx.c Sean Christopherson   2019-09-17  4335  		if (vmcs_config.vmentry_ctrl & VM_ENTRY_LOAD_IA32_PAT) {
468d472f3f6510 arch/x86/kvm/vmx.c Sheng Yang            2008-10-09  4336  			vmcs_write64(GUEST_IA32_PAT, data);
468d472f3f6510 arch/x86/kvm/vmx.c Sheng Yang            2008-10-09  4337  			vcpu->arch.pat = data;
468d472f3f6510 arch/x86/kvm/vmx.c Sheng Yang            2008-10-09  4338  			break;
468d472f3f6510 arch/x86/kvm/vmx.c Sheng Yang            2008-10-09  4339  		}
8fe8ab46be06fc arch/x86/kvm/vmx.c Will Auld             2012-11-29  4340  		ret = kvm_set_msr_common(vcpu, msr_info);
4e47c7a6d714cf arch/x86/kvm/vmx.c Sheng Yang            2009-12-18  4341  		break;
ba904635d498fe arch/x86/kvm/vmx.c Will Auld             2012-11-29  4342  	case MSR_IA32_TSC_ADJUST:
ba904635d498fe arch/x86/kvm/vmx.c Will Auld             2012-11-29  4343  		ret = kvm_set_msr_common(vcpu, msr_info);
4e47c7a6d714cf arch/x86/kvm/vmx.c Sheng Yang            2009-12-18  4344  		break;
c45dcc71b794b5 arch/x86/kvm/vmx.c Ashok Raj             2016-06-22  4345  	case MSR_IA32_MCG_EXT_CTL:
c45dcc71b794b5 arch/x86/kvm/vmx.c Ashok Raj             2016-06-22  4346  		if ((!msr_info->host_initiated &&
c45dcc71b794b5 arch/x86/kvm/vmx.c Ashok Raj             2016-06-22  4347  		     !(to_vmx(vcpu)->msr_ia32_feature_control &
c45dcc71b794b5 arch/x86/kvm/vmx.c Ashok Raj             2016-06-22  4348  		       FEATURE_CONTROL_LMCE)) ||
c45dcc71b794b5 arch/x86/kvm/vmx.c Ashok Raj             2016-06-22  4349  		    (data & ~MCG_EXT_CTL_LMCE_EN))
c45dcc71b794b5 arch/x86/kvm/vmx.c Ashok Raj             2016-06-22  4350  			return 1;
c45dcc71b794b5 arch/x86/kvm/vmx.c Ashok Raj             2016-06-22  4351  		vcpu->arch.mcg_ext_ctl = data;
c45dcc71b794b5 arch/x86/kvm/vmx.c Ashok Raj             2016-06-22  4352  		break;
cae501397a25dc arch/x86/kvm/vmx.c Jan Kiszka            2014-01-04  4353  	case MSR_IA32_FEATURE_CONTROL:
37e4c997dadf71 arch/x86/kvm/vmx.c Haozhong Zhang        2016-06-22  4354  		if (!vmx_feature_control_msr_valid(vcpu, data) ||
3b84080b9512bc arch/x86/kvm/vmx.c Haozhong Zhang        2016-06-22  4355  		    (to_vmx(vcpu)->msr_ia32_feature_control &
cae501397a25dc arch/x86/kvm/vmx.c Jan Kiszka            2014-01-04  4356  		     FEATURE_CONTROL_LOCKED && !msr_info->host_initiated))
cae501397a25dc arch/x86/kvm/vmx.c Jan Kiszka            2014-01-04  4357  			return 1;
3b84080b9512bc arch/x86/kvm/vmx.c Haozhong Zhang        2016-06-22  4358  		vmx->msr_ia32_feature_control = data;
cae501397a25dc arch/x86/kvm/vmx.c Jan Kiszka            2014-01-04  4359  		if (msr_info->host_initiated && data == 0)
cae501397a25dc arch/x86/kvm/vmx.c Jan Kiszka            2014-01-04  4360  			vmx_leave_nested(vcpu);
cae501397a25dc arch/x86/kvm/vmx.c Jan Kiszka            2014-01-04  4361  		break;
cae501397a25dc arch/x86/kvm/vmx.c Jan Kiszka            2014-01-04  4362  	case MSR_IA32_VMX_BASIC ... MSR_IA32_VMX_VMFUNC:
62cc6b9dc61eee arch/x86/kvm/vmx.c David Matlack         2016-11-29  4363  		if (!msr_info->host_initiated)
cae501397a25dc arch/x86/kvm/vmx.c Jan Kiszka            2014-01-04  4364  			return 1; /* they are read-only */
62cc6b9dc61eee arch/x86/kvm/vmx.c David Matlack         2016-11-29  4365  		if (!nested_vmx_allowed(vcpu))
62cc6b9dc61eee arch/x86/kvm/vmx.c David Matlack         2016-11-29  4366  			return 1;
62cc6b9dc61eee arch/x86/kvm/vmx.c David Matlack         2016-11-29  4367  		return vmx_set_vmx_msr(vcpu, msr_index, data);
203000993de509 arch/x86/kvm/vmx.c Wanpeng Li            2014-12-02  4368  	case MSR_IA32_XSS:
08aca7450c7eaf arch/x86/kvm/vmx.c Wanpeng Li            2019-09-17  4369  		if (!vmx_xsaves_supported() ||
08aca7450c7eaf arch/x86/kvm/vmx.c Wanpeng Li            2019-09-17  4370  		    (!msr_info->host_initiated &&
08aca7450c7eaf arch/x86/kvm/vmx.c Wanpeng Li            2019-09-17  4371  		     !(guest_cpuid_has(vcpu, X86_FEATURE_XSAVE) &&
08aca7450c7eaf arch/x86/kvm/vmx.c Wanpeng Li            2019-09-17  4372  		       guest_cpuid_has(vcpu, X86_FEATURE_XSAVES))))
203000993de509 arch/x86/kvm/vmx.c Wanpeng Li            2014-12-02  4373  			return 1;
203000993de509 arch/x86/kvm/vmx.c Wanpeng Li            2014-12-02  4374  		/*
203000993de509 arch/x86/kvm/vmx.c Wanpeng Li            2014-12-02  4375  		 * The only supported bit as of Skylake is bit 8, but
203000993de509 arch/x86/kvm/vmx.c Wanpeng Li            2014-12-02  4376  		 * it is not supported on KVM.
203000993de509 arch/x86/kvm/vmx.c Wanpeng Li            2014-12-02  4377  		 */
203000993de509 arch/x86/kvm/vmx.c Wanpeng Li            2014-12-02  4378  		if (data != 0)
203000993de509 arch/x86/kvm/vmx.c Wanpeng Li            2014-12-02  4379  			return 1;
203000993de509 arch/x86/kvm/vmx.c Wanpeng Li            2014-12-02  4380  		vcpu->arch.ia32_xss = data;
203000993de509 arch/x86/kvm/vmx.c Wanpeng Li            2014-12-02  4381  		if (vcpu->arch.ia32_xss != host_xss)
203000993de509 arch/x86/kvm/vmx.c Wanpeng Li            2014-12-02  4382  			add_atomic_switch_msr(vmx, MSR_IA32_XSS,
989e3992d2eca3 arch/x86/kvm/vmx.c Konrad Rzeszutek Wilk 2018-06-20  4383  				vcpu->arch.ia32_xss, host_xss, false);
203000993de509 arch/x86/kvm/vmx.c Wanpeng Li            2014-12-02  4384  		else
203000993de509 arch/x86/kvm/vmx.c Wanpeng Li            2014-12-02  4385  			clear_atomic_switch_msr(vmx, MSR_IA32_XSS);
203000993de509 arch/x86/kvm/vmx.c Wanpeng Li            2014-12-02  4386  		break;
4e47c7a6d714cf arch/x86/kvm/vmx.c Sheng Yang            2009-12-18  4387  	case MSR_TSC_AUX:
d6321d493319bf arch/x86/kvm/vmx.c Radim Krčmář          2017-08-05  4388  		if (!msr_info->host_initiated &&
d6321d493319bf arch/x86/kvm/vmx.c Radim Krčmář          2017-08-05  4389  		    !guest_cpuid_has(vcpu, X86_FEATURE_RDTSCP))
4e47c7a6d714cf arch/x86/kvm/vmx.c Sheng Yang            2009-12-18  4390  			return 1;
4e47c7a6d714cf arch/x86/kvm/vmx.c Sheng Yang            2009-12-18  4391  		/* Check reserved bit, higher 32 bits should be zero */
4e47c7a6d714cf arch/x86/kvm/vmx.c Sheng Yang            2009-12-18  4392  		if ((data >> 32) != 0)
4e47c7a6d714cf arch/x86/kvm/vmx.c Sheng Yang            2009-12-18  4393  			return 1;
4e47c7a6d714cf arch/x86/kvm/vmx.c Sheng Yang            2009-12-18  4394  		/* Otherwise falls through */
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4395  	default:
8b9cf98cc7ea73 drivers/kvm/vmx.c  Rusty Russell         2007-07-30  4396  		msr = find_msr_entry(vmx, msr_index);
3bab1f5dda3443 drivers/kvm/vmx.c  Avi Kivity            2006-12-29  4397  		if (msr) {
8b3c3104c3f4f7 arch/x86/kvm/vmx.c Andy Honig            2014-08-27  4398  			u64 old_msr_data = msr->data;
3bab1f5dda3443 drivers/kvm/vmx.c  Avi Kivity            2006-12-29  4399  			msr->data = data;
2225fd56049643 arch/x86/kvm/vmx.c Avi Kivity            2012-04-18  4400  			if (msr - vmx->guest_msrs < vmx->save_nmsrs) {
2225fd56049643 arch/x86/kvm/vmx.c Avi Kivity            2012-04-18  4401  				preempt_disable();
8b3c3104c3f4f7 arch/x86/kvm/vmx.c Andy Honig            2014-08-27  4402  				ret = kvm_set_shared_msr(msr->index, msr->data,
9ee73970c03edb arch/x86/kvm/vmx.c Avi Kivity            2012-03-06  4403  							 msr->mask);
2225fd56049643 arch/x86/kvm/vmx.c Avi Kivity            2012-04-18  4404  				preempt_enable();
8b3c3104c3f4f7 arch/x86/kvm/vmx.c Andy Honig            2014-08-27  4405  				if (ret)
8b3c3104c3f4f7 arch/x86/kvm/vmx.c Andy Honig            2014-08-27  4406  					msr->data = old_msr_data;
2225fd56049643 arch/x86/kvm/vmx.c Avi Kivity            2012-04-18  4407  			}
3bab1f5dda3443 drivers/kvm/vmx.c  Avi Kivity            2006-12-29  4408  			break;
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4409  		}
8fe8ab46be06fc arch/x86/kvm/vmx.c Will Auld             2012-11-29 @4410  			ret = kvm_set_msr_common(vcpu, msr_info);
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4411  	}
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4412  
4c9a908c6bde35 arch/x86/kvm/vmx.c Pawan Gupta           2022-07-06  4413  	/* FB_CLEAR may have changed, also update the FB_CLEAR_DIS behavior */
4c9a908c6bde35 arch/x86/kvm/vmx.c Pawan Gupta           2022-07-06  4414  	if (msr_index == MSR_IA32_ARCH_CAPABILITIES)
4c9a908c6bde35 arch/x86/kvm/vmx.c Pawan Gupta           2022-07-06  4415  		vmx_update_fb_clear_dis(vcpu, vmx);
4c9a908c6bde35 arch/x86/kvm/vmx.c Pawan Gupta           2022-07-06  4416  
2cc51560aed0ed drivers/kvm/vmx.c  Eddie Dong            2007-05-21  4417  	return ret;
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4418  }
6aa8b732ca01c3 drivers/kvm/vmx.c  Avi Kivity            2006-12-10  4419  

:::::: The code at line 4410 was first introduced by commit
:::::: 8fe8ab46be06fcd9abfe6fe9928fd95b54ab079a KVM: x86: Add code to track call origin for msr assignment

:::::: TO: Will Auld <will.auld.intel@gmail.com>
:::::: CC: Marcelo Tosatti <mtosatti@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
