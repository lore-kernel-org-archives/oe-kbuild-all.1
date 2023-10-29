Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD57A377
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Oct 2023 02:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qd9v9vn3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698547310; x=1730083310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gJgl0Tbuq1PMUqtQZsw8Ijx0YJdzZNS1T/3zAvMYNg8=;
  b=Qd9v9vn3JMC6eQza6zZyPShtFIGbQ57FLGOJURh/LGSZloeJGpqR+RbE
   RA637fXeiKvbBm4aIyAAOEPdiJijDdQI3TtVdh6RSXSOhLc1sVNGAgAh7
   6CpmgvxuNC7/YAOMH+3+dJS5rusSl1fhD6fuyRx5VpcYYHexha2U/I1ug
   Th3hhV/JuL70+6A+MFnS+Rqe22WbP//KA20pDPfgWGT7zTSrgsKHYNy5X
   Q036pTarri5DFzACwILZ6oHpeP1h7mNH7tUnsYsESgHHPSFUPC4DZHaCS
   WdRR6rrVH2gMG4Mp1Y6nivot8/EuaCxSYisiLItK7DmlXz4okY2mdqZDE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="390789895"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="390789895"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 19:41:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="933464643"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="933464643"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Oct 2023 19:41:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwvkG-000CHP-2r;
	Sun, 29 Oct 2023 02:41:44 +0000
Date: Sun, 29 Oct 2023 10:41:35 +0800
From: kernel test robot <lkp@intel.com>
To: York Jasper Niebuhr <yjnworkstation@gmail.com>,
	akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	York Jasper Niebuhr <yjnworkstation@gmail.com>
Subject: Re: [PATCH] Added empty sys_ememz
Message-ID: <202310291059.qzvihDY2-lkp@intel.com>
References: <20231028204046.11258-1-yjnworkstation@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231028204046.11258-1-yjnworkstation@gmail.com>

Hi York,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on tip/x86/asm linus/master v6.6-rc7]
[cannot apply to arnd-asm-generic/master next-20231027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/York-Jasper-Niebuhr/Added-empty-sys_ememz/20231029-044215
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231028204046.11258-1-yjnworkstation%40gmail.com
patch subject: [PATCH] Added empty sys_ememz
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231029/202310291059.qzvihDY2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310291059.qzvihDY2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310291059.qzvihDY2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1573:2: warning: #warning syscall ememz not implemented [-Wcpp]
--
>> <stdin>:1573:2: warning: #warning syscall ememz not implemented [-Wcpp]
--
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> <stdin>:1573:2: warning: #warning syscall ememz not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
