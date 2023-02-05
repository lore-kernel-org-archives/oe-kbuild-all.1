Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C9A7F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 05:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675574841; x=1707110841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YkCI8G6HsUkw8/mx4Zw3p8fzVAoGZ61uYyMmMHJfIKg=;
  b=EXvV62MtI1GdTw4jIrHxDcO0uG5/cXSa3sYjmvrnSLfyNjjuR9slGbd7
   yGtFkmA55xsmE9Q3KpGdsuEAMvSlhYjG2mVBXN2MOhO10QXnyUWQVT/HN
   sA+dRUDHIyqOpq3zPjDHevVoMkkrxoBSdIAkpZmyOCeeOuFKLR2Ho0s+K
   XS47Pb1Qxm2YbcNto7vs5Q10kmY7cMOVOUUHiNY+QlLerLTtMv2yr3/jW
   7IfYeaQLQ6bIf4oBdtLUOh+6b+KVBq/xldI4s9dc+PYoVtCwgVQRAXrhD
   Eg61DUV/3E8lDDgaVBkd1F+ousaH88oQAfoFZsfPmjqmGwdqndDFQ2lcA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="326711690"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="326711690"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 21:27:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="643688740"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="643688740"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Feb 2023 21:27:09 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOXYS-0001lS-37;
	Sun, 05 Feb 2023 05:27:08 +0000
Date: Sun, 5 Feb 2023 13:27:06 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 4263/20208]
 drivers/tty/serial/fsl_linflexuart.c:180:13: warning: function
 'linflex_string_write' has internal linkage but is not defined
Message-ID: <202302051348.24dwVgcw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Larisa,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 093375dfcc1c685b974c21cb9b50f44df4dcf29f [4263/20208] LF-631-7 tty: serial: linflexuart: Add support for FIFO with DMA
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230205/202302051348.24dwVgcw-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/093375dfcc1c685b974c21cb9b50f44df4dcf29f
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 093375dfcc1c685b974c21cb9b50f44df4dcf29f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/fsl_linflexuart.c:180:13: warning: function 'linflex_string_write' has internal linkage but is not defined [-Wundefined-internal]
   static void linflex_string_write(struct linflex_port *sport, const char *s,
               ^
   drivers/tty/serial/fsl_linflexuart.c:993:3: note: used here
                   linflex_string_write(sport, "", 1);
                   ^
   1 warning generated.


vim +/linflex_string_write +180 drivers/tty/serial/fsl_linflexuart.c

   176	
   177	/* Forward declare this for the dma callbacks. */
   178	static void linflex_dma_tx_complete(void *arg);
   179	static void linflex_dma_rx_complete(void *arg);
 > 180	static void linflex_string_write(struct linflex_port *sport, const char *s,
   181					 unsigned int count);
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
