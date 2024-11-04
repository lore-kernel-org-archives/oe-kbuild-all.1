Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144721CC177
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 20:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730752723; cv=none; b=Cgk2aYTxiwJcNTL95HWc2aImnLMQshT9q9r62qI4W5Uw1yIzjG1Dx4QN7SBkQ4aeQzLI9FOxZ0ylVZFepSCm4jsTGoL7/+K9GH2i5JJl6zfXu3+AELaOAfGQPNp20wdFWYVlZKFup5nsc43EOK3M7AS0JxTgu1VdpRwrM9ZArS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730752723; c=relaxed/simple;
	bh=SXU8e2KDR/URLBHts+5ONxXMNTy5/Zkrhtw1FFat7JI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RThESyK4XN0cYZwKUQF4eDjPo271n6khogL1tHFZY4cGx/Ip46cN0ESLWpNaK6eL5QTpxJk4v9PzOq86RThnzlM22nhJwOe84ox9Z/lE0LGD8sZ4BIez4yBb5PG4INwP6kgQQj45VJWWXqIt/fwtE6XTsnboo6sEtjnpRtznVNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PuOTXQ2N; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuOTXQ2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730752721; x=1762288721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SXU8e2KDR/URLBHts+5ONxXMNTy5/Zkrhtw1FFat7JI=;
  b=PuOTXQ2NjpQa5e5KCA6qYUufusQ2ZtTTZoax/RRWpaC6qVte64vmVkJw
   EhcDyGjPqipyDpTP/bM+MIviVp7MJDonJOkFVB9bREJ7uYIMCXY/YE6oS
   ILrwho9qG8f4qgNH9CSwfGpcX2BRqzHgM273F7bnFHQAvKQxya2RqB8ej
   RrjLDUW5T0b9CFObNGS8OgsnOaTLD3rnTaQ7G3j07hgCHWKniWZxDW1ve
   sLONFALy2FwjOSe4y52S3IBYUuzvLEytwoETJSpVnF3Go41g8G+tvmtPd
   ueXz05kpbXTKquRYSs+T7MYFaoHUZqE2quobQus/nxjU8Yk+p1IEOX7r1
   g==;
X-CSE-ConnectionGUID: mN81JlOPRzyKTzzEg0dgYw==
X-CSE-MsgGUID: d2OZd4CMQrm8szg6WsML3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30322255"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30322255"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 12:38:41 -0800
X-CSE-ConnectionGUID: 4G14lYIVSqq56qUwlHVbeA==
X-CSE-MsgGUID: bbSku+9bSyq4BAA0jqxA2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="88341627"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Nov 2024 12:38:37 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t83qN-000lGL-0L;
	Mon, 04 Nov 2024 20:38:35 +0000
Date: Tue, 5 Nov 2024 04:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 arch/x86/ia32/ia32_signal.c:354:9: sparse: sparse: cast removes address
 space '<asn:1>' of expression
Message-ID: <202411050449.3x8cB8nj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 2779664eca3a100ac10f7d01bcc5e353496294bc [1/1] x86: ia32_setup_rt_frame(): consolidate uaccess areas
config: x86_64-randconfig-121-20241028 (https://download.01.org/0day-ci/archive/20241105/202411050449.3x8cB8nj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050449.3x8cB8nj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050449.3x8cB8nj-lkp@intel.com/

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
