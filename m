Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8C62F1FF1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 15:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765209230; cv=none; b=LjoBvQbKDCCd45TnTY9qpM8e+0aqk5AO45rbyDq/FCwV1d5RBKn9JpDxH7n818TKu2zmeq6S2MQGZUn6cS7b0tylFPTH8y3hUdbMhgkWuUgYKRaHwzbrD4uLQW7BQqQdUjnwZ11HRxmG5nap4ZZdZmrRo9RnjP4PVL0nrzm8xVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765209230; c=relaxed/simple;
	bh=wUA6OH8nOVD6Qj6IOOnCPikRZV40w9glP32GYFR6xmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m6AdRUrpLCUGSunpiK1gyqlZfORztHkv0wmWjEwRMEajg4db6WCCd0jJBCPlxP2fZGwsc94QBSJ5blASI1MOb7nQoRPzjfit3L4FYihfTKqdxkuPMEaYCHit2eEZD0hiN1cc08RyleW6OQZE4VKFM3/OM/ERvlEZyO/9PNQjSYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G22T4dMr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G22T4dMr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765209229; x=1796745229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wUA6OH8nOVD6Qj6IOOnCPikRZV40w9glP32GYFR6xmA=;
  b=G22T4dMr/M6Docg6WgRwcaU7+tDPfkpwHGETOed4xH7Rr9U67VzuULCi
   iBytekl/l6GrEbGoBauk6bnh0zL5QyPmrHjNS60hZZsoqNpUvi7TOb7qO
   PUo2otkxmL/kM3RHjbSG8s7FErodGeP0TV997DGrqhfE3srUAjwFE9OQi
   1ISdykhqnvZZxE3qWZK+btwYDEbUGZ6GCsg6mGTbJFaNYcuyX38vpaY1f
   xq5xA836fV0skLQ6u/pk+KLCQpIbdPd3G2H9MQraIFthKPGiSzqIdHqeB
   /LnhPDfKR8AeuDd7pEj8yK0ii0+qSOjuK64LXH6+/JIIua2chb1iVSFxR
   g==;
X-CSE-ConnectionGUID: PjXQjY1qT/ijnlWgkt9XSw==
X-CSE-MsgGUID: JF94v5aGQ9u1DXFeBDYXUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="70996958"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="70996958"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 07:53:48 -0800
X-CSE-ConnectionGUID: XlJSixi9RGKHO6/U/2ULTg==
X-CSE-MsgGUID: 3gmv6+xzS5Cf9zPwXaz9Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="219316214"
Received: from igk-lkp-server01.igk.intel.com (HELO a9286e139fc0) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 08 Dec 2025 07:53:46 -0800
Received: from kbuild by a9286e139fc0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSdYW-0000000008L-2mle;
	Mon, 08 Dec 2025 15:53:44 +0000
Date: Mon, 8 Dec 2025 16:53:17 +0100
From: kernel test robot <lkp@intel.com>
To: Mykyta Yatsenko <yatsenko@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 5492/8918] kernel/bpf/stream.c:384:70: warning:
 diagnostic behavior may be improved by adding the 'format(printf, 2, 0)'
 attribute to the declaration of 'bpf_stream_vprintk_impl'
Message-ID: <202512081633.Rs2j8sSs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mykyta,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82bcd04d124a4d84580ea4a8ba6b120db5f512e7
commit: 137cc92ffe2e71705fce112656a460d924934ebe [5492/8918] bpf: add _impl suffix for bpf_stream_vprintk() kfunc
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251208/202512081633.Rs2j8sSs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2222cfe7e11ff3e0434bc696856629199ef0da7c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081633.Rs2j8sSs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512081633.Rs2j8sSs-lkp@intel.com/

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
