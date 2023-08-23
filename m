Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17389C2E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 19:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692820719; x=1724356719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DWpi1WF0A7pyHfE5VmRDXpAMGPRbGG/nl9Ypmh1P914=;
  b=ZHphwjNahYrYwzG9d5OV/f8If8ce/bliA7O46Xj5tIUd22lJkTwgZXcp
   GecKpCdXsTKYDeMKrruvHwFJxA9Xlsee6gkCLTY0MUEHjYKRJuBMfHiFI
   N2lq3cYGr0Mzhoq9f3Y2RjkYY6B/ZZksPUnkFmcISH0EGqjjElBgeE/L6
   q731Y9LCqD2hmoG+nZVeDFjgnnZaVkWrtcuPze+kPIOpNi2DcWs1fiLFZ
   I/N91+nyYhZ/ToNL9hATmdsR3d0G1k3f62f5ViVAg3Ie8WdLLK36R1x4e
   /r2ddcGRM+S7JF+4XfiQoob1r7B2wQFpLcusHOiL/HKdIRJD4kUNrj4Wy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="460619961"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="460619961"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 12:58:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="826848502"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="826848502"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Aug 2023 12:58:32 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYtzj-0001Si-1b;
	Wed, 23 Aug 2023 19:58:27 +0000
Date: Thu, 24 Aug 2023 03:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Sumit Garg <sumit.garg@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Lecopzer Chen <lecopzer.chen@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, ito-yuichi@fujitsu.com,
	Stephen Boyd <swboyd@chromium.org>,
	Thomas Gleixner <tglx@linutronix.de>, Chen-Yu Tsai <wens@csie.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Masayoshi Mizuma <msys.mizuma@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Ingo Molnar <mingo@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 4/6] arm64: smp: Add arch support for backtrace using
 pseudo-NMI
Message-ID: <202308240309.hI0bjoys-lkp@intel.com>
References: <20230822142644.v10.4.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822142644.v10.4.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c@changeid>

Hi Douglas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on tip/irq/core arm-perf/for-next/perf linus/master v6.5-rc7 next-20230823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Douglas-Anderson/irqchip-gic-v3-Enable-support-for-SGIs-to-act-as-NMIs/20230823-053216
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230822142644.v10.4.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c%40changeid
patch subject: [PATCH v10 4/6] arm64: smp: Add arch support for backtrace using pseudo-NMI
config: arm64-randconfig-r026-20230823 (https://download.01.org/0day-ci/archive/20230824/202308240309.hI0bjoys-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240309.hI0bjoys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240309.hI0bjoys-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/smp.c:855:6: warning: no previous prototype for 'arm64_backtrace_ipi' [-Wmissing-prototypes]
     855 | void arm64_backtrace_ipi(cpumask_t *mask)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/arm64_backtrace_ipi +855 arch/arm64/kernel/smp.c

   854	
 > 855	void arm64_backtrace_ipi(cpumask_t *mask)
   856	{
   857		__ipi_send_mask(ipi_desc[IPI_CPU_BACKTRACE], mask);
   858	}
   859	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
