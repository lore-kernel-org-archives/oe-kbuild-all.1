Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B9A1CABF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 18:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705429014; cv=none; b=TTsPFQWPEY3CMzRg5LsMxb0cm21BkXMeY+pdDQTVjBbg/9bkKapsjADkW4iN5dNiD/hXxsya1B23vp1CVOcBsugmBkqIb4Kimj1BqccVqGjCQ3rWUxCRQQj/TKB+tIGJvHAg1aPp4R0K/+AQ5+lFnT5axh+LVf6YBfMh+yUBreM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705429014; c=relaxed/simple;
	bh=KNUPmsD5ZPRdgdxtbO3/IuuN1OlB9S54qGLYcjXisWM=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=Jn4QgQpINUGJlPEKiMBTrc988PwsGRvA1mgY34vDT7Y6SBunee9htI971I+JoVl3+4HHkq3M2aDgrP3yy2dG67OFLLd2kUbeltoMiep9ov7+MME5hszZr4qyrtnhAg3RhN/SNuKpUXENwmoFanwl9I3wCdgSz+CuZF1gPIWKBjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNt4ro23; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNt4ro23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705429013; x=1736965013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KNUPmsD5ZPRdgdxtbO3/IuuN1OlB9S54qGLYcjXisWM=;
  b=RNt4ro23KE9hotieIQ/beJrklmPuN3ZaMyB3M1+cGnT+bmOg+CXmZQM8
   EBuiOPRH5mLd6r9OFsCeFs6wi2n9qe1od8gKOJn9ZkPeyKzd6VVhY08Ud
   RoAiDUBuwC3GXtFt9jo7H0LI5oLlLf3Uu6v/8GUz+nswyorMyHxajSJtF
   xDYlVaSwvRojLnxRH/Ue2jmjlRfRtmvfnffU79KvusOOF5cen2fNANsN2
   QyZUJ6VXaPjPvg54MqnqGzbzMt7gh8GDfMJdknDSU4J4cdRRwUBXvRXjY
   HJVSnjPbC9E7NXGKpg3xqXi7sPJgrmNGdZfF5k+kN0cap2tO7jilhO6Yk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6698915"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="6698915"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 10:16:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="957242303"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="957242303"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Jan 2024 10:16:23 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPnz3-00013m-1K;
	Tue, 16 Jan 2024 18:16:21 +0000
Date: Wed, 17 Jan 2024 02:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2379/2425] include/trace/stages/init.h:2:23:
 warning: 'str__bonding__trace_system_name' defined but not used
Message-ID: <202401170210.jpY8kCcH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ec7d78798bfb669efc713c2c416a553a40d4dc77
commit: 69ddcb21328bd29cfd2f64710bdac158f4c90bf6 [2379/2425] drivers: hooks: add bonding driver vendor hooks
config: x86_64-openeuler_defconfig-OLK-6.6-func (https://download.01.org/0day-ci/archive/20240117/202401170210.jpY8kCcH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401170210.jpY8kCcH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401170210.jpY8kCcH-lkp@intel.com/

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
