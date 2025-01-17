Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB1613541B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 19:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737141207; cv=none; b=TjIcO/tMPmAXwuLEligKW6ln/v2hJDm7riFsBmwOIGm+7uv/D3j+cq2phw9J7INf7JQRNr2To9uupfAGYfNjyZjOtd0AAS8hIX/qqwEV6rA6qlukHe+hhmpECfnTCF/O/Tmjl+Ofz3bP3XzvrHPIw+CQFe8T9gmPM2z1rqPFy9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737141207; c=relaxed/simple;
	bh=ddpyV1NvdnMYrzmcPOCMcnO+O64kPtUCLv8toSJpQE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cZeNw8+78YOEgpnEEZTjHTIAtkyVwwm4h4JIPoaFp07cAm0d2WQMFfBfTkbTYa8OW5Jny61A+Snwt6V+3AtmwHfmcwq9/R5FaPgRTjdDTXbc23IcI87WPdWvncfXFAMjXGerdMi6JjeUm7J4+8KxWWUJuh9zkLa0YfHcRM9EJOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIDBTmTr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIDBTmTr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737141206; x=1768677206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ddpyV1NvdnMYrzmcPOCMcnO+O64kPtUCLv8toSJpQE4=;
  b=FIDBTmTrWNWOnG3LJeTlN/T2bjSL0aEr4OVzaH85Ktmmd55KkwebU72S
   QgqTPPwgV9aeLhNLkeh/LomNsu4R3UwlxBfNkJIwASrSdeSFyBtC3OEzO
   vSjc2PImN2+oFuH+5l4cdBiWw09s1kR27Z/Pfw9aeDTm+Mlz7wgtuZ4eu
   2/yH5oI72BpIyWRkBfHBuIzZMSHqMM5myIuofDk0thzsWQ0CS70YjX+ZY
   0hkCqPKi0EU2xnStQZjOZW+UM5CtGDhbxcWU33nfGhvucIGMyyjuDYUPY
   AqsU8OTFXwB4FHRvLbkGzJ/W9IGupAqMSv1ZxS1XHLOVwDfbu109N2Z8P
   g==;
X-CSE-ConnectionGUID: 5Q77HGgZTY2biv6eVlVNeg==
X-CSE-MsgGUID: vRdzUGlMRXqNSPA1ceZSQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36861452"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="36861452"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 11:13:25 -0800
X-CSE-ConnectionGUID: 102OrQOXRcav8fL2z61iKg==
X-CSE-MsgGUID: Diyk5fI3SPayS1qtOaWHHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105722240"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Jan 2025 11:13:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYrmT-000Tax-03;
	Fri, 17 Jan 2025 19:13:21 +0000
Date: Sat, 18 Jan 2025 03:12:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1] kernel/trace/blktrace.c:348:12:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202501180359.p8CjtqlF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   bf5b85fe246873efa65a9dc0631ad70c59eece6c
commit: 6f9cff84dde800b4d9eab071810fbe284686601e [1/1] blktrace: Protect q->blk_trace with RCU
config: arm64-randconfig-r122-20250117 (https://download.01.org/0day-ci/archive/20250118/202501180359.p8CjtqlF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250118/202501180359.p8CjtqlF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180359.p8CjtqlF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/blktrace.c:348:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct blk_trace *bt @@     got struct blk_trace [noderef] __rcu *[assigned] __ret @@
   kernel/trace/blktrace.c:348:12: sparse:     expected struct blk_trace *bt
   kernel/trace/blktrace.c:348:12: sparse:     got struct blk_trace [noderef] __rcu *[assigned] __ret
   kernel/trace/blktrace.c:1002:50: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected int error @@     got restricted blk_status_t [usertype] bi_status @@
   kernel/trace/blktrace.c:1002:50: sparse:     expected int error
   kernel/trace/blktrace.c:1002:50: sparse:     got restricted blk_status_t [usertype] bi_status
   kernel/trace/blktrace.c:1040:68: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected int error @@     got restricted blk_status_t [usertype] bi_status @@
   kernel/trace/blktrace.c:1040:68: sparse:     expected int error
   kernel/trace/blktrace.c:1040:68: sparse:     got restricted blk_status_t [usertype] bi_status
   kernel/trace/blktrace.c:1263:16: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1263:16: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1263:16: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1263:16: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1263:16: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1263:16: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1263:16: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1263:16: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1263:16: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1263:16: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1270:32: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] sector_from @@     got restricted __be64 const [usertype] sector_from @@
   kernel/trace/blktrace.c:1270:32: sparse:     expected unsigned long long [usertype] sector_from
   kernel/trace/blktrace.c:1270:32: sparse:     got restricted __be64 const [usertype] sector_from
   kernel/trace/blktrace.c:1272:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] device_from @@     got unsigned int @@
   kernel/trace/blktrace.c:1272:24: sparse:     expected restricted __be32 [usertype] device_from
   kernel/trace/blktrace.c:1272:24: sparse:     got unsigned int
   kernel/trace/blktrace.c:1273:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] device_to @@     got unsigned int @@
   kernel/trace/blktrace.c:1273:24: sparse:     expected restricted __be32 [usertype] device_to
   kernel/trace/blktrace.c:1273:24: sparse:     got unsigned int
   kernel/trace/blktrace.c:1274:26: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1274:26: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1274:26: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1274:26: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1274:26: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1274:26: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1274:26: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1274:26: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1274:26: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1274:26: sparse: sparse: cast to restricted __be64
   kernel/trace/blktrace.c:1274:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be64 [usertype] sector_from @@     got unsigned long long @@
   kernel/trace/blktrace.c:1274:24: sparse:     expected restricted __be64 [usertype] sector_from
   kernel/trace/blktrace.c:1274:24: sparse:     got unsigned long long
   kernel/trace/blktrace.c:1407:26: sparse: sparse: restricted __be32 degrades to integer
   kernel/trace/blktrace.c:1407:48: sparse: sparse: restricted __be32 degrades to integer
   kernel/trace/blktrace.c:1408:27: sparse: sparse: cast from restricted __be64
   kernel/trace/blktrace.c:1632:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct blk_trace *bt @@     got struct blk_trace [noderef] __rcu *[assigned] __ret @@
   kernel/trace/blktrace.c:1632:12: sparse:     expected struct blk_trace *bt
   kernel/trace/blktrace.c:1632:12: sparse:     got struct blk_trace [noderef] __rcu *[assigned] __ret

vim +348 kernel/trace/blktrace.c

2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  343  
1f2cac107c591c2 kernel/trace/blktrace.c Jens Axboe 2017-11-05  344  static int __blk_trace_remove(struct request_queue *q)
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  345  {
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  346  	struct blk_trace *bt;
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  347  
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23 @348  	bt = xchg(&q->blk_trace, NULL);
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  349  	if (!bt)
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  350  		return -EINVAL;
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  351  
5554720482a6317 kernel/trace/blktrace.c Li Zefan   2009-03-25  352  	if (bt->trace_state != Blktrace_running)
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  353  		blk_trace_cleanup(bt);
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  354  
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  355  	return 0;
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  356  }
1f2cac107c591c2 kernel/trace/blktrace.c Jens Axboe 2017-11-05  357  

:::::: The code at line 348 was first introduced by commit
:::::: 2056a782f8e7e65fd4bfd027506b4ce1c5e9ccd4 [PATCH] Block queue IO tracing support (blktrace) as of 2006-03-23

:::::: TO: Jens Axboe <axboe@suse.de>
:::::: CC: Jens Axboe <axboe@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
