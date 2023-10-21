Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4063F612D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 21:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbwsWOgV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697922866; x=1729458866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YUbIxKCHmq5R9HzT8zGyXPtgHpooMeZyociFVlgLXgA=;
  b=RbwsWOgVofNx173AYAACaWIZqgpGPcDNMDsWXl4sfODiroI2XepkcrJR
   q3a7t2mxgnF5Y6IMeATKIpFIGPijytnovdWyDOrcQyLbiuDnBmMiFpct0
   jgIaJSJ5YdihXofzOUpwVdT37arEeFWISm2udn6dt6sQMc7dFD3bz525N
   bBDV0UZvVOw3fFxB2Fs7nIrvLWJwlIXthrcscWuPE0EOlMBHQcvd3x5R4
   FWpqhFxBVYTgPDJIISw+Vpziq0XAfKFkOB3OnevTRrG8U7yDIX4+egaLU
   e64Gk8MpDnw1Y0Efy8zVb5U7R99uXMiQCv5Rb3HUDgcy/rtpWLLD+qfoz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="450882445"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="450882445"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 14:14:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="734287756"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="734287756"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Oct 2023 14:14:24 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quJIb-0005EY-23;
	Sat, 21 Oct 2023 21:14:21 +0000
Date: Sun, 22 Oct 2023 05:14:03 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 -tip] x86/percpu: Use C for arch_raw_cpu_ptr()
Message-ID: <202310220511.hfMI8MtV-lkp@intel.com>
References: <20231010164234.140750-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010164234.140750-1-ubizjak@gmail.com>

Hi Uros,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[cannot apply to dennis-percpu/for-next tip/auto-latest luto/next linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/x86-percpu-Use-C-for-arch_raw_cpu_ptr/20231011-004532
base:   tip/master
patch link:    https://lore.kernel.org/r/20231010164234.140750-1-ubizjak%40gmail.com
patch subject: [PATCH v2 -tip] x86/percpu: Use C for arch_raw_cpu_ptr()
config: i386-randconfig-062-20231021 (https://download.01.org/0day-ci/archive/20231022/202310220511.hfMI8MtV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220511.hfMI8MtV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220511.hfMI8MtV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   init/calibrate.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
   arch/x86/include/asm/percpu.h:567:49: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/percpu.h:567:49: sparse: sparse: got __seg_fs
   arch/x86/include/asm/percpu.h:579:33: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/percpu.h:579:33: sparse: sparse: got __seg_fs
   init/calibrate.c: note: in included file (through arch/x86/include/asm/timex.h, include/linux/timex.h, include/linux/time32.h, ...):
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_fs
   init/calibrate.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   arch/x86/include/asm/preempt.h:27:16: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:27:16: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:34:15: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:34:15: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:38:19: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:38:19: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:61:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:61:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:66:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:66:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:71:18: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:71:18: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:95:16: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:95:16: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:104:16: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:104:16: sparse: sparse: got __seg_fs
   init/calibrate.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/delay.h):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   init/calibrate.c:279:24: sparse: sparse: Expected ) at end of cast operator
   init/calibrate.c:279:24: sparse: sparse: got __seg_fs
   init/calibrate.c:279:24: sparse: sparse: Expected ) at end of cast operator
   init/calibrate.c:279:24: sparse: sparse: got __seg_fs
   init/calibrate.c:279:24: sparse: sparse: Expected ) at end of cast operator
   init/calibrate.c:279:24: sparse: sparse: got __seg_fs
   init/calibrate.c:279:24: sparse: sparse: Expected ) at end of cast operator
   init/calibrate.c:279:24: sparse: sparse: got __seg_fs
>> init/calibrate.c:279:24: sparse: sparse: incompatible types for operation (+):
>> init/calibrate.c:279:24: sparse:    void
>> init/calibrate.c:279:24: sparse:    unsigned long

vim +279 init/calibrate.c

e6639117d624d5 Peter De Schrijver 2014-06-12  274  
0db0628d901251 Paul Gortmaker     2013-06-19  275  void calibrate_delay(void)
71c696b1d0310d Phil Carmody       2011-03-22  276  {
1b19ca9f0bdab7 Russell King       2011-06-22  277  	unsigned long lpj;
71c696b1d0310d Phil Carmody       2011-03-22  278  	static bool printed;
7afe1845dd1e7c Sameer Nanda       2011-07-25 @279  	int this_cpu = smp_processor_id();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
