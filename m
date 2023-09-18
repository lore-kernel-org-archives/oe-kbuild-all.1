Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ABE450FB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 21:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695073796; x=1726609796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VK9Drx5ZB9mVGLqUzZs+rI2r0wC/1ZzZtxn0Hm3/FUY=;
  b=gdVGXv8jQDRmqPLQSKsTdspoF5vEU36p1MMFEouIbHLiJXMSvDwE57uA
   duE911FXDccLy/7BliRDrWaZVPifRhyxozYIthsvbaU/HNL6eixYqzllC
   dkaxhvntnT318CWaWmvEaEoG2PDNHLv/8INZNa3oPwb8z8EH6+4yCAopO
   mwdvAif1+0Ok0w15wDwPuTcc9O/ZOYs/WQwmGJybRikmpH4LYeqY18HyM
   g5r1Bs9wQ0OxEVdvLoLBtQcamZH1Q0l/5kyvbB/En39c6rGmjmFBtlu3P
   N4Pyk52D99L4r9TT1hKlrEbibNLu8KtObTaMnIWe4kDBsNkXv6bEu/0UF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377095417"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="377095417"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 14:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="1076740171"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="1076740171"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 18 Sep 2023 14:49:52 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiM7q-0006Ye-2t;
	Mon, 18 Sep 2023 21:49:50 +0000
Date: Tue, 19 Sep 2023 05:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Milena Olech <milena.olech@intel.com>,
	Michal Michalik <michal.michalik@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Jiri Pirko <jiri@nvidia.com>
Subject: [net-next:main 8/84] drivers/dpll/dpll_netlink.c:847:3-4: Unneeded
 semicolon
Message-ID: <202309190540.RFwfIgO7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git main
head:   a5ea26536e89d04485aa9e1c8f60ba11dfc5469e
commit: d7999f5ea64bb10d2857b8cbfe973be373bac7c9 [8/84] ice: implement dpll interface to control cgu
config: i386-randconfig-051-20230918 (https://download.01.org/0day-ci/archive/20230919/202309190540.RFwfIgO7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230919/202309190540.RFwfIgO7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309190540.RFwfIgO7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dpll/dpll_netlink.c:847:3-4: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
