Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98331D5AD6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 04:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727412481; cv=none; b=QqC/inSuBkp0q7lW/NzHY/6IvqetkGGMNaypZQN4e+tu1uSVYpPGYonmVuqQZOQ2EBZpsrwCNvsm0GqH1mfTOVdh4DufD4i5lcdKVBDu43jJvD4pqH/7yuAyvExmW1vet4IThK7RPbl4SKpk/V9mVYH2hFwztEzy3PHGtlDCzAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727412481; c=relaxed/simple;
	bh=NvGZH198laStAw0dM/YVVT1O6yNDr7xRED4V24apxRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jV4JtYH+6WkJ9N3nrxrMHRXnDogFyw6IBE+EZkscK+Sci/8Hby6ZCN6Vg60LEcQ31ZfkQla5C964g5LTNbhsDQjK7OuvZDI2Wbi3MBttKrpE1n4vKbogXBZ0OPpNOO1XcWN4VBEcLF8x+EoSwHYow7Rv6lZ/yd0XFBGtLWwmxRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ur7VxCBt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ur7VxCBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727412479; x=1758948479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NvGZH198laStAw0dM/YVVT1O6yNDr7xRED4V24apxRU=;
  b=Ur7VxCBtfI0w5XoJm+LNL8O89pCENwFYI/NCcD1hIJzwoPmJrupfXyFy
   Ogl9PmPIkrP+reLKOS0dFPolERjKaZ2fZV799y4+Ar/1PtC6lAWhvP5qn
   NPgyuVwr6BHzQ+bKNvt4ofR3IM3YSlEV7GIksBDhIXrxC7qwH46BOHmfE
   pT/qs+dn4mvh89jRQTLGsnLsis5WLVU6cAIJfDP/h5fbHQ9J2Vk21E5HT
   DJz+EzumHAykt4xZDSZtPfj2wNORYFSpPeKWELFsvALiQz0BPvPVlk3lX
   1uJjhn0vhYiQr7D5keDd4DBwggdLEY+dlS0ZKgvGRb0P/wsStHJNxhgzk
   A==;
X-CSE-ConnectionGUID: 35ts8Cr/SdeW5W2dyCaEiA==
X-CSE-MsgGUID: UgalR7YnTXibNOQ1KJolXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="44061801"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="44061801"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 21:47:59 -0700
X-CSE-ConnectionGUID: CNHqZRBoQjyPmQ/KTfuuzA==
X-CSE-MsgGUID: XdnziXzHTdyEeRIKrDtNkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="76464033"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Sep 2024 21:47:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su2tV-000LUF-25;
	Fri, 27 Sep 2024 04:47:53 +0000
Date: Fri, 27 Sep 2024 12:47:08 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2078/2444]
 arch/x86/ia32/ia32_signal.c:354:9: sparse: sparse: cast removes address
 space '<asn:1>' of expression
Message-ID: <202409271218.Ba0sTOBg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   aabcc6dc6d7f9e12baf1f117341469c84afd545d
commit: 2779664eca3a100ac10f7d01bcc5e353496294bc [2078/2444] x86: ia32_setup_rt_frame(): consolidate uaccess areas
config: x86_64-randconfig-122-20240925 (https://download.01.org/0day-ci/archive/20240927/202409271218.Ba0sTOBg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271218.Ba0sTOBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271218.Ba0sTOBg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/ia32/ia32_signal.c:354:9: sparse: sparse: cast removes address space '<asn:1>' of expression
>> arch/x86/ia32/ia32_signal.c:354:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned long long [usertype] * @@
   arch/x86/ia32/ia32_signal.c:354:9: sparse:     expected void const volatile [noderef] <asn:1> *
   arch/x86/ia32/ia32_signal.c:354:9: sparse:     got unsigned long long [usertype] *
>> arch/x86/ia32/ia32_signal.c:354:9: sparse: sparse: cast removes address space '<asn:1>' of expression
>> arch/x86/ia32/ia32_signal.c:354:9: sparse: sparse: cast removes address space '<asn:1>' of expression
>> arch/x86/ia32/ia32_signal.c:354:9: sparse: sparse: cast removes address space '<asn:1>' of expression
>> arch/x86/ia32/ia32_signal.c:354:9: sparse: sparse: cast removes address space '<asn:1>' of expression
>> arch/x86/ia32/ia32_signal.c:354:9: sparse: sparse: cast removes address space '<asn:1>' of expression
>> arch/x86/ia32/ia32_signal.c:354:9: sparse: sparse: cast removes address space '<asn:1>' of expression
>> arch/x86/ia32/ia32_signal.c:354:9: sparse: sparse: cast removes address space '<asn:1>' of expression
>> arch/x86/ia32/ia32_signal.c:354:9: sparse: sparse: cast removes address space '<asn:1>' of expression
>> arch/x86/ia32/ia32_signal.c:354:9: sparse: sparse: cast removes address space '<asn:1>' of expression

vim +354 arch/x86/ia32/ia32_signal.c

   303	
   304	int ia32_setup_rt_frame(int sig, struct ksignal *ksig,
   305				compat_sigset_t *set, struct pt_regs *regs)
   306	{
   307		struct rt_sigframe_ia32 __user *frame;
   308		void __user *restorer;
   309		void __user *fp = NULL;
   310	
   311		/* unsafe_put_user optimizes that into a single 8 byte store */
   312		static const struct {
   313			u8 movl;
   314			u32 val;
   315			u16 int80;
   316			u8  pad;
   317		} __attribute__((packed)) code = {
   318			0xb8,
   319			__NR_ia32_rt_sigreturn,
   320			0x80cd,
   321			0,
   322		};
   323	
   324		frame = get_sigframe(ksig, regs, sizeof(*frame), &fp);
   325	
   326		if (!user_access_begin(frame, sizeof(*frame)))
   327			return -EFAULT;
   328	
   329		unsafe_put_user(sig, &frame->sig, Efault);
   330		unsafe_put_user(ptr_to_compat(&frame->info), &frame->pinfo, Efault);
   331		unsafe_put_user(ptr_to_compat(&frame->uc), &frame->puc, Efault);
   332	
   333		/* Create the ucontext.  */
   334		if (static_cpu_has(X86_FEATURE_XSAVE))
   335			unsafe_put_user(UC_FP_XSTATE, &frame->uc.uc_flags, Efault);
   336		else
   337			unsafe_put_user(0, &frame->uc.uc_flags, Efault);
   338		unsafe_put_user(0, &frame->uc.uc_link, Efault);
   339		unsafe_compat_save_altstack(&frame->uc.uc_stack, regs->sp, Efault);
   340	
   341		if (ksig->ka.sa.sa_flags & SA_RESTORER)
   342			restorer = ksig->ka.sa.sa_restorer;
   343		else
   344			restorer = current->mm->context.vdso +
   345				vdso_image_32.sym___kernel_rt_sigreturn;
   346		unsafe_put_user(ptr_to_compat(restorer), &frame->pretcode, Efault);
   347	
   348		/*
   349		 * Not actually used anymore, but left because some gdb
   350		 * versions need it.
   351		 */
   352		unsafe_put_user(*((u64 *)&code), (u64 __user *)frame->retcode, Efault);
   353		unsafe_put_sigcontext32(&frame->uc.uc_mcontext, fp, regs, set, Efault);
 > 354		unsafe_put_user(*(__u64 *)set, (__u64 *)&frame->uc.uc_sigmask, Efault);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
