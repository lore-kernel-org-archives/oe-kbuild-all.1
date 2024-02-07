Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F2520308
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Feb 2024 23:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707347721; cv=none; b=QSk3Mw2vvxqdEM0KvUVje2iw4afwkmiYbJPscgren+4LfTp+EpN5JqFoi3bbemv4r1RF2g7yjs+Inh68C3uKrAW9nXMYiu7l3J1ofyfR3851iV29kKSuYGODzraoPc180cJZViz7Y0SP2ULZjgke0cf4S/ISCweTRV6uumW2epU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707347721; c=relaxed/simple;
	bh=37kvymAl2a0vztjBgxyT3wvcC6NyoffOOBrP+Zfackc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l9u2LD7nswH2iutyEc/yKd3wvAhjeFHA5ae7WJcz8xfUc+NqFECt+DINdapILmE0pLnbkRE5ZXURwWR8aIIzgcrCw1aGVWrXLsBdbCoMGF0v+Lai/bjwXLKdG2nwFSt3TGauXAItLiv4LA8NRCIWvjY5iXlTLhuCsk7beie3h14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VP9Prw40; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VP9Prw40"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707347718; x=1738883718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=37kvymAl2a0vztjBgxyT3wvcC6NyoffOOBrP+Zfackc=;
  b=VP9Prw40CyCIMQkw5LCIsygCfugx6jflJmsftXBUK36m6bJLGxtawC3n
   YT39XStfFksTCx+YFaAyzHilLORMjD0p0yruoHGXiBgLxiGQHs+lZgdLj
   EbBVglsknGtwDZ/F/nP5gG7n9OmSQzhxk67A4WiC+3G3/Xyl9ju3BUBTs
   7qFD1WijC7r3+F2IKDCstPYRDbAqqTSnvXALwlZzYu1H4ZYURowg7YlKn
   eMI7o5pJ9OxAzdt3IhcrNcueAF8lWBn5rCKBUfQ8KPNi0Gv28ztCvRhrL
   X2flX3IagxMzEg1eEq8+a/6boKCK4c24okbPPHkUseyFs5MIlEwhlrePr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="4087704"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="4087704"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 15:15:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1844585"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Feb 2024 15:15:16 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXr8M-00037c-0r;
	Wed, 07 Feb 2024 23:15:14 +0000
Date: Thu, 8 Feb 2024 07:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4602/4898] io_uring/filetable.h:66:35: sparse:
 sparse: restricted io_req_flags degrades to integer
Message-ID: <202402080739.XJoiFBMo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2ae0a045e6814c8c1d676d6153c605a65746aa29
commit: 4767a6c0a8092dd225b8177a6cf731b1787f2f72 [4602/4898] io_uring: expand main struct io_kiocb flags to 64-bits
config: x86_64-randconfig-121-20240207 (https://download.01.org/0day-ci/archive/20240208/202402080739.XJoiFBMo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402080739.XJoiFBMo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402080739.XJoiFBMo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/filetable.c: note: in included file (through io_uring/io_uring.h):
   include/linux/io_uring_types.h:341:48: sparse: sparse: array of flexible structures
   io_uring/filetable.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   io_uring/filetable.c: note: in included file (through io_uring/io_uring.h):
>> io_uring/filetable.h:66:35: sparse: sparse: restricted io_req_flags degrades to integer
--
   io_uring/rsrc.c: note: in included file (through io_uring/io_uring.h):
   include/linux/io_uring_types.h:341:48: sparse: sparse: array of flexible structures
   io_uring/rsrc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   io_uring/rsrc.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   io_uring/rsrc.c: note: in included file (through io_uring/io_uring.h):
>> io_uring/filetable.h:66:35: sparse: sparse: restricted io_req_flags degrades to integer
   io_uring/rsrc.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   io_uring/rsrc.c: note: in included file (through io_uring/io_uring.h):
>> io_uring/filetable.h:66:35: sparse: sparse: restricted io_req_flags degrades to integer
--
   io_uring/io_uring.c: note: in included file (through include/linux/io_uring/cmd.h):
   include/linux/io_uring_types.h:341:48: sparse: sparse: array of flexible structures
   io_uring/io_uring.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/io_uring.h):
>> include/trace/events/io_uring.h:140:1: sparse: sparse: cast from restricted io_req_flags
   include/trace/events/io_uring.h:370:1: sparse: sparse: cast from restricted io_req_flags
   io_uring/io_uring.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/io_uring.h):
>> include/trace/events/io_uring.h:140:1: sparse: sparse: cast to restricted io_req_flags
>> include/trace/events/io_uring.h:140:1: sparse: sparse: restricted io_req_flags degrades to integer
>> include/trace/events/io_uring.h:140:1: sparse: sparse: restricted io_req_flags degrades to integer
   include/trace/events/io_uring.h:370:1: sparse: sparse: cast to restricted io_req_flags
   include/trace/events/io_uring.h:370:1: sparse: sparse: restricted io_req_flags degrades to integer
   include/trace/events/io_uring.h:370:1: sparse: sparse: restricted io_req_flags degrades to integer
   io_uring/io_uring.c: note: in included file (through include/linux/io_uring/cmd.h):
   include/linux/io_uring_types.h:182:37: sparse: sparse: array of flexible structures
>> io_uring/io_uring.c:2175:23: sparse: sparse: cast to restricted io_req_flags
   io_uring/io_uring.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   io_uring/io_uring.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   io_uring/io_uring.c:656:36: sparse: sparse: context imbalance in 'io_fill_cqe_req_aux' - unexpected unlock
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   io_uring/io_uring.c:658:17: sparse: sparse: context imbalance in '__io_submit_flush_completions' - different lock contexts for basic block
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +66 io_uring/filetable.h

4bfb0c9af832a1 Christoph Hellwig 2023-06-20  61  
a4ad4f748ea962 Jens Axboe        2022-05-25  62  static inline void io_fixed_file_set(struct io_fixed_file *file_slot,
a4ad4f748ea962 Jens Axboe        2022-05-25  63  				     struct file *file)
a4ad4f748ea962 Jens Axboe        2022-05-25  64  {
8487f083c6ff6e Christoph Hellwig 2023-06-20  65  	file_slot->file_ptr = (unsigned long)file |
8487f083c6ff6e Christoph Hellwig 2023-06-20 @66  		(io_file_get_flags(file) >> REQ_F_SUPPORT_NOWAIT_BIT);
a4ad4f748ea962 Jens Axboe        2022-05-25  67  }
a4ad4f748ea962 Jens Axboe        2022-05-25  68  

:::::: The code at line 66 was first introduced by commit
:::::: 8487f083c6ff6e02b2ec14f22ef2b0079a1b6425 io_uring: return REQ_F_ flags from io_file_get_flags

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
