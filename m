Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D53356758
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 05:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785995187; cv=none; b=jF5A7GDYvcg5d0laCs65/LnU1zn76aSjx8LgQ2L7bdYjWkjCYkKNdPMbsDj79w7eGpn2ay6VbmClLrRPhDaf09hz3U275G6l2F0/DVnaaS92l9gQwQLvRp6CN2LiDBGzc7QI2IDMmD17w5r3g+b82tw5fZKeLgFHVKXYUVA0w1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785995187; c=relaxed/simple;
	bh=n79xyjESpiwYNS/7JYnVWfWSbvR4qe1Ep1uf5lnbYWQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gMuBJCH1JEdkv3B09/B6Lpywb+imtvZjCsXUB0SSvZYUlyPKkOTfV+fvrrw0R+5Vqd+xudUgwY89JtN+tWmy4BLk1ZxrBvuIOsjvqw6tPViy6DO6JUXODy/Sg8XfJ6o0Md97imF86ruxJFb++v7taIN/pTVL9Q19IRmQnE8VgA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsv4YcUm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsv4YcUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785995184; x=1817531184;
  h=date:from:to:cc:subject:message-id;
  bh=n79xyjESpiwYNS/7JYnVWfWSbvR4qe1Ep1uf5lnbYWQ=;
  b=jsv4YcUmPS7cL+lhFTAmyxACABiwrhJi/73yjg8qFqQLryxt6QWj9T1f
   n4zBS444m/5vGW3dLlZx4XGclWrKliHvM1YWcjrPUZlnfvYV1xtkoZmQL
   2Tw42x2H8o1RFeHXYrUphFuojFgxPVpnMtd0SdQaequuiocZClgtCQbIe
   d8jJfytpZu3vTOKYJa0nTaiyTBLxPUasCUbPmyLQO2WPtNFxdOFuRRAcL
   plca1XmQb9vaLVeFQjhPTOxLQfgm8QA4fsqUcz3IqJ7Vz6XL8QU+3o3X9
   WKHLL0VkMtprI/3yTbfsWN3QIkZDapdn9GOYmhV2nypjNh12UbZP9PdRp
   Q==;
X-CSE-ConnectionGUID: aNntQfaSTFq9WZnAWI5YBA==
X-CSE-MsgGUID: vt9qbe3YRZOeDeJRbhE75A==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="96929592"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="96929592"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 22:46:23 -0700
X-CSE-ConnectionGUID: UsmMyaaISKC7wT8BjpjPcw==
X-CSE-MsgGUID: nvlJEFwoR8mpbxpPpQ8jrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="265489266"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Aug 2026 22:46:22 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrqvr-00000000EI1-30NE;
	Thu, 06 Aug 2026 05:46:19 +0000
Date: Thu, 06 Aug 2026 13:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-04 3/3]
 kernel/bpf/stream.c:384:70: warning: diagnostic behavior may be improved by
 adding the 'format(printf, 2, 0)' attribute to the declaration of
 'bpf_stream_vprintk_impl'
Message-ID: <202608061351.tzxE2VWP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mykyta,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-04
head:   0f03843d0cc5d3b140f7c5dca46a946a00a5c92c
commit: 137cc92ffe2e71705fce112656a460d924934ebe [3/3] bpf: add _impl suffix for bpf_stream_vprintk() kfunc
config: x86_64-randconfig-013-20260806 (https://download.01.org/0day-ci/archive/20260806/202608061351.tzxE2VWP-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061351.tzxE2VWP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 137cc92ffe2e ("bpf: add _impl suffix for bpf_stream_vprintk() kfunc")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608061351.tzxE2VWP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/stream.c:384:70: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'bpf_stream_vprintk_impl' [-Wmissing-format-attribute]
     358 |         ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt__str, data.bin_args);
         |                                                                             ^
   kernel/bpf/stream.c:358:17: note: 'bpf_stream_vprintk_impl' declared here
     358 | __bpf_kfunc int bpf_stream_vprintk_impl(int stream_id, const char *fmt__str, const void *args,
         |                 ^
   1 warning generated.


vim +384 kernel/bpf/stream.c

5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  353  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  354  /*
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  355   * Avoid using enum bpf_stream_id so that kfunc users don't have to pull in the
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  356   * enum in headers.
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  357   */
137cc92ffe2e71 Mykyta Yatsenko         2025-11-04  358  __bpf_kfunc int bpf_stream_vprintk_impl(int stream_id, const char *fmt__str, const void *args,
137cc92ffe2e71 Mykyta Yatsenko         2025-11-04  359  					u32 len__sz, void *aux__prog)
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  360  {
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  361  	struct bpf_bprintf_data data = {
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  362  		.get_bin_args	= true,
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  363  		.get_buf	= true,
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  364  	};
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  365  	struct bpf_prog_aux *aux = aux__prog;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  366  	u32 fmt_size = strlen(fmt__str) + 1;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  367  	struct bpf_stream *stream;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  368  	u32 data_len = len__sz;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  369  	int ret, num_args;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  370  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  371  	stream = bpf_stream_get(stream_id, aux);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  372  	if (!stream)
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  373  		return -ENOENT;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  374  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  375  	if (data_len & 7 || data_len > MAX_BPRINTF_VARARGS * 8 ||
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  376  	    (data_len && !args))
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  377  		return -EINVAL;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  378  	num_args = data_len / 8;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  379  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  380  	ret = bpf_bprintf_prepare(fmt__str, fmt_size, args, num_args, &data);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  381  	if (ret < 0)
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  382  		return ret;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  383  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03 @384  	ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt__str, data.bin_args);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  385  	/* Exclude NULL byte during push. */
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  386  	ret = bpf_stream_push_str(stream, data.buf, ret);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  387  	bpf_bprintf_cleanup(&data);
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  388  
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  389  	return ret;
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  390  }
5ab154f1463a11 Kumar Kartikeya Dwivedi 2025-07-03  391  

:::::: The code at line 384 was first introduced by commit
:::::: 5ab154f1463a111e1dc8fd5d31eaa7a2a71fe2e6 bpf: Introduce BPF standard streams

:::::: TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
