Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6187E2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 04:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686285438; x=1717821438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9iO6iQ1MspJNfS1WrbKGwp9o/DpSKKLObbf3S0rI43o=;
  b=YjMIwwrEjrAQVrCkEDpGufZd+LEJEjCAaLVI8GRG2jrKZwPtnkfEuvU+
   KzgZTTSwxPk0gTziclPZuXjCphdROze473Qln9WTbkugm5VWCZQhSAAHv
   Z6MQekft57AlWmdPyPQmlR0aO4z+0hf3HxCe0rvvr82R7OSd1oweDGJ4a
   lkGeB/hH4OCPcvoXUjyRdgl0jFgpXvuEuNs9DceJVn5IiALJx0P3sCB9U
   vtCUw8/qlqAmEOL5ploYv4T/lhqTVoqCROtJO/d/5p7B9ZJDrGsdoutrl
   9A9pixtdZ1ZiDu5XqSeu+gjzRdB/6JPi10ZXYTiKGoaIewq0eGtAtJpj3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="337146263"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="337146263"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 21:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="713370523"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="713370523"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Jun 2023 21:37:15 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7TsA-0008dU-0m;
	Fri, 09 Jun 2023 04:37:14 +0000
Date: Fri, 9 Jun 2023 12:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: Tristram.Ha@microchip.com, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	UNGLinuxDriver@microchip.com,
	Tristram Ha <Tristram.Ha@microchip.com>
Subject: Re: [PATCH v1 net-next] net: phy: smsc: add WoL support to
 LAN8740/LAN8742 PHYs
Message-ID: <202306091217.3BjbElwv-lkp@intel.com>
References: <1686274280-2994-1-git-send-email-Tristram.Ha@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1686274280-2994-1-git-send-email-Tristram.Ha@microchip.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Tristram-Ha-microchip-com/net-phy-smsc-add-WoL-support-to-LAN8740-LAN8742-PHYs/20230609-093207
base:   net-next/main
patch link:    https://lore.kernel.org/r/1686274280-2994-1-git-send-email-Tristram.Ha%40microchip.com
patch subject: [PATCH v1 net-next] net: phy: smsc: add WoL support to LAN8740/LAN8742 PHYs
config: arc-randconfig-r021-20230609 (https://download.01.org/0day-ci/archive/20230609/202306091217.3BjbElwv-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add net-next https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
        git fetch net-next main
        git checkout net-next/main
        b4 shazam https://lore.kernel.org/r/1686274280-2994-1-git-send-email-Tristram.Ha@microchip.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091217.3BjbElwv-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: drivers/net/phy/smsc.o: in function `lan874x_set_wol':
>> smsc.c:(.text+0x688): undefined reference to `in_dev_finish_destroy'
>> arc-elf-ld: smsc.c:(.text+0x688): undefined reference to `in_dev_finish_destroy'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
