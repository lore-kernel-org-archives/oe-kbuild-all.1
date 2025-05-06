Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A1F2747B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 19:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746561546; cv=none; b=XSbDStbvFx8jaA4ZVZg3/WmHJ8/2jsACWvVg5OpPQcdP4Jte05VyutTKB51jvU26enujeKXLwodCwKxOOWg4Ex4eoH09M2ve/n8KOeCEKUf1PtIMOk5hWJuL0kLYqm6K2ZeSi06g9U9cYng938d0HzIsI4DoUUq5KqV9RNlcjZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746561546; c=relaxed/simple;
	bh=cam0lQT+ASjrDXZWv90CE3dbzCBwWWLaTei3+1S814I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JGWzRA6EWyu33vCxCvbCPAmpNXbb3TkX1n8L5HV0lQTZUuGNBm0TZIMPi1Ijnad6WcJvCaUQpzYiiHvBQeaEzsrIeKyMZ1xNdilBMQq5t6p3GMf/jAARXgkXMB/BIbwyHzWx04UaBl6nGVXAEWOnbQ0lOcAN2N5FbeiG3KGBDro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4yEDwle; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4yEDwle"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746561544; x=1778097544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cam0lQT+ASjrDXZWv90CE3dbzCBwWWLaTei3+1S814I=;
  b=N4yEDwle26EMGNyHgccbcNGCgUSazZG6fEdKYuh5aYWeJCKdeqsQE5YV
   tj6T8caeQ5PQFbS4qzLUeJhkpPPUOH0HGQT93xD86qYLT5A8UAzmAc1gG
   vgKjyBSCUv/REjT6eds24wwPN/01fI5LyaiKJ8l6jsGK5pKkja9bktInG
   k2DfjYTLbdiZSe//WszJ9Ven3hNmrhd8IP6uumLAb8xrj12Jg9iAluEff
   TBXGmX8RdlTEcZwRqZCdVlYFyotAcc0tbErITY9gdt0ZFoD49KKIFafux
   TYEXV+LDbFLkloYAFi1aRR4x341I9MZoN7L0KZiGCVcd5DYDbxqOdhNBO
   w==;
X-CSE-ConnectionGUID: pi21SMBDS4avWz+no8qkzg==
X-CSE-MsgGUID: +lUoqn1ISVWcVbEFDA4tnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52063270"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="52063270"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 12:59:04 -0700
X-CSE-ConnectionGUID: BqthFXpNQ3eRyrzN0LlYhw==
X-CSE-MsgGUID: lcNwjl/HQqex+/1rjfMMzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="136117405"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 May 2025 12:59:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCORQ-0006pe-1R;
	Tue, 06 May 2025 19:59:00 +0000
Date: Wed, 7 May 2025 03:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1614/1614]
 include/trace/trace_events.h:26:23: warning: 'str__fs__trace_system_name'
 defined but not used
Message-ID: <202505070314.0zdCBK7T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ac2dbcb2630a54db6d68c792a6cfff34c6bd5232
commit: a4f256bae217c9679528b4957b6dc68e52cd4782 [1614/1614] vfs: add bare tracepoints for vfs read and release
config: arm64-randconfig-001-20250506 (https://download.01.org/0day-ci/archive/20250507/202505070314.0zdCBK7T-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505070314.0zdCBK7T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505070314.0zdCBK7T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/read_write.c:483:9: warning: no previous prototype for '__vfs_write' [-Wmissing-prototypes]
     483 | ssize_t __vfs_write(struct file *file, const char __user *p, size_t count,
         |         ^~~~~~~~~~~
   In file included from include/trace/define_trace.h:96,
                    from include/trace/events/fs.h:33,
                    from fs/read_write.c:28:
>> include/trace/trace_events.h:26:23: warning: 'str__fs__trace_system_name' defined but not used [-Wunused-const-variable=]
      26 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:21: note: in expansion of macro '__app__'
      27 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:29:29: note: in expansion of macro '__app'
      29 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:32:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      32 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:35:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      35 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   fs/read_write.c:90: warning: Function parameter or member 'maxsize' not described in 'generic_file_llseek_size'
   fs/read_write.c:90: warning: Excess function parameter 'size' description in 'generic_file_llseek_size'


vim +/str__fs__trace_system_name +26 include/trace/trace_events.h

acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  25) 
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31 @26) #define __app__(x, y) str__##x##y
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  27) #define __app(x, y) __app__(x, y)
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  28) 

:::::: The code at line 26 was first introduced by commit
:::::: acd388fd3af350ab24c6ab6f19b83fc4a4f3aa60 tracing: Give system name a pointer

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
