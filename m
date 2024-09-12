Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2223A5BAF0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 04:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726116697; cv=none; b=BUOjx1PdKv8XgFZLbKTSLAvkqGmy3rjSjKenc521w6BNR/cXiqamIiiGgPD0rgBOlB3kwdcKTj7E7y4SGOSnmeUiSz+AM6MOGKqQ8QsN6vR55iItNwBw4cfXd1YR6iqsQDt7c3SFMvJv2SQOQbrG3vrq2D3uS8AI7iEdltuFWrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726116697; c=relaxed/simple;
	bh=5ncC+/sJSwrsGTo077jzFIYnnOSEZCJNBYugRimccic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRSvmHNgqsDtIb6RfbSrVbxq5dM4FylwWtbaVjspVV5cojVDLU7pu9s6SYxaq/LQ3lmQSGrvK+0+OBy4JqYh8jqkTdePWiv8AeMEzLd0nVPz8VzldPci0o7cdfNyVf9gJm2g8f9Hvoo6VUHFjtEdu7UcxvFDhQyzcQfCR7mmlE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Co3KK0oJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Co3KK0oJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726116695; x=1757652695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ncC+/sJSwrsGTo077jzFIYnnOSEZCJNBYugRimccic=;
  b=Co3KK0oJcF70ng3Z19RfT2ladO20o0XyLT5bMmO02Mj0JCfyE40OEHoN
   ivolQT8sNIQ685O9FwoGHr/YXqTxgWg3lOrOqRwBGBysdd+zHzeaw0feZ
   k94lggREoVZ80uF51N9FOr3A8CQZ/z7QtFT5cWFpOy0reZIG+Gnb12OQg
   Sz3ZvkGSCgXCrbahs7/IAMJ0T/PPAzeNTzssmi9js7XPkS1dIJFsQHR1p
   9pHRVPOH5uMWBR/6Q18gJwQNxEdYEbZ8MjIZYYyxiQcXJLT2MqPiI/QWp
   GMvS+eP2ncrMdaXMDOlI8lXnA3ubFEjj17eLHBQAhVonfH0a9C+PSLobo
   Q==;
X-CSE-ConnectionGUID: vTAjfLbJTNmWw0aFBviOyw==
X-CSE-MsgGUID: TKZTUrUkQ4WCi5eooXmhlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28835723"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="28835723"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 21:51:34 -0700
X-CSE-ConnectionGUID: jpsBlml3RuGWcYq4GNQDVw==
X-CSE-MsgGUID: GHanZ0QZS7O2kpA8DGLu6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="72571653"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Sep 2024 21:51:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sobnm-0004XO-1O;
	Thu, 12 Sep 2024 04:51:30 +0000
Date: Thu, 12 Sep 2024 12:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 5544/30000] include/trace/trace_events.h:27:23:
 warning: 'str__bonding__trace_system_name' defined but not used
Message-ID: <202409121219.ZxGnKcyP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   7c98201b2598a42ac2ce6a9036ee4e4349a406ac
commit: b88ceab57674d2035d500a42901eb2e603e8f00c [5544/30000] drivers: hooks: add bonding driver vendor hooks
config: arm64-randconfig-004-20240912 (https://download.01.org/0day-ci/archive/20240912/202409121219.ZxGnKcyP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409121219.ZxGnKcyP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409121219.ZxGnKcyP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/bonding.h:27,
                    from drivers/hooks/vendor_hooks.c:11:
>> include/trace/trace_events.h:27:23: warning: 'str__bonding__trace_system_name' defined but not used [-Wunused-const-variable=]
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/str__bonding__trace_system_name +27 include/trace/trace_events.h

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
