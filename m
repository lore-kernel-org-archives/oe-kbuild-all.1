Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9473915CC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 01:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679536627; x=1711072627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AOaSIlwCUsIpDTclzW9GoxbdemwcG9Jdhr/dYoorob4=;
  b=kEvaG11plclAHJdYPEUHe46zO+Rx7nfv6NmdSuzfEFTrRxMzIYCL2Z76
   yNLOjcrIXfzeY/9UX85kwIAPWr3MTp+lL4zPquKAFa/5p4wYLwMOPN289
   ++3CzrOlc3BBhAbXaRMM5zKe09OlNlM3/oJRmZVNXZLbyR11VZ4RFZEMz
   RdpUXLLvOi6QI5dOYDsaGFcnR0U52ozSM1e6cLZn7HQ390YihRLXE7NQ/
   SeBexWLBcyr9PXgm22uqK2vJ6HicGRfqF8atwBBBj6fzL0diaZjKdN+/f
   zDO3LcjxgE8dnp2p/aJP0ryyjnk1MHxCPxcQ6bdkAUZ/GbUlvJt8ODI11
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="340912684"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="340912684"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 18:57:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="771268782"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="771268782"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2023 18:57:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfACN-000Dpq-2w;
	Thu, 23 Mar 2023 01:57:03 +0000
Date: Thu, 23 Mar 2023 09:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Ross Zwisler <zwisler@google.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH] tracing: Trace instrumentation begin and end
Message-ID: <202303230955.doWocaU3-lkp@intel.com>
References: <20230321215121.71b339c5@gandalf.local.home>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321215121.71b339c5@gandalf.local.home>

Hi Steven,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc3 next-20230322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Trace-instrumentation-begin-and-end/20230322-095354
patch link:    https://lore.kernel.org/r/20230321215121.71b339c5%40gandalf.local.home
patch subject: [PATCH] tracing: Trace instrumentation begin and end
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230323/202303230955.doWocaU3-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/1f40755bb9b4817135459d6cf76fcbd17ffb53dd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Steven-Rostedt/tracing-Trace-instrumentation-begin-and-end/20230322-095354
        git checkout 1f40755bb9b4817135459d6cf76fcbd17ffb53dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303230955.doWocaU3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .text+0x2bb7f2: relocation to !ENDBR: .text+0x2bb7e9
   vmlinux.o: warning: objtool: .text+0x2bb803: relocation to !ENDBR: .text+0x2bb7e2


objdump-func vmlinux.o .text:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
