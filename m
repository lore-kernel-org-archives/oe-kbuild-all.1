Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F276B8BF5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 18:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694112164; x=1725648164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CGdYzt6D/2JS/ES4rx9fFh3hBIVSd7eZ99XA9/1aJBQ=;
  b=BpsVEwTb2UcazVyT3wX/WXWk7euqtQmWdPr0/FxHl2b990zawc4TFLJF
   cL8hgQqnPKihq3Ysvda03wZ+xMICNpuERnVwNDP+C4NQknmVvnPNC8KGw
   JGadOexzQ2E54GMMjVApM5vCDAsFngDM7x75fNU6gO3/YSIbxO22+Eieb
   dWBESh2sKIQISZfhz3IXOKExP1XMinm/DqiYBUty+npUMWYdJQlWE4D0U
   qn57+5O+nIMP3O1MVY02DRVK1q+VQTmuoU/9OUexNL8xiU5J50MWMKLwP
   LdAUOqtxvjRnSVxdYelktJ7IbDqZ27OHTOHSeGLUo8fVsfgXMUkuesLL2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="381251106"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="381251106"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 11:41:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="771383463"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="771383463"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Sep 2023 11:41:27 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeJwT-0001TD-0u;
	Thu, 07 Sep 2023 18:41:25 +0000
Date: Fri, 8 Sep 2023 02:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 6/7] net: ethtool: add a netlink command to
 get PHY information
Message-ID: <202309080203.dEuPLN7k-lkp@intel.com>
References: <20230907092407.647139-7-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907092407.647139-7-maxime.chevallier@bootlin.com>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-sfp-pass-the-phy_device-when-disconnecting-an-sfp-module-s-PHY/20230907-235512
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230907092407.647139-7-maxime.chevallier%40bootlin.com
patch subject: [RFC PATCH net-next 6/7] net: ethtool: add a netlink command to get PHY information
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20230908/202309080203.dEuPLN7k-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080203.dEuPLN7k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080203.dEuPLN7k-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ethtool/phy.c:121:35: error: initialization of 'int (*)(const struct ethnl_req_info *, struct ethnl_reply_data *, const struct genl_info *)' from incompatible pointer type 'int (*)(const struct ethnl_req_info *, struct ethnl_reply_data *, struct genl_info *)' [-Werror=incompatible-pointer-types]
     121 |         .prepare_data           = phy_prepare_data,
         |                                   ^~~~~~~~~~~~~~~~
   net/ethtool/phy.c:121:35: note: (near initialization for 'ethnl_phy_request_ops.prepare_data')
   cc1: some warnings being treated as errors


vim +121 net/ethtool/phy.c

   112	
   113	const struct ethnl_request_ops ethnl_phy_request_ops = {
   114		.request_cmd		= ETHTOOL_MSG_PHY_GET,
   115		.reply_cmd		= ETHTOOL_MSG_PHY_GET_REPLY,
   116		.hdr_attr		= ETHTOOL_A_PHY_HEADER,
   117		.req_info_size		= sizeof(struct phy_req_info),
   118		.reply_data_size	= sizeof(struct phy_reply_data),
   119	
   120		.parse_request		= phy_parse_request,
 > 121		.prepare_data		= phy_prepare_data,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
