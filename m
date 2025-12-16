Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3789393768
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 12:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889239; cv=none; b=SIreqN1slllIjwEdNAmJIxztn5qFwpkunZ60bzcuGa7l/w6kVyf64p315f11jik1Qfp2R3IWRsTqqDTqXlOOammnyj0LVzih+uYxHNikVEJrNmd9yTNKhTbDCdQvwZB/G3fuxCHe5BI/LKffwVbSa6GKepQFFNWwFaOgVpti1J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889239; c=relaxed/simple;
	bh=vBcBSibTO9QNg8JbvNeeU6JIL+YSwJfQA/u2PqPGE5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IxETq11Ht6hDPIxI7R7p8K+1Y3B1fOTKZhazDr4fq20XLwmamOnR4iqQTQxQswlXwZOAnrpf165ttLzF5B4gThSDcPyUTbjwUlBdCjH1tN21CeyRiu721XkT74ql74+IV3e23PoVduQVO6jn7oxUr0JOn5GXnczyAeGEGlwEmM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QzbHtSA3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QzbHtSA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765889238; x=1797425238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vBcBSibTO9QNg8JbvNeeU6JIL+YSwJfQA/u2PqPGE5U=;
  b=QzbHtSA3nQ0gJSRg7HKTMYAWFezvZabNkMQMRnPGPx4HN9FvtUjLczfM
   6TwHmbtGv9JS8Zuj+c67yv5sMNXP/WvasJWPSniFFhvyrJ3fH8H2SBHPk
   NXpfkwZbIAwiGmtACX3WT1lDGSIcDsthllHmSX+Mr5+Q9DCVqUTL2ptAr
   pg5dfgYWoKaZV8AxwsgOlwdLnQRJbKbZL2VzthuQVHSF341kgNOh7dJTd
   bbM0Pi9TBpSgLb3r2d8jsplFG5AgTYw8L2ZOpvljve5IQKRDTCTmIRMWu
   FtgvVG5kPBKLbAtb6tDUKN/MMi6+jISu2ypBil2XFk2KR/jnXPp9XYLOb
   A==;
X-CSE-ConnectionGUID: Bajza4R/THW630OM0l97Nw==
X-CSE-MsgGUID: akQOYpKeT0O1gvTEaYrU9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67840881"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67840881"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 04:47:15 -0800
X-CSE-ConnectionGUID: CWnaYV80R0Si6AMkrL23Dw==
X-CSE-MsgGUID: vTWO4xJ5R8u3M/VFXAhGkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="202507685"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Dec 2025 04:47:14 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVUSN-0000000032W-33Mh;
	Tue, 16 Dec 2025 12:47:11 +0000
Date: Tue, 16 Dec 2025 20:46:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 arch/x86/kernel/fpu/xstate.c:1119: warning: Function parameter or member
 'xsave' not described in 'copy_uabi_to_xstate'
Message-ID: <202512162012.Cej5WHGd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kyle,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: 3f1c81426a9f1cf038b00994dab1ececa72de56b [2/2] x86/fpu: Allow PKRU to be (once again) written by ptrace.
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251216/202512162012.Cej5WHGd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162012.Cej5WHGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162012.Cej5WHGd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/fpu/xstate.c:1119: warning: Function parameter or member 'xsave' not described in 'copy_uabi_to_xstate'
>> arch/x86/kernel/fpu/xstate.c:1119: warning: Excess function parameter 'fpstate' description in 'copy_uabi_to_xstate'


vim +1119 arch/x86/kernel/fpu/xstate.c

947f4947cf00ea Thomas Gleixner           2021-06-23  1092  
522e92743b3535 Thomas Gleixner           2021-06-23  1093  
3f1c81426a9f1c Kyle Huey                 2023-01-09  1094  /**
3f1c81426a9f1c Kyle Huey                 2023-01-09  1095   * copy_uabi_to_xstate - Copy a UABI format buffer to the kernel xstate
3f1c81426a9f1c Kyle Huey                 2023-01-09  1096   * @fpstate:	The fpstate buffer to copy to
3f1c81426a9f1c Kyle Huey                 2023-01-09  1097   * @kbuf:	The UABI format buffer, if it comes from the kernel
3f1c81426a9f1c Kyle Huey                 2023-01-09  1098   * @ubuf:	The UABI format buffer, if it comes from userspace
3f1c81426a9f1c Kyle Huey                 2023-01-09  1099   * @pkru:	The location to write the PKRU value to
3f1c81426a9f1c Kyle Huey                 2023-01-09  1100   *
3f1c81426a9f1c Kyle Huey                 2023-01-09  1101   * Converts from the UABI format into the kernel internal hardware
3f1c81426a9f1c Kyle Huey                 2023-01-09  1102   * dependent format.
3f1c81426a9f1c Kyle Huey                 2023-01-09  1103   *
3f1c81426a9f1c Kyle Huey                 2023-01-09  1104   * This function ultimately has two different callers with distinct PKRU
3f1c81426a9f1c Kyle Huey                 2023-01-09  1105   * behavior.
3f1c81426a9f1c Kyle Huey                 2023-01-09  1106   * 1.	When called from sigreturn the PKRU register will be restored from
3f1c81426a9f1c Kyle Huey                 2023-01-09  1107   *	@fpstate via an XRSTOR. Correctly copying the UABI format buffer to
3f1c81426a9f1c Kyle Huey                 2023-01-09  1108   *	@fpstate is sufficient to cover this case, but the caller will also
3f1c81426a9f1c Kyle Huey                 2023-01-09  1109   *	pass a pointer to the thread_struct's pkru field in @pkru and updating
3f1c81426a9f1c Kyle Huey                 2023-01-09  1110   *	it is harmless.
3f1c81426a9f1c Kyle Huey                 2023-01-09  1111   * 2.	When called from ptrace the PKRU register will be restored from the
3f1c81426a9f1c Kyle Huey                 2023-01-09  1112   *	thread_struct's pkru field. A pointer to that is passed in @pkru.
3f1c81426a9f1c Kyle Huey                 2023-01-09  1113   *	The kernel will restore it manually, so the XRSTOR behavior that resets
3f1c81426a9f1c Kyle Huey                 2023-01-09  1114   *	the PKRU register to the hardware init value (0) if the corresponding
3f1c81426a9f1c Kyle Huey                 2023-01-09  1115   *	xfeatures bit is not set is emulated here.
3f1c81426a9f1c Kyle Huey                 2023-01-09  1116   */
522e92743b3535 Thomas Gleixner           2021-06-23  1117  static int copy_uabi_to_xstate(struct xregs_state *xsave, const void *kbuf,
b29773d6b0bb8e Kyle Huey                 2023-01-09  1118  			       const void __user *ubuf, u32 *pkru)
79fecc2b7506f2 Ingo Molnar               2017-09-23 @1119  {
79fecc2b7506f2 Ingo Molnar               2017-09-23  1120  	unsigned int offset, size;
80d8ae86b36791 Eric Biggers              2017-09-24  1121  	struct xstate_header hdr;
522e92743b3535 Thomas Gleixner           2021-06-23  1122  	u64 mask;
522e92743b3535 Thomas Gleixner           2021-06-23  1123  	int i;
79fecc2b7506f2 Ingo Molnar               2017-09-23  1124  
79fecc2b7506f2 Ingo Molnar               2017-09-23  1125  	offset = offsetof(struct xregs_state, header);
522e92743b3535 Thomas Gleixner           2021-06-23  1126  	if (copy_from_buffer(&hdr, offset, sizeof(hdr), kbuf, ubuf))
522e92743b3535 Thomas Gleixner           2021-06-23  1127  		return -EFAULT;
79fecc2b7506f2 Ingo Molnar               2017-09-23  1128  
5274e6c172c472 Fenghua Yu                2020-05-12  1129  	if (validate_user_xstate_header(&hdr))
79fecc2b7506f2 Ingo Molnar               2017-09-23  1130  		return -EINVAL;
79fecc2b7506f2 Ingo Molnar               2017-09-23  1131  
522e92743b3535 Thomas Gleixner           2021-06-23  1132  	/* Validate MXCSR when any of the related features is in use */
522e92743b3535 Thomas Gleixner           2021-06-23  1133  	mask = XFEATURE_MASK_FP | XFEATURE_MASK_SSE | XFEATURE_MASK_YMM;
522e92743b3535 Thomas Gleixner           2021-06-23  1134  	if (hdr.xfeatures & mask) {
522e92743b3535 Thomas Gleixner           2021-06-23  1135  		u32 mxcsr[2];
522e92743b3535 Thomas Gleixner           2021-06-23  1136  
522e92743b3535 Thomas Gleixner           2021-06-23  1137  		offset = offsetof(struct fxregs_state, mxcsr);
522e92743b3535 Thomas Gleixner           2021-06-23  1138  		if (copy_from_buffer(mxcsr, offset, sizeof(mxcsr), kbuf, ubuf))
522e92743b3535 Thomas Gleixner           2021-06-23  1139  			return -EFAULT;
522e92743b3535 Thomas Gleixner           2021-06-23  1140  
522e92743b3535 Thomas Gleixner           2021-06-23  1141  		/* Reserved bits in MXCSR must be zero. */
522e92743b3535 Thomas Gleixner           2021-06-23  1142  		if (mxcsr[0] & ~mxcsr_feature_mask)
947f4947cf00ea Thomas Gleixner           2021-06-23  1143  			return -EINVAL;
947f4947cf00ea Thomas Gleixner           2021-06-23  1144  
522e92743b3535 Thomas Gleixner           2021-06-23  1145  		/* SSE and YMM require MXCSR even when FP is not in use. */
522e92743b3535 Thomas Gleixner           2021-06-23  1146  		if (!(hdr.xfeatures & XFEATURE_MASK_FP)) {
522e92743b3535 Thomas Gleixner           2021-06-23  1147  			xsave->i387.mxcsr = mxcsr[0];
522e92743b3535 Thomas Gleixner           2021-06-23  1148  			xsave->i387.mxcsr_mask = mxcsr[1];
522e92743b3535 Thomas Gleixner           2021-06-23  1149  		}
522e92743b3535 Thomas Gleixner           2021-06-23  1150  	}
522e92743b3535 Thomas Gleixner           2021-06-23  1151  
79fecc2b7506f2 Ingo Molnar               2017-09-23  1152  	for (i = 0; i < XFEATURE_MAX; i++) {
79fecc2b7506f2 Ingo Molnar               2017-09-23  1153  		u64 mask = ((u64)1 << i);
79fecc2b7506f2 Ingo Molnar               2017-09-23  1154  
b89eda482d7849 Eric Biggers              2017-09-24  1155  		if (hdr.xfeatures & mask) {
07baeb04f37c95 Sebastian Andrzej Siewior 2019-04-03  1156  			void *dst = __raw_xsave_addr(xsave, i);
79fecc2b7506f2 Ingo Molnar               2017-09-23  1157  
79fecc2b7506f2 Ingo Molnar               2017-09-23  1158  			offset = xstate_offsets[i];
79fecc2b7506f2 Ingo Molnar               2017-09-23  1159  			size = xstate_sizes[i];
79fecc2b7506f2 Ingo Molnar               2017-09-23  1160  
522e92743b3535 Thomas Gleixner           2021-06-23  1161  			if (copy_from_buffer(dst, offset, size, kbuf, ubuf))
522e92743b3535 Thomas Gleixner           2021-06-23  1162  				return -EFAULT;
79fecc2b7506f2 Ingo Molnar               2017-09-23  1163  		}
79fecc2b7506f2 Ingo Molnar               2017-09-23  1164  	}
79fecc2b7506f2 Ingo Molnar               2017-09-23  1165  
3f1c81426a9f1c Kyle Huey                 2023-01-09  1166  	if (hdr.xfeatures & XFEATURE_MASK_PKRU) {
3f1c81426a9f1c Kyle Huey                 2023-01-09  1167  		struct pkru_state *xpkru;
3f1c81426a9f1c Kyle Huey                 2023-01-09  1168  
3f1c81426a9f1c Kyle Huey                 2023-01-09  1169  		xpkru = __raw_xsave_addr(xsave, XFEATURE_PKRU);
3f1c81426a9f1c Kyle Huey                 2023-01-09  1170  		*pkru = xpkru->pkru;
3f1c81426a9f1c Kyle Huey                 2023-01-09  1171  	}
3f1c81426a9f1c Kyle Huey                 2023-01-09  1172  
79fecc2b7506f2 Ingo Molnar               2017-09-23  1173  	/*
79fecc2b7506f2 Ingo Molnar               2017-09-23  1174  	 * The state that came in from userspace was user-state only.
79fecc2b7506f2 Ingo Molnar               2017-09-23  1175  	 * Mask all the user states out of 'xfeatures':
79fecc2b7506f2 Ingo Molnar               2017-09-23  1176  	 */
8ab22804efefea Fenghua Yu                2020-05-12  1177  	xsave->header.xfeatures &= XFEATURE_MASK_SUPERVISOR_ALL;
79fecc2b7506f2 Ingo Molnar               2017-09-23  1178  
79fecc2b7506f2 Ingo Molnar               2017-09-23  1179  	/*
79fecc2b7506f2 Ingo Molnar               2017-09-23  1180  	 * Add back in the features that came in from userspace:
79fecc2b7506f2 Ingo Molnar               2017-09-23  1181  	 */
b89eda482d7849 Eric Biggers              2017-09-24  1182  	xsave->header.xfeatures |= hdr.xfeatures;
79fecc2b7506f2 Ingo Molnar               2017-09-23  1183  
79fecc2b7506f2 Ingo Molnar               2017-09-23  1184  	return 0;
79fecc2b7506f2 Ingo Molnar               2017-09-23  1185  }
79fecc2b7506f2 Ingo Molnar               2017-09-23  1186  

:::::: The code at line 1119 was first introduced by commit
:::::: 79fecc2b7506f29fb91becc65e8788e5ae7eba9f x86/fpu: Split copy_user_to_xstate() into copy_kernel_to_xstate() & copy_user_to_xstate()

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
