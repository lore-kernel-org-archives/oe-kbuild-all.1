Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B182937159
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 22:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSnDkQBC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698271727; x=1729807727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Tt3J6JtFPyCHVZ0qWGspBMZCNoJx4XaiuK/ZuPKkwE=;
  b=KSnDkQBC4XJjd8RU86tXO2yShXnaG/h3/X1DnUB8gB4n2JItjenty4sG
   c/twyenJLCh+z9I1Z7FxD964ur1OTZ6tb99kKEJEcNSIVzj9D1uwY17xq
   EioNRsePfibnuU1Xudw+o2WT80O7DohhZWOQowQgdVFFDY7/xgXVDemwF
   PlZ9fu9kMPvrBJ4bebK7He0QeF6YyToz8SyXhSK+XBury/Cxn67QA4jzr
   01+X/9omf2JOUhZ64I5L0BXSUQdpTW0aUEQ5kID42d6CgrrLr8BvhtCn+
   EBE4Wtn97XhVr0rwZuoASvuCXFrqSZmYXIwvNVIq8xV5vt0V58+MR5m++
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="191195"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="191195"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 15:08:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="875670592"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="875670592"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Oct 2023 15:08:42 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvm3M-0009EM-1L;
	Wed, 25 Oct 2023 22:08:40 +0000
Date: Thu, 26 Oct 2023 06:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	edumazet@google.com, pabeni@redhat.com, almasrymina@google.com,
	hawk@kernel.org, ilias.apalodimas@linaro.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 09/15] net: page_pool: implement GET in the
 netlink API
Message-ID: <202310260559.9QsjadJ3-lkp@intel.com>
References: <20231024160220.3973311-10-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024160220.3973311-10-kuba@kernel.org>

Hi Jakub,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/net-page_pool-split-the-page_pool_params-into-fast-and-slow/20231025-023128
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231024160220.3973311-10-kuba%40kernel.org
patch subject: [PATCH net-next 09/15] net: page_pool: implement GET in the netlink API
config: csky-defconfig (https://download.01.org/0day-ci/archive/20231026/202310260559.9QsjadJ3-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310260559.9QsjadJ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310260559.9QsjadJ3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> csky-linux-ld: net/core/netdev-genl-gen.o:(.rodata+0x48): undefined reference to `netdev_nl_page_pool_get_doit'
>> csky-linux-ld: net/core/netdev-genl-gen.o:(.rodata+0x60): undefined reference to `netdev_nl_page_pool_get_dumpit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
