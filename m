Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6EE134B2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 17:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694108240; x=1725644240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WUcT3wtKNsVW+hc0DTK/HzyO60Y04ZbjUNJbu8UGoDA=;
  b=g2gWX3AG1l0uQd6CYsl+nrb0ulLrim57tnT2ZDQiWyKbXkMQ21sjryyh
   bYn3gPRGYzRJcKp4u2dsKW+3gZdfUkGV03b/ISCaqY+6naVpdQRjlfIOw
   /mRAdoRxCLMP2mqlVn/kfci/jBI1ort9Erx6WvEe/FPsU+4xI/MifLK+y
   4JynmPew9zd8Qhs6tjLEL33ls2DUPluBA3g+FFCmCQ6NsIIDP+FyXDJhL
   q/D4QetTxq21uE8gvPizEAFRtrw9etLPsKZYQV056eT+J81Z1xbTwZ/7Z
   tDRx57ah0biI7mv2RO5ePIkyKfpOJyIzvlghzCagqRtXlGRe0ZuUtwQ4M
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="367680906"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="367680906"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 10:37:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="777158410"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="777158410"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Sep 2023 10:37:18 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeIwO-0001RC-2O;
	Thu, 07 Sep 2023 17:37:16 +0000
Date: Fri, 8 Sep 2023 01:37:04 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 4/7] net: ethtool: add a netlink command to
 list PHYs
Message-ID: <202309080120.kPU8t59H-lkp@intel.com>
References: <20230907092407.647139-5-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907092407.647139-5-maxime.chevallier@bootlin.com>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-sfp-pass-the-phy_device-when-disconnecting-an-sfp-module-s-PHY/20230907-235512
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230907092407.647139-5-maxime.chevallier%40bootlin.com
patch subject: [RFC PATCH net-next 4/7] net: ethtool: add a netlink command to list PHYs
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20230908/202309080120.kPU8t59H-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080120.kPU8t59H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080120.kPU8t59H-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ethtool/phy_list.c:96:35: error: initialization of 'int (*)(const struct ethnl_req_info *, struct ethnl_reply_data *, const struct genl_info *)' from incompatible pointer type 'int (*)(const struct ethnl_req_info *, struct ethnl_reply_data *, struct genl_info *)' [-Werror=incompatible-pointer-types]
      96 |         .prepare_data           = phy_list_prepare_data,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   net/ethtool/phy_list.c:96:35: note: (near initialization for 'ethnl_phy_list_request_ops.prepare_data')
   cc1: some warnings being treated as errors


vim +96 net/ethtool/phy_list.c

    88	
    89	const struct ethnl_request_ops ethnl_phy_list_request_ops = {
    90		.request_cmd		= ETHTOOL_MSG_PHY_LIST_GET,
    91		.reply_cmd		= ETHTOOL_MSG_PHY_LIST_GET_REPLY,
    92		.hdr_attr		= ETHTOOL_A_PHY_LIST_HEADER,
    93		.req_info_size		= sizeof(struct phy_list_req_info),
    94		.reply_data_size	= sizeof(struct phy_list_reply_data),
    95	
  > 96		.prepare_data		= phy_list_prepare_data,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
