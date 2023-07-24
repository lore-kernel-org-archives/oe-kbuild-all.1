Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08779EC5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 03:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690170577; x=1721706577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YMpA4l7y+ePdnJdeAAV9jQFDyhu3sQCKQd1wgr3p9dU=;
  b=ajD+ZtsluHmXVuRn+cjnm5Qz8asA5nLHDCM9Ti4PWjLzWwjERAAhSnQE
   Z34X023YhcLiJS867rVUYhqmnlbgXKt9KWeBmoZraMROd86wkPyA4A2Pm
   RTada4LO8M8SobSOC8eniC7uEwn9raDdvKsljVBfVpwURIfKH/5GhyeFZ
   5xgCMeqYslNbFA8nWR7A5RJCiUd37+rj2pmdoI56Ol6ZcVBJjlkVXURPN
   WEmZMo9tQo1sre7Ck4QWS3alzFBLowNFPf9rNZ6ko0aLa97swokTVeRCs
   UwgMSExgifLFDx3ld7sw3EvOQIt4HXA5nNkZvd/vOqRs61Ye8sr7eeixQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="364799093"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="364799093"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 20:49:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="760629386"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="760629386"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 23 Jul 2023 20:49:27 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNmZb-0009T5-0p;
	Mon, 24 Jul 2023 03:49:27 +0000
Date: Mon, 24 Jul 2023 11:48:23 +0800
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
Message-ID: <202307241130.Ay2R8Hnf-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.5-rc3 next-20230721]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/firmware-imx-scu-change-init-level-to-subsys_initcall_sync/20230724-101304
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20230724014711.2048958-7-peng.fan%40oss.nxp.com
patch subject: [PATCH V3 6/8] firmware: imx: scu-irq: export imx_scu_irq_get_status
config: csky-randconfig-r011-20230724 (https://download.01.org/0day-ci/archive/20230724/202307241130.Ay2R8Hnf-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307241130.Ay2R8Hnf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307241130.Ay2R8Hnf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/can/flexcan/flexcan-core.c:19:
>> include/linux/firmware/imx/sci.h:52:5: warning: no previous prototype for 'imx_scu_irq_get_status' [-Wmissing-prototypes]
      52 | int imx_scu_irq_get_status(u8 group, u32 *irq_status)
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/imx_scu_irq_get_status +52 include/linux/firmware/imx/sci.h

    51	
  > 52	int imx_scu_irq_get_status(u8 group, u32 *irq_status)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
