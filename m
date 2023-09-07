Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69C3134DD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 18:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694110228; x=1725646228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sRzLkXk3M4lcoh9W7Aw3q4TMSzoUIIlmvmThKP3ZJeI=;
  b=m0ywZpi0u8yZd/gl+CUJIiP7dobDU44ZtQgsxctROs/IZzPHABMx/E1q
   Zvk1Rg69cZWlSsnyHKQzVPJKdep3eu4bEJJ8LWI0kb6m3yOZq1S+rKdci
   TE3fPlNqdWQVvy0UAxsH2N77vIM6xVboHg7uENHMhfPRVA29RDyh+9bIM
   KLvb6VV59NtX2zVzZYYfqb91dJGMA6QXJLq58SYaeLom0TnqJDYuET4BZ
   U7KSk2GusEu+aGqTAY5ub9n2nYURrmqEKtQUYYaX4DBW1jNmYEHee2l34
   d4vHATmGXZKUwxCYCGSaVlBq6urEFi0+isXkYoSY/e7GOXws5WNGxfL6+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="376342544"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="376342544"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 11:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="988881928"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="988881928"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Sep 2023 11:10:26 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeJSS-0001SN-22;
	Thu, 07 Sep 2023 18:10:24 +0000
Date: Fri, 8 Sep 2023 02:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 4/7] net: ethtool: add a netlink command to
 list PHYs
Message-ID: <202309080251.s2jhUjb9-lkp@intel.com>
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
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230908/202309080251.s2jhUjb9-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080251.s2jhUjb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080251.s2jhUjb9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ethtool/phy_list.c:96:19: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
     .prepare_data  = phy_list_prepare_data,
                      ^~~~~~~~~~~~~~~~~~~~~
   net/ethtool/phy_list.c:96:19: note: (near initialization for 'ethnl_phy_list_request_ops.prepare_data')
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
