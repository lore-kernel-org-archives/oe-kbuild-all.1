Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F29018B02
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 23:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695944429; x=1727480429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k/f/gKQZGDaEsUvegbnb3e92P2w+7dVz08wKtD7/Pgs=;
  b=Kg60fZQkBuGsrnrutV7gPZwJ7hBl4UlY7HlvSJxWkhCmUI5e5PrEGDZQ
   DwElSB1cLz/7cYermGFv11IaHpOzQ+K/91E86YXLHBxgUtmyOvq0k96sY
   I818LqzBXR5Lq3wI6ogh1/Q2ceiFaANOeyjooLOy5HJcXRIvboiTwaSAb
   BJLobKZl1yaK57CKo8DXKCe+4tKU9RU4UdRqC8cJe8SlIm9B7YVIzJksW
   yhJT07lW+W18CIZ+Zk+G8dIoGMU0yLCFrzJYCVJZux4OZN9ArJ2ia+rLs
   f983YJ76Yew/hftoVEKnZfQUbW5KpTCiXUxbR2jqe7cQYrxtnqP0cMVnn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="3771151"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="3771151"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 16:39:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="749782827"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="749782827"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 28 Sep 2023 16:39:57 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm0bq-00029Z-2s;
	Thu, 28 Sep 2023 23:39:54 +0000
Date: Fri, 29 Sep 2023 07:39:46 +0800
From: kernel test robot <lkp@intel.com>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 88/1370]
 drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:1269:31: sparse: sparse:
 incorrect type in return expression (different base types)
Message-ID: <202309290707.ZFyEb8Lo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 94ece3554bcf455d4f036547a7030a774bbeec9c [88/1370] staging: xlnx_tsmux: Initial version of xlnx mpeg2tsmux driver
config: i386-randconfig-062-20230929 (https://download.01.org/0day-ci/archive/20230929/202309290707.ZFyEb8Lo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290707.ZFyEb8Lo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290707.ZFyEb8Lo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:1269:31: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:1269:31: sparse:     expected restricted __poll_t
   drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:1269:31: sparse:     got int

vim +1269 drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c

  1261	
  1262	static __poll_t xlnx_tsmux_poll(struct file *fptr, poll_table *wait)
  1263	{
  1264		struct xlnx_tsmux *mpgmuxts = fptr->private_data;
  1265	
  1266		poll_wait(fptr, &mpgmuxts->waitq, wait);
  1267	
  1268		if (xlnx_tsmux_read(mpgmuxts, XTSMUX_LAST_NODE_PROCESSED))
> 1269			return POLLIN | POLLPRI;
  1270	
  1271		return 0;
  1272	}
  1273	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
