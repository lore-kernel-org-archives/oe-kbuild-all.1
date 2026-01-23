Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34163A95E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 19:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769196592; cv=none; b=AfgcPGvwA2n1fBs3omxWQxx013gRNGkoCEPYGiDyFj2FfM6jfXBHca1QzBBoUzzgbUrZ6BJT2GPt3B9KWSUqZU2D9z6h5K5DCwj2srx8OHNgkLwhYRPBG22G7kPjYeXM0xcG3KTyevNYCMUD3jgZyjcutiAHDVjdIiwmkX8bEIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769196592; c=relaxed/simple;
	bh=K94WOfYge5JWzrXDK2t8RcxfnaxLHaIxi+SS4VAgBf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liMF6a/CTD+nKHSHt6FgqHO5vLat/JvyBcgHwpZ4cNYep513FSojRKL/w26ReN7zMe16VYvHgFuSDjCapI0lqLUbfTq5y/FruJf2bpGy72+XHCJYZq2q2jQNJtT3m5TAD+nYd3brdZ9aQCp7amOXZ0b/J4b+PAN6AzETYDeRZO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFe4uKWo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFe4uKWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769196590; x=1800732590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K94WOfYge5JWzrXDK2t8RcxfnaxLHaIxi+SS4VAgBf4=;
  b=EFe4uKWoELW4SloGStqrj/6YqO3lNVFHhEC8gWcgvKjvSRtUcs6qxL+O
   RlICaUMZHs0i8OzEK7lmUlegMoiRU32b+fJIxQQ+A2yKlyHzc3yhYQGZU
   s0cEwGB01yfrMOyINOOEC2ArqAIu8USS5NE1DtYr1Mot0yyTuWhhww79w
   wiyuT9HP3wBY3E5jclCk0719RPgqdaptdZn1yukLEX+vKkkHhMctHaaVY
   FlvqmFOxsjmlGX5Vmyet68FVImDfWrJ8EM2L+gd8hFW8+/jzMmprWPZ3U
   CexQ1XLydB3DBqdHexANoMacJPEd6TekG8P4CUcWE8rJVVkpDMR75dtRv
   Q==;
X-CSE-ConnectionGUID: Jx9GaW9/TEi4hKVvvo5cIg==
X-CSE-MsgGUID: pJr16OJLRVG+8BZvT2BrYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81171685"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="81171685"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 11:29:49 -0800
X-CSE-ConnectionGUID: 52e24O9ARRCiTtNdtiWCAQ==
X-CSE-MsgGUID: c9TlESt0Ro6R+YYY8kjh9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="207143122"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 23 Jan 2026 11:29:49 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjMqn-000000000nx-3dI4;
	Fri, 23 Jan 2026 19:29:45 +0000
Date: Fri, 23 Jan 2026 20:29:14 +0100
From: kernel test robot <lkp@intel.com>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next v3 05/12] libbpf: introduce
 bpf_map__attach_struct_ops_opts()
Message-ID: <202601232044.Xc3szUBv-lkp@intel.com>
References: <03bf6aafe30def690c63e454d76e733f27dff4b3.1769157382.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03bf6aafe30def690c63e454d76e733f27dff4b3.1769157382.git.zhuhui@kylinos.cn>

Hi Hui,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]
[cannot apply to akpm-mm/mm-everything bpf-next/net bpf/master linus/master v6.16-rc1 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Zhu/bpf-move-bpf_struct_ops_link-into-bpf-h/20260123-170445
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/03bf6aafe30def690c63e454d76e733f27dff4b3.1769157382.git.zhuhui%40kylinos.cn
patch subject: [RFC PATCH bpf-next v3 05/12] libbpf: introduce bpf_map__attach_struct_ops_opts()
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260123/202601232044.Xc3szUBv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601232044.Xc3szUBv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601232044.Xc3szUBv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Num of global symbols in tools/testing/selftests/hid/tools/build/libbpf/sharedobjs/libbpf-in.o (357) does NOT match with num of versioned symbols in tools/testing/selftests/hid/tools/build/libbpf/libbpf.so libbpf.map (356). Please make sure all LIBBPF_API symbols are versioned in libbpf.map.
   make[3]: *** [Makefile:179: check_abi] Error 1
   make[3]: Target 'all_cmd' not remade because of errors.
--
>> Warning: Num of global symbols in tools/testing/selftests/net/tools/build/libbpf/sharedobjs/libbpf-in.o (357) does NOT match with num of versioned symbols in tools/testing/selftests/net/tools/build/libbpf/libbpf.so libbpf.map (356). Please make sure all LIBBPF_API symbols are versioned in libbpf.map.
   make[3]: *** [Makefile:179: check_abi] Error 1
   make[3]: Target 'all_cmd' not remade because of errors.
--
>> Warning: Num of global symbols in tools/testing/selftests/net/lib/tools/build/libbpf/sharedobjs/libbpf-in.o (357) does NOT match with num of versioned symbols in tools/testing/selftests/net/lib/tools/build/libbpf/libbpf.so libbpf.map (356). Please make sure all LIBBPF_API symbols are versioned in libbpf.map.
   make[3]: *** [Makefile:179: check_abi] Error 1
   make[3]: Target 'all_cmd' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
