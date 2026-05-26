Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7E333C52E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779793767; cv=none; b=XnR/jvZ1S5dccp/wQ/UUMwzAVm65YLSMJ0ONv9YOL8Xu/17+/T/Qj8Y5X7Jd3bUYTcJ/y8vBq2K/5YVqTCv6ZXs2TXDpv4E4yqyD7oIPNAiOTw3/LRxTivqloQk27KNRp3erSiURdF685+puW3xc+LznqrATrMQkpbi+0rLeQNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779793767; c=relaxed/simple;
	bh=j6TaUlC47OXbpMCjOfshx9gNR7CDpXVn+dCplzoGksU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MyEXTQ6noAj7NM4N86rDsqRjIOCn6hdkSlkHj4l1mf4eNPxAmvywEMIHnXZcj6TFPWqTtOtSRXBx9WVftskCxrt+DJnLpiNcXJoqJT3yMR8XZD6aATQBy9vyditTOcFUvHoDlU9fgY+fJki5xkXa7l+S0QyBke2ZQBnBmY0QyCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYUqJbEL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYUqJbEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779793766; x=1811329766;
  h=date:from:to:cc:subject:message-id;
  bh=j6TaUlC47OXbpMCjOfshx9gNR7CDpXVn+dCplzoGksU=;
  b=TYUqJbELnJwmZVMaqjHIIr5XBWChLvlGWZdM5zOJHyPOFFJ2spXq9d1H
   TSUio/CwMiCI0xbAj/qkBtLmBcGLakhWJwamP+QLgypxLV17aQQNys7Ch
   SLsy4euKyKwZQKSi60QaMIZGG6xFHjPgacg2nDtVYu4QRth3zerE6z5iK
   2pM+LiUt6+5Cn8t8Gp526Ei2IzbYj+6c3bf05X6NY0yb+QyTGCTFUYfeW
   8BWjN4Ws0cTVUPQ5dnnuQ4cgYDCt8CPHk9DKbp/Rrp18Fa6q1vgUsE8x5
   UsFqu2tblF34dU4yq9bAqfizUnfWLRcPVXI+nFN7M0kBUxiGo1AzCg06P
   g==;
X-CSE-ConnectionGUID: 0jtuEvmFR4as51E+zyidPw==
X-CSE-MsgGUID: tj1QUZtXR2u3kDZdLqpe2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80574754"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80574754"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 04:09:26 -0700
X-CSE-ConnectionGUID: SfsgtmxsQuuA6poDKte/yQ==
X-CSE-MsgGUID: Cs5DHp9LSbisCOChnIF25A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="280012457"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 May 2026 04:09:24 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRpez-000000002OU-3zJb;
	Tue, 26 May 2026 11:09:21 +0000
Date: Tue, 26 May 2026 19:09:21 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [song:fanotify-bpf 4/5]
 fs/notify/fanotify/fanotify_filter.c:342:9: error: call to undeclared
 function 'bpf_tracing_btf_ctx_access'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202605261921.UDqzzmIf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/song/linux.git fanotify-bpf
head:   c24199c92d3bc59bd852c1315daa67a33b94bc74
commit: d436c8b935658bf3a6ef99e30168532268d2847a [4/5] fanotify: Add BPF kfuncs and struct_ops for fanotify filter
config: i386-randconfig-r071-20260526 (https://download.01.org/0day-ci/archive/20260526/202605261921.UDqzzmIf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261921.UDqzzmIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261921.UDqzzmIf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/notify/fanotify/fanotify_filter.c:342:9: error: call to undeclared function 'bpf_tracing_btf_ctx_access'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     342 |         return bpf_tracing_btf_ctx_access(off, size, type, prog, info);
         |                ^
   1 error generated.


vim +/bpf_tracing_btf_ctx_access +342 fs/notify/fanotify/fanotify_filter.c

   336	
   337	static bool bpf_fanotify_filter_is_valid_access(int off, int size,
   338							enum bpf_access_type type,
   339							const struct bpf_prog *prog,
   340							struct bpf_insn_access_aux *info)
   341	{
 > 342		return bpf_tracing_btf_ctx_access(off, size, type, prog, info);
   343	}
   344	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
