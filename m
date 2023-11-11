Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC057371
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 00:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fp/s24Ly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699660994; x=1731196994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/eAenwcVFM3YhoSmYfJZIknCRdZuEbUJP5/5Lzm9+/0=;
  b=Fp/s24LyrG+uJsqzPsvz792gjEx5D9Swuy3K4xxLFZaBBXgzWxdachaO
   jshk+UGZVyQ+5rcrzfRCw3vSmDcch1/M+Ply+QKWwrpfmtO6goPWPZzQT
   EekNpP9LlyysiZY3oFPQ3RlZl0IqycNAe82Slj7c3PcKagVE0QZtxSk6O
   kaD6UaMcoHmRiubcP0fL3XH0/u19Wzdf9lwpZyAYPJ8hgkhb5WuV7vMrm
   R7FmaRC0cJFYrnooaLzJxdCyJjGbZRriZYVL8WiF3WaA+4kt2JdlRWc4T
   DLBSjkUy/uNn/SjFAPhzoNI/lsse1TfABSYb/l6F/1s9dtzmwhuYhM5z5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="421339235"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="421339235"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 16:03:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="937281572"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="937281572"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Nov 2023 16:03:12 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1bSw-000A40-0c;
	Sat, 11 Nov 2023 00:03:10 +0000
Date: Sat, 11 Nov 2023 08:02:28 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 9/10] kernel/unwind/user.c:40:30: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202311110749.UZ5JGPyC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   ec004e900e02c9c85cf8c89d4c26d4168a6c5d18
commit: 09460e60dd1c2f8ea1abb8d9188195db699ce76f [9/10] unwind: Introduce SFrame user space unwinding
config: x86_64-randconfig-121-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110749.UZ5JGPyC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110749.UZ5JGPyC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110749.UZ5JGPyC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/unwind/user.c:40:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned long * @@
   kernel/unwind/user.c:40:30: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/user.c:40:30: sparse:     got unsigned long *
   kernel/unwind/user.c:43:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned long * @@
   kernel/unwind/user.c:43:30: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/user.c:43:30: sparse:     got unsigned long *

vim +40 kernel/unwind/user.c

bd5cff471e67cf Josh Poimboeuf 2023-11-07  14  
bd5cff471e67cf Josh Poimboeuf 2023-11-07  15  int user_unwind_next(struct user_unwind_state *state)
bd5cff471e67cf Josh Poimboeuf 2023-11-07  16  {
bd5cff471e67cf Josh Poimboeuf 2023-11-07  17  	struct user_unwind_frame _frame;
bd5cff471e67cf Josh Poimboeuf 2023-11-07  18  	struct user_unwind_frame *frame = &_frame;
bd5cff471e67cf Josh Poimboeuf 2023-11-07  19  	unsigned long cfa, fp, ra;
bd5cff471e67cf Josh Poimboeuf 2023-11-07  20  	int ret = -EINVAL;
bd5cff471e67cf Josh Poimboeuf 2023-11-07  21  
bd5cff471e67cf Josh Poimboeuf 2023-11-07  22  	if (state->done)
bd5cff471e67cf Josh Poimboeuf 2023-11-07  23  		return -EINVAL;
bd5cff471e67cf Josh Poimboeuf 2023-11-07  24  
bd5cff471e67cf Josh Poimboeuf 2023-11-07  25  	switch (state->type) {
bd5cff471e67cf Josh Poimboeuf 2023-11-07  26  	case USER_UNWIND_TYPE_FP:
bd5cff471e67cf Josh Poimboeuf 2023-11-07  27  		frame = &fp_frame;
bd5cff471e67cf Josh Poimboeuf 2023-11-07  28  		break;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  29  	case USER_UNWIND_TYPE_SFRAME:
09460e60dd1c2f Josh Poimboeuf 2023-11-08  30  		ret = sframe_find(state->ip, frame);
09460e60dd1c2f Josh Poimboeuf 2023-11-08  31  		if (ret)
09460e60dd1c2f Josh Poimboeuf 2023-11-08  32  			goto the_end;
09460e60dd1c2f Josh Poimboeuf 2023-11-08  33  		break;
bd5cff471e67cf Josh Poimboeuf 2023-11-07  34  	default:
bd5cff471e67cf Josh Poimboeuf 2023-11-07  35  		BUG();
bd5cff471e67cf Josh Poimboeuf 2023-11-07  36  	}
bd5cff471e67cf Josh Poimboeuf 2023-11-07  37  
bd5cff471e67cf Josh Poimboeuf 2023-11-07  38  	cfa = (frame->use_fp ? state->fp : state->sp) + frame->cfa_off;
bd5cff471e67cf Josh Poimboeuf 2023-11-07  39  
bd5cff471e67cf Josh Poimboeuf 2023-11-07 @40  	if (frame->ra_off && get_user(ra, (unsigned long *)(cfa + frame->ra_off)))
bd5cff471e67cf Josh Poimboeuf 2023-11-07  41  		goto the_end;
bd5cff471e67cf Josh Poimboeuf 2023-11-07  42  
bd5cff471e67cf Josh Poimboeuf 2023-11-07  43  	if (frame->fp_off && get_user(fp, (unsigned long *)(cfa + frame->fp_off)))
bd5cff471e67cf Josh Poimboeuf 2023-11-07  44  		goto the_end;
bd5cff471e67cf Josh Poimboeuf 2023-11-07  45  
bd5cff471e67cf Josh Poimboeuf 2023-11-07  46  	state->sp = cfa;
bd5cff471e67cf Josh Poimboeuf 2023-11-07  47  	state->ip = ra;
bd5cff471e67cf Josh Poimboeuf 2023-11-07  48  	if (frame->fp_off)
bd5cff471e67cf Josh Poimboeuf 2023-11-07  49  		state->fp = fp;
bd5cff471e67cf Josh Poimboeuf 2023-11-07  50  
bd5cff471e67cf Josh Poimboeuf 2023-11-07  51  	return 0;
bd5cff471e67cf Josh Poimboeuf 2023-11-07  52  
bd5cff471e67cf Josh Poimboeuf 2023-11-07  53  the_end:
bd5cff471e67cf Josh Poimboeuf 2023-11-07  54  	state->done = true;
bd5cff471e67cf Josh Poimboeuf 2023-11-07  55  	return ret;
bd5cff471e67cf Josh Poimboeuf 2023-11-07  56  }
bd5cff471e67cf Josh Poimboeuf 2023-11-07  57  

:::::: The code at line 40 was first introduced by commit
:::::: bd5cff471e67cf8d2b2d3bd8db35007ccc86f6a4 unwind: Introduce generic user space unwinding interfaces

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
