Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01B77B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 08:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675584807; x=1707120807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QdX/hFKnV25iuZj8xEd4DLsxYffjnB9AJdAKX0q8kvk=;
  b=nPGE2BnpJmNZ630baVvhAWR/alJ4TzFoTIQokqVl+czI8x33mObdzc5e
   l9r2quDjMFk0hJF/ZTGU5KQqEZqBNwNu4pwXXnGT+Tdrj2ZiuPTbdci3A
   X5lOTA+ioW0N6901Ios7xNY6/7+phtGFqrGFX2b+VXRoar7UONal4bDOr
   9DXhEHoDSAKSiGnicik9MAmwPlNsDzfYCi1nTYzmnxtbLN8O8Rmwd0zYq
   gRHInOBWrTDTql8A/xlsLgcrdJGTl2V4LH9vho7ep5+RfVyKoYbjsTHu/
   enZMQOYc1Mcl61CAXphkqsxwjz8AwVzR0sf4siNJMb1vWrpq5asvZvtj+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="393624887"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="393624887"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 00:13:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="659541829"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="659541829"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Feb 2023 00:13:14 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOa9B-0001rE-0Z;
	Sun, 05 Feb 2023 08:13:13 +0000
Date: Sun, 5 Feb 2023 16:12:21 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 17396/20208]
 drivers/mailbox/imx-mailbox.c:132:10: warning: no previous prototype for
 'get_mu_buf'
Message-ID: <202302051640.2037YnW2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vabhav,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: e7f19219a4920854744c970b43522cb6d17e0262 [17396/20208] LF-6580-1: drivers: imx-mailbox: MU Buffer
config: arc-randconfig-r043-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051640.2037YnW2-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/e7f19219a4920854744c970b43522cb6d17e0262
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout e7f19219a4920854744c970b43522cb6d17e0262
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/mailbox/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mailbox/imx-mailbox.c:132:10: warning: no previous prototype for 'get_mu_buf' [-Wmissing-prototypes]
     132 | uint8_t *get_mu_buf(struct mbox_chan *chan)
         |          ^~~~~~~~~~
   drivers/mailbox/imx-mailbox.c:900:19: warning: initialized field overwritten [-Woverride-init]
     900 |         .rxdb   = imx_mu_generic_rxdb,
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/mailbox/imx-mailbox.c:900:19: note: (near initialization for 'imx_mu_cfg_imx8ulp.rxdb')


vim +/get_mu_buf +132 drivers/mailbox/imx-mailbox.c

   131	
 > 132	uint8_t *get_mu_buf(struct mbox_chan *chan)
   133	{
   134		uint8_t *addr;
   135		struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
   136	
   137		addr = priv->base + priv->dcfg->xBUF;
   138		return addr;
   139	}
   140	EXPORT_SYMBOL(get_mu_buf);
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
