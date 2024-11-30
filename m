Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AAE1A0BFF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 16:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732983086; cv=none; b=k1VOK5ll8ZToRZpjVXGva9mq36tjIJ/eBWT6rj5Y9srIDHFKtjCMHMIX7vtcZedtRdQdcjzmjkx4UOSaUSwvDxVbudHFBMThMrmC+MoYrw3fWuAhd53LIre638GaJJKKUsM/5h8I8RUdRAQuK3g5Up3tIB6XiSA4hA6NYLClqUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732983086; c=relaxed/simple;
	bh=+g2EDYAU42gL4FZ8G+k82ZDOVly5+JNxBL7rRsPg8Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZAWIQ/kjyZDw5R5qIQzK/+mIVth3/bGfuXviia1QXLvwgSKd2K8Ze7K0oVS4LRC6MLnZCyc8Tb1OLMXRn6KR6DeoPplG2yVxU0Hyf66dyrvXWuG5RnVLkQxIm0uib+eqRpXfC51/gk/eHkmIwzZ7tPD0qob0AI60AtX2SuCNGkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZtEfe21u; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZtEfe21u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732983085; x=1764519085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+g2EDYAU42gL4FZ8G+k82ZDOVly5+JNxBL7rRsPg8Vg=;
  b=ZtEfe21us1rBxBGjt5zJcKxLOixBQyAJEkz64p0F0b4uG0OrSZUxF6rG
   nh4aOJeVQyuzskw3T7D+WTz8yT+a2/OiJwcSVfHOTUQfwQfO4teLRAOvI
   42kPKHvu8In8TNOsJfR3BOIhoB25/3mm57puI4Zk+d7M63Fiv5JSFv3ro
   C9ZAFwOXLHT4QXPzheuBonhwYiJxcxyp0o12Db3oSiVxpu3febFVSnoFr
   Qs9fg0O9xS+/tnyhVY3ftnIDdXj08GXsbxR//mDOv/fQc2C9ydS3NB7uU
   VhbRXh9jO3BC9Pk/C4WGoNkVuJWD/oeTjv1PK82IZ5wFaldRgMZnYH57A
   w==;
X-CSE-ConnectionGUID: dII7WMgzSLK56DSmh23n9g==
X-CSE-MsgGUID: lNnoJ8XQS9KxruBtvruGuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33429814"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="33429814"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 08:11:24 -0800
X-CSE-ConnectionGUID: ssLgHDJ+TCe4sqkw/8HMNg==
X-CSE-MsgGUID: FpBCr8smQRyo3I+AO+h6Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="92590853"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Nov 2024 08:11:22 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHQ40-0000nL-1Q;
	Sat, 30 Nov 2024 16:11:20 +0000
Date: Sun, 1 Dec 2024 00:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 12/24] fs/fuse/backing.c:142:16:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202412010018.CHZHDyUc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   d66e9166bfa175691dd2d0ad7f65c9fec54aa520
commit: 8b16bb6b6f0a233c0b1717efdaf7a959ba4f5b71 [12/24] ANDROID: fuse-bpf: fuse-bpf v1.2
config: arm64-randconfig-r123-20241117 (https://download.01.org/0day-ci/archive/20241201/202412010018.CHZHDyUc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241201/202412010018.CHZHDyUc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010018.CHZHDyUc-lkp@intel.com/

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
