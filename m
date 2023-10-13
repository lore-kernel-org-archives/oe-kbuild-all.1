Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7979A2C841
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 22:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cu5Y1QjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697237607; x=1728773607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ewb+Aez+fhRehySPqkvby2x3y8Wpqm9bj0iM3l8q9tk=;
  b=Cu5Y1QjA49WrgLcjTYKgU5FRti5lS/BjKbataBgRqZ0x+AZS0T8p9dYp
   ndaQ5jhu10NmvT7ARrX4K49g8p/a6ySwkgjvMz2X+NLlws3lHI/Vx43UM
   Buox0XuVVraQzqOj1tchr+3DL7EidsF4XUvDKlAmciuDt4sJKO9YzPFlp
   XWcgDqZf7YGdLI9mbsfYwYsAPbeY5ua8V37FdMjj0BRdrCQPN2W01JKSt
   3y3sZYfCsxHxaHArw6xMZSl/BfSxtSzYwYHJ6rqsFFqIhR/kU9vwr91wy
   fQZgddp5+NY06CCmlNA4VwSD5SwU3W5Z7txKwv3/7e0kG1MTHj5uCfHRP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388134468"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="388134468"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 15:52:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871267016"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="871267016"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2023 15:52:57 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrR1b-0005UN-1M;
	Fri, 13 Oct 2023 22:52:55 +0000
Date: Sat, 14 Oct 2023 06:52:03 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2284/30000] drivers/soc/imx/soc-imx8.c:238:5:
 warning: no previous prototype for 'check_m4_enabled'
Message-ID: <202310140642.L7pdt0Iv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 9872ac864756839cbe0557ba4cdc975c44ec70d7 [2284/30000] Merge branch 'clock/next' into next
config: arm64-randconfig-003-20231013 (https://download.01.org/0day-ci/archive/20231014/202310140642.L7pdt0Iv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140642.L7pdt0Iv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140642.L7pdt0Iv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/soc-imx8.c:238:5: warning: no previous prototype for 'check_m4_enabled' [-Wmissing-prototypes]
     238 | int check_m4_enabled(void)
         |     ^~~~~~~~~~~~~~~~


vim +/check_m4_enabled +238 drivers/soc/imx/soc-imx8.c

b199c5a4709cd5 Dong Aisheng 2019-04-19  237  
b199c5a4709cd5 Dong Aisheng 2019-04-19 @238  int check_m4_enabled(void)

:::::: The code at line 238 was first introduced by commit
:::::: b199c5a4709cd5681c7b740829c77780730e6898 soc: imx: fix build error of missing imx_src_is_m4_enabled

:::::: TO: Dong Aisheng <aisheng.dong@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
