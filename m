Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0232634D4C9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 11:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794429; cv=none; b=INpw+7ntolrSCXgU3J3w6idqDSpvxETnflYwWDPQ2DIe5ZpvXszHU6ufMSN7NSCFaBWxzC+eS/0ucW/RDm9SuR7wLkxyz8BUeYz+2MBtBd/H89FjPEmnmNZK7v+n/KRBfaBed+URkSb576IDzgbV4yEAH6XVwe2moc5TWNyD7fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794429; c=relaxed/simple;
	bh=x/0j6pcxfMi05j6KwzhOu1llduikcp0+IlyLgqaDTjU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c7iVXkP1JWFF2bUPymtamcVTy9XhH25WjR4miIjuanUEMRZ1Q56onMO9y+rWRujJwLPdDIbK2IX4BWTwUzo7AsY1YFAal1gayTDPzdMhd4TahcZDnN+yWmiWeqcSvlkB+JNF8JCTspfFXlUZquc2Y+vfZrT8u7btSlveFZ6cN/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSJPYpqK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSJPYpqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779794427; x=1811330427;
  h=date:from:to:cc:subject:message-id;
  bh=x/0j6pcxfMi05j6KwzhOu1llduikcp0+IlyLgqaDTjU=;
  b=FSJPYpqKJvqs/7mTwITFDy8ZTP0g1NonxVx3MgVIWiv50KwNwYojF4BJ
   +X0MqztgKjquptL6PwOReLTTP1ZMcRiDvU0/53Is32GmIPrlcl63vgH8L
   KrwkX1eZJ+nqbJwPfkdlmJ3oqzrwfYEsUFff9YCy27kJuj/rZa8JLoHcN
   LfL//f6adBzXNzWJ0/t6LeRzh61DdBlu4iWiyNKyE14u7bMlA0Sdi3UbW
   ddv5YnPYFFcytQKXA9tbJxSNu0R9Z/4R3klJA8UgSvXe5lBZNIeYwbL4C
   Wi4w8YvSlRLYCrcMu3+HhZXFad99AzLYsHK6ZTqv0RfZawv7EtDCD/7Za
   Q==;
X-CSE-ConnectionGUID: dJ9KUT7ESlmugfRDUePbpw==
X-CSE-MsgGUID: SzecoCgHRxKJZnyl2Qp3+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80661611"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80661611"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 04:20:26 -0700
X-CSE-ConnectionGUID: nDcWmHirRKuVVhzzv0FNyw==
X-CSE-MsgGUID: 9O6jBv4UTGqa6ydficyjEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="241953611"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 May 2026 04:20:25 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRppe-000000002Ou-1Jqt;
	Tue, 26 May 2026 11:20:22 +0000
Date: Tue, 26 May 2026 19:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [song:fanotify-bpf 4/5]
 fs/notify/fanotify/fanotify_filter.c:342:9: error: implicit declaration of
 function 'bpf_tracing_btf_ctx_access'; did you mean
 'bpf_sock_convert_ctx_access'?
Message-ID: <202605261920.3JYUJ4wY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/song/linux.git fanotify-bpf
head:   c24199c92d3bc59bd852c1315daa67a33b94bc74
commit: d436c8b935658bf3a6ef99e30168532268d2847a [4/5] fanotify: Add BPF kfuncs and struct_ops for fanotify filter
config: arm64-randconfig-002-20260526 (https://download.01.org/0day-ci/archive/20260526/202605261920.3JYUJ4wY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261920.3JYUJ4wY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261920.3JYUJ4wY-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/notify/fanotify/fanotify_filter.c: In function 'bpf_fanotify_filter_is_valid_access':
>> fs/notify/fanotify/fanotify_filter.c:342:9: error: implicit declaration of function 'bpf_tracing_btf_ctx_access'; did you mean 'bpf_sock_convert_ctx_access'? [-Werror=implicit-function-declaration]
     return bpf_tracing_btf_ctx_access(off, size, type, prog, info);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
            bpf_sock_convert_ctx_access
   In file included from fs/notify/fanotify/fanotify_filter.c:2:
   fs/notify/fanotify/fanotify_filter.c: In function 'bpf_fanotify_filter_struct_ops_init':
   include/linux/bpf.h:2148:50: warning: statement with no effect [-Wunused-value]
    #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
                                                     ^~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_filter.c:439:15: note: in expansion of macro 'register_bpf_struct_ops'
     ret = ret ?: register_bpf_struct_ops(&bpf_fanotify_filter_struct_ops,
                  ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +342 fs/notify/fanotify/fanotify_filter.c

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
