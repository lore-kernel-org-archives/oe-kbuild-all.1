Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB882E7635
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 18:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778263763; cv=none; b=gVvkiZT0Jii+u2LRx0WeV6/74iCoU/RrvU0dDQCL1fsgfKqNbj1uMR4xevFR61q4BA26Cj4Rk/CYlfprRGxANtNGcz26GqAFzDjOTbm+Vj0AZChXqMZFJQ0f5vCSrE45+StbpSJv6Fr8CIfZBQMggxIK65iuHRxgF8kk7sBeNL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778263763; c=relaxed/simple;
	bh=THdliJz3O5unUP0miu+FcNs8Z7t4TyHDVz70x6uDdk8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DXAWLwfG/+4FZrVa+kl68WQW9J9lAEzsKNnbeBiF9MKptPWQjRJkxNzG7gPAdW6BJMNI8uGn91X+QogKjLCLi7F06YS1W+p9m1kR4tJftiKGQZLmuIUGnpl/YYaD0fxY41GZxT5SbCUy6fjDSEH/78xkvFdHsZ17N+Q9cdk/hCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZO1vBJk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZO1vBJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778263762; x=1809799762;
  h=date:from:to:cc:subject:message-id;
  bh=THdliJz3O5unUP0miu+FcNs8Z7t4TyHDVz70x6uDdk8=;
  b=RZO1vBJkT8L+s9P2BqqpyCrNHbqOlA6fMEpZPVQij9rt9h2d8+wvMvvW
   xF6B1/WKnv0OVRAx5hk5Lk43I/iu5u93C0AL7Lr6JZalhnQyVFGuoRqg/
   Tg+VUltC9G2mROScND4idImtFoNeR22mMF9QOVTEU+YPNRp3V9JwAvwNE
   TtYp4nzWPYcW/GLV9bCV/un5vfsbjYr8ulaHh89FS/hQ+4YXXJpFg3V9T
   zjjI5PMAPvmBgqUk8+z2ufQgi9H1nNKKzfFMkjpaS5clbKF8bb0wyepVq
   xUJdC0C2gk2d3ci+2AoPp04gSqHKiu9okaG2cgzZFdVPGPwTbb5AJc8Ht
   A==;
X-CSE-ConnectionGUID: aJvxawrQSxy0GvjS1mfSvA==
X-CSE-MsgGUID: r+lGrM0sTzCk86BdlKW8ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79345400"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="79345400"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 11:09:21 -0700
X-CSE-ConnectionGUID: MN6iFIetQNup/9RSvLtR2A==
X-CSE-MsgGUID: vatQCG/8RMmqtTxdA50pPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="232318536"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2026 11:09:20 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLPdW-000000000L7-24bJ;
	Fri, 08 May 2026 18:09:18 +0000
Date: Sat, 09 May 2026 02:08:23 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:configfs-ns 1/9]
 drivers/nvme/target/bpf_ops.c:25:16: error: implicit declaration of function
 'bpf_tracing_btf_ctx_access'
Message-ID: <202605090205.CEh9SC9R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git configfs-ns
head:   509cbb083b05db0f02a3ceea68bb093f8725a6a5
commit: 94040dcdf8d7b146f62dfb3e0156d93a9713880d [1/9] nvmet-bpf: eBPF struct_ops support for log pages
config: loongarch-randconfig-001-20260509 (https://download.01.org/0day-ci/archive/20260509/202605090205.CEh9SC9R-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090205.CEh9SC9R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605090205.CEh9SC9R-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/target/bpf_ops.c: In function 'nvmet_bpf_ops_is_valid_access':
>> drivers/nvme/target/bpf_ops.c:25:16: error: implicit declaration of function 'bpf_tracing_btf_ctx_access' [-Wimplicit-function-declaration]
      25 |         return bpf_tracing_btf_ctx_access(off, size, type, prog, info);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bpf_verifier.h:7,
                    from drivers/nvme/target/bpf_ops.c:4:
   drivers/nvme/target/bpf_ops.c: In function 'nvmet_bpf_struct_ops_init':
   include/linux/bpf.h:2142:50: warning: statement with no effect [-Wunused-value]
    2142 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/nvme/target/bpf_ops.c:309:15: note: in expansion of macro 'register_bpf_struct_ops'
     309 |         ret = register_bpf_struct_ops(&bpf_nvmet_bpf_ops, nvmet_bpf_ops);
         |               ^~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_tracing_btf_ctx_access +25 drivers/nvme/target/bpf_ops.c

    19	
    20	static bool nvmet_bpf_ops_is_valid_access(int off, int size,
    21						  enum bpf_access_type type,
    22						  const struct bpf_prog *prog,
    23						  struct bpf_insn_access_aux *info)
    24	{
  > 25		return bpf_tracing_btf_ctx_access(off, size, type, prog, info);
    26	}
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
