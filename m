Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792629475;
	b=L2Y9+ybq2XI9JXaxREMDrhqq7j3WrP3iR7IO7BKtvjPIWl2R06TwymqmFTjglgGZFR+o
	 8KBy9NWwgFY9EfzseaiB4EAxQLnizwWJ/CHN/svztBZNuuFR8v1nS7SnpBo3R0CjmXfJx
	 uqVU/BmJXi/EiM7ZDgN8zJXZzMkb97MCLqEM+M35Aq1KUeHxuGM0lZpZ8ZYcLuI9s0O/8
	 npA7+z0FjOO9ygsZOc7nrYOrzV8YWRLdhHlPztuGn84IuWnqpyB3C35TEzyqpoYNR33Ft
	 id62JL9Vl1xtKPYJskkKnsxK/aj2Vmm1kY48vFEZtYP8lG6WaX7elkE4hqqm/1oEE0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792629475;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6K3yY++rqbXE0eFLS3yzir+b7Z6G0uXIhN0thS7409s=;
	b=2rxoSkk/KIpAQoQ3RGYBV1DLhm4z0l8mczosN6Sx+mnTGENKw/rxo2c5hs9u8IOfV4TT
	 /wCI9DbDnSwxqv4SBjhEcxVpzpkDDptM2WiPtARQMXGiLLQb/zV+xZ7f3uIfSNX0bmtk3
	 nEs6Pdtur23U3jchNubadpv8nekiyLXs39udog7Q+edRZfTjyesFqA1OhyEK9XGrFzwfV
	 bRgFQBZp0Za6KqyGFa+9gsQBYPyAEWUkHdwX5jVWFgzuSP+6X+QaZAEmeLkyLRmhuPlp9
	 lILzGSWHKIZJcqBgS1tpn7DrLCWM+W6ZvGPLyo1Jixja6ksOrvjXuyJMChuACMDfSUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n2yRxUNo;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811C9606A319
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 00:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 811C9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n2yRxUNo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792629474; x=1824165474;
  h=date:from:to:cc:subject:message-id;
  bh=qB98ayD9I5n1FXa1GE4uZBY51nc6ejSRwTeHlhnPf6c=;
  b=n2yRxUNozYAhPNb1cikOoJmtUg6zwgeqWnjSpZF1Ogu6vr3kS4TqTWsn
   8HkugxcJKzqOIP7z83dTQnlFF2XpQA+G2VLILAtoA3etWD6Dp+yGwJAUC
   FbYeJ4WAPDB/I4+Bcm1jChxC3N+MwNsc9ak8aE8Pk1hM0Rp4AkiDe/mX7
   SOsfIGqcunNRV6H+ISdhRWycRBOPUEnFFDaxrbZdpP7eR/JhBD7mRHEbX
   WqqjbyiaQ9D8+F4F191EXL4nmQXzwtVc7K+gFOi2XpABVy6xYP55VNjDv
   NZysZV1Ehg/7qADRF5REJXwrHbvaNLPB8TVZ3VPalMFlJot2UC1zxSyjS
   A==;
X-CSE-ConnectionGUID: v990m5Z9SeWtw/t+s2UVgw==
X-CSE-MsgGUID: 96YYIPjGQx+aritN/BQ+VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1384910"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1384910"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 17:37:53 -0700
X-CSE-ConnectionGUID: 91111UfGSQysVMdE/zInWQ==
X-CSE-MsgGUID: 7ZI0t1TwSX2keERRzN8n8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3583114"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Oct 2026 17:37:52 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJgoX-00000000QIc-1WvD;
	Thu, 22 Oct 2026 00:37:49 +0000
Date: Thu, 22 Oct 2026 08:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 include/trace/stages/init.h:2:23: warning: 'str__kasan__trace_system_name'
 defined but not used
Message-ID: <202610220856.9HAjvK2Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi qinglin.li,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   571d9c1bbba0039f8fa842785e434862ba744377
commit: 4b324ceb0c412ab134e13e3d20c8e313918c046c [1/1] ANDROID: vendor_hooks: Add hooks for slab
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261022/202610220856.9HAjvK2Y-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610220856.9HAjvK2Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610220856.9HAjvK2Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/kasan.h:18,
                    from drivers/android/vendor_hooks.c:80:
>> include/trace/stages/init.h:2:23: warning: 'str__kasan__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/usb.h:29,
                    from drivers/android/vendor_hooks.c:79:
   include/trace/stages/init.h:2:23: warning: 'str__usb__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/gzvm.h:29,
                    from drivers/android/vendor_hooks.c:78:
   include/trace/stages/init.h:2:23: warning: 'str__gzvm__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/user.h:21,
                    from drivers/android/vendor_hooks.c:77:
   include/trace/stages/init.h:2:23: warning: 'str__user__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/suspend.h:28,
                    from drivers/android/vendor_hooks.c:76:
   include/trace/stages/init.h:2:23: warning: 'str__suspend__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/ogki_honor.h:31,
                    from drivers/android/vendor_hooks.c:75:
   include/trace/stages/init.h:2:23: warning: 'str__ogki_honor__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +/str__kasan__trace_system_name +2 include/trace/stages/init.h

af6b9668e85ffd Steven Rostedt (Google  2022-03-03 @2) #define __app__(x, y) str__##x##y
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  3) #define __app(x, y) __app__(x, y)
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  4) 

:::::: The code at line 2 was first introduced by commit
:::::: af6b9668e85ffd1502aada8036ccbf4dbd481708 tracing: Move the defines to create TRACE_EVENTS into their own files

:::::: TO: Steven Rostedt (Google) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
