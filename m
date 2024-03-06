Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BD15CDC2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 07:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709711301; cv=none; b=JNFMmNYjqBXFs/lb0XBdkefI/cUlODiK4TTZNV+gshvkU8oDUn3xKUa2vL8KZQDB8IMConFIuRLL44abhQj6JMHnhWFNW5L512Gngts8u4rLhg+reS75iLyXx9pljvdvWX39sTUGhzW6hUIKgCuCWjUNoX9Qey3Yg79O7mFoclk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709711301; c=relaxed/simple;
	bh=SROiXL6MEIo7/+RiXXsQji9Cnsjez+eS+sbgsaW8Lrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a1+Ahe028GbF3konbmgZT4G0YK6EKs2nRioAFOJUf0F+16Jmdu6bz71C8Ps3r6DfX/Disd9pwlKKFgNbo+UyKo9lnGCRYHXYqC8mHLYuoSQcqm0KNgoHwxnL9NF643Xcmm0dni7QfDAi/bEACl0QpINQ2Go2qbARQw35M+su7zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNulk5mS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNulk5mS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709711299; x=1741247299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SROiXL6MEIo7/+RiXXsQji9Cnsjez+eS+sbgsaW8Lrs=;
  b=UNulk5mSDv4V3QN1TnRu46rt7851wsqe4KadgGJxr46y1aaHfuIpECFI
   wJOv03XbhaNY1A6GAQXKVby0GjnTHPo9g8d1zAoK44JvyC0WiZ8/gSCOq
   mQAO3sSUEFYw8IPthxrvaUS/Ve0DrTnIDGs+O9fBynbCSb1DV8hFHEqr1
   8kiuvVuMGekUq2I82AoFFCzjCYflwbni+G4BDxHW6zqr3qbu5iKhlCZ2j
   t/mpnlOmzocQPePjnf7F8b54PnfBL6kAcEN6sGw3lFaHIcSa8FL1hhbR2
   0Ki13/WyeDoVz7+ywCW58JKWM+UaPgmUtFr7Qx9zvCjnsSYSVuii44Qg6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4479909"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4479909"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 23:48:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9532067"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2024 23:48:15 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhm0b-00042r-0m;
	Wed, 06 Mar 2024 07:48:13 +0000
Date: Wed, 6 Mar 2024 15:48:10 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: arch/x86/ia32/ia32_signal.c:354:9: sparse: sparse: cast removes
 address space '<asn:1>' of expression
Message-ID: <202403061513.ZfwVU05Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: e1d6214f1baf879f571eb4c990ca3f3518fc49ea x86: ia32_setup_rt_frame(): consolidate uaccess areas
date:   9 months ago
config: x86_64-randconfig-121-20240305 (https://download.01.org/0day-ci/archive/20240306/202403061513.ZfwVU05Z-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061513.ZfwVU05Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061513.ZfwVU05Z-lkp@intel.com/

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
