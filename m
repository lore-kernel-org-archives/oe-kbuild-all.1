Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AD1360
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 01:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685235698; x=1716771698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DSytgaw5nCrAYRqaOfzoa+m05zYQfdK6DDyq0Lmvg04=;
  b=UQc3xaW2i4uQG2YjEfqwu6jlwd7tbU/3cxLzfWU+PHBinp8dRoVLal2x
   douugGrclpmqP+1c3/inzhX9Fj52qr4bYC4CbaINOrXunnErOkPG2PV1C
   jkrpx7XRio1NB9tjqBsaLqWQDbNhmDrzSXtCumxdNAijTgIV2ygT8csgB
   HQIIh9Y/UC1XFnLS5CGyNN2IJmkU7LaNELVqG4gM9StCh6uq8LXKXkp05
   XkB4S6pz+h1eI0IteW0arz8fWAC5hE29AiYDC1BAT9hZSbFzZwRsRb2lX
   4uvJ6zuK31o/ucMcQ2KtEw0xOtKM3+Ch8JA3Z4zKsK2ey1ytWQ+ICnb1Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="339055050"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="339055050"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 18:01:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="708807617"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="708807617"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 May 2023 18:01:32 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q34mq-000KL8-18;
	Sun, 28 May 2023 01:01:32 +0000
Date: Sun, 28 May 2023 09:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 8602/20126]
 include/trace/hooks/timekeeping.h:14:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202305280820.iLU7hP62-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   1247e4a9ca826161b8c13c6422a56ed008dc4de5
commit: 5168caa32a196470b560403662a31cf20837626d [8602/20126] ANDROID: Add vendor hook for tk_based_time_sync
config: i386-randconfig-s001-20230528 (https://download.01.org/0day-ci/archive/20230528/202305280820.iLU7hP62-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15
        git checkout 5168caa32a196470b560403662a31cf20837626d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/ kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305280820.iLU7hP62-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/time/timekeeping.c: note: in included file:
>> include/trace/hooks/timekeeping.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/timekeeping.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/timekeeping.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +14 include/trace/hooks/timekeeping.h

    12	
    13	struct timekeeper;
  > 14	DECLARE_RESTRICTED_HOOK(android_rvh_tk_based_time_sync,
    15		TP_PROTO(struct timekeeper *tk),
    16		TP_ARGS(tk), 1);
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
