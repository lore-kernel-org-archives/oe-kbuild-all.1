Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794731626;
	b=gtgkWZocJJ6W0w9Q5MtUUy4Azj3pFEkieNK7XGYA4sNF+JOHK24z353poCBtmzI5ZcRK
	 NHRxBQCu0cNyyyARbQJhMvlMfLgQ/VWwcQ35SskefEytkC8BzHKZ7G49gQnCY5jUtrVtt
	 UnQ20B5d26A6NQvJvvVbutSJydsc5fGKRTLlbYrW+5hyWMXENpYx04nU2ByesuHreBfFR
	 t0h3tDoERAXrihJGjo9OjMrCww8tgBjRZ9HO6RbcmMQd2/C94eUYgftb4TXo7IsKMGitB
	 FvE+Bn/6WXUz5oxixOxFtmmcOe/2BmI+7H+zNWUwJ5aVyLHhtFrL3K3QKDUnegowsXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731626;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6rfanZcEmThQG2uofPbuSiua06UpU78aHZBudDezPsA=;
	b=eLEY426fFswQisGSQ7/lLT1fwN+bDqse01Guy9ogBPtYD8hD9AtaSJ7c4/inIVjg849O
	 e/sX6Cu0zINpbZMHljlfY9nFAE4/VP1rvMtLAb+dFGinShu6Ndrd+4QCMaouoKfHP6u9F
	 I/lkP27DTbu2emQOU5x66lPkZN/1gqy318L8Sxh5C7hr4eJdhQZDk28kM5JoOl2LaViyt
	 1iTNqVo42gdNEHtjc5IOU3ujpxzjtyfUdAptgodb//r/reMgqbeSWnVTIxL0VmvqgZf+a
	 oIkFcWdHSe99Kp7QunZfCkymAgtNBWP65A0xvU/qh9TzAqGAK2TmuHhoKvk5V7bUkiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZTfbw0nG;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F77606A31E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 08:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04F77606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZTfbw0nG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794731627; x=1826267627;
  h=date:from:to:cc:subject:message-id;
  bh=j3IjTX+queOpxKK6C1mE+KIkLnK6ZYmQQou1cA4NTG4=;
  b=ZTfbw0nGK+R/3F7muGsLXX46vnzkb8oOo+lv/Di7oLu1aQtND2YrpYuD
   rv+TzG7N0aCLbaqP07F6a86tmhOof6GH0jm+NX4wA+xTMalnX4ywk5Grs
   6NX63BbgKp2n5vAWce7Fn2+es70i+rNZPNZMMFZtjQcwRHSWbSPJgStn7
   y6Z9x6yckv/dI7hRADilEwgfJzDPW0JwdTIFdXcMwDINnY6BnXHC/SNKr
   Q3/+DdfOS1W3FkMpVIQjHo0vFHtGaKV5ighaD8NJ7R6QDLMm8crdaqthL
   I69BxFxNMpqu/4JJj/Yf33FjPOI6JqQEAkdoAhkOs3fkJFS2VEmc+fo41
   A==;
X-CSE-ConnectionGUID: X4ljpjH3Ss2MJvrcqS3QZg==
X-CSE-MsgGUID: u3yfjL04Q9Sj3z1pY9Hliw==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3501416"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3501416"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 00:33:45 -0800
X-CSE-ConnectionGUID: UWfVaBXVTSO953ezoF/6WA==
X-CSE-MsgGUID: ueRWdPCTSS2S+Qanx9uVkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9226443"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 15 Nov 2026 00:33:43 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSVgC-0000000027I-1lPR;
	Sun, 15 Nov 2026 08:33:40 +0000
Date: Sun, 15 Nov 2026 09:33:11 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 400/458]
 include/linux/compiler-context-analysis.h:191:49: error: expected expression
 before 'do'
Message-ID: <202611150929.W3L8bFKy-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   6a8743e9201f9d942f7c93093bf7ce69b48a7eea
commit: 30de8225ca7129893217c164616597464eba4693 [400/458] btrfs: Annotate btrfs_readdir_put_delayed_items()
config: arm64-randconfig-2200-20261115 (https://download.01.org/0day-ci/archive/20261115/202611150929.W3L8bFKy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611150929.W3L8bFKy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611150929.W3L8bFKy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/compiler_types.h:44,
                    from <command-line>:
   fs/btrfs/inode.c: In function 'btrfs_real_readdir':
>> include/linux/compiler-context-analysis.h:191:49: error: expected expression before 'do'
     191 | # define __release_shared_ctx_lock(var)         do { } while (0)
         |                                                 ^~
   include/linux/compiler-context-analysis.h:224:9: note: in definition of macro 'context_unsafe'
     224 |         __VA_ARGS__;                    \
         |         ^~~~~~~~~~~
   include/linux/compiler-context-analysis.h:506:33: note: in expansion of macro '__release_shared_ctx_lock'
     506 | #define __release_shared(x)     __release_shared_ctx_lock(x)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:6379:32: note: in expansion of macro '__release_shared'
    6379 |                                __release_shared(&BTRFS_I(inode)->vfs_inode.i_rwsem));
         |                                ^~~~~~~~~~~~~~~~


vim +/do +191 include/linux/compiler-context-analysis.h

3269701cb25662a Marco Elver     2025-12-19  167  
3269701cb25662a Marco Elver     2025-12-19  168  # define __ctx_lock_type(name)
3269701cb25662a Marco Elver     2025-12-19  169  # define __reentrant_ctx_lock
3269701cb25662a Marco Elver     2025-12-19  170  # define __acquires_ctx_lock(...)
3269701cb25662a Marco Elver     2025-12-19  171  # define __acquires_shared_ctx_lock(...)
3269701cb25662a Marco Elver     2025-12-19  172  # define __try_acquires_ctx_lock(ret, var)
3269701cb25662a Marco Elver     2025-12-19  173  # define __try_acquires_shared_ctx_lock(ret, var)
4bed8a05c4b5a72 Bart Van Assche 2026-10-30  174  # define __try_acquires_ctx_lock_range(first, last, ...)
4bed8a05c4b5a72 Bart Van Assche 2026-10-30  175  # define __try_acquires_shared_ctx_lock_range(first, last, ...)
3269701cb25662a Marco Elver     2025-12-19  176  # define __releases_ctx_lock(...)
3269701cb25662a Marco Elver     2025-12-19  177  # define __releases_shared_ctx_lock(...)
3269701cb25662a Marco Elver     2025-12-19  178  # define __assumes_ctx_lock(...)
3269701cb25662a Marco Elver     2025-12-19  179  # define __assumes_shared_ctx_lock(...)
3269701cb25662a Marco Elver     2025-12-19  180  # define __returns_ctx_lock(var)
3269701cb25662a Marco Elver     2025-12-19  181  # define __guarded_by(...)
3269701cb25662a Marco Elver     2025-12-19  182  # define __pt_guarded_by(...)
3269701cb25662a Marco Elver     2025-12-19  183  # define __excludes_ctx_lock(...)
3269701cb25662a Marco Elver     2025-12-19  184  # define __requires_ctx_lock(...)
3269701cb25662a Marco Elver     2025-12-19  185  # define __requires_shared_ctx_lock(...)
3269701cb25662a Marco Elver     2025-12-19  186  # define __acquire_ctx_lock(var)			do { } while (0)
3269701cb25662a Marco Elver     2025-12-19  187  # define __acquire_shared_ctx_lock(var)		do { } while (0)
3269701cb25662a Marco Elver     2025-12-19  188  # define __try_acquire_ctx_lock(var, ret)		(ret)
3269701cb25662a Marco Elver     2025-12-19  189  # define __try_acquire_shared_ctx_lock(var, ret)	(ret)
3269701cb25662a Marco Elver     2025-12-19  190  # define __release_ctx_lock(var)			do { } while (0)
3269701cb25662a Marco Elver     2025-12-19 @191  # define __release_shared_ctx_lock(var)		do { } while (0)
3269701cb25662a Marco Elver     2025-12-19  192  # define __assume_ctx_lock(var)			do { (void)(var); } while (0)
3269701cb25662a Marco Elver     2025-12-19  193  # define __assume_shared_ctx_lock(var)			do { (void)(var); } while (0)
3269701cb25662a Marco Elver     2025-12-19  194  # define context_lock_struct(name, ...)		struct __VA_ARGS__ name
3269701cb25662a Marco Elver     2025-12-19  195  # define disable_context_analysis()
3269701cb25662a Marco Elver     2025-12-19  196  # define enable_context_analysis()
3269701cb25662a Marco Elver     2025-12-19  197  # define __no_context_analysis
3269701cb25662a Marco Elver     2025-12-19  198  

:::::: The code at line 191 was first introduced by commit
:::::: 3269701cb25662ae8a9771a864201116626adb50 compiler-context-analysis: Add infrastructure for Context Analysis with Clang

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
