Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D666FD3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 23:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675726344; x=1707262344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uGcg6RXpN31VZJkVU6pRDi4QUO7SCFNy0sS4PebvV38=;
  b=V83cR7IkssCxpPZ1xhbg/rBpjcauBXlmk8WO97JjlcW1OzRfYf40aHdU
   EjstTbdV+tWtzb7djjBxTgN5MiJXRnf2cNUSdSDdDDOL+iKzjj+40XGHV
   MhnYvfgBHZRC4O2KodXjyZ4fgo7lryXdYsZ9CszCDkHKFp964rZWo0Pig
   PCdFxvv+MjwICeme+OfFzTAsftWFfPlt7Ca2MK6AahYs45kknxKavA+S1
   pweK1TC7ko+uUCbtw21AOirLS3Gmuxp6onrRVRYLtI8t5Gzf/fC5+eCbW
   Cj+SEh5zykPcq3036UgpGg2v+LXY/sdpYNIz2TEmj7U7pyZz1cYUxRxeZ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="327028856"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="327028856"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 15:32:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="668573206"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="668573206"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Feb 2023 15:32:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPAyC-0002rM-1T;
	Mon, 06 Feb 2023 23:32:20 +0000
Date: Tue, 7 Feb 2023 07:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 10/11] net: enetc: add RX support for
 zero-copy XDP sockets
Message-ID: <202302070724.8DHXW8De-lkp@intel.com>
References: <20230206100837.451300-11-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206100837.451300-11-vladimir.oltean@nxp.com>

Hi Vladimir,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Oltean/net-enetc-optimize-struct-enetc_rx_swbd-layout/20230206-181117
patch link:    https://lore.kernel.org/r/20230206100837.451300-11-vladimir.oltean%40nxp.com
patch subject: [RFC PATCH net-next 10/11] net: enetc: add RX support for zero-copy XDP sockets
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230207/202302070724.8DHXW8De-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fbab63c50d7c6cf49f331ad32599c48e98804258
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vladimir-Oltean/net-enetc-optimize-struct-enetc_rx_swbd-layout/20230206-181117
        git checkout fbab63c50d7c6cf49f331ad32599c48e98804258
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "enetc_xsk_wakeup" [drivers/net/ethernet/freescale/enetc/fsl-enetc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
