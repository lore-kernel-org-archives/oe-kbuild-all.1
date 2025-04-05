Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741AE2E403
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 16:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743869198; cv=none; b=OuB/BWloCOwEosQCQG8lI2xaM6gNrMreQKcCwomHdg3TQbBiOi2mUxCxYDEfQQNV8oFuKZNjSLGXQel4SmcJu1IUjiqB7AHL4jZg/V5IHRGIGuFfZOpLrfc9uT4dV6lj9NQNDoJ3BaB/nYiEZa6xBV9Xf/2E0GgD9bVVZMVt9Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743869198; c=relaxed/simple;
	bh=kRZWcUnjawCNP+qiE/wm9QwoHE3ajv4lmOXZNzpS7gI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ocTPu7BQ9B7SZY5SD8mxiHBvHjGgcPglX2NsWP+ccugaX6ToOCKRKQM6HvI1ROEilCj5f38PbrBfzb7wN0MYeW1R8fgJbjAu32X46KLWPfiPhgeyFo1F7kHx/w/60xzChpojegU0rEIdnYhWWyA9SfmjO1tTl4EVjALViF3kv1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCUCaCls; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCUCaCls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743869197; x=1775405197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kRZWcUnjawCNP+qiE/wm9QwoHE3ajv4lmOXZNzpS7gI=;
  b=PCUCaCls1ch+VqgtIldG9t6Z+MEzF/1TI7W5+yfJ75Xz/6w4IsFVu81N
   BosPyphGDPo/aoWGCxY0sA2Ngu+P3jv1HlQgn7arwbRKhgDtQ7dVN5hUy
   DkEjBIzzm0T6X8n0frvTJ+baxWrAw4N8pWCJYcCmw6yNBXV05y+0ERlCN
   AZovw4sEES+zchqZkmidcFzTtRo3Y0xWdPyZSAyWMK8opVrghC+QGxIFS
   rxbqG0DehCdAm19x+frpoj8iHNxPIee+UkJSi6es0+vjFmxPXJWXfUvRq
   Fno3fdgY95WEiwuIlc+7ydLWSs6LK0zGX4rVaqb6KR7acbnWCCn6iyVcN
   g==;
X-CSE-ConnectionGUID: nPR/17UfQrOtVuloC2ZJAA==
X-CSE-MsgGUID: 6sElAOyXSsq5SQO0s02NZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="55928844"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="55928844"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 09:06:36 -0700
X-CSE-ConnectionGUID: fASjbAZkRuea/uJ6R9ePSw==
X-CSE-MsgGUID: B1uSkPVjQgeqTATBGY1E5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="131700073"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Apr 2025 09:06:35 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u162S-00028p-2b;
	Sat, 05 Apr 2025 16:06:32 +0000
Date: Sun, 6 Apr 2025 00:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/fpsimd/fixes 13/14] arch/arm64/kernel/fpsimd.c:676:13:
 warning: 'sve_to_fpsimd' defined but not used
Message-ID: <202504052302.L11K7HZm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/fpsimd/fixes
head:   21b8328cb318dd14b51c1bb726b036a1f774b668
commit: 1f8c75e43d75fdd3300e6be91ed25e21f7fde6ba [13/14] arm64/fpsimd: signal: Always save+flush state early
config: arm64-randconfig-003-20250405 (https://download.01.org/0day-ci/archive/20250405/202504052302.L11K7HZm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504052302.L11K7HZm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504052302.L11K7HZm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/fpsimd.c:676:13: warning: 'sve_to_fpsimd' defined but not used [-Wunused-function]
    static void sve_to_fpsimd(struct task_struct *task)
                ^~~~~~~~~~~~~


vim +/sve_to_fpsimd +676 arch/arm64/kernel/fpsimd.c

bc0ee476036478 Dave Martin  2017-10-31  664  
8cd969d28fd284 Dave Martin  2017-10-31  665  /*
8cd969d28fd284 Dave Martin  2017-10-31  666   * Transfer the SVE state in task->thread.sve_state to
65896545b69ffa Dave Martin  2018-03-28  667   * task->thread.uw.fpsimd_state.
8cd969d28fd284 Dave Martin  2017-10-31  668   *
8cd969d28fd284 Dave Martin  2017-10-31  669   * Task can be a non-runnable task, or current.  In the latter case,
6dcdefcde413c1 Julien Grall 2019-05-21  670   * the caller must have ownership of the cpu FPSIMD context before calling
6dcdefcde413c1 Julien Grall 2019-05-21  671   * this function.
8cd969d28fd284 Dave Martin  2017-10-31  672   * task->thread.sve_state must point to at least sve_state_size(task)
8cd969d28fd284 Dave Martin  2017-10-31  673   * bytes of allocated kernel memory.
8cd969d28fd284 Dave Martin  2017-10-31  674   * task->thread.sve_state must be up to date before calling this function.
8cd969d28fd284 Dave Martin  2017-10-31  675   */
8cd969d28fd284 Dave Martin  2017-10-31 @676  static void sve_to_fpsimd(struct task_struct *task)
8cd969d28fd284 Dave Martin  2017-10-31  677  {
e12310a0d30f26 Mark Brown   2022-04-19  678  	unsigned int vq, vl;
8cd969d28fd284 Dave Martin  2017-10-31  679  	void const *sst = task->thread.sve_state;
65896545b69ffa Dave Martin  2018-03-28  680  	struct user_fpsimd_state *fst = &task->thread.uw.fpsimd_state;
8cd969d28fd284 Dave Martin  2017-10-31  681  	unsigned int i;
41040cf7c5f0f2 Dave Martin  2019-06-12  682  	__uint128_t const *p;
8cd969d28fd284 Dave Martin  2017-10-31  683  
507ea5dd92d23f Mark Brown   2023-08-03  684  	if (!system_supports_sve() && !system_supports_sme())
8cd969d28fd284 Dave Martin  2017-10-31  685  		return;
8cd969d28fd284 Dave Martin  2017-10-31  686  
e12310a0d30f26 Mark Brown   2022-04-19  687  	vl = thread_get_cur_vl(&task->thread);
e12310a0d30f26 Mark Brown   2022-04-19  688  	vq = sve_vq_from_vl(vl);
ed2f3e9ff637c7 Dave Martin  2019-06-12  689  	for (i = 0; i < SVE_NUM_ZREGS; ++i) {
41040cf7c5f0f2 Dave Martin  2019-06-12  690  		p = (__uint128_t const *)ZREG(sst, vq, i);
41040cf7c5f0f2 Dave Martin  2019-06-12  691  		fst->vregs[i] = arm64_le128_to_cpu(*p);
41040cf7c5f0f2 Dave Martin  2019-06-12  692  	}
8cd969d28fd284 Dave Martin  2017-10-31  693  }
8cd969d28fd284 Dave Martin  2017-10-31  694  

:::::: The code at line 676 was first introduced by commit
:::::: 8cd969d28fd2848dbfd86f6954dbd71f394f55f3 arm64/sve: Signal handling support

:::::: TO: Dave Martin <Dave.Martin@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
