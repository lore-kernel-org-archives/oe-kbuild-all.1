Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B4F137E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 21:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750453396; cv=none; b=fPCjPhPtBA67BOAgig23+6uf9okVT1LOXBhiQjzZbOXoGQNFpfm84gHzrtRwOFTe1bpTxb3qRkaJPnzRe5SDudh7OshX7qxKIjf0B9KrpodY9qcYRDMuqAB6YU9NzFDHo+xZ5mbFjRmzgvwMWrzzWvMQ2ojROmDnxXBnEvL1vzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750453396; c=relaxed/simple;
	bh=CnQCvnVVn8PIkTQxMAFC0Li2mcD671cgug87+RvUkM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hd5jh4wXP/3VXurUAjiNtCtR2CJdNUahbUbhSrLrWvFyme5M2FXU12jL9W4Ao/fsZEscSNzWS6BqKdMdWxI6r/b2YLSaSArtYOkqj50owlka8qvD7rW2ghg3HcE5qimDIyuzQhO9FAfztvsBNVNh+Zg5yK49QIYx42SGpnDZIBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVn9Ap5N; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVn9Ap5N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750453395; x=1781989395;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CnQCvnVVn8PIkTQxMAFC0Li2mcD671cgug87+RvUkM8=;
  b=DVn9Ap5NS0/GOAVaxvf3Yb6aMUyxrhCroR6vPbkQbMqLDuGo5hg5zclr
   EHNCBsjpn2/NrcYBfdtXVuBME/ViTnMHJZx8ZXe3+ZXUGBryYX4MKn+M8
   GzBXfPc1Mb8jYarbron2VoEhhjEhQJtKqxczOM0DYs7JN19GpAh0uV28B
   slIql1pwgPIT7hTc4VUN7RJl8lxGmIDTWcJm3/wRcAvJO9ltt9f0gqtZW
   rdcm/8NwKloPRp6uiz8LtUJ7CuIAHNQr0k2ZnR+TcjzSrOTjtIn1X+2xY
   j0NjEhcVQVhkld8mJVcEWqM8OdYg537JFEjorkCYg3px0vj7Ke9wc9Vpu
   A==;
X-CSE-ConnectionGUID: EnDS84MHQ0mWF7zXAfHR/A==
X-CSE-MsgGUID: GzdfR1mfTZ2JWXzrl4lXfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52867822"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="52867822"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 14:03:14 -0700
X-CSE-ConnectionGUID: xkQITjubSmqoZF9FOed9tA==
X-CSE-MsgGUID: Yr2n13CcStGAvQG8frgKew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="151539542"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jun 2025 14:03:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSitD-000M9c-0X;
	Fri, 20 Jun 2025 21:03:11 +0000
Date: Sat, 21 Jun 2025 05:03:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:kunit-kselftests-integration 46/49]
 tools/include/nolibc/types.h:110:40: warning: 'status' may be used
 uninitialized
Message-ID: <202506210409.yM2sXnpa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git kunit-kselftests-integration
head:   7c2a5fb4d342d9fee958d8881e69704a964a7982
commit: c555045651907293f196164c17ddda221cf194f1 [46/49] timens
config: loongarch-randconfig-001-20250621 (https://download.01.org/0day-ci/archive/20250621/202506210409.yM2sXnpa-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506210409.yM2sXnpa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506210409.yM2sXnpa-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from tools/include/nolibc/nolibc.h:99,
                    from <command-line>:
   tools/include/nolibc/types.h: In function 'main':
>> tools/include/nolibc/types.h:110:40: warning: 'status' may be used uninitialized [-Wmaybe-uninitialized]
     110 | #define WIFEXITED(status)   (((status) & 0x7f) == 0)
         |                                        ^
   In file included from kernel/time/tests/timens_test_futex.c:3:
   kernel/time/tests/../../../tools/testing/selftests/timens/futex.c:64:13: note: 'status' was declared here
      64 |         int status, len, fd;
         |             ^~~~~~
--
   In file included from kernel/time/tests/timens_test_exec.c:3:
   kernel/time/tests/../../../tools/testing/selftests/timens/exec.c: In function 'main':
>> kernel/time/tests/../../../tools/testing/selftests/timens/exec.c:89:12: warning: 'status' may be used uninitialized [-Wmaybe-uninitialized]
      89 |         if (status)
         |            ^
   kernel/time/tests/../../../tools/testing/selftests/timens/exec.c:24:13: note: 'status' was declared here
      24 |         int status, i;
         |             ^~~~~~
--
   In file included from tools/include/nolibc/nolibc.h:99,
                    from <command-line>:
   tools/include/nolibc/types.h: In function 'main':
>> tools/include/nolibc/types.h:110:40: warning: 'status' may be used uninitialized [-Wmaybe-uninitialized]
     110 | #define WIFEXITED(status)   (((status) & 0x7f) == 0)
         |                                        ^
   In file included from kernel/time/tests/timens_test_timer.c:3:
   kernel/time/tests/../../../tools/testing/selftests/timens/timer.c:73:18: note: 'status' was declared here
      73 |         int ret, status, len, fd;
         |                  ^~~~~~
--
   In file included from tools/include/nolibc/nolibc.h:99,
                    from <command-line>:
   tools/include/nolibc/types.h: In function 'main':
>> tools/include/nolibc/types.h:110:40: warning: 'status' may be used uninitialized [-Wmaybe-uninitialized]
     110 | #define WIFEXITED(status)   (((status) & 0x7f) == 0)
         |                                        ^
   In file included from kernel/time/tests/timens_test_timerfd.c:3:
   kernel/time/tests/../../../tools/testing/selftests/timens/timerfd.c:80:18: note: 'status' was declared here
      80 |         int ret, status, len, fd;
         |                  ^~~~~~


vim +/status +110 tools/include/nolibc/types.h

788aca91ab5e4c Zhangjin Wu      2023-07-08  107  
cc7a492ad0a076 Willy Tarreau    2022-02-07  108  /* Macros used on waitpid()'s return status */
cc7a492ad0a076 Willy Tarreau    2022-02-07  109  #define WEXITSTATUS(status) (((status) & 0xff00) >> 8)
cc7a492ad0a076 Willy Tarreau    2022-02-07 @110  #define WIFEXITED(status)   (((status) & 0x7f) == 0)
8c934d4822c778 Thomas Weiﬂschuh 2023-03-25  111  #define WTERMSIG(status)    ((status) & 0x7f)
8c934d4822c778 Thomas Weiﬂschuh 2023-03-25  112  #define WIFSIGNALED(status) ((status) - 1 < 0xff)
cc7a492ad0a076 Willy Tarreau    2022-02-07  113  

:::::: The code at line 110 was first introduced by commit
:::::: cc7a492ad0a076dff5cb4281b1516676d7924fcf tools/nolibc/types: split syscall-specific definitions into their own files

:::::: TO: Willy Tarreau <w@1wt.eu>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
