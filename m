Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B86A41D22B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 10:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467016; cv=none; b=H6spGAonqjGrW0lLrPMI0dx2nf0nTnF7TqiSBTIZie36h6rHnpOaXHbihK2drX3jQHwKTLJAvCiL1gg/DA4sOCWekdDHvTjGL3OoX6l1SrAlo/RRcV47FwNyJPSrpVRxgutblkjJWZnuD6EiCR9s0U9CxPpmJRZCNm8eC4Jdbwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467016; c=relaxed/simple;
	bh=dk21WjAW04msmp2MwwSoX6wGGzr7IGwDaQpcSJy3HaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=W0rUOPSU6HbpuHiE0ZEBtiFHf3Vpyf5lkisyZCmgX9QDcxvKeXkA9fhW+ZNxRxV9hZjQxHc0kIPmFqzqz4o0ilWB5BMcKimJhxeelac71IymmqtEA2jMPcwMnXcT+r+YfTojsNhfMoXj1f5VMYsAipF2YVLka98hmSxo5BFeGc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNtqtqQH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNtqtqQH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789467014; x=1821003014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dk21WjAW04msmp2MwwSoX6wGGzr7IGwDaQpcSJy3HaY=;
  b=aNtqtqQHxITAe/IdnoTsxb9jUulc8zg2m6ywiYE41pJSoMWVp39yM/iu
   SS4DAfAFsakMkPlLdB0BkrtT9/+m+XKdRzyKWmJBV9Myg1UXXaqogzEmK
   SGP4JjAYnjDVR0CwlYlTKrynGALi+fc2owa6EhsASFyK3R+k1sWpkDi5M
   VXFS6k8ut5+/clu7ou2QIbOiAHhtHi+kpGxiJzlFw8VPK23ZUwrDaUbsN
   MumUSS7hstzEk7atgseuJVuXV9gAV5weQtwanMRzvzyuoEHPdpyKmcwZj
   +RrKozSWnbNK1fP7lUnc5+26xrxv0VJEHlyI9oFBNhw06uv5mwanZ6G6R
   w==;
X-CSE-ConnectionGUID: OhSyrLHJT0G8R5oLv+DEfw==
X-CSE-MsgGUID: dIBIfBWnS4CpJBTeqqSV+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115361009"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115361009"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:10:12 -0700
X-CSE-ConnectionGUID: c+8VMs2EQTOtlJQGjRvrrA==
X-CSE-MsgGUID: o8hEiH7dTnWkNzoTIahqhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271517715"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 15 Sep 2026 03:10:11 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6Q76-000000000ad-1jpG;
	Tue, 15 Sep 2026 10:10:08 +0000
Date: Tue, 15 Sep 2026 12:09:49 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmaps-v9-akpm 30/41]
 ./include/linux/dynamic_debug.h:519:9: warning: "_DPRINTK_CLASSBITS_INIT"
 redefined
Message-ID: <202609151152.QDxQ8hJ4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-classmaps-v9-akpm
head:   bc05be3d2d3a71c95bbd0c24599f0bafcd5e7326
commit: 5959d9dd620041fe8451e9b2d2545b1084526432 [30/41] dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260915/202609151152.QDxQ8hJ4-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609151152.QDxQ8hJ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609151152.QDxQ8hJ4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./include/linux/module.h:31,
                    from ./include/linux/device/driver.h:21,
                    from ./include/linux/device.h:32,
                    from ./include/linux/node.h:18,
                    from ./include/linux/cpu.h:17,
                    from ./include/linux/cpufreq.h:12,
                    from kernel/sched/sched.h:31,
                    from kernel/sched/rq-offsets.c:5:
>> ./include/linux/dynamic_debug.h:519:9: warning: "_DPRINTK_CLASSBITS_INIT" redefined
     519 | #define _DPRINTK_CLASSBITS_INIT 0U
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/dynamic_debug.h:70:9: note: this is the location of the previous definition
      70 | #define _DPRINTK_CLASSBITS_INIT ((_DPRINTK_FLAGS_DEFAULT & _DPRINTK_FLAGS_PRINT) ? ~0U : 0U)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from ./include/linux/module.h:31,
                    from net/8021q/vlan.c:20:
>> ./include/linux/dynamic_debug.h:519:9: warning: "_DPRINTK_CLASSBITS_INIT" redefined
     519 | #define _DPRINTK_CLASSBITS_INIT 0U
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/dynamic_debug.h:70:9: note: this is the location of the previous definition
      70 | #define _DPRINTK_CLASSBITS_INIT ((_DPRINTK_FLAGS_DEFAULT & _DPRINTK_FLAGS_PRINT) ? ~0U : 0U)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   net/8021q/vlan.c: In function 'register_vlan_device':
   net/8021q/vlan.c:249:46: warning: '%i' directive output may be truncated writing between 1 and 4 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     249 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                              ^~
   net/8021q/vlan.c:249:42: note: directive argument in the range [0, 4094]
     249 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                          ^~~~~~~
   net/8021q/vlan.c:249:17: note: 'snprintf' output between 3 and 21 bytes into a destination of size 16
     249 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/8021q/vlan.c:237:46: warning: '%.4i' directive output may be truncated writing 4 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     237 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                              ^~~~
   net/8021q/vlan.c:237:42: note: directive argument in the range [0, 4094]
     237 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                          ^~~~~~~~~
   net/8021q/vlan.c:237:17: note: 'snprintf' output between 6 and 21 bytes into a destination of size 16
     237 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from ./include/linux/module.h:31,
                    from ./include/linux/bpf.h:22,
                    from kernel/bpf/diagnostics.c:4:
>> ./include/linux/dynamic_debug.h:519:9: warning: "_DPRINTK_CLASSBITS_INIT" redefined
     519 | #define _DPRINTK_CLASSBITS_INIT 0U
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/dynamic_debug.h:70:9: note: this is the location of the previous definition
      70 | #define _DPRINTK_CLASSBITS_INIT ((_DPRINTK_FLAGS_DEFAULT & _DPRINTK_FLAGS_PRINT) ? ~0U : 0U)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/diagnostics.c: In function 'bpf_diag_source':
   kernel/bpf/diagnostics.c:828:9: warning: function 'bpf_diag_source' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     828 |         msg = bpf_diag_vfmt(env, fmt, args);
         |         ^~~


vim +/_DPRINTK_CLASSBITS_INIT +519 ./include/linux/dynamic_debug.h

   515	
   516	#if defined(DEBUG)
   517	#define _DPRINTK_CLASSBITS_INIT ~0U
   518	#else
 > 519	#define _DPRINTK_CLASSBITS_INIT 0U
   520	#endif
   521	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
