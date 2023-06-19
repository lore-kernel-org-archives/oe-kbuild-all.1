Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0348BE5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687185938; x=1718721938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yoEByqBkambGkCJiJIubqQfRE/V06XGkaD+JTvok5Kw=;
  b=Pb9N50+CrNWTFM7sBwfryEvfizDG8KMr8HODU6rl4qE9YaMeUouq6xOX
   4ECwaWxBQZ+8MwfYuxU330A3LKEASAKOHfvqEiZG8I9IbJ620vSU7KdXV
   bl70wbdYlTrThG2Xd4lYALVNLOEVehBDCrJWXszT0t4bRq6lMeBxR+T4l
   UBIxEu24TWbXo1MBEqkuQ1Cn/hYvyha/FNMjQ69KrloN/jVWNITRHWG8T
   LweWj8zl+0roSHviX+MVKotE7JAlnYzJZUFtkepWiyM0CY8MFsW7mAcQA
   ng9SILItLPCFlMSlmqnUr7T8AOh17E4ss2ed65i52lQg8OiPYKgrN4+i6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="388725057"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="388725057"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 07:45:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="743478143"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="743478143"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Jun 2023 07:45:33 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBG8K-0004o6-25;
	Mon, 19 Jun 2023 14:45:32 +0000
Date: Mon, 19 Jun 2023 22:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: Minda Chen <minda.chen@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Roger Quadros <rogerq@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Minda Chen <minda.chen@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: Re: [PATCH v7 4/5] phy: starfive: Add JH7110 PCIE 2.0 PHY driver
Message-ID: <202306192215.TvQco9m6-lkp@intel.com>
References: <20230619094759.21013-5-minda.chen@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619094759.21013-5-minda.chen@starfivetech.com>

Hi Minda,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.4-rc7 next-20230619]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Minda-Chen/dt-bindings-phy-Add-StarFive-JH7110-PCIe-PHY/20230619-184756
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230619094759.21013-5-minda.chen%40starfivetech.com
patch subject: [PATCH v7 4/5] phy: starfive: Add JH7110 PCIE 2.0 PHY driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230619/202306192215.TvQco9m6-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306192215.TvQco9m6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306192215.TvQco9m6-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_platform_ioremap_resource" [drivers/phy/starfive/phy-jh7110-pcie.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
WARNING: modpost: suppressed 19 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [m]:
   - PHY_STARFIVE_JH7110_PCIE [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
