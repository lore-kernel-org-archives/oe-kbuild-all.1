Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D9619C556
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 12:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749904188; cv=none; b=ZBDxFjmTA+iWUGp4nKW5Xbd8e/t6PKv2+xfmZSXxj3INjaNHK51+7w21ZNdhV1bAP/HASZg7/j+Hq6o3hGvr0eV2IVfuNWnfyyohW0oh5l5D3rXIlLOM1f0HenoDF/eiWNZ8ixHD9dKGTK3PKo1uBt83DEXQA5r/knX2LqersYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749904188; c=relaxed/simple;
	bh=JuEBjaOe7ick7uf1a79k6sgSYzF5oCE3nvu+5X1INes=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h+Saepe2esdC99DWKAjf7VRy7sGV/g23ZKufurXzhFp9ZOGfJEm6rrsi8awTx3Eua9glYJE8w1++MoaemXC8bSq1MwBY1LkafWq3UYsNtxpg5xNDJvgEx9s+Wq1G33WrxF++kN5P8fNAcEPdTRBCDVHrPiZ3NGm+z+l+H5n5ltw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bR4Ducfe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bR4Ducfe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749904186; x=1781440186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JuEBjaOe7ick7uf1a79k6sgSYzF5oCE3nvu+5X1INes=;
  b=bR4DucfeNNW8Nn22+hrz9L7iZG2StRam9RPoAxwt/SCFGatCTk2CzaA6
   s3oyze1TJ/gy61Qlgd8M+t4qrpovOZ0TQ6dOihYlz3FOLnnmCarxFeL4d
   LI+eQqjd2JmYDTAzxrV2ebhb9zmmgb3WySbsZ+ASmSsL69eYD/mGiodv3
   PfKMQTcsgBhEm1fZozL1kc5ngKS3qMBa6+4nP7k9x+D9ktPI8NLgOvyYy
   iBQI9Gx6eSLxK4Dm0+Nz+y5TCjN9HbzUQdsJg+bgLm6XOWcWePJ/mJqXL
   JylxPhSZlYLstoe5VO9f585XPGk/DVHXoOlQWWKnK3hTjtxiSWteowMcU
   A==;
X-CSE-ConnectionGUID: DBAtWn9KRIuO0QQTjlNQng==
X-CSE-MsgGUID: 2ERc0esdRIWKHoqYKt0T6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="63460135"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="63460135"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 05:29:45 -0700
X-CSE-ConnectionGUID: BnqWkX67Ru2K/6GzDXKU3w==
X-CSE-MsgGUID: ok0wGL3HQZC29J9g8EZDtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="147943807"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jun 2025 05:29:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQQ10-000DVQ-1G;
	Sat, 14 Jun 2025 12:29:42 +0000
Date: Sat, 14 Jun 2025 20:28:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 2/2]
 include/trace/trace_events.h:27:23: warning:
 'str__fpsimd__trace_system_name' defined but not used
Message-ID: <202506142049.L9AM0nzQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wooyeon,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   00bb1edff25ad0fc3c07851c519558bce383e8ff
commit: 74555f39924dc4c173b4bec9bd015acfeb895e68 [2/2] ANDROID: vendor_hooks: FPSIMD save/restore by using vendor_hooks
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250614/202506142049.L9AM0nzQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506142049.L9AM0nzQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506142049.L9AM0nzQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/fpsimd.h:26,
                    from drivers/android/vendor_hooks.c:12:
>> include/trace/trace_events.h:27:23: warning: 'str__fpsimd__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/sched.h:23,
                    from drivers/android/vendor_hooks.c:11:
   include/trace/trace_events.h:27:23: warning: 'str__sched__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~


vim +/str__fpsimd__trace_system_name +27 include/trace/trace_events.h

acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  26) 
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31 @27) #define __app__(x, y) str__##x##y
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  28) #define __app(x, y) __app__(x, y)
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  29) 

:::::: The code at line 27 was first introduced by commit
:::::: acd388fd3af350ab24c6ab6f19b83fc4a4f3aa60 tracing: Give system name a pointer

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
