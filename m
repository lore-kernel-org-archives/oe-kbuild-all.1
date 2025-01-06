Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D74E1CA9C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 06:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736144283; cv=none; b=BuvMm/gRH8bX6zjtevK9btZvw76Gymw9VGHb1HZMs9s2kAKWC8aENiTe9dB73ZnAFHHzKGP/DcroDKnYt4RjxqfLIoEz6qiUmwJJpC3zpyOwIa21yX17a1AVXILGnNuToHP7+pW4TBV+kBgDg35QZbKKMglygmbBfxJH8ndZkIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736144283; c=relaxed/simple;
	bh=QV1JsIPBOREGvNV27gIoYpiER0XMks9iA3E72JZj/FA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RUjQsAb4X0Htk+9WB4W/2+Uf9MXknjbyPmuFpvoHjIihIU4SCdkToZnvl5dAYzBncUVMDNjrey9go2pckCauly1RRv9s8WQjP+SU5pU0pqt1jPDkLLtfoM8lFddR0QbwLITlMzxEOkCWRgpq1zvS6BxKvTDEZZFzStKLwWgRfmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYR6Vaa4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYR6Vaa4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736144283; x=1767680283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QV1JsIPBOREGvNV27gIoYpiER0XMks9iA3E72JZj/FA=;
  b=PYR6Vaa4cd/e/5o1UG79V/DVesxT7/gHDxkuYzoEZ89TVud11a4jt3j9
   QzI0G4tXHJ904+3+Du38SLs+oJJ29Jk454u1HMxCSF8O2FM0Kob5Gv8Bz
   aYflF5ObSUcD13FkQSCZuRl2f2w2+/USqBUigkBgQG56c2v0zKYdkP5Jm
   1PV5Jk5crsahU8mCVPIBEiDF/XLqGC+DfIt4Mt+5CE9rl3BxTq3mcJQqz
   L1/w91pD5MuHy2MnwQ19qWNlV/tSmjbiLK5nOLsOnPkmJHg5X1WPHgSDH
   lnuBXpbWuszsgRLPzlpzhPCNkBuKzQhTiF7Wj43n2Jq77ay1KP/xzx83y
   g==;
X-CSE-ConnectionGUID: WEX29r77SuePifOTaa00Lw==
X-CSE-MsgGUID: 81XM5OXURb24OkLVSYKBPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="58748481"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="58748481"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 22:18:02 -0800
X-CSE-ConnectionGUID: DR+xzxtqTii0KU+0yWndSw==
X-CSE-MsgGUID: v4XKlng3Qyi8Dekw4On9rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="107412435"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Jan 2025 22:18:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUgR4-000CJT-1B;
	Mon, 06 Jan 2025 06:17:58 +0000
Date: Mon, 6 Jan 2025 14:17:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/trace/stages/init.h:2:23: warning:
 'str__irq_vectors__trace_system_name' defined but not used
Message-ID: <202501061455.3mO4FN32-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steven,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d89551994a430b50c4fffcb1e617a057fa76e20
commit: af6b9668e85ffd1502aada8036ccbf4dbd481708 tracing: Move the defines to create TRACE_EVENTS into their own files
date:   2 years, 10 months ago
config: i386-randconfig-063-20231024 (https://download.01.org/0day-ci/archive/20250106/202501061455.3mO4FN32-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061455.3mO4FN32-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501061455.3mO4FN32-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from arch/x86/include/asm/trace/irq_vectors.h:383,
                    from arch/x86/kernel/irq.c:27:
>> include/trace/stages/init.h:2:23: warning: 'str__irq_vectors__trace_system_name' defined but not used [-Wunused-const-variable=]
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


vim +/str__irq_vectors__trace_system_name +2 include/trace/stages/init.h

   > 2	#define __app__(x, y) str__##x##y
     3	#define __app(x, y) __app__(x, y)
     4	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
