Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92762D481F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 04:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765945082; cv=none; b=erzDhpVF8JruTqx3OPAgxBVEDEqnOEGQA8c537B3J5NXud5HMD/ZDSqzHb0SVHuFG5ca4fVV7nwCaTgVkeBWFQsIOuNFPPsseRJ513XVX1oZZRR7LAic7GjI3Wrq8DwcA30KnID4zJCP4oZlVywqFclh7svcvD/+xYUi91GfSNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765945082; c=relaxed/simple;
	bh=9jU/XkLK8jGi8TZH0wNxwzqM1aeH1gvKcHWXK0Vr+cY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mcUREP52tOu7MFYkZHik1nHHnDjy2skGKUuDrthVWfOZpKWxpxP/1mRv8thPUCjU10ZKO6rxqszZGMdihXZ10VD5Ihzh6L4g59oLaraTYxuBnebEsJgmgIukcHF6hklJagYbLNMQU4HOYYljMlj4DcsxsAtlsXxLVxFfNeWRcCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLTWNEnS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLTWNEnS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765945080; x=1797481080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9jU/XkLK8jGi8TZH0wNxwzqM1aeH1gvKcHWXK0Vr+cY=;
  b=bLTWNEnS7D+WrG5RJ6AlxHprUgrlWka8+C0IDYfx8hRa2GUOLqHeZqWj
   p1PPfxceUAVDr4tYeO1+9SB8tGUO9zOkYtqRaEp9uNTfxJSAm7LuTexUD
   ImGLN4SFTZTA2Rsr97nT2dnbteugjm5yYoOXjZDmQsjt15viOrer6R9Tz
   0+2sTEie9xxMR8HZbTb8HvjK/Wfzu6xKBfOKLRDBFZUNna3Vxbzov/mFy
   eyDyK9yy8B+l/CWGpeXYammglrqNcatpVwBNlMFzpznk/GmjbYv2+/s0y
   uYbwiNMpeTqibN0QeroCQ8sbbpIGXC+ZOfqkDeC3m1Rop1QzwSN1WM46k
   w==;
X-CSE-ConnectionGUID: jVs2/nufQdudoAnbIBECeA==
X-CSE-MsgGUID: HMF7zgQ4R9WpavGSTpb+ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67068704"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="67068704"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 20:17:59 -0800
X-CSE-ConnectionGUID: I/QbppgSSZOljuSOH3Bv9g==
X-CSE-MsgGUID: dv3fWejAQqeJmhiMvdNISg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="235595714"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2025 20:17:58 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vViz2-000000004Ad-2ZT1;
	Wed, 17 Dec 2025 04:17:53 +0000
Date: Wed, 17 Dec 2025 12:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:ctx-analysis/dev 30/35]
 arch/um/include/shared/skas/mm_id.h:24:54: error: use of undeclared
 identifier 'turnstile'
Message-ID: <202512171220.vHlvhpCr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   ce5acac3089f2dd72a384cbcd3f0e4ec28e9cf29
commit: 909029ea2f537071fd692f46d1ab7d217d0bcca4 [30/35] stackdepot: Enable context analysis
config: um-defconfig (https://download.01.org/0day-ci/archive/20251217/202512171220.vHlvhpCr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171220.vHlvhpCr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171220.vHlvhpCr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/stackdepot.c:17:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:7:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:26:
   In file included from arch/um/include/asm/mmu.h:12:
>> arch/um/include/shared/skas/mm_id.h:24:54: error: use of undeclared identifier 'turnstile'
      24 | void enter_turnstile(struct mm_id *mm_id) __acquires(turnstile);
         |                                                      ^~~~~~~~~
   arch/um/include/shared/skas/mm_id.h:25:53: error: use of undeclared identifier 'turnstile'
      25 | void exit_turnstile(struct mm_id *mm_id) __releases(turnstile);
         |                                                     ^~~~~~~~~
   In file included from lib/stackdepot.c:17:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from lib/stackdepot.c:17:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from lib/stackdepot.c:17:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from lib/stackdepot.c:17:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from lib/stackdepot.c:17:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from lib/stackdepot.c:17:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from lib/stackdepot.c:17:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~


vim +/turnstile +24 arch/um/include/shared/skas/mm_id.h

d67b569f5f620c arch/um/kernel/skas/include/mm_id.h Jeff Dike 2005-07-07  23  
1e4ee5135d814f arch/um/include/shared/skas/mm_id.h Tiwei Bie 2025-10-27 @24  void enter_turnstile(struct mm_id *mm_id) __acquires(turnstile);
1e4ee5135d814f arch/um/include/shared/skas/mm_id.h Tiwei Bie 2025-10-27  25  void exit_turnstile(struct mm_id *mm_id) __releases(turnstile);
1e4ee5135d814f arch/um/include/shared/skas/mm_id.h Tiwei Bie 2025-10-27  26  

:::::: The code at line 24 was first introduced by commit
:::::: 1e4ee5135d814fe4785890790cec81c3132888fb um: Add initial SMP support

:::::: TO: Tiwei Bie <tiwei.btw@antgroup.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
