Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037EC2F39
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 23:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681600918; x=1713136918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gIHh39/MIJRdavy4bw+S2F00lPDxG7rqMzvieyYNoR4=;
  b=bXFhVSfl8WJBzf6e+A4uqsnVrWpP9GaiktrYjEGx4j9GhM9uuR0NkLrX
   faw3SqpQJbWad5pXQ0CMz8dTwGP4QvBL81oVZxt0y0wyXd/YqPIqKKP+m
   Wc2IUc8TbevdBkXPQsdRB524BzZd7tGWvyhBNQiaF8/bnaPqrsUC1PLJA
   9gD8MtD+EIYUzhyOGZyiQQwVKR5h7gkvVC79SvxViv+KGyZUBvIijeqOz
   6JXFAdCMfVwvo5iFc6NZwjXZ5dPRusLnpuX50ND3F4xuXOubosk8neTix
   AmiRL8q6dzJttoE7wS1RsG5ASETDHF2EOB57pvD20xwyfPzfqVXGp7F/I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="407575630"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="407575630"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 16:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="667701098"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="667701098"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 15 Apr 2023 16:21:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnpDP-000bPF-27;
	Sat, 15 Apr 2023 23:21:55 +0000
Date: Sun, 16 Apr 2023 07:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 3031/9838]
 drivers/mailbox/imx-mailbox.c:140:10: warning: no previous prototype for
 'get_mu_buf'
Message-ID: <202304160752.005kgWJ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 94cd15eaa1a2683afc6b0949be818d597f51eb2e [3031/9838] LF-6580-1: drivers: imx-mailbox: MU Buffer
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230416/202304160752.005kgWJ8-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/94cd15eaa1a2683afc6b0949be818d597f51eb2e
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 94cd15eaa1a2683afc6b0949be818d597f51eb2e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/mailbox/ drivers/media/platform/ drivers/net/dsa/ocelot/ drivers/net/ethernet/freescale/ drivers/pwm/ drivers/regulator/ drivers/soc/imx/ drivers/staging/ drivers/video/fbdev/ sound/soc/fsl/ sound/soc/sof/amd/ sound/soc/sof/imx/ sound/soc/sof/intel/ sound/soc/sof/mediatek/mt8186/ sound/soc/sof/mediatek/mt8195/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304160752.005kgWJ8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/imx-mailbox.c:140:10: warning: no previous prototype for 'get_mu_buf' [-Wmissing-prototypes]
     140 | uint8_t *get_mu_buf(struct mbox_chan *chan)
         |          ^~~~~~~~~~


vim +/get_mu_buf +140 drivers/mailbox/imx-mailbox.c

   139	
 > 140	uint8_t *get_mu_buf(struct mbox_chan *chan)
   141	{
   142		uint8_t *addr;
   143		struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
   144	
   145		addr = priv->base + priv->dcfg->xBUF;
   146		return addr;
   147	}
   148	EXPORT_SYMBOL(get_mu_buf);
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
