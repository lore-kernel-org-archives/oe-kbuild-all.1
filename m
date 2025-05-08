Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEFB101C8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746666329; cv=none; b=bKOj72pLZDaQ9o0kyaHC7h4KUYjmrQw90lQXV8Cjpjbk4rBbBdzzqw7Z14xLPhYwtwueWCi1irDDEw2LVIvLsgMsBCWrxcy4dpd7xPBURWDvYugu3eFzSCZyoCrRPiYfTDSqFOHqqtld3MTphFBuNbASf3moYxC73xBqW+JLUrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746666329; c=relaxed/simple;
	bh=+OBmtRyqGrqdk0BfHILE2cvp1hVJ9ArGFKGPg8MWcBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dbphjP0iSZvI574qpT44hQomXef/fucSN7HxXZVSfwu4KruG+e1tPs64z6l2W1vzImhfBnwkmap/MXIvJFEw4nO2s+l/wNX94TIPac80vdOFUA6oYe/gdfyGcEipSv1BPJn1ns5VCiXOn89n910P6tSgks/RMom1k5mAvoDA6tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETwDlxue; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETwDlxue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746666328; x=1778202328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+OBmtRyqGrqdk0BfHILE2cvp1hVJ9ArGFKGPg8MWcBM=;
  b=ETwDlxueXAAg/9jlOiuDRlZSio00cajnuOWozBWkTe6dLr7Y/TptyMVA
   mr7Hhk4GdsG08S/YSosqeKJgObnMrtYOEZyN5GJVaOP5840YUO2bQ6pU9
   nHKLGAF+MjjgOXJ+pRGlex8xqHwO5KuebszoP1x43PyTwSSB3VHLL/G8D
   AKCEjN7dwtYhyW17l8swBkqTZNO/KTy81beIFgP1rh8ntZDG5L43T+4Sd
   XjGv5Fe6N/cc+TMaYSn1vBPesgOFcZat+uW57aTjj3nzgsJ/O/Tzehgka
   yrL4oQSzqHnU22juKQ0gIlpNjvVo65c4k43kkzW+bVjeJeIyqq2nKaqdR
   w==;
X-CSE-ConnectionGUID: qRBbaDbiT6SleCMmPpUfZA==
X-CSE-MsgGUID: ztMlrB+kRb+jsaf7S6J9Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47531539"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="47531539"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 18:05:09 -0700
X-CSE-ConnectionGUID: 6XLezF0qT7SmHGl47JC0Og==
X-CSE-MsgGUID: /kIa41esQfadnkmHvOY+uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="141003950"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 May 2025 18:04:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCpgo-0009Af-0K;
	Thu, 08 May 2025 01:04:42 +0000
Date: Thu, 8 May 2025 09:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhengchao Shao <shaozhengchao@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2208/2208] include/trace/stages/init.h:2:23:
 warning: 'str__bonding__trace_system_name' defined but not used
Message-ID: <202505080910.94UlZrA0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wei,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66448995cc552d846c7442188f69e833f4a86676
commit: 69ddcb21328bd29cfd2f64710bdac158f4c90bf6 [2208/2208] drivers: hooks: add bonding driver vendor hooks
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250508/202505080910.94UlZrA0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505080910.94UlZrA0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505080910.94UlZrA0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/bonding.h:27,
                    from drivers/hooks/vendor_hooks.c:11:
>> include/trace/stages/init.h:2:23: warning: 'str__bonding__trace_system_name' defined but not used [-Wunused-const-variable=]
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


vim +/str__bonding__trace_system_name +2 include/trace/stages/init.h

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
