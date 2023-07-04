Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF9163C1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 16:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688486587; x=1720022587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8EzxjNBJEiOLebSVickE91Z/q2rrXCnTSdS0VA0ODrw=;
  b=J5sIG6hZaCs9K9Rw36LvZiMKFl588dcnHKiQ2sp2wx0xUsKM26uGacCj
   zM8ut1QwfR7pv/WZnGpz6nxWw8NDHr5FlJxUBDeMn/eINyHPOOMIWhWlX
   4+zCCa4dI1q10ZUPkDa15f7I3fbvZMJHn76i0mhZdn74SkRBNQBatA9zt
   R6I6Gv1CP2ZGAT5LhFpwRw4av8YYP1eYJySuCt/Ca2rbSzqGAEhbih6oC
   sbHrbNenG2SUJN62V4x3f2UGJViiV4AY8AcOFItg2vicvjn4AmQj0D8Qx
   YhEM8EJOQfYa4AuqVjknGMmu9i/LZoNoWEqBg3iQf6JiEJdnE0TsqSfPg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="360629832"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="360629832"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 09:03:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="788897619"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="788897619"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2023 09:02:59 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGiUU-000ILk-1X;
	Tue, 04 Jul 2023 16:02:58 +0000
Date: Wed, 5 Jul 2023 00:02:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-4.14 2/4] hrtimer.c:undefined reference to
 `tick_nohz_hres_to_lres'
Message-ID: <202307042315.3VJzdW5J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-4.14
head:   4d89af6ae49b62b28be9c5bacc14997e409188d3
commit: cdc5027eae87be4fbce2aa7892bdd12b38388f63 [2/4] CHROMIUM: hrtimer: Add a sysctl to lower resolution of timers
config: x86_64-buildonly-randconfig-r001-20230703 (https://download.01.org/0day-ci/archive/20230704/202307042315.3VJzdW5J-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307042315.3VJzdW5J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307042315.3VJzdW5J-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: kernel/time/hrtimer.o: in function `hrtimer_switch_to_lres':
>> hrtimer.c:(.text+0xa31): undefined reference to `tick_nohz_hres_to_lres'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
