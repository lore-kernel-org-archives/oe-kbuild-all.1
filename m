Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D7919BCD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 09:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWZAComW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698312856; x=1729848856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jEomB4tFAOKN2gSwHUvwlP38ZUAuFSN/msrrEs09gjY=;
  b=JWZAComWSgLlmmmvEN1Vhte1mn0Dz8U/XxWplXNtt3WykofO/9pUP04H
   sYdU6FF1V+4KpCViDfbpHP6wwA8t18E/jgd0yFOFoEuwBKJqnWL1irAVV
   cFC1GFOPWm9mCBJuWFOoLZ0OuFN1RFo9gUGqt8TdG9vLWiAXY4JA4VjSg
   DJqdwzMDVbaZOJPeaJqjnaR2Wz0FMkXg5LuiextNpzP6v918PPv67mvuA
   JQJtLal4EF3YqE2BThVXZVV0LvfNd9y2x1pXQegIN83SrYWqQAA0bimSd
   JKsvfDiPDALS3pBhgRcO2iO9K3rp3OlgGECoQGAQ8zJQaSGP5NqZenV0J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="451736786"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="451736786"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 02:34:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="932671385"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="932671385"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Oct 2023 02:34:14 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvwkl-0009gN-31;
	Thu, 26 Oct 2023 09:34:11 +0000
Date: Thu, 26 Oct 2023 17:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4631/15770]
 drivers/firmware/imx/ele_trng.c:91:5: error: redefinition of 'ele_trng_init'
Message-ID: <202310261732.pub5KUqG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gaurav,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   742924a05c8a6349d6d1fe67010a3c5ed54df884
commit: 45df0f582836b4f75f20627d85dff2668bde0f17 [4631/15770] LF-7285: firmware: imx: ele: Add support for ELE HW Random Number Generator
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20231026/202310261732.pub5KUqG-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310261732.pub5KUqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310261732.pub5KUqG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/imx/ele_trng.c:44:5: warning: no previous prototype for 'ele_get_random' [-Wmissing-prototypes]
      44 | int ele_get_random(struct hwrng *rng, void *data, size_t len, bool wait)
         |     ^~~~~~~~~~~~~~
>> drivers/firmware/imx/ele_trng.c:91:5: error: redefinition of 'ele_trng_init'
      91 | int ele_trng_init(struct device *dev)
         |     ^~~~~~~~~~~~~
   In file included from drivers/firmware/imx/ele_trng.c:13:
   drivers/firmware/imx/ele_mu.h:146:19: note: previous definition of 'ele_trng_init' with type 'int(struct device *)'
     146 | static inline int ele_trng_init(struct device *dev)
         |                   ^~~~~~~~~~~~~


vim +/ele_trng_init +91 drivers/firmware/imx/ele_trng.c

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
  > 91	int ele_trng_init(struct device *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
