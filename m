Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F3010F1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 01:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716601586; cv=none; b=RN1d1wJ0WtXXudUvhXdbXkoOmxnGDwqfU9r1FbDpguRj0QxbI255B4Ob/oda7Ysb+sniYt0f2yAEa1N+zX3HKUpY5JjGi/dOD23ubZ2GZUwgtoGNhpyna764FilU6ACFAM08eUB6UUKuBkleE+19xlk9Dl0SMX1o/OZtg7Tj/NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716601586; c=relaxed/simple;
	bh=vsDoex8Gvus+B9CGCwimKeFeciZvU2d0U21ZTc8wnIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FC0cInvEuv2a4j4fzwjUOExzV4gRdJ7jqSwHsqHQhI/nZvNMKx+GPdylvhRrBA2Q5Q/64Ijv5Hdt/mmLR1lTErvK1rB2wyM9VynzymAs7vJ3FEE85foDUI/WQIuYUsYdbOSXIRGT+DSF70GioIqgpPRPPlroLNDU8Rcuas/C17c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+tDpDpG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+tDpDpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716601584; x=1748137584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vsDoex8Gvus+B9CGCwimKeFeciZvU2d0U21ZTc8wnIc=;
  b=Q+tDpDpGbLS94VjQOpbTjtUZySRpTnTLvH0pLAhrkil1hBPh9dQWrcrv
   tpXO9CM/eEIdQV1Pcl4JHh2Jbw38TEs4L+MK3FJzXgccrmlerikMuOvS6
   JlYZ+bOEIMvY1w1Ahl6gZBc3D0V5mD9uRIUBd6DDmIm9SwXPMInUyhwzD
   gqbJS4f5NpdkNNN+CxADZ4u0puVzuHVxZemjlU1xY1u5mmbybHz1AQ+VC
   /PEu1xO6uwwf4+eQGyz1dAMK4N7CeAWRXqg+coUUwNifOArNZTK3jVi0B
   ND5wfqS0hmZJQtDnIQD6QnR7KVqIwDuE8izHn8ye1KRYLHsgdg8EbB9fd
   w==;
X-CSE-ConnectionGUID: m+N3B9soSEi/ERbEpowG6g==
X-CSE-MsgGUID: ajVNhHZKQCCcbBh6ErEuaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="30509864"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="30509864"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 18:46:18 -0700
X-CSE-ConnectionGUID: bnepzXa9S+aqz4U1brhIaQ==
X-CSE-MsgGUID: dcS5noeuSdywT5bLonzyug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="39175032"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 May 2024 18:46:17 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAgUB-0006K3-0e;
	Sat, 25 May 2024 01:46:15 +0000
Date: Sat, 25 May 2024 09:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 2/2] fs/kpatch-macros.h:54:11: fatal error:
 kpatch.h: No such file or directory
Message-ID: <202405250910.MEZEIATv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   745009dc796e56fc87e911138d801679ecd3576e
commit: 745009dc796e56fc87e911138d801679ecd3576e [2/2] test
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240525/202405250910.MEZEIATv-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250910.MEZEIATv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250910.MEZEIATv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/aio.c:54:
>> fs/kpatch-macros.h:54:11: fatal error: kpatch.h: No such file or directory
      54 | # include "kpatch.h"
         |           ^~~~~~~~~~
   compilation terminated.
--
   kernel/fork.c: In function 'kernel_clone':
>> kernel/fork.c:2815:18: error: implicit declaration of function 'klp_shadow_get_or_alloc' [-Werror=implicit-function-declaration]
    2815 |         newpid = klp_shadow_get_or_alloc(p, 0, sizeof(*newpid), GFP_KERNEL,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/fork.c:2815:16: warning: assignment to 'int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2815 |         newpid = klp_shadow_get_or_alloc(p, 0, sizeof(*newpid), GFP_KERNEL,
         |                ^
   cc1: some warnings being treated as errors
--
   kernel/exit.c: In function 'do_exit':
>> kernel/exit.c:882:9: error: implicit declaration of function 'klp_shadow_free' [-Werror=implicit-function-declaration]
     882 |         klp_shadow_free(tsk, 0, NULL);
         |         ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from kernel/kpatch-syscall.h:4,
                    from kernel/sys.c:1307:
>> kernel/kpatch-macros.h:54:11: fatal error: kpatch.h: No such file or directory
      54 | # include "kpatch.h"
         |           ^~~~~~~~~~
   compilation terminated.
--
>> drivers/tty/n_tty.c:2350: warning: expecting prototype for n_tty_write(). Prototype was for kpatch_n_tty_write() instead
--
   fs/proc/array.c: In function 'task_context_switch_counts':
>> fs/proc/array.c:408:18: error: implicit declaration of function 'klp_shadow_get' [-Werror=implicit-function-declaration]
     408 |         newpid = klp_shadow_get(p, 0);
         |                  ^~~~~~~~~~~~~~
>> fs/proc/array.c:408:16: warning: assignment to 'int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     408 |         newpid = klp_shadow_get(p, 0);
         |                ^
   cc1: some warnings being treated as errors


vim +54 fs/kpatch-macros.h

8603978b6c309a Josh Poimboeuf 2024-03-23  49  
8603978b6c309a Josh Poimboeuf 2024-03-23  50  #ifdef HAS_LIVEPATCH_CALLBACKS
8603978b6c309a Josh Poimboeuf 2024-03-23  51  # include <linux/livepatch.h>
8603978b6c309a Josh Poimboeuf 2024-03-23  52  typedef struct klp_object patch_object;
8603978b6c309a Josh Poimboeuf 2024-03-23  53  #else
8603978b6c309a Josh Poimboeuf 2024-03-23 @54  # include "kpatch.h"
8603978b6c309a Josh Poimboeuf 2024-03-23  55  typedef struct kpatch_object patch_object;
8603978b6c309a Josh Poimboeuf 2024-03-23  56  #endif /* HAS_LIVEPATCH_CALLBACKS */
8603978b6c309a Josh Poimboeuf 2024-03-23  57  

:::::: The code at line 54 was first introduced by commit
:::::: 8603978b6c309a0184ea26eb1cc822f889ec4654 todo

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
