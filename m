Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4796A33D0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681579251; x=1713115251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aTWZbuALiZ+KYJp5gO+y7pXGkMS3CQ3bkOBZyyhwiXM=;
  b=cQxeRfSDFtGoOxDMrr+GXoLd3Q32S09MxkLhsZ2qAz8YOxOE+2zKd+vz
   cD8kKNQS36cX155sOcclahhFFLw0Ng6bYHeDUzqhFP5aQfBJiM1ZjdgXq
   JEngtLkweBVTVJOUkGL/Kj0kTXTEJ4VVvnjWC4lVHV0k3bTrFvwQJZh3o
   nlqT7fUigesoxc+DTP+Y6DZ9QtwIz8tdarhFbWh/8pasOiRSg13hhrj6f
   fuYYUxL08kHw18b9LSXtQl/tFSuhFr7ZJ/4OA7vCVo0eRHEbu5sgpnaXp
   Cq+3EuCLH3mEh47TbYTxK2ul+31PQuT9moGpAwtbxp0HQkbjz0TIIw7EW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="328821803"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="328821803"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 10:20:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="683711322"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="683711322"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 Apr 2023 10:20:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnjZw-000bEB-34;
	Sat, 15 Apr 2023 17:20:48 +0000
Date: Sun, 16 Apr 2023 01:20:06 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 4631/9838]
 drivers/firmware/imx/ele_trng.c:44:5: warning: no previous prototype for
 'ele_get_random'
Message-ID: <202304160150.ii1WT2Vq-lkp@intel.com>
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
commit: 45df0f582836b4f75f20627d85dff2668bde0f17 [4631/9838] LF-7285: firmware: imx: ele: Add support for ELE HW Random Number Generator
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230416/202304160150.ii1WT2Vq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/45df0f582836b4f75f20627d85dff2668bde0f17
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 45df0f582836b4f75f20627d85dff2668bde0f17
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/firmware/imx/ drivers/mailbox/ drivers/media/platform/ drivers/net/ drivers/pwm/ drivers/regulator/ drivers/soc/imx/ drivers/staging/ drivers/video/fbdev/ sound/soc/fsl/ sound/soc/sof/amd/ sound/soc/sof/imx/ sound/soc/sof/intel/ sound/soc/sof/mediatek/mt8186/ sound/soc/sof/mediatek/mt8195/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304160150.ii1WT2Vq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/imx/ele_trng.c:44:5: warning: no previous prototype for 'ele_get_random' [-Wmissing-prototypes]
      44 | int ele_get_random(struct hwrng *rng, void *data, size_t len, bool wait)
         |     ^~~~~~~~~~~~~~


vim +/ele_get_random +44 drivers/firmware/imx/ele_trng.c

    37	
    38	/*
    39	 * ele_get_random() - prepare and send the command to proceed
    40	 *                    with a random number generation operation
    41	 *
    42	 * returns:  size of the rondom number generated
    43	 */
  > 44	int ele_get_random(struct hwrng *rng, void *data, size_t len, bool wait)
    45	{
    46		struct ele_mu_priv *priv;
    47		unsigned int tag, command, size, ver, status;
    48		dma_addr_t dst_dma;
    49		u8 *buf;
    50		int ret;
    51	
    52		/* access ele_mu_priv data structure pointer*/
    53		ret = get_ele_mu_priv(&priv);
    54		if (ret)
    55			return ret;
    56	
    57		buf = dmam_alloc_coherent(priv->dev, len, &dst_dma, GFP_KERNEL);
    58		if (!buf) {
    59			dev_err(priv->dev, "Failed to map destination buffer memory\n");
    60			return -ENOMEM;
    61		}
    62	
    63		ret = plat_fill_rng_msg_hdr((struct mu_hdr *)&priv->tx_msg.header, ELE_GET_RANDOM_REQ, 16);
    64		if (ret)
    65			goto exit;
    66	
    67		priv->tx_msg.data[0] = 0x0;
    68		priv->tx_msg.data[1] = dst_dma;
    69		priv->tx_msg.data[2] = len;
    70		ret = imx_ele_msg_send_rcv(priv);
    71		if (ret < 0)
    72			goto exit;
    73	
    74		tag = MSG_TAG(priv->rx_msg.header);
    75		command = MSG_COMMAND(priv->rx_msg.header);
    76		size = MSG_SIZE(priv->rx_msg.header);
    77		ver = MSG_VER(priv->rx_msg.header);
    78		status = RES_STATUS(priv->rx_msg.data[0]);
    79		if (tag == 0xe1 && command == ELE_GET_RANDOM_REQ && size == 0x02 &&
    80		    ver == 0x07 && status == 0xd6) {
    81			memcpy(data, buf, len);
    82			ret = len;
    83		} else
    84			ret = -EINVAL;
    85	
    86	exit:
    87		dmam_free_coherent(priv->dev, len, buf, dst_dma);
    88		return ret;
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
