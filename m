Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854911AF0D6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 17:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729012964; cv=none; b=GQM9M1sR0DQi91KiaOSdSHhTZGWxEXxb+POR802BH3rewEu1V4PKmCcc/vIkEVf9Oh2RCCcb8icfTuNXWwTHjS0h9pMjVFV2uk6vnpx0bi+id48hjtmfu+sBfza70kzsVc9++TDVxQlwEPlAQhev3HXeEZ7mq9Cp3GN5Ta4mrQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729012964; c=relaxed/simple;
	bh=2mEhCPVHCTTAzl9fFpCjcQJlAPr5oWmayIG8kPhHBtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLwDNy2OBwJJvomZhGPGkT0qAkc6cTEuawCKHuqW+JHnwvusigfqGw6eo0wXInajJZisAxUF9+jVAfIXo6BvaxvBAqrc0qK8ZcI/OMvAL1Bfkd6xxF2Wsct11vHUqg2aswXl4Ir+pKdNF5RxA0a2d3c/krYx1f4yNU9+keBqLcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cB7E1gFR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cB7E1gFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729012962; x=1760548962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2mEhCPVHCTTAzl9fFpCjcQJlAPr5oWmayIG8kPhHBtE=;
  b=cB7E1gFRWesj6Q07ZgMAaCVA89jVcSWlbMwqIDQR4RoQtfg31+twz5hX
   myLmhTzYdCA48sXzRkH9/SVj0eD/nESkeBgaZ816PELXRROW/ljZrBay3
   kTFzdJ/3X5uhATPVSk1aICQew5xIghdEH+RihywMVA/cRYPUXREooMsiS
   HXSnyZB9Z0JEBV1mEIXx9EAFyoqREAuxLH+2SjBh/Q12uBa59+4/1OsUZ
   4M8NEA1zToUpWQ1UKwbV1aLBOEog/poHYacnVLeYUe/t/+ejIfT3hz0/s
   tuy6v/NHGW3wMu6Awyq0sRUuehlAJEO5SZKZaqHWq8LEUj0wDNTlbB8cl
   g==;
X-CSE-ConnectionGUID: 1wt8QGhXQLyySZqkWDeeRg==
X-CSE-MsgGUID: cXZ3EbbYRY6WnJJ1t42VpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32342114"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="32342114"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 10:22:42 -0700
X-CSE-ConnectionGUID: B7LxWq2jSfqCuscHEOUpXQ==
X-CSE-MsgGUID: wP3pTVDTS76bfIPaiBUpkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="77627834"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Oct 2024 10:22:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0lFl-000Jex-0h;
	Tue, 15 Oct 2024 17:22:37 +0000
Date: Wed, 16 Oct 2024 01:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Stockhausen <markus.stockhausen@gmx.de>, vkoul@kernel.org,
	kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, chris.packham@alliedtelesis.co.nz
Cc: oe-kbuild-all@lists.linux.dev,
	Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: Re: [PATCH v3 2/2] phy: Realtek Otto SerDes driver
Message-ID: <202410160026.e4fdH3Ov-lkp@intel.com>
References: <20241012134834.1306992-3-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012134834.1306992-3-markus.stockhausen@gmx.de>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.12-rc3 next-20241015]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Stockhausen/dt-bindings-phy-add-realtek-rtl8380m-serdes/20241012-214949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241012134834.1306992-3-markus.stockhausen%40gmx.de
patch subject: [PATCH v3 2/2] phy: Realtek Otto SerDes driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241016/202410160026.e4fdH3Ov-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410160026.e4fdH3Ov-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160026.e4fdH3Ov-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:8,
                    from include/linux/skbuff.h:28,
                    from include/linux/if_ether.h:19,
                    from include/linux/ethtool.h:18,
                    from include/linux/phy.h:16,
                    from drivers/phy/realtek/phy-rtk-otto-serdes.c:13:
   drivers/phy/realtek/phy-rtk-otto-serdes.c: In function 'rtsds_fw_load':
>> drivers/phy/realtek/phy-rtk-otto-serdes.c:119:29: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
     119 |         dev_info(ctrl->dev, "firmware %s: loaded with %d bytes, %d sequences\n",
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/phy/realtek/phy-rtk-otto-serdes.c:119:9: note: in expansion of macro 'dev_info'
     119 |         dev_info(ctrl->dev, "firmware %s: loaded with %d bytes, %d sequences\n",
         |         ^~~~~~~~
   drivers/phy/realtek/phy-rtk-otto-serdes.c:119:56: note: format string is defined here
     119 |         dev_info(ctrl->dev, "firmware %s: loaded with %d bytes, %d sequences\n",
         |                                                       ~^
         |                                                        |
         |                                                        int
         |                                                       %ld


vim +119 drivers/phy/realtek/phy-rtk-otto-serdes.c

  > 13	#include <linux/phy.h>
    14	#include <linux/phy/phy.h>
    15	#include <linux/platform_device.h>
    16	
    17	#include "phy-rtk-otto-serdes.h"
    18	
    19	/*
    20	 * A Realtek Otto SerDes is configured/patched by writing specific values into its registers.
    21	 * These values are bound to the individual hardware and the transceivers that are connected to
    22	 * it. Depending on the model some of this might be integrated into the bootloader. To fully
    23	 * support different configurations allow the driver to load firmware files and run patch
    24	 * sequences.
    25	 *
    26	 * A firmware file contains a head, a directory and at the end the raw patch data. See
    27	 * structure rtsds_fw_head, rtsds_fw_dir an rtsds_fw_seq for more details.
    28	 *
    29	 * header
    30	 *	(u32) magic = 0x83009300, see RTSDS_FW_MAGIC
    31	 *	(u32) CRC checksum of the following data
    32	 *	(u32) filesize
    33	 *	(u32) directory size = number of sequences
    34	 *
    35	 * directory with n elements consisting of
    36	 *	(u32) id of the sequence. See RTSDS_FW_EVT_xxx
    37	 *	(u32) offset of patch data for this directory entry
    38	 *
    39	 * patch data with x elements consisting of
    40	 *	(u16) action to process. See RTSDS_FW_OP_xxx
    41	 *	(u16) mode for which the command is to be executed. See RTSDS_FW_MODE_xxx
    42	 *	(u16) SerDes ports bitmask for which the command is to be executed
    43	 *	(u16) page for action
    44	 *	(u16) register for action
    45	 *	(u16) value for action
    46	 *	(u16) mask for write operations
    47	 *	(u16) future use to avoid structure breakage
    48	 */
    49	
    50	static const char *rtsds_fw_events[RTSDS_FW_EVT_CNT] = {
    51		[RTSDS_FW_EVT_SETUP]		= "setup",
    52		[RTSDS_FW_EVT_INIT]		= "init",
    53		[RTSDS_FW_EVT_POWER_ON]		= "power-on",
    54		[RTSDS_FW_EVT_PRE_SET_MODE]	= "pre-set-mode",
    55		[RTSDS_FW_EVT_POST_SET_MODE]	= "post-set-mode",
    56		[RTSDS_FW_EVT_PRE_RESET]	= "pre-reset",
    57		[RTSDS_FW_EVT_POST_RESET]	= "post-reset",
    58		[RTSDS_FW_EVT_PRE_POWER_OFF]	= "pre-power-off",
    59		[RTSDS_FW_EVT_POST_POWER_OFF]	= "post-power-off",
    60	};
    61	
    62	static const u8 rtsds_fw_modes[PHY_INTERFACE_MODE_MAX] = {
    63		[PHY_INTERFACE_MODE_NA]		= RTSDS_FW_MODE_ALL,
    64		[PHY_INTERFACE_MODE_QSGMII]	= RTSDS_FW_MODE_QSGMII,
    65		[PHY_INTERFACE_MODE_XGMII]	= RTSDS_FW_MODE_XGMII,
    66		[PHY_INTERFACE_MODE_USXGMII]	= RTSDS_FW_MODE_USXGMII,
    67		[PHY_INTERFACE_MODE_1000BASEX]	= RTSDS_FW_MODE_1000BASEX,
    68		[PHY_INTERFACE_MODE_2500BASEX]	= RTSDS_FW_MODE_2500BASEX,
    69		[PHY_INTERFACE_MODE_10GBASER]	= RTSDS_FW_MODE_10GBASER,
    70	};
    71	
    72	static int rtsds_fw_load(struct rtsds_ctrl *ctrl)
    73	{
    74		int ret;
    75		struct rtsds_fw_head *h;
    76		u32 checksum;
    77		const char *msg;
    78		const char *fwprop;
    79		char fwname[128];
    80	
    81		ret = device_property_read_string(ctrl->dev, "firmware-name", &fwprop);
    82		if (ret)
    83			snprintf(fwname, sizeof(fwname), "realtek/%s", ctrl->conf->fwname);
    84		else if (strcmp(fwprop, ""))
    85			snprintf(fwname, sizeof(fwname), "realtek/%s", fwprop);
    86		else {
    87			dev_info(ctrl->dev, "firmware deactivated, patching disabled\n");
    88			return 0;
    89		}
    90	
    91		ret = firmware_request_nowarn(&ctrl->firmware, fwname, ctrl->dev);
    92		if (ret < 0) {
    93			msg = "not found";
    94			goto error;
    95		}
    96	
    97		if (ctrl->firmware->size < 16) {
    98			msg = "size to small";
    99			goto error;
   100		}
   101	
   102		h = (struct rtsds_fw_head *)ctrl->firmware->data;
   103		if (h->magic != RTSDS_FW_MAGIC) {
   104			msg = "magic mismatch";
   105			goto error;
   106		}
   107	
   108		if (h->filesize != ctrl->firmware->size) {
   109			msg = "size mismatch";
   110			goto error;
   111		}
   112	
   113		checksum = ~crc32(0xFFFFFFFFU, ctrl->firmware->data + 8, ctrl->firmware->size - 8);
   114		if (h->checksum != checksum) {
   115			msg = "checksum mismatch";
   116			goto error;
   117		}
   118	
 > 119		dev_info(ctrl->dev, "firmware %s: loaded with %d bytes, %d sequences\n",
   120			 fwname, ctrl->firmware->size, h->dirsize);
   121	
   122		return 0;
   123	error:
   124		dev_err(ctrl->dev, "firmware %s: %s, patching disabled\n", fwname, msg);
   125		ctrl->firmware = NULL;
   126		return -EINVAL;
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
