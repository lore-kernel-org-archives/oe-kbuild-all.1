Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD80815A4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 02:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695262941; x=1726798941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o8JY+DoFA4RXIWxXYxbi0dih/PLLXhU57Oeh+PgN1V4=;
  b=Q0UGSZeqaC3nRW7WKKDQtlejku7RaYP1vhu6oWlrgOR2s1HWD1ZBKAJB
   xc6g2u0soH9C+fwQO0ZjFHKdV+qxYfuWeP99vqcZLIZmDYIGP2D0gnzg0
   RJ8dLT8hWT2ETEKUZa92PVjsdvjI20wado4mveTXMbQKuwGzLOcycoQHI
   2XW/1OtiXYizd+g1g3u0SN2IotuqCvUTQPpVauyodSrUo7TjZ/R133csu
   vLVu3UIDnxosXFyEqLHXKh+6wws1V0Ylf9COOf6Dm+O3/ibT+LSC7xmhX
   8kfk4yx0GDq1dRo30uTTVTRFnVWW8ivAzaOobeUuvww9RTA5luktModQk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="377698054"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="377698054"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 19:22:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870613606"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="870613606"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 20 Sep 2023 19:22:17 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj9KZ-0009Po-2G;
	Thu, 21 Sep 2023 02:22:15 +0000
Date: Thu, 21 Sep 2023 10:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v4 11/11] media: imx-asrc: Add memory to memory driver
Message-ID: <202309211005.aK6quLsv-lkp@intel.com>
References: <1695202370-24678-12-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1695202370-24678-12-git-send-email-shengjiu.wang@nxp.com>

Hi Shengjiu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on broonie-sound/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.6-rc2 next-20230920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-fsl_asrc-define-functions-for-memory-to-memory-usage/20230920-181051
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/1695202370-24678-12-git-send-email-shengjiu.wang%40nxp.com
patch subject: [RFC PATCH v4 11/11] media: imx-asrc: Add memory to memory driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230921/202309211005.aK6quLsv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211005.aK6quLsv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309211005.aK6quLsv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/nxp/imx-asrc.c:1018:12: warning: 'asrc_m2m_resume' defined but not used [-Wunused-function]
    1018 | static int asrc_m2m_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~
>> drivers/media/platform/nxp/imx-asrc.c:983:12: warning: 'asrc_m2m_suspend' defined but not used [-Wunused-function]
     983 | static int asrc_m2m_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~


vim +/asrc_m2m_resume +1018 drivers/media/platform/nxp/imx-asrc.c

   981	
   982	/* suspend callback for m2m */
 > 983	static int asrc_m2m_suspend(struct device *dev)
   984	{
   985		struct asrc_m2m *m2m = dev_get_drvdata(dev);
   986		struct fsl_asrc *asrc = m2m->asrc;
   987		struct fsl_asrc_pair *pair;
   988		unsigned long lock_flags;
   989		int i;
   990	
   991		for (i = 0; i < PAIR_CTX_NUM; i++) {
   992			spin_lock_irqsave(&asrc->lock, lock_flags);
   993			pair = asrc->pair[i];
   994			if (!pair || !pair->req_pair) {
   995				spin_unlock_irqrestore(&asrc->lock, lock_flags);
   996				continue;
   997			}
   998			if (!completion_done(&pair->complete[V4L_OUT])) {
   999				if (pair->dma_chan[V4L_OUT])
  1000					dmaengine_terminate_all(pair->dma_chan[V4L_OUT]);
  1001				asrc_input_dma_callback((void *)pair);
  1002			}
  1003			if (!completion_done(&pair->complete[V4L_CAP])) {
  1004				if (pair->dma_chan[V4L_CAP])
  1005					dmaengine_terminate_all(pair->dma_chan[V4L_CAP]);
  1006				asrc_output_dma_callback((void *)pair);
  1007			}
  1008	
  1009			if (asrc->m2m_pair_suspend)
  1010				asrc->m2m_pair_suspend(pair);
  1011	
  1012			spin_unlock_irqrestore(&asrc->lock, lock_flags);
  1013		}
  1014	
  1015		return 0;
  1016	}
  1017	
> 1018	static int asrc_m2m_resume(struct device *dev)
  1019	{
  1020		struct asrc_m2m *m2m = dev_get_drvdata(dev);
  1021		struct fsl_asrc *asrc = m2m->asrc;
  1022		struct fsl_asrc_pair *pair;
  1023		unsigned long lock_flags;
  1024		int i;
  1025	
  1026		for (i = 0; i < PAIR_CTX_NUM; i++) {
  1027			spin_lock_irqsave(&asrc->lock, lock_flags);
  1028			pair = asrc->pair[i];
  1029			if (!pair || !pair->req_pair) {
  1030				spin_unlock_irqrestore(&asrc->lock, lock_flags);
  1031				continue;
  1032			}
  1033			if (asrc->m2m_pair_resume)
  1034				asrc->m2m_pair_resume(pair);
  1035	
  1036			spin_unlock_irqrestore(&asrc->lock, lock_flags);
  1037		}
  1038	
  1039		return 0;
  1040	}
  1041	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
