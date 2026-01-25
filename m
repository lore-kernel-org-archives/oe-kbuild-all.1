Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1E21DE8B5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 15:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769353935; cv=none; b=I8QKAB+USUmqa0DuVchAVnvUl1T2+K1lNEmOrUyeaw1nKrYhVEpVTs83A1xF2bJKd8ezfxFsel4yHCnwz8J9eWzX61xHU+V+/i6WFWkkpZyIaR0WviJQBD2iEtz28MK71KJqI8OtY5TnGW1JwHxq2pPGLE6BopYKVoBm+IHoBA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769353935; c=relaxed/simple;
	bh=KbbgbxW8/c+SBr/x1r+V1BVCbdzPbqJREk5lxMbUszo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SzS6UjT5jBhANoGSCgDtcaESlqPLXUh16RoD3bTUoTEftiWFMztO6/Z8zOqZmHGVowEom9nohWXVsxKi87bIPgX+xYHuMrDBscwmrhejD7qrPXm9/PmFxg4UsG1S5V2200BeiKYjOB/cbLnbGd6pWahOWEiz4CFQ0mRaPtgbxwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F0RpXxG5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0RpXxG5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769353934; x=1800889934;
  h=date:from:to:cc:subject:message-id;
  bh=KbbgbxW8/c+SBr/x1r+V1BVCbdzPbqJREk5lxMbUszo=;
  b=F0RpXxG5Rnc85kDB8n6y0AsMUhFSS14kD5pPI/P21oWvUFRC3njEgKC9
   aUI7MvKHdwlwSCoUFP14+fY8RifZknEdXVETS9scStpwtRFxnT8z1Zo90
   XkVwHBmWOdWdz8BEwaxgKyjbfZxbkn7UHHbW1ZohOfJhhpyP97F39Qc/D
   2qTgE+A3/WPLyS79bvxrn5QrKo+/n6SDrZotyJZfEKuRf8Ez2JFVGl+kF
   q5AbWrnwLeyB+27bZf7/mpjZyQG72ZJA0YrCVCScpOxwck2XyyzE2T9kV
   nyyEOLnbQ21GTCW3SIEUY9qMaYe7Zvkp9AXXNlIqfvAl+Pd0gUKy1+Yao
   Q==;
X-CSE-ConnectionGUID: dVRWIgLhThu2hueaM5fcNg==
X-CSE-MsgGUID: 53rLDA6UTJiMcdp2eKTuoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="81916878"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="81916878"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 07:12:13 -0800
X-CSE-ConnectionGUID: WujKOezaQsmH7PGvPAU7LA==
X-CSE-MsgGUID: LpLW+SA7SV2aGp2YFA8UAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207527465"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 25 Jan 2026 07:12:10 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk1ma-000000001IB-0HiI;
	Sun, 25 Jan 2026 15:12:08 +0000
Date: Sun, 25 Jan 2026 16:11:59 +0100
From: kernel test robot <lkp@intel.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>
Subject: [linux-next:master 7747/9539] kernel/bpf/stream.c:240:70:
 warning: diagnostic behavior may be improved by adding the 'format(printf, 2,
 0)' attribute to the declaration of 'bpf_stream_vprintk'
Message-ID: <202601251630.4lFpAheQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
commit: d806f3101276a1ed18d963944580e1ee1c7a3d26 [7747/9539] bpf: Migrate bpf_stream_vprintk() to KF_IMPLICIT_ARGS
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260125/202601251630.4lFpAheQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251630.4lFpAheQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251630.4lFpAheQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/stream.c:240:70: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'bpf_stream_vprintk' [-Wmissing-format-attribute]
     215 |         ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt__str, data.bin_args);
         |                                                                             ^
   kernel/bpf/stream.c:215:17: note: 'bpf_stream_vprintk' declared here
     215 | __bpf_kfunc int bpf_stream_vprintk(int stream_id, const char *fmt__str, const void *args,
         |                 ^
   1 warning generated.


vim +240 kernel/bpf/stream.c

5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  210  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  211  /*
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  212   * Avoid using enum bpf_stream_id so that kfunc users don't have to pull in the
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  213   * enum in headers.
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  214   */
d806f3101276a1 Ihor Solodrai           2026-01-20  215  __bpf_kfunc int bpf_stream_vprintk(int stream_id, const char *fmt__str, const void *args,
d806f3101276a1 Ihor Solodrai           2026-01-20  216  				   u32 len__sz, struct bpf_prog_aux *aux)
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  217  {
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  218  	struct bpf_bprintf_data data = {
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  219  		.get_bin_args	= true,
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  220  		.get_buf	= true,
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  221  	};
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  222  	u32 fmt_size = strlen(fmt__str) + 1;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  223  	struct bpf_stream *stream;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  224  	u32 data_len = len__sz;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  225  	int ret, num_args;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  226  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  227  	stream = bpf_stream_get(stream_id, aux);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  228  	if (!stream)
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  229  		return -ENOENT;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  230  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  231  	if (data_len & 7 || data_len > MAX_BPRINTF_VARARGS * 8 ||
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  232  	    (data_len && !args))
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  233  		return -EINVAL;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  234  	num_args = data_len / 8;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  235  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  236  	ret = bpf_bprintf_prepare(fmt__str, fmt_size, args, num_args, &data);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  237  	if (ret < 0)
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  238  		return ret;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  239  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03 @240  	ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt__str, data.bin_args);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  241  	/* Exclude NULL byte during push. */
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  242  	ret = bpf_stream_push_str(stream, data.buf, ret);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  243  	bpf_bprintf_cleanup(&data);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  244  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  245  	return ret;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  246  }
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  247  

:::::: The code at line 240 was first introduced by commit
:::::: 5ab154f1463a111e1dc8fd5d31eaa7a2a71fe2e6 bpf: Introduce BPF standard streams

:::::: TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
