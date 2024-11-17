Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8101DAC9F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 21:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731879820; cv=none; b=tT9E9AEhsk0mIzuSYOWcZgqvPy0is82g0TH3kAONQbFcnre8PVC03njSyt22QCpoHIrxly1Slhc543VklokwmYJbTTWHOHDr+8EW4bc9yzB0cUY+CzRvj/LQbsdB3Ij1RhKGmtplN2dpZlpxN7AAjiLdscGc/SbC6624UTJuPOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731879820; c=relaxed/simple;
	bh=q/D9glVJMcqGiwQ5IzaxYlPSyfU+BvkJx902abMpwXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bVM7Ax/ytSMoxXQEEePEQgP1T6Xou6paKaCisgonL5iXiJX5N7jz9f7/IEGLEgSu5pkvdM0gq4W3brHt6ADT4htumHioLP9JLqexdGw/BMTXyWfVVftN+T1FPCWQFi8wZ0I6PFeLY4hKXxbtXEeoKNmIBIsOoCTqyl3fDbguOn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyJZnPzc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyJZnPzc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731879818; x=1763415818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q/D9glVJMcqGiwQ5IzaxYlPSyfU+BvkJx902abMpwXw=;
  b=iyJZnPzcxZMqZIeISCLPfjPOC24i6I9u5d+ZztX3upjwLy5tbzAq7ab+
   MgUzrbG3MUj8PxTfT9+bpyujZs9mWJMjgfETFCegVlq5EI1bd2qiN6yvA
   YqP5+nJ5ZLyMO6VzLTf1x0yIRKVxdheB5l28pp98iLV4Quh3KEBws3ErB
   DBSpm01xkW32iappTnnj1LVpKSA6aP1mDv89Cw3rUbGf0uMT5OPpLV0Ps
   MvOtqlVDe99ntD6IT3Bja5mkqhoAWD/9n8O0fLm+a6uQD8ddSjVoLRymP
   KfcLbGD7ICIj2tXRI2zwgo9cAtdXusnEzk1VqwHwgLLXDuFQNtfL94DxS
   w==;
X-CSE-ConnectionGUID: y7z1YehYQtK3ykAXZm8zUA==
X-CSE-MsgGUID: 0r2tN11hTwe5QUVqCqYtBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31924219"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="31924219"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 13:43:38 -0800
X-CSE-ConnectionGUID: +2QQbP7aROWeAQZGV/g85g==
X-CSE-MsgGUID: bZwZKQh1SB2g9d94guaLHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="89460090"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2024 13:43:36 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCn3O-00023F-0H;
	Sun, 17 Nov 2024 21:43:34 +0000
Date: Mon, 18 Nov 2024 05:42:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 12/24] fs/fuse/backing.c:142:16:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202411180558.fKKzMrKB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ecfafb63c0299870c3ebd29da329583f1215bd4c
commit: 8b16bb6b6f0a233c0b1717efdaf7a959ba4f5b71 [12/24] ANDROID: fuse-bpf: fuse-bpf v1.2
config: arm64-randconfig-r123-20241117 (https://download.01.org/0day-ci/archive/20241118/202411180558.fKKzMrKB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241118/202411180558.fKKzMrKB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180558.fKKzMrKB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/backing.c:142:16: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c:300:16: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c: note: in included file (through arch/arm64/include/asm/smp.h, include/linux/smp.h, arch/arm64/include/asm/arch_timer.h, ...):
   arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
   arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
   arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
   arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
   fs/fuse/backing.c: note: in included file (through arch/arm64/include/asm/elf.h, include/linux/elf.h, include/linux/module.h, ...):
   include/linux/fs.h:3273:20: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __kernel_rwf_t @@     got int @@
   include/linux/fs.h:3273:20: sparse:     expected restricted __kernel_rwf_t
   include/linux/fs.h:3273:20: sparse:     got int
   include/linux/fs.h:3273:20: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __kernel_rwf_t @@     got int @@
   include/linux/fs.h:3273:20: sparse:     expected restricted __kernel_rwf_t
   include/linux/fs.h:3273:20: sparse:     got int
   fs/fuse/backing.c: note: in included file (through arch/arm64/include/asm/smp.h, include/linux/smp.h, arch/arm64/include/asm/arch_timer.h, ...):
   arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
   arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
   arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
   arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> fs/fuse/backing.c:2078:18: sparse: sparse: Initializer entry defined twice
   fs/fuse/backing.c:2079:18: sparse:   also defined here

vim +142 fs/fuse/backing.c

   131	
   132	void *fuse_open_finalize(struct fuse_bpf_args *fa,
   133			       struct inode *inode, struct file *file, bool isdir)
   134	{
   135		struct fuse_file *ff = file->private_data;
   136		struct fuse_open_out *foo = fa->out_args[0].value;
   137	
   138		if (ff) {
   139			ff->fh = foo->fh;
   140			ff->nodeid = get_fuse_inode(inode)->nodeid;
   141		}
 > 142		return 0;
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
