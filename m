Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678817FD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 02:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2ZCjtDE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697681642; x=1729217642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H8Kt3gQmdbca+S6PmzrnWU9+9HnfyjfJ4+J8O9QhowI=;
  b=j2ZCjtDEkM5TOxYXtxwY12xX7Gsa9B0WixFbltMUOrT3/YB8fKr9fSRc
   1+uOOxJdXS0LRvPbWmaBzCYqaJtDYea4+DjLudaqnCNh5288FKYuZEFPr
   CId6e/DSUPcXue3/KkvwTDGS8roWSY9xP2na6DKDu0xllUtTxzr2c2n4o
   HA6CUf7GhN68d5fyicVSpuwYg3Ctn6sQZ5DvXDrPV7zCKHWuSCgRdQiCH
   iQ/6+HR51SxcI0RF2k8afIMsA0ukXd74GB6HIyfHZL1SkKVIC6CHgUuZ/
   K1qlYhOtse8BegU2zv3+6hxTJiHbPiF68TSO0xHE+NrDQwWdk4Vj+qNcb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389018089"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="389018089"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 19:13:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="791833069"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="791833069"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Oct 2023 19:13:40 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtIXa-0001Qk-1H;
	Thu, 19 Oct 2023 02:13:38 +0000
Date: Thu, 19 Oct 2023 10:12:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 03/35] arch/sh: Disable SH specific modules in OF
 enabled.
Message-ID: <202310191009.O9dsNlMy-lkp@intel.com>
References: <7205f371a7bee68ffb9c34a6750d368676b49606.1697199949.git.ysato@users.sourceforge.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7205f371a7bee68ffb9c34a6750d368676b49606.1697199949.git.ysato@users.sourceforge.jp>

Hi Yoshinori,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on robh/for-next pci/next pci/for-linus linus/master v6.6-rc6 next-20231018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yoshinori-Sato/arch-sh-boot-compressed-head_32-S-passing-FDT-address-to-initialize-function/20231017-170254
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/7205f371a7bee68ffb9c34a6750d368676b49606.1697199949.git.ysato%40users.sourceforge.jp
patch subject: [RFC PATCH v3 03/35] arch/sh: Disable SH specific modules in OF enabled.
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231019/202310191009.O9dsNlMy-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310191009.O9dsNlMy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191009.O9dsNlMy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/sh/kernel/cpu/sh2/clock-sh7619.c:29:10: error: 'struct sh_clk_ops' has no member named 'init'
      29 |         .init           = master_clk_init,
         |          ^~~~
>> arch/sh/kernel/cpu/sh2/clock-sh7619.c:29:27: error: initialization of 'int (*)(struct clk *)' from incompatible pointer type 'void (*)(struct clk *)' [-Werror=incompatible-pointer-types]
      29 |         .init           = master_clk_init,
         |                           ^~~~~~~~~~~~~~~
   arch/sh/kernel/cpu/sh2/clock-sh7619.c:29:27: note: (near initialization for 'sh7619_master_clk_ops.enable')
   cc1: some warnings being treated as errors


vim +29 arch/sh/kernel/cpu/sh2/clock-sh7619.c

9d4436a6fbc8c5 Yoshinori Sato 2006-11-05  27  
71984236d6112d Magnus Damm    2012-02-29  28  static struct sh_clk_ops sh7619_master_clk_ops = {
9d4436a6fbc8c5 Yoshinori Sato 2006-11-05 @29  	.init		= master_clk_init,
9d4436a6fbc8c5 Yoshinori Sato 2006-11-05  30  };
9d4436a6fbc8c5 Yoshinori Sato 2006-11-05  31  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
