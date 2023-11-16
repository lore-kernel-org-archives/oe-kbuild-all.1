Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B7517C2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 04:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dk1NTE41"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700109964; x=1731645964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u7AwYwkUc08u3aSNm79nVuehY1RYI7AdNm42j1ZAAKc=;
  b=dk1NTE41qtpTDaJYVfOrjWncrp2bglym29dEaLJlrGylYgIGfWaZtVcG
   vk1La5PBfXgbRWwGc44JXeBA2IfFbfDhr8F4I8BV01RAmRLz9rs41YaIv
   Nset2FDRhYHq4telij1uCbyUhUE08K1KSqJ6YTItCz+9c+0XT0tQyb2pV
   29UBZJkuPB4UZWMeIMv1yq5KV++efynGjjrq78bVrdtG1bw0eS//eipW9
   j59cEPXHD3u3q8z1t+4QOexftml2e/99CRShzUha/a+RjrCUbXcQq8zXU
   c+av4le0TW9a/yTaTkpKOm0Cisda/HAWVyKMAJjD8/u31nvHu6EViFoz4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="376058636"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="376058636"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 20:46:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="800063202"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="800063202"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Nov 2023 20:46:02 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3UGO-0001Id-0J;
	Thu, 16 Nov 2023 04:46:00 +0000
Date: Thu, 16 Nov 2023 12:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelaf@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: kernel/time/tick-sched.c:995: warning: Function parameter or member
 'cpu' not described in 'tick_nohz_get_idle_calls_cpu'
Message-ID: <202311161213.8QKZqSLs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 466a2b42d67644447a1765276259a3ea5531ddff cpufreq: schedutil: Use idle_calls counter of the remote CPU
date:   6 years ago
config: x86_64-randconfig-x012-20230629 (https://download.01.org/0day-ci/archive/20231116/202311161213.8QKZqSLs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311161213.8QKZqSLs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311161213.8QKZqSLs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/include/asm/bitops.h: Assembler messages:
   arch/x86/include/asm/bitops.h:225: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
   arch/x86/include/asm/bitops.h:271: Warning: no instruction mnemonic suffix given and no register operands; using default for `btr'
   arch/x86/include/asm/bitops.h:225: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
   kernel/time/tick-sched.c:500: warning: Function parameter or member 'now' not described in 'tick_nohz_update_jiffies'
>> kernel/time/tick-sched.c:995: warning: Function parameter or member 'cpu' not described in 'tick_nohz_get_idle_calls_cpu'
   kernel/time/tick-sched.c:1248: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Async notification about clocksource changes
   kernel/time/tick-sched.c:1269: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Check, if a change happened, which makes oneshot possible.
   kernel/time/tick-sched.o: warning: objtool: tick_nohz_stop_sched_tick()+0xb1a: sibling call from callable instruction with modified stack frame
   kernel/time/tick-sched.o: warning: objtool: __tick_nohz_idle_enter()+0x398: sibling call from callable instruction with modified stack frame
   kernel/time/tick-sched.o: warning: objtool: tick_do_update_jiffies64.part.0()+0x2a4: sibling call from callable instruction with modified stack frame
   kernel/time/tick-sched.o: warning: objtool: tick_nohz_idle_enter()+0x13f: sibling call from callable instruction with modified stack frame
   kernel/time/tick-sched.o: warning: objtool: tick_setup_sched_timer()+0x227: sibling call from callable instruction with modified stack frame
   kernel/time/tick-sched.o: warning: objtool: tick_check_oneshot_change()+0x8d: sibling call from callable instruction with modified stack frame


vim +995 kernel/time/tick-sched.c

   987	
   988	/**
   989	 * tick_nohz_get_idle_calls_cpu - return the current idle calls counter value
   990	 * for a particular CPU.
   991	 *
   992	 * Called from the schedutil frequency scaling governor in scheduler context.
   993	 */
   994	unsigned long tick_nohz_get_idle_calls_cpu(int cpu)
 > 995	{
   996		struct tick_sched *ts = tick_get_tick_sched(cpu);
   997	
   998		return ts->idle_calls;
   999	}
  1000	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
