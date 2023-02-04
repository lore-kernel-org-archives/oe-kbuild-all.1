Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295FC322A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 16:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675527419; x=1707063419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LIenQcJUqRhy8gf6hQFC8JlLc/fc4/5QzhB4CeGveBc=;
  b=a11DKbtADPCIjqDG90jPWa48byZJyHm02naREyBGKMAo1x2pxSWnSthO
   GtJGvJQLqqLzQSy8ZkRfLPpFhmPOFb4p3Jpvfj6UI7EBsqer1by9Ab1v7
   r7L6ytruaD7zfi2wxXisPbcCXDhzc1QB3JRBFU+PH6vw90IWRpgwla7nj
   7o5iHXnfM1czC1zvSlvoidgaaFibi4i4CAO3xLLKH1wl6lFiQsDlV/VFP
   34Yi65Amdv6wkmrK2BrZJwac7swV+Pwt8WhX9BCp6EGcFTpMKLmJphc8I
   fEvtyzcRqMEvzvOv6rEP2vad4nj9i5BSzGAur/XHvkGIq/1pxqX/tnBT0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="312615104"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="312615104"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 08:16:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="734682075"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="734682075"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2023 08:16:49 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOLDc-0001Q4-2e;
	Sat, 04 Feb 2023 16:16:48 +0000
Date: Sun, 5 Feb 2023 00:16:38 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [pinchartl-media:muxed/2023.1/base 259/929] ERROR: modpost: module
 fpga-mgr uses symbol dma_buf_attach from namespace DMA_BUF, but does not
 import it.
Message-ID: <202302050027.6pxSQt1h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nava,

FYI, the error/warning still remains.

tree:   git://linuxtv.org/pinchartl/media.git muxed/2023.1/base
head:   f9c8e14ae03c937a79e1c904d004d80a0db3647e
commit: f1ee4b0445c48ec1ec980ef17fd92a355380d9f1 [259/929] fpga: support loading from a pre-allocated buffer
config: arm64-randconfig-r031-20230201 (https://download.01.org/0day-ci/archive/20230205/202302050027.6pxSQt1h-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2023.1/base
        git checkout f1ee4b0445c48ec1ec980ef17fd92a355380d9f1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module fpga-mgr uses symbol dma_buf_attach from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module fpga-mgr uses symbol dma_buf_map_attachment from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module fpga-mgr uses symbol dma_buf_unmap_attachment from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module fpga-mgr uses symbol dma_buf_detach from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module fpga-mgr uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module fpga-mgr uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
