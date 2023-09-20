Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7285252
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 06:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695192155; x=1726728155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1XBjOvoYIfQgOlX/w7XkfX8AUm99GnKWt+2lESMz/P8=;
  b=ZCW/lDefM4qzkWhgszBZlo0jwzL1DPp7hwjw2+uR+gTKMoeSYF2xtlIO
   33rUCV5ji/oY84jo4XvbrFEHvmqrLwdKRrtwgmXdeCj8mw1VgW9J642m1
   IDccASjINOXl1XjfTXY40wwCsMcD5m8CzmpX9eqZJYOD6ahaL7fbSsUeB
   yhOzfoNyJvKkCkJ31fnCcx5NaSfTSVo7W8VqjewcFyvAf5SL2LnoB9Eq2
   0r5pfLlqNnkA3iBrPtKUr8Sk69JSaym1uzSwaSq7UKOuGwAX9EIYQrmvf
   B4JuSZvxpI0QMtOQEW3+54/1iFwAVoaEOhV0mGegguuHnN+9Yk+F1XPIy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="365192626"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="365192626"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 23:42:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="1077302109"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="1077302109"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 Sep 2023 23:42:33 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiqut-0008Q2-05;
	Wed, 20 Sep 2023 06:42:31 +0000
Date: Wed, 20 Sep 2023 14:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 256/1363] fpga-mgr.c:undefined
 reference to `dma_buf_get'
Message-ID: <202309201429.e9oXYnxC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   4f412ed20fd2c5353c1e878ef9ed77952a5040a1
commit: b026acba70d3b352ce2a5b6d8ff7554c91771d2b [256/1363] fpga: support loading from a pre-allocated buffer
config: s390-randconfig-001-20230920 (https://download.01.org/0day-ci/archive/20230920/202309201429.e9oXYnxC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201429.e9oXYnxC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201429.e9oXYnxC-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/fpga/fpga-mgr.o: in function `fpga_device_ioctl':
>> fpga-mgr.c:(.text+0xf66): undefined reference to `dma_buf_get'
   s390-linux-ld: drivers/fpga/fpga-mgr.o: in function `fpga_mgr_load':
>> fpga-mgr.c:(.text+0x16c8): undefined reference to `dma_buf_attach'
>> s390-linux-ld: fpga-mgr.c:(.text+0x16e0): undefined reference to `dma_buf_map_attachment'
>> s390-linux-ld: fpga-mgr.c:(.text+0x1736): undefined reference to `dma_buf_unmap_attachment'
>> s390-linux-ld: fpga-mgr.c:(.text+0x1746): undefined reference to `dma_buf_detach'
>> s390-linux-ld: fpga-mgr.c:(.text+0x1752): undefined reference to `dma_buf_put'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
