Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA2E168AE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 16:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692289833; x=1723825833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aGavS9oNH+2YgYCxG93cP7kSZLWDqJmKGQLMezrDRus=;
  b=SI0HqEynpc1W4s0VtiRrfPA3zlyNxu28duJfUWTA3HjNXjGlgKpVYTgG
   +7cIARavmyEfkTeHMNcrz91reyxYCwFcMjrhT/T8OelaN1uKRvIwhYDSS
   cbs0bv10k2AIbGpJ816n6xTlrX7LGEpfJYvb7L6eSAvF7h8NpjFm2Lbod
   BV9m1qw3I0yn5zJ6d4lDSY1eoxAymfHWzzxpNK+CJL3rjcoHNMh1s+MZC
   RMCiFOXygZPI/dUWZnheJj6X5KEJOmjXvohOybasC9RdzKdsuCJX6MBgn
   DDXd26eDhaFOrdbDBNUsd+sEsqE8xJqfGMX156yc0fQW62Y7+XSAjWi0e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="352450281"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="352450281"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 09:30:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="824682434"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="824682434"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Aug 2023 09:30:29 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWftF-0001K1-0X;
	Thu, 17 Aug 2023 16:30:29 +0000
Date: Fri, 18 Aug 2023 00:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kyle Huey <me@kylehuey.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [stable:linux-5.15.y 5472/9999] arch/x86/kernel/fpu/xstate.c:1119:
 warning: Function parameter or member 'xsave' not described in
 'copy_uabi_to_xstate'
Message-ID: <202308180040.H2AYyymG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   f6f7927ac664ba23447f8dd3c3dfe2f4ee39272f
commit: 3f1c81426a9f1cf038b00994dab1ececa72de56b [5472/9999] x86/fpu: Allow PKRU to be (once again) written by ptrace.
config: x86_64-randconfig-x062-20230817 (https://download.01.org/0day-ci/archive/20230818/202308180040.H2AYyymG-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180040.H2AYyymG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180040.H2AYyymG-lkp@intel.com/

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
