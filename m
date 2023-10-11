Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEC1814
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 01:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pgm3FPTP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696986847; x=1728522847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yO2zbp4g6B054PlPVAli+XIoKyz9al7LS+sIVuCBe2I=;
  b=Pgm3FPTPyugTWheqahrpdxNwMIemkYvqvkYZ0aruR9+7cmQTXudM3e0+
   BpkBwAR3n6k44gNUz0+9RQGi16E+pHx2SWsU6+QXtorS1vZ0g1SPaJzsN
   7FOxp/kEtGTAgTRQQ1C40cU4/TLWl90Gk+r+Y8OGLf7VxeFyfoAtiAqRl
   JCjKOXi2bx86gV1sIZjNcrD4o7ZePMKCGclu4XW634PtxMMplqew66Oxw
   HI3jnk1iqdKtOuqIRoZhJ6LrTH7EmZkUfvCoK+hZGLzkwW9GClA3cf8V9
   5cbG1k2x99oc+PfRWy4+Q3iXtENpkJknAkAZk+2TeRcECRg7SHR3pKp6T
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387395678"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="387395678"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 18:14:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="783067102"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="783067102"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Oct 2023 18:14:02 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqNnU-0001U6-1B;
	Wed, 11 Oct 2023 01:14:00 +0000
Date: Wed, 11 Oct 2023 09:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jinyu Tang <tangjinyu@tinylab.org>, rostedt@goodmis.org,
	mhiramat@kernel.org, bristot@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ttjjyystupid@163.com, falcon@tinylab.org,
	wangjiexun@tinylab.org, linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jinyu Tang <tangjinyu@tinylab.org>
Subject: Re: [PATCH v1] Ftrace: make sched_wakeup can focus on the target
 process
Message-ID: <202310110813.FxuaTrH0-lkp@intel.com>
References: <20231009153714.10743-1-tangjinyu@tinylab.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009153714.10743-1-tangjinyu@tinylab.org>

Hi Jinyu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on rostedt-trace/for-next v6.6-rc5 next-20231010]
[cannot apply to rostedt-trace/for-next-urgent]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinyu-Tang/Ftrace-make-sched_wakeup-can-focus-on-the-target-process/20231009-234127
base:   linus/master
patch link:    https://lore.kernel.org/r/20231009153714.10743-1-tangjinyu%40tinylab.org
patch subject: [PATCH v1] Ftrace: make sched_wakeup can focus on the target process
config: i386-randconfig-062-20231010 (https://download.01.org/0day-ci/archive/20231011/202310110813.FxuaTrH0-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310110813.FxuaTrH0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110813.FxuaTrH0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/trace_sched_wakeup.c:368:1: sparse: sparse: symbol 'sched_wakeup_mutex' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
