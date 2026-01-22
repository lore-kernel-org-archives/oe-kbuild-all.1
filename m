Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BAD3D666E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 22:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769121533; cv=none; b=QjapwJnqQZtqQ/mmDFh5MImxpzsJedzZO83NxDBctHp1GTJj4xKX4CP7IJSPspOP/8Ij3Vej0FRwIhOeSGqRAtj3RtLKlnHY4YH5++5A8hnO7Th5z7negWiQv87LTtXHdglcZmInxyWQHKA4fapJ8fD3b5YmNwHFSvMxelWMi5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769121533; c=relaxed/simple;
	bh=mq/7pUnTpsx1XVR3eDrJ0QK5uNQPovBAL7SunwXPSm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYNONsJ5fJKFYeTE0/UC7n7RWaUXNFesaLS5Zq9F7htKWgEDKugwsjiA2Acd42p9yMO5wUIWc4cGWXBbIM0X+lGiR8UfRvvTkJ3FrNcz25p5SD6FYregWIBAcGdm8hgwZCi41cpxo8DKkehUq+NH1BHZX0HgW7sYWCfNQB0QCSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMAY2rh1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMAY2rh1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769121524; x=1800657524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mq/7pUnTpsx1XVR3eDrJ0QK5uNQPovBAL7SunwXPSm0=;
  b=VMAY2rh1wdassHecUYICp2FTNLt+DEDO5jZDhx/6Ff7MKc7lOwVAoz9P
   2OBdoXxor2apkV3AIOl9GAg8FZIgVBu9kM+I5cJrXpTLON9kxmiv7BX7H
   UYCx1dV9PG6YOzldiQH5JHsylQpKhpNeb8ovPsKpiEs3zWjodfcEMG2pc
   f5jxHRqfTB6RUa+0QQ5sNQn2RICC/B6aJaue94FFS8XBdc7PbLta3Mdkg
   DT6U1I3xW7Fweaewa+A3Lzf+cTFqe0GvepWnLLsFvpcFs2K5MrDQ5wTzb
   uMozA73YhpWYINg4x2FfuAQWz3UWjg/hnG/hNSUDyuhFg6By5k4BScPPj
   g==;
X-CSE-ConnectionGUID: ldrVwkmSQmaEwM94ZIdZ5g==
X-CSE-MsgGUID: 1Lha9X20RXGVaVJCsrMenA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="57942413"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="57942413"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 14:38:39 -0800
X-CSE-ConnectionGUID: dBgyA90RTH2BqKSZA4Z0EA==
X-CSE-MsgGUID: yJGLKDvoS76r12S3wMz09A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="211864152"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 22 Jan 2026 14:38:38 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj3Jz-000000000Yr-35Vx;
	Thu, 22 Jan 2026 22:38:35 +0000
Date: Thu, 22 Jan 2026 23:38:05 +0100
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/7] selftests/statmount: add statmount_alloc() helper
Message-ID: <202601222326.ewkrfh8w-lkp@intel.com>
References: <20260122-work-fsmount-namespace-v1-5-5ef0a886e646@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-work-fsmount-namespace-v1-5-5ef0a886e646@kernel.org>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1bce1a664ac25d37a327c433a01bc347f0a81bd6]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/mount-start-iterating-from-start-of-rbtree/20260122-191218
base:   1bce1a664ac25d37a327c433a01bc347f0a81bd6
patch link:    https://lore.kernel.org/r/20260122-work-fsmount-namespace-v1-5-5ef0a886e646%40kernel.org
patch subject: [PATCH 5/7] selftests/statmount: add statmount_alloc() helper
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260122/202601222326.ewkrfh8w-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601222326.ewkrfh8w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601222326.ewkrfh8w-lkp@intel.com/

All errors (new ones prefixed by >>):

>> statmount_test.c:36:26: error: conflicting types for 'statmount_alloc'
      36 | static struct statmount *statmount_alloc(uint64_t mnt_id, int fd, uint64_t mask, unsigned int flags)
         |                          ^
   ./statmount.h:91:33: note: previous definition is here
      91 | static inline struct statmount *statmount_alloc(uint64_t mnt_id, uint64_t mnt_ns_id, uint64_t mask)
         |                                 ^
   statmount_test.c:376:11: warning: format specifies type 'unsigned long' but the argument has type '__fsword_t' (aka 'int') [-Wformat]
     374 |                 ksft_test_result_fail("unexpected sb magic: 0x%llx != 0x%lx\n",
         |                                                                         ~~~
         |                                                                         %x
     375 |                                       (unsigned long long) sm.sb_magic,
     376 |                                       sf.f_type);
         |                                       ^~~~~~~~~
>> statmount_test.c:387:56: error: too many arguments to function call, expected 3, have 4
     387 |         sm = statmount_alloc(root_id, 0, STATMOUNT_MNT_POINT, 0);
         |              ~~~~~~~~~~~~~~~                                  ^
   ./statmount.h:91:33: note: 'statmount_alloc' declared here
      91 | static inline struct statmount *statmount_alloc(uint64_t mnt_id, uint64_t mnt_ns_id, uint64_t mask)
         |                                 ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   statmount_test.c:417:55: error: too many arguments to function call, expected 3, have 4
     417 |         sm = statmount_alloc(root_id, 0, STATMOUNT_MNT_ROOT, 0);
         |              ~~~~~~~~~~~~~~~                                 ^
   ./statmount.h:91:33: note: 'statmount_alloc' declared here
      91 | static inline struct statmount *statmount_alloc(uint64_t mnt_id, uint64_t mnt_ns_id, uint64_t mask)
         |                                 ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   statmount_test.c:450:54: error: too many arguments to function call, expected 3, have 4
     450 |         sm = statmount_alloc(root_id, 0, STATMOUNT_FS_TYPE, 0);
         |              ~~~~~~~~~~~~~~~                                ^
   ./statmount.h:91:33: note: 'statmount_alloc' declared here
      91 | static inline struct statmount *statmount_alloc(uint64_t mnt_id, uint64_t mnt_ns_id, uint64_t mask)
         |                                 ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   statmount_test.c:480:9: error: too many arguments to function call, expected 3, have 4
     479 |         sm = statmount_alloc(root_id, 0, STATMOUNT_MNT_BASIC | STATMOUNT_MNT_OPTS,
         |              ~~~~~~~~~~~~~~~
     480 |                              0);
         |                              ^
   ./statmount.h:91:33: note: 'statmount_alloc' declared here
      91 | static inline struct statmount *statmount_alloc(uint64_t mnt_id, uint64_t mnt_ns_id, uint64_t mask)
         |                                 ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   statmount_test.c:569:41: error: too many arguments to function call, expected 3, have 4
     569 |         sm = statmount_alloc(root_id, 0, mask, 0);
         |              ~~~~~~~~~~~~~~~                   ^
   ./statmount.h:91:33: note: 'statmount_alloc' declared here
      91 | static inline struct statmount *statmount_alloc(uint64_t mnt_id, uint64_t mnt_ns_id, uint64_t mask)
         |                                 ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   statmount_test.c:718:72: error: too many arguments to function call, expected 3, have 4
     718 |         sm = statmount_alloc(0, fd, STATMOUNT_MNT_ROOT | STATMOUNT_MNT_POINT, STATMOUNT_BY_FD);
         |              ~~~~~~~~~~~~~~~                                                  ^~~~~~~~~~~~~~~
   usr/include/linux/mount.h:243:26: note: expanded from macro 'STATMOUNT_BY_FD'
     243 | #define STATMOUNT_BY_FD         0x00000001U     /* want mountinfo for given fd */
         |                                 ^~~~~~~~~~~
   ./statmount.h:91:33: note: 'statmount_alloc' declared here
      91 | static inline struct statmount *statmount_alloc(uint64_t mnt_id, uint64_t mnt_ns_id, uint64_t mask)
         |                                 ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   statmount_test.c:753:72: error: too many arguments to function call, expected 3, have 4
     753 |         sm = statmount_alloc(0, fd, STATMOUNT_MNT_ROOT | STATMOUNT_MNT_POINT, STATMOUNT_BY_FD);
         |              ~~~~~~~~~~~~~~~                                                  ^~~~~~~~~~~~~~~
   usr/include/linux/mount.h:243:26: note: expanded from macro 'STATMOUNT_BY_FD'
     243 | #define STATMOUNT_BY_FD         0x00000001U     /* want mountinfo for given fd */
         |                                 ^~~~~~~~~~~
   ./statmount.h:91:33: note: 'statmount_alloc' declared here
      91 | static inline struct statmount *statmount_alloc(uint64_t mnt_id, uint64_t mnt_ns_id, uint64_t mask)
         |                                 ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   statmount_test.c:847:72: error: too many arguments to function call, expected 3, have 4
     847 |         sm = statmount_alloc(0, fd, STATMOUNT_MNT_POINT | STATMOUNT_MNT_ROOT, STATMOUNT_BY_FD);
         |              ~~~~~~~~~~~~~~~                                                  ^~~~~~~~~~~~~~~
   usr/include/linux/mount.h:243:26: note: expanded from macro 'STATMOUNT_BY_FD'
     243 | #define STATMOUNT_BY_FD         0x00000001U     /* want mountinfo for given fd */
         |                                 ^~~~~~~~~~~
   ./statmount.h:91:33: note: 'statmount_alloc' declared here
      91 | static inline struct statmount *statmount_alloc(uint64_t mnt_id, uint64_t mnt_ns_id, uint64_t mask)
         |                                 ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 9 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
