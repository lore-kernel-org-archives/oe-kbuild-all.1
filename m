Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2953D75
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 12:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692275716; x=1723811716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XE/+62g8Bmc73ud9Zust5fkgHBtPBHVWQGUqiKlXaR8=;
  b=F+yTQ2RkfT3+8EDeCPsSISi8k4d/hcJjjPfl2nHENmgWMPweoCLwSiXc
   cwJguKzRHvcnPqGb6omO3aBfLrykkF4nZ1QeN4ER1yV0MJULmaQ5h+inh
   NNOf7HQ3LIuRpbX5GJJiCgS/B+AM5LrXQRSYVbLcixfKFuNrkgFpVuhBd
   ew5NfD4urlEpgzWFUWJx4L1pA73VXjKrJE12AOY1bOVaOn+kd4kGnq6lC
   li0gGwXinCvS9d8ZEE2cIdw3YjUsjozJpyUGtzt6pHVheiCjlS+qlRDJf
   nGhAh7S+L7xnMCcbiM0tvZb9rqkNNdlln/A01v6msXBqpwjllZE0wnELR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403778470"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="403778470"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 05:35:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="734652440"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="734652440"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Aug 2023 05:35:12 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWcDY-00018R-02;
	Thu, 17 Aug 2023 12:35:12 +0000
Date: Thu, 17 Aug 2023 20:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH iwl-next v1 2/2] i40e: add
 mdd-auto-reset-vf private flag
Message-ID: <202308171945.ER5x9p9W-lkp@intel.com>
References: <20230811124648.3368659-2-jan.sokolowski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811124648.3368659-2-jan.sokolowski@intel.com>

Hi Jan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-next-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Sokolowski/i40e-add-mdd-auto-reset-vf-private-flag/20230811-204507
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230811124648.3368659-2-jan.sokolowski%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-next v1 2/2] i40e: add mdd-auto-reset-vf private flag
config: x86_64-rhel-8.3-ltp (https://download.01.org/0day-ci/archive/20230817/202308171945.ER5x9p9W-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171945.ER5x9p9W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171945.ER5x9p9W-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/i40e/i40e_main.c:11162: warning: Function parameter or member 'pf' not described in 'i40e_print_vf_rx_mdd_event'


vim +11162 drivers/net/ethernet/intel/i40e/i40e_main.c

 11156	
 11157	/**
 11158	 * i40e_print_vf_rx_mdd_event - print VF Rx malicious driver detect event
 11159	 * @vf: pointer to the VF structure
 11160	 */
 11161	static void i40e_print_vf_rx_mdd_event(struct i40e_pf *pf, struct i40e_vf *vf)
 11162	{
 11163		dev_err_ratelimited(&pf->pdev->dev, "%lld Rx Malicious Driver Detection events detected on PF %d VF %d MAC %pm. mdd-auto-reset-vfs=%s\n",
 11164			vf->mdd_rx_events.count,
 11165			pf->hw.pf_id,
 11166			vf->vf_id,
 11167			vf->default_lan_addr.addr,
 11168			(I40E_FLAG_MDD_AUTO_RESET_VF & pf->flags) ? "on" : "off");
 11169	}
 11170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
