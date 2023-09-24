Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE799CA5C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 18:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695578802; x=1727114802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fwm4J9sXQH+nrqo+o+VmsQeVd70vBhYcLajXYFiHSi4=;
  b=gIbkmrtbUqBNdYWuyFxBGWmyiOO4zdQ2xokdBsr81zNFC0Su1OCnY2fY
   ApC5nau3dTfpoIWptbxUsLKlSSDwCduNZDtIxvfAPlld396Hff7dZnohq
   my43QeGi9zuo9wJOBeroqiYkffDDMYpBR1HkFdjXXHq9EmlWf2o8twSFp
   FFiczG1gMu9lBb9+DXWKSLb0LXEPNX2JaqCBAR14WAq8yv7e8SJZBP3ov
   UU6mh9yS4YiQ74KsRct8ov4kY3AVxa1KearSltraX2saQe4Y9gr9EQmxg
   inv6aeTgc+Q8cl/eOgF234e2Tbdi9wIUI/tgpaKRb4bMBmu/KCxSVWHKT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412051918"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="412051918"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 11:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="777428321"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="777428321"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Sep 2023 11:06:37 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkTV6-0000Gn-0h;
	Sun, 24 Sep 2023 18:06:36 +0000
Date: Mon, 25 Sep 2023 02:05:41 +0800
From: kernel test robot <lkp@intel.com>
To: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Wendy Liang <wendy.liang@xilinx.com>
Subject: [xilinx-xlnx:pr/146 11884/14527]
 drivers/uio/uio_xilinx_ai_engine.c:39:13: warning: variable 'irq' set but
 not used
Message-ID: <202309250250.xwTDuY72-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hyun,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx pr/146
head:   38b0c0cf11566882cda99f8e4f2243924a684be5
commit: 15d16835418c3d35e07f215d2934dcf9e6725cc6 [11884/14527] uio: Add the UIO driver for AI engine
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20230925/202309250250.xwTDuY72-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309250250.xwTDuY72-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309250250.xwTDuY72-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/uio/uio_xilinx_ai_engine.c: In function 'xilinx_ai_engine_debugfs_write':
>> drivers/uio/uio_xilinx_ai_engine.c:39:13: warning: variable 'irq' set but not used [-Wunused-but-set-variable]
      39 |         int irq, ret;
         |             ^~~


vim +/irq +39 drivers/uio/uio_xilinx_ai_engine.c

    33	
    34	static ssize_t xilinx_ai_engine_debugfs_write(struct file *f,
    35						      const char __user *buf,
    36						      size_t size, loff_t *pos)
    37	{
    38		struct irq_domain *irq_sim_domain = file_inode(f)->i_private;
  > 39		int irq, ret;
    40	
    41		irq = irq_find_mapping(irq_sim_domain, 1);
    42		ret = irq_set_irqchip_state(1, IRQCHIP_STATE_PENDING, true);
    43		if (ret)
    44			return ret;
    45	
    46		return size;
    47	}
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
