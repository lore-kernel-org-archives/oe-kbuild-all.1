Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F000F8BF8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 10:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687343176; x=1718879176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sZMhYf6xCxz8tX/bynBSPYlyJo5XmvsaI5fYQJ1Pe4o=;
  b=irJGk2ywnaau9QyA7rs+mh5AZQ/VkqCyLzcMT6N4CRUz28HA79oFonbA
   oFSGvdrkg9IaosiBhfvcvxequtsXhqrje85EkD9BkaXX1Fq16zgnlMn1a
   29tzEiGVHmmTN50ZDdae7cjYJw6HMXKx3T3R3AmX/Irh5wIN/L6XxjfNU
   jqWuLwM+E8jfnIpTgjg8fupmUFC+G62PoASe5fvpsXVXDtMLysvRmege8
   Kt/PAxO6msPozpMJvPiRzigqBrxDqqAtE7NHGmcn6MxiIKK89lJt8CCgP
   d2bS8uaVDAYAry5a+lXh+9QHN5CP6i3Jor/pSEgaKuCMascOTYW0NFuLh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="340474333"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="340474333"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 03:26:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="888602762"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="888602762"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Jun 2023 03:26:05 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBv2K-0006md-3B;
	Wed, 21 Jun 2023 10:26:04 +0000
Date: Wed, 21 Jun 2023 18:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 4/4] arm64: dts: rockchip: rk3588: add PCIe2 support
Message-ID: <202306211833.rx96nmun-lkp@intel.com>
References: <20230616170022.76107-5-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616170022.76107-5-sebastian.reichel@collabora.com>

Hi Sebastian,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus rockchip/for-next linus/master v6.4-rc7 next-20230621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/dt-bindings-PCI-dwc-rockchip-Fix-interrupt-names-issue/20230617-010332
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20230616170022.76107-5-sebastian.reichel%40collabora.com
patch subject: [PATCH v1 4/4] arm64: dts: rockchip: rk3588: add PCIe2 support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230621/202306211833.rx96nmun-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211833.rx96nmun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211833.rx96nmun-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm64/boot/dts/rockchip/rk3588s.dtsi:1146.25-26 syntax error
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
