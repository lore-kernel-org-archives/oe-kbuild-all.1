Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CEB23B0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 04:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737691843; cv=none; b=uJMVuzMph02RU4UsUrYlMx87zvIB9j/pRrnukkiGG2djCMRmcPrqR1JnfJMBxOxSR0OkFcIGCN+ULwITUP8CuEp1vNZ+HBd9nYusS07fp3oKCWAy9tRuhxGS4XcabJgKPEQTsTFBDu1MJ42Q/VdTUgDrKVrJYJVOTlU6xoQ/yZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737691843; c=relaxed/simple;
	bh=xLx30xJ+tqueWxRl/INY13g4Avvshwt77Om+kGJ4u/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QV2UjEQOxG8Ztn0ARtk58LbYwNmGAWCcdF8W69R4HlVlCi3PWImK041BJofacsS9rVRla2XPWFKzBd5qVMziQBbL7xwnIpFheex7SpV2F0Ddqa/AN8rvIKzfSg1l/tjfU+RGR811q9tgNzx1prlsByS4z+YTyM+Tf39pQK1aTFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nTzoL/Sq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTzoL/Sq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737691842; x=1769227842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xLx30xJ+tqueWxRl/INY13g4Avvshwt77Om+kGJ4u/s=;
  b=nTzoL/SqZbxsCB/uqG5Vqe+7qykyJ+CutbCX9PEFpCVP2xjaRYjXPuH9
   5eZFMeyV7UX10XumN68HxOqhpNnFRB1qkkil1NyHrjQeG6LVT/LXkDDqg
   z8M5MLfUwPzDSAzEEGN2Ej8aGFhpBRkdhH/Rg2B9kPGNvIZrNqSAczO0s
   Hb/hLtkklcnQnAYuHPCQJv6L0bucFwoOhQOR3a0/fNDqt+jPi5Rpz4GJS
   C1Xg8vRtW6MTPe2Od1hp1ivPnChqcE2lG1rSJowND4dPDt8tGTrzJQWVx
   tbH7ViVz5gcI02GkSDiQQsFJTWq/DbvQ4suxYvJYlCzh4XRubTlEJCs4Q
   w==;
X-CSE-ConnectionGUID: EMcZWahhRMqID645HbOcLA==
X-CSE-MsgGUID: UbzvSHCCROeLRICN9sL4wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49640023"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49640023"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 20:10:41 -0800
X-CSE-ConnectionGUID: bQSONEZTSbioGFnmJpve+A==
X-CSE-MsgGUID: j7u7xBg7TMivlz6aOm7laA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="130954322"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jan 2025 20:10:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbB1i-000c84-1E;
	Fri, 24 Jan 2025 04:10:38 +0000
Date: Fri, 24 Jan 2025 12:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2717/2717] include/trace/trace_events.h:27:23:
 warning: 'str__fs__trace_system_name' defined but not used
Message-ID: <202501241230.GPAoTpQP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   683824f7f33a10565e9afcc9358ed8004d851077
commit: fb8a60ca5cddddd060fa14bc7348fea7ac035d8d [2717/2717] vfs: add bare tracepoints for vfs read and release
config: x86_64-randconfig-121-20250124 (https://download.01.org/0day-ci/archive/20250124/202501241230.GPAoTpQP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501241230.GPAoTpQP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241230.GPAoTpQP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/fs.h:33,
                    from fs/read_write.c:28:
>> include/trace/trace_events.h:27:23: warning: 'str__fs__trace_system_name' defined but not used [-Wunused-const-variable=]
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


vim +/str__fs__trace_system_name +27 include/trace/trace_events.h

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
