Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106789;
	b=Tg/Amgh2Zxy8O+dQCJ6HWVEDIg2fkpZqG9RzaaVAGEisoZvnwyxF37UdljL55PBD74VA
	 QtNB6eIEJEsgsooZO52T5awckhO9bHG7XytQYkKelqmB5CwMK559TYcZa1dIUceqZ+a1d
	 pkIkAZbtHkrq6AiIrwVEYAootUn55/I6ZNECeeBVnnN62XRi25tTuSAdLm8sMAsPDV5wH
	 6XEoZZFft96L9E3ayj/oj9PU0yv0h83am4+51BohB0ZV+4LVLAw92gDWafixEK/gyRPEG
	 pTnpug6WTWUvOdc3Xy12rKkMGhaIFriiIeUGHZZIl7ljKdhi8Pkvuf1EnPBO8r3j22w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106789;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=IFr15BBvhsQrBN+W1Mwja4liENDqFJEdx/wSWPsfPv4=;
	b=K0O+uQWkieSmRgg/GJ0qfE3pCygZUXuhD+1iBKq+TWACjO2ZTu1/ORVrt/VneVaKDean
	 hwj+qKrMDNAnaBSI4imY0+2UoPlb/qEpbCOyZ0MHUgbPSqWCY+HYPuJREw/w+jGsoCeR8
	 NopbOnpv3fUOVGnK2UI21tdpQuQajIPoMXRVG7pPKMqBwf/ctwtzHUo2UxGaB4cWMQnBY
	 f8MjpCCyP0Y1+BQk0FPUQ6aZQwy/s4OZW3A4dBm/WeIm+OvxIeC+T8cO0iKZMT+C4lmhs
	 vo0bGOssKhVUuD3D79VQ98muflei6NaEupGXeHS1DwJvYHhxjT85sEiQpTP4CdtMOVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=amgC73TV;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777F1606A31E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 13:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 777F1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=amgC73TV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793106788; x=1824642788;
  h=date:from:to:cc:subject:message-id;
  bh=sLgBbjgCE2Avr4fikO1NGOmHixgNSCk9ypL7hGE0Sm8=;
  b=amgC73TVwqINyg4Um9bXivywLYXj1RZUK5hi/IOwibBFHuenuAt3yceS
   tFRQ90U/fcdE03s8JEAaU9olVYTP26kOKwHxsgSctsDy/X97ejDthJ4Rz
   3rMELhVFIupynNURdSYmvWIrQ6nV0rVye3DETWD3n6uzsab8h8V+La70i
   /6jXgkmh4tjwsxemYLswfgXKWmo0+Hm/RJ+KnEjJHVYD2S130DccrZtA7
   NOIzM5IAJCzr6RT7gzFlLdIcTnxg5QsmsuJ/ph2LRN6L0nz+Io19rhpr4
   jJoyTJaGiGD5vrsQQlF8crEfujbaOvMuvyYMoKQF3vLToj69WVNc8c8sf
   g==;
X-CSE-ConnectionGUID: r3J9ZB/ZS2ivDmTj91mL/Q==
X-CSE-MsgGUID: Ddc+N4DXRI+Bv0j1TZelcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1813093"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1813093"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 06:13:07 -0700
X-CSE-ConnectionGUID: mOxc63vlSayDkJDLtgPCkA==
X-CSE-MsgGUID: t4SUCknWRuanxBCRzc8lLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6299858"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 27 Oct 2026 06:13:06 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLgzA-000000004WB-1bPM;
	Tue, 27 Oct 2026 13:13:04 +0000
Date: Tue, 27 Oct 2026 14:12:48 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-10 1/1]
 io_uring/io_uring.c:3149:24: sparse: sparse: incorrect type in return
 expression (different address spaces)
Message-ID: <202610271405.HrXPbwhj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.10-2026-10
head:   a4c2f82969bc5fa7fcc21ede4b690ece7ff72335
commit: 76050cdc5c3427bc117501314d31f15a2635d50b [1/1] UPSTREAM: io_uring: import 5.15-stable io_uring
config: arm64-randconfig-r2309-20261018 (https://download.01.org/0day-ci/archive/20261027/202610271405.HrXPbwhj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271405.HrXPbwhj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271405.HrXPbwhj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> io_uring/io_uring.c:3149:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __user * @@     got struct io_buffer *[assigned] kbuf @@
   io_uring/io_uring.c:3149:24: sparse:     expected void [noderef] __user *
   io_uring/io_uring.c:3149:24: sparse:     got struct io_buffer *[assigned] kbuf
>> io_uring/io_uring.c:4547:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   io_uring/io_uring.c:4547:14: sparse:     expected struct file *file
   io_uring/io_uring.c:4547:14: sparse:     got struct file [noderef] __rcu *
>> io_uring/io_uring.c:5343:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] result @@     got restricted __poll_t @@
   io_uring/io_uring.c:5343:37: sparse:     expected unsigned int [usertype] result
   io_uring/io_uring.c:5343:37: sparse:     got restricted __poll_t
>> io_uring/io_uring.c:5348:71: sparse: sparse: restricted __poll_t degrades to integer
>> io_uring/io_uring.c:5348:65: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/io_uring.c:5348:65: sparse:     expected restricted __poll_t [usertype] val
   io_uring/io_uring.c:5348:65: sparse:     got unsigned int
>> io_uring/io_uring.c:5348:52: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got unsigned short @@
   io_uring/io_uring.c:5348:52: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/io_uring.c:5348:52: sparse:     got unsigned short
>> io_uring/io_uring.c:5352:71: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [usertype] mask @@
   io_uring/io_uring.c:5352:71: sparse:     expected signed int [usertype] res
   io_uring/io_uring.c:5352:71: sparse:     got restricted __poll_t [usertype] mask
   io_uring/io_uring.c:5386:66: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/io_uring.c:5386:55: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/io_uring.c:5386:55: sparse:     expected restricted __poll_t [usertype] val
   io_uring/io_uring.c:5386:55: sparse:     got unsigned int
>> io_uring/io_uring.c:5481:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [usertype] mask @@
   io_uring/io_uring.c:5481:40: sparse:     expected int mask
   io_uring/io_uring.c:5481:40: sparse:     got restricted __poll_t [usertype] mask
>> io_uring/io_uring.c:5564:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/io_uring.c:5564:24: sparse:     expected int
   io_uring/io_uring.c:5564:24: sparse:     got restricted __poll_t [assigned] [usertype] mask
>> io_uring/io_uring.c:5583:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/io_uring.c:5583:40: sparse:     expected int mask
   io_uring/io_uring.c:5583:40: sparse:     got restricted __poll_t [assigned] [usertype] mask
   io_uring/io_uring.c:5617:25: sparse: sparse: restricted __poll_t degrades to integer
>> io_uring/io_uring.c:5617:48: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got unsigned int @@
   io_uring/io_uring.c:5617:48: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/io_uring.c:5617:48: sparse:     got unsigned int
   io_uring/io_uring.c:5628:22: sparse: sparse: invalid assignment: |=
   io_uring/io_uring.c:5628:22: sparse:    left side has type restricted __poll_t
   io_uring/io_uring.c:5628:22: sparse:    right side has type int
   io_uring/io_uring.c:5633:30: sparse: sparse: invalid assignment: &=
   io_uring/io_uring.c:5633:30: sparse:    left side has type restricted __poll_t
   io_uring/io_uring.c:5633:30: sparse:    right side has type int
   io_uring/io_uring.c:5635:22: sparse: sparse: invalid assignment: |=
   io_uring/io_uring.c:5635:22: sparse:    left side has type restricted __poll_t
   io_uring/io_uring.c:5635:22: sparse:    right side has type int
   io_uring/io_uring.c:5651:33: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected int mask @@     got restricted __poll_t [usertype] mask @@
   io_uring/io_uring.c:5651:33: sparse:     expected int mask
   io_uring/io_uring.c:5651:33: sparse:     got restricted __poll_t [usertype] mask
>> io_uring/io_uring.c:5651:50: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected int events @@     got restricted __poll_t [usertype] events @@
   io_uring/io_uring.c:5651:50: sparse:     expected int events
   io_uring/io_uring.c:5651:50: sparse:     got restricted __poll_t [usertype] events
   io_uring/io_uring.c:5733:24: sparse: sparse: invalid assignment: |=
   io_uring/io_uring.c:5733:24: sparse:    left side has type unsigned int
   io_uring/io_uring.c:5733:24: sparse:    right side has type restricted __poll_t
   io_uring/io_uring.c:5734:65: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/io_uring.c:5734:29: sparse: sparse: restricted __poll_t degrades to integer
>> io_uring/io_uring.c:5734:38: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got unsigned int @@
   io_uring/io_uring.c:5734:38: sparse:     expected restricted __poll_t
   io_uring/io_uring.c:5734:38: sparse:     got unsigned int
   io_uring/io_uring.c:5823:43: sparse: sparse: invalid assignment: &=
   io_uring/io_uring.c:5823:43: sparse:    left side has type restricted __poll_t
   io_uring/io_uring.c:5823:43: sparse:    right side has type int
   io_uring/io_uring.c:5824:62: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/io_uring.c:5824:43: sparse: sparse: invalid assignment: |=
   io_uring/io_uring.c:5824:43: sparse:    left side has type restricted __poll_t
   io_uring/io_uring.c:5824:43: sparse:    right side has type unsigned int
   io_uring/io_uring.c: note: in included file (through include/linux/irqflags.h, include/linux/spinlock.h, include/linux/wait.h, include/linux/wait_bit.h, ...):
   arch/arm64/include/asm/percpu.h:126:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
   arch/arm64/include/asm/percpu.h:126:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
   arch/arm64/include/asm/percpu.h:126:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
   arch/arm64/include/asm/percpu.h:126:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
   io_uring/io_uring.c:7811:9: sparse: sparse: context imbalance in 'io_sq_thread_unpark' - wrong count at exit
   io_uring/io_uring.c:7822:9: sparse: sparse: context imbalance in 'io_sq_thread_park' - wrong count at exit

vim +3149 io_uring/io_uring.c

bcda7baaa3f15c fs/io_uring.c Jens Axboe       2020-02-23  3138  
4d954c258a0c36 fs/io_uring.c Jens Axboe       2020-02-27  3139  static void __user *io_rw_buffer_select(struct io_kiocb *req, size_t *len,
4d954c258a0c36 fs/io_uring.c Jens Axboe       2020-02-27  3140  					bool needs_lock)
4d954c258a0c36 fs/io_uring.c Jens Axboe       2020-02-27  3141  {
4d954c258a0c36 fs/io_uring.c Jens Axboe       2020-02-27  3142  	struct io_buffer *kbuf;
4f4eeba87cc731 fs/io_uring.c Bijan Mottahedeh 2020-05-19  3143  	u16 bgid;
4d954c258a0c36 fs/io_uring.c Jens Axboe       2020-02-27  3144  
4d954c258a0c36 fs/io_uring.c Jens Axboe       2020-02-27  3145  	kbuf = (struct io_buffer *) (unsigned long) req->rw.addr;
4f4eeba87cc731 fs/io_uring.c Bijan Mottahedeh 2020-05-19  3146  	bgid = req->buf_index;
4d954c258a0c36 fs/io_uring.c Jens Axboe       2020-02-27  3147  	kbuf = io_buffer_select(req, len, bgid, kbuf, needs_lock);
4d954c258a0c36 fs/io_uring.c Jens Axboe       2020-02-27  3148  	if (IS_ERR(kbuf))
4d954c258a0c36 fs/io_uring.c Jens Axboe       2020-02-27 @3149  		return kbuf;
4d954c258a0c36 fs/io_uring.c Jens Axboe       2020-02-27  3150  	req->rw.addr = (u64) (unsigned long) kbuf;
4d954c258a0c36 fs/io_uring.c Jens Axboe       2020-02-27  3151  	req->flags |= REQ_F_BUFFER_SELECTED;
4d954c258a0c36 fs/io_uring.c Jens Axboe       2020-02-27  3152  	return u64_to_user_ptr(kbuf->addr);
4d954c258a0c36 fs/io_uring.c Jens Axboe       2020-02-27  3153  }
4d954c258a0c36 fs/io_uring.c Jens Axboe       2020-02-27  3154  

:::::: The code at line 3149 was first introduced by commit
:::::: 4d954c258a0c365a85a2d1b1cccf63aec38fca4c io_uring: add IOSQE_BUFFER_SELECT support for IORING_OP_READV

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
