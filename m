Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC905CBD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 07:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695283139; x=1726819139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K9pIcSCIJ3tlx0+DN1qDzAgQVz1ml96TGI//UhlMc1I=;
  b=hRfHiYeUje1EAC7hPbXefi1BsD0PHxa94opqRNAHPUvHSOO0/hBIHajY
   YW6jRCYZgAY9PbdWp/z08WUVaLssSD+ydA1KHqnZPfYmhkqxgbh9rtQIl
   VORgEp/AThD8w3q0a7aG8j7HdlV9kZnJZBnuhK5ff/r5OZYQ6kWnovAEW
   GhV2BctpXFwnNIlhOxn0D4TiAwYZaWROLTyk0oR7COpAcTjo9sKpJwlw1
   r+PRNKIkY/rrwu/QUGvk7rXt2u7Zagz8MEI+hITn79Hn54KIU1HfPhVdI
   Qv38uTB4oh+R368kV4qGWQCRnv8SQ4KuNBEmMFY2rKInL1Hhm4sqxzKDI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="444554944"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="444554944"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 00:58:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="920632324"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="920632324"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Sep 2023 00:58:57 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjEaK-0009kO-2k;
	Thu, 21 Sep 2023 07:58:53 +0000
Date: Thu, 21 Sep 2023 15:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 256/1365] ERROR: modpost: module
 fpga-mgr uses symbol dma_buf_get from namespace DMA_BUF, but does not import
 it.
Message-ID: <202309211505.H6WIBUzR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   008e6788f5aa09862307822bfc396c926dc0dbac
commit: b026acba70d3b352ce2a5b6d8ff7554c91771d2b [256/1365] fpga: support loading from a pre-allocated buffer
config: i386-randconfig-015-20230920 (https://download.01.org/0day-ci/archive/20230921/202309211505.H6WIBUzR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211505.H6WIBUzR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309211505.H6WIBUzR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: module uio uses symbol dma_buf_attach from namespace DMA_BUF, but does not import it.
ERROR: modpost: module uio uses symbol dma_buf_map_attachment from namespace DMA_BUF, but does not import it.
ERROR: modpost: module uio uses symbol dma_buf_unmap_attachment from namespace DMA_BUF, but does not import it.
ERROR: modpost: module uio uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
ERROR: modpost: module uio uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
ERROR: modpost: module uio uses symbol dma_buf_detach from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module fpga-mgr uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module fpga-mgr uses symbol dma_buf_attach from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module fpga-mgr uses symbol dma_buf_map_attachment from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module fpga-mgr uses symbol dma_buf_unmap_attachment from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module fpga-mgr uses symbol dma_buf_detach from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module fpga-mgr uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
