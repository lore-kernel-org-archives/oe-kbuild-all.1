Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A086262C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 00:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FreMuZeu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697762261; x=1729298261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8iubCs15//k2GBeV+ULutuA4rmgbIK1gDzdV1fVOCXc=;
  b=FreMuZeu1n8d+Ufa/OAWivX26IQFI84ItBedIPUry3Tp3Z2W75cexmhZ
   RrJizM+7DhC0B0Fh7G4HCLX2cAa3kJntUECs8F7G0WHav9oJXyTt5sdu1
   UmW0wGjNWvIexie2OlgV2/00BjPXLK3t6dPQVH9Obqn+o6I0rpRs8ipQo
   Ikeejqx6yz1aAZVI9MX9ssAY62V1FllHm0cQRrl2pVKGfklLjXz8wRCei
   zqxZ4QPpd9VpmLiBKCqX5T8vzfNru9MFxPgLyZe+Nfvrm3Mj3LQEe2Y5z
   xE+wsB5C2NGP6qtzvSql5aWo1ltFxP9Tye9gVeiKTLTWwTfnGw0opqura
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385279698"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="385279698"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 17:37:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="733784145"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="733784145"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Oct 2023 17:37:37 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtdWB-0002mW-0U;
	Fri, 20 Oct 2023 00:37:35 +0000
Date: Fri, 20 Oct 2023 08:37:07 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>, Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>, Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>,
	linux-fpga@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fpga: xilinx-pr-decoupler: Fix unused
 xlnx_pr_decoupler_of_match warning for !CONFIG_OF
Message-ID: <202310200826.9spStghB-lkp@intel.com>
References: <20231012192149.1546368-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012192149.1546368-1-robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build errors:

[auto build test ERROR on xilinx-xlnx/master]
[also build test ERROR on linus/master v6.6-rc6]
[cannot apply to next-20231019]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring/fpga-xilinx-pr-decoupler-Fix-unused-xlnx_pr_decoupler_of_match-warning-for-CONFIG_OF/20231017-112523
base:   https://github.com/Xilinx/linux-xlnx master
patch link:    https://lore.kernel.org/r/20231012192149.1546368-1-robh%40kernel.org
patch subject: [PATCH] fpga: xilinx-pr-decoupler: Fix unused xlnx_pr_decoupler_of_match warning for !CONFIG_OF
config: parisc-randconfig-002-20231019 (https://download.01.org/0day-ci/archive/20231020/202310200826.9spStghB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200826.9spStghB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200826.9spStghB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/fpga/xilinx-pr-decoupler.c:179:35: error: 'xlnx_pr_decoupler_of_match' undeclared here (not in a function); did you mean 'xlnx_pr_decoupler_data'?
     179 |                 .of_match_table = xlnx_pr_decoupler_of_match,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   xlnx_pr_decoupler_data


vim +179 drivers/fpga/xilinx-pr-decoupler.c

   173	
   174	static struct platform_driver xlnx_pr_decoupler_driver = {
   175		.probe = xlnx_pr_decoupler_probe,
   176		.remove = xlnx_pr_decoupler_remove,
   177		.driver = {
   178			.name = "xlnx_pr_decoupler",
 > 179			.of_match_table = xlnx_pr_decoupler_of_match,
   180		},
   181	};
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
