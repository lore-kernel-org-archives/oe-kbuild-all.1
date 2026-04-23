Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453701ACEDF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Apr 2026 00:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776903626; cv=none; b=HHogoxrhXhlY2iLkgv72aEAakQARfIt6UfJN4YKn9sMeXqoGk1dUoVxhrHoj9n7LOO7vABqCchm0UW82w2jR8U29BmRO3EDKuKRH6sjzyJhXGzu3C8SlLqKczFAs7CKJBhjVlGosSS7ulZ90HtyOYIbsvc0wrw0OP6wkYtx0/rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776903626; c=relaxed/simple;
	bh=xHqMhij4yyFpZqrwNhtABEfliI5SPKy8sR2D3or7Nvw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h0LvzS+2xH/+c0FbGl2HTVaGk4/+F6ohL9RjulP3VxPiG7pFCvcPrABQkqhNCaEbXGtdCsHIC0ta0UlcAwSJ+13SGQw3G+UpIgKRa38OehF8dIBoM5nVuy+RfmtQiPpPmlaqFb7CfJyy7Nhhcrslv6PIo1dgyewJS87ge/ZCkO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bVAygRUz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bVAygRUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776903625; x=1808439625;
  h=date:from:to:cc:subject:message-id;
  bh=xHqMhij4yyFpZqrwNhtABEfliI5SPKy8sR2D3or7Nvw=;
  b=bVAygRUza4575WUZLVefTweY6st6Lgplikq9OGUAo97WBsq4UqBTXceJ
   /IdBClkX4CXzi0tr74CAioR69wHcYrjSl9E+GITbOzVvW9bLli/zSCyhH
   IZNn+DsGIr2c515Y0602R+oOXmMtuhjJ4ZNBz7G1J24kkKpWe0YEKNeMH
   Ef3gjY53PXPeYCBrP5zJO1zOrDKW9jSKAAQvVoWnzmC4CT6hoeJLDA5ji
   um10/OjSZnA7Y07E6LVtkZIgS8tX2J3EcnBjIU88mdD4xiil++8R6NE0F
   JUi5IPzspulwZMixshC7WlM1eVedng4sH9DT4SxwytTLpuPHGF+e+tufk
   A==;
X-CSE-ConnectionGUID: XQiN0IXkQsCNmcGBtazutw==
X-CSE-MsgGUID: Aa9yOne8QayYYAllimj14g==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77781176"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="77781176"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 17:20:24 -0700
X-CSE-ConnectionGUID: +ehnQeHcRZmNvPqE6AUiKQ==
X-CSE-MsgGUID: dHle4nSuQ1y3AwZAz9WvjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="236861796"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Apr 2026 17:20:22 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFhnn-000000001ED-3Tf7;
	Thu, 23 Apr 2026 00:20:19 +0000
Date: Thu, 23 Apr 2026 08:20:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 kernel/bpf/stream.c:384:70: warning: diagnostic behavior may be improved by
 adding the 'format(printf, 2, 0)' attribute to the declaration of
 'bpf_stream_vprintk_impl'
Message-ID: <202604230831.vIPGQrir-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mykyta,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   d847e03df243cdbc643c9f57cb5b0712286d5a39
commit: 137cc92ffe2e71705fce112656a460d924934ebe [1/1] bpf: add _impl suffix for bpf_stream_vprintk() kfunc
config: arm64-randconfig-001-20260422 (https://download.01.org/0day-ci/archive/20260423/202604230831.vIPGQrir-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604230831.vIPGQrir-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 137cc92ffe2e ("bpf: add _impl suffix for bpf_stream_vprintk() kfunc")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604230831.vIPGQrir-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/stream.c:384:70: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'bpf_stream_vprintk_impl' [-Wmissing-format-attribute]
     358 |         ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt__str, data.bin_args);
         |                                                                             ^
   kernel/bpf/stream.c:358:17: note: 'bpf_stream_vprintk_impl' declared here
     358 | __bpf_kfunc int bpf_stream_vprintk_impl(int stream_id, const char *fmt__str, const void *args,
         |                 ^
   1 warning generated.


vim +384 kernel/bpf/stream.c

5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  353  
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  354  /*
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  355   * Avoid using enum bpf_stream_id so that kfunc users don't have to pull in the
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  356   * enum in headers.
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  357   */
137cc92ffe2e717 Mykyta Yatsenko         2025-11-04  358  __bpf_kfunc int bpf_stream_vprintk_impl(int stream_id, const char *fmt__str, const void *args,
137cc92ffe2e717 Mykyta Yatsenko         2025-11-04  359  					u32 len__sz, void *aux__prog)
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  360  {
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  361  	struct bpf_bprintf_data data = {
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  362  		.get_bin_args	= true,
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  363  		.get_buf	= true,
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  364  	};
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  365  	struct bpf_prog_aux *aux = aux__prog;
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  366  	u32 fmt_size = strlen(fmt__str) + 1;
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  367  	struct bpf_stream *stream;
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  368  	u32 data_len = len__sz;
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  369  	int ret, num_args;
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  370  
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  371  	stream = bpf_stream_get(stream_id, aux);
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  372  	if (!stream)
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  373  		return -ENOENT;
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  374  
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  375  	if (data_len & 7 || data_len > MAX_BPRINTF_VARARGS * 8 ||
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  376  	    (data_len && !args))
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  377  		return -EINVAL;
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  378  	num_args = data_len / 8;
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  379  
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  380  	ret = bpf_bprintf_prepare(fmt__str, fmt_size, args, num_args, &data);
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  381  	if (ret < 0)
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  382  		return ret;
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  383  
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03 @384  	ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt__str, data.bin_args);
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  385  	/* Exclude NULL byte during push. */
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  386  	ret = bpf_stream_push_str(stream, data.buf, ret);
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  387  	bpf_bprintf_cleanup(&data);
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  388  
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  389  	return ret;
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  390  }
5ab154f1463a111 Kumar Kartikeya Dwivedi 2025-07-03  391  

:::::: The code at line 384 was first introduced by commit
:::::: 5ab154f1463a111e1dc8fd5d31eaa7a2a71fe2e6 bpf: Introduce BPF standard streams

:::::: TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
