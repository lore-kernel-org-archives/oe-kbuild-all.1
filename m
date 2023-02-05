Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA0F7F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 06:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675577355; x=1707113355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=flr6ZSElzfIEC6KYJTqOg+koEzkn6aB6RwPyszqPP/k=;
  b=fdumYMFGJUHU90kiIQOB35ER+4KMBwW8fu5hhDm9wg5vm7dVpipd/Bv7
   WfqLdF6yIR4rvYJQJji5Fr6dEEoP9zKVt4KGgBIOcTGGdh8ZtzwlaO3Zh
   8fSvM6k2SUdcM0ZY/HGPRpb+oJ3asw5yqQTLGMW9mNVY+es2qRmdlKE3w
   8Y4cqJo3zIhChpFOpnc+7ERcWLUgc70I1xbuoBAqUMaWeO5O/eASDTjc3
   3z+3Q2xp11Fwui73xLyIucni5QX0azIQMspzkadEl28HKsZwVKHYrcwGa
   OPGDtgHMnYWmczG7EIoyThLpYM5QfWveWnTdd6mcVYIppoedUhGwKMc50
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="312678439"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="312678439"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 22:09:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="754917430"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="754917430"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2023 22:09:10 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOYD7-0001me-37;
	Sun, 05 Feb 2023 06:09:09 +0000
Date: Sun, 5 Feb 2023 14:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 4263/20208]
 drivers/tty/serial/fsl_linflexuart.c:180:13: warning: 'linflex_string_write'
 used but never defined
Message-ID: <202302051417.kygN7Lg8-lkp@intel.com>
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
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230205/202302051417.kygN7Lg8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Freescale/linux-fslc/commit/093375dfcc1c685b974c21cb9b50f44df4dcf29f
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 093375dfcc1c685b974c21cb9b50f44df4dcf29f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/fsl_linflexuart.c:180:13: warning: 'linflex_string_write' used but never defined
     180 | static void linflex_string_write(struct linflex_port *sport, const char *s,
         |             ^~~~~~~~~~~~~~~~~~~~


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
