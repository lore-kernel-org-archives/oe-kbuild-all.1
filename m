Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A24EA9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 06:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690180515; x=1721716515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kLXxeOJhmgMtiKhZdKzMeA29Pw6z5lzHICvjZqSFmm0=;
  b=OtG281uoU1ck+4mQHenbto0MFSh8t+fikF/miFvWX89tOO9SsqEc4aLd
   Bpk1Ps04G2ginIDm4/tJhfU/HlMPs85zLuU0VHoXGSvDgswab/mGYh0i2
   VBl2P+WORFarFl1N3LlfoFDlvzXfvmlVtNtSPmQOiXrVFJ7byIJDlyFo3
   aWVPaU7gWU1gR+y1fkshJIUOvhgcRUMIqeqRqcQnBdjgNxTrmZDET20oj
   STw10LYD04nMWTewqrW295LDxJ0GWV1lSWCHtioIt1Wu6o7kVUE+pgeS5
   ivCvRa0yMjfhhQdSW+kVo36RJL1AgChZ4UA7pCUIcbW3uCGPHKtv5NHSJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="453738287"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="453738287"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 23:35:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="728798987"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="728798987"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jul 2023 23:34:53 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNp9a-0009Xs-2M;
	Mon, 24 Jul 2023 06:34:50 +0000
Date: Mon, 24 Jul 2023 14:34:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: oe-kbuild-all@lists.linux.dev, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
	alexander.stein@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3 6/8] firmware: imx: scu-irq: export
 imx_scu_irq_get_status
Message-ID: <202307241442.nX6M25Pa-lkp@intel.com>
References: <20230724014711.2048958-7-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724014711.2048958-7-peng.fan@oss.nxp.com>

Hi Peng,

kernel test robot noticed the following build errors:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on linus/master v6.5-rc3 next-20230721]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/firmware-imx-scu-change-init-level-to-subsys_initcall_sync/20230724-101304
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20230724014711.2048958-7-peng.fan%40oss.nxp.com
patch subject: [PATCH V3 6/8] firmware: imx: scu-irq: export imx_scu_irq_get_status
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230724/202307241442.nX6M25Pa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307241442.nX6M25Pa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307241442.nX6M25Pa-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/ethernet/freescale/fec_ptp.o: in function `imx_scu_irq_get_status':
>> fec_ptp.c:(.text+0xc2c): multiple definition of `imx_scu_irq_get_status'; drivers/net/ethernet/freescale/fec_main.o:fec_main.c:(.text+0x6894): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
