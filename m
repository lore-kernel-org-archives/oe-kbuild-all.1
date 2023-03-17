Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470DC810
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 09:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679044573; x=1710580573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PqelyuH3Nsk0wfLo1PS2fQoEjLN+9ZtSqm2XgKZcS5U=;
  b=cObeIsHG3sPye9ytf+lk4kjgTDZbEpJNwedpj+fI6RWz+S1q6Qc33WFM
   bdFg0pcBrpJ1QjAqm5dI0rOAUq0xuVIkz0F0vIWhki+w7oWzdzs7xFyrP
   C59zF19uTkV+YbvEsbI68JfG8ArYfu+AwkoJchbCjYeDd5SidECyYOn/C
   FBuIhwKyGwJvltJ2B+O5O4oARSO4bu+K9Y1KBC6KVfkOB0RL6MnTwjGLK
   flAthPs/K8RqeWLC880FkLukUF72j3A3LmS4EaSSIR/KLeHTG8Myv6LoA
   Sjjo3KgYeRy8VykK1Io8IDP/SBGNnpHiq9Wi6bL0KyIS5cAad8hgkLXpR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="318617475"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="318617475"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 02:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="823598255"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="823598255"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Mar 2023 02:16:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd6Bu-0009G2-2q;
	Fri, 17 Mar 2023 09:16:02 +0000
Date: Fri, 17 Mar 2023 17:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next PATCH v4 04/14] net: phy: Add a binding for PHY LEDs
Message-ID: <202303171741.CmQ9G5ln-lkp@intel.com>
References: <20230317023125.486-5-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317023125.486-5-ansuelsmth@gmail.com>

Hi Christian,

I love your patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.3-rc2 next-20230317]
[cannot apply to net-next/main]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-dsa-qca8k-move-qca8k_port_to_phy-to-header/20230317-103653
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230317023125.486-5-ansuelsmth%40gmail.com
patch subject: [net-next PATCH v4 04/14] net: phy: Add a binding for PHY LEDs
config: arc-axs101_defconfig (https://download.01.org/0day-ci/archive/20230317/202303171741.CmQ9G5ln-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/762837764b4e6fc001509c79a6548943996c6577
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-Marangi/net-dsa-qca8k-move-qca8k_port_to_phy-to-header/20230317-103653
        git checkout 762837764b4e6fc001509c79a6548943996c6577
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171741.CmQ9G5ln-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: drivers/net/phy/mdio_bus.o: in function `__mdiobus_register':
   mdio_bus.c:(.text+0x968): undefined reference to `mdiobus_setup_mdiodev_from_board_info'
>> arc-elf-ld: mdio_bus.c:(.text+0x968): undefined reference to `mdiobus_setup_mdiodev_from_board_info'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLIB
   Depends on [n]: NETDEVICES [=y] && LEDS_CLASS [=n]
   Selected by [y]:
   - PHYLINK [=y] && NETDEVICES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
