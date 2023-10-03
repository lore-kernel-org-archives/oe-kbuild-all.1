Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A2E7F4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 03:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696304177; x=1727840177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nCmiH57oZv9WAv0vgBGKqzAWdVJ+jN5ugCWsYTfPrz4=;
  b=cyLwrgjPcTAyk7cXJv37t7gpZXC+PA81YwC27SitANK/0sktwg8rXm+C
   VgcBLmy/EXaixuOIetCQvLP24WEUriaHnkRRyt7+1s4BalzZpZRiWSFpr
   ujxt3jr4XoVK/T64+iiGbFsr9FIZjWvvNCSpEThnxhtoJJZ5yATsTMNZN
   jfvVt4bFPc8ZuoTlJjvRT3oJHjWuy4DWv25dEQcVe60SAoChhQSctf5ES
   Klcdy3264Sz/Q/dbaXZhElR+ff/zoUMVXDqVZDLqGof9Jhxy1Nu5mvouC
   j2Lxv9QrGZUYektoqFDBEBsN7Zr7iTqQ4Bf/MUHXMWkpfHpnx2tsMJhtj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="385607262"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="385607262"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 20:36:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="894330749"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="894330749"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Oct 2023 20:34:52 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnWCj-0006iz-1N;
	Tue, 03 Oct 2023 03:36:13 +0000
Date: Tue, 3 Oct 2023 11:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/4] mm/mempolicy: Implement set_mempolicy2 and
Message-ID: <202310031100.eM0lYYkL-lkp@intel.com>
References: <20231003002156.740595-3-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003002156.740595-3-gregory.price@memverge.com>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-mempolicy-refactor-do_set_mempolicy-for-code-re-use/20231003-082354
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231003002156.740595-3-gregory.price%40memverge.com
patch subject: [RFC PATCH v2 2/4] mm/mempolicy: Implement set_mempolicy2 and
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20231003/202310031100.eM0lYYkL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310031100.eM0lYYkL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310031100.eM0lYYkL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: arch/x86/entry/syscall_32.o:(.rodata+0x718): undefined reference to `__ia32_sys_set_mempolicy2'
>> ld: arch/x86/entry/syscall_32.o:(.rodata+0x71c): undefined reference to `__ia32_sys_get_mempolicy2'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
