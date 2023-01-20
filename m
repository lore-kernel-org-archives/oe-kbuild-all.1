Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9FAB434
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 23:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674257676; x=1705793676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E2gxb0L3/toBnbFs7DTv3zXEuUw4WpxcDWK6bM6N05A=;
  b=geVKXPR7aHD14Bf8Kypx5+hDQa+yWWid38u26UTuHmrEmB/ubR+UGl58
   MA0amb6IzQljeGoSTYNYY/v7Ld/DSd0hLBGR1JlAzwtmqLQtcVCHIWvjb
   BfzC83cDIS7noyALdOeRHxz+gC+n4bI7woaYTvQ+EfacuIvm07VEtf+wd
   91UA6bjS8bz5QJc7EmiTqSQTBvj0SFkvjwP83xayo0NT6c4QM7IV0A04C
   Z9qvs3qZyOKul3l+3CH+6VjPH53MIZ/UtBaDBh7tbz7Cdz96pRb+RjGsF
   IPmSk2nd7qLbSxdqAx6ITmKjwLA+qNVt2aTYZePQZXy35SEL9pFBCjFjR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="352979729"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="352979729"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 15:34:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="662708195"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="662708195"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jan 2023 15:34:32 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ0tz-00036I-20;
	Fri, 20 Jan 2023 23:34:31 +0000
Date: Sat, 21 Jan 2023 07:34:12 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <olteanv@gmail.com>,
	Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH] mt7530 don't make the CPU port a VLAN user port
Message-ID: <202301210746.xjCzhDc3-lkp@intel.com>
References: <20230120172132.rfo3kf4fmkxtw4cl@skbuf>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120172132.rfo3kf4fmkxtw4cl@skbuf>

Hi Vladimir,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.2-rc4 next-20230120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Oltean/mt7530-don-t-make-the-CPU-port-a-VLAN-user-port/20230121-012326
patch link:    https://lore.kernel.org/r/20230120172132.rfo3kf4fmkxtw4cl%40skbuf
patch subject: [PATCH] mt7530 don't make the CPU port a VLAN user port
config: i386-randconfig-a005 (https://download.01.org/0day-ci/archive/20230121/202301210746.xjCzhDc3-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/563aaac5703ee8530858faf04f93f30785d74cf6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vladimir-Oltean/mt7530-don-t-make-the-CPU-port-a-VLAN-user-port/20230121-012326
        git checkout 563aaac5703ee8530858faf04f93f30785d74cf6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/dsa/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/net/dsa/mt7530.c: In function 'mt7530_port_vlan_filtering':
>> drivers/net/dsa/mt7530.c:1525:26: warning: unused variable 'cpu_dp' [-Wunused-variable]
    1525 |         struct dsa_port *cpu_dp = dp->cpu_dp;
         |                          ^~~~~~


vim +/cpu_dp +1525 drivers/net/dsa/mt7530.c

83163f7dca5684 Sean Wang        2017-12-15  1519  
83163f7dca5684 Sean Wang        2017-12-15  1520  static int
89153ed6ebc148 Vladimir Oltean  2021-02-13  1521  mt7530_port_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
89153ed6ebc148 Vladimir Oltean  2021-02-13  1522  			   struct netlink_ext_ack *extack)
83163f7dca5684 Sean Wang        2017-12-15  1523  {
1f9a6abecf538c Frank Wunderlich 2022-06-10  1524  	struct dsa_port *dp = dsa_to_port(ds, port);
1f9a6abecf538c Frank Wunderlich 2022-06-10 @1525  	struct dsa_port *cpu_dp = dp->cpu_dp;
1f9a6abecf538c Frank Wunderlich 2022-06-10  1526  
83163f7dca5684 Sean Wang        2017-12-15  1527  	if (vlan_filtering) {
83163f7dca5684 Sean Wang        2017-12-15  1528  		/* The port is being kept as VLAN-unaware port when bridge is
83163f7dca5684 Sean Wang        2017-12-15  1529  		 * set up with vlan_filtering not being set, Otherwise, the
83163f7dca5684 Sean Wang        2017-12-15  1530  		 * port and the corresponding CPU port is required the setup
83163f7dca5684 Sean Wang        2017-12-15  1531  		 * for becoming a VLAN-aware port.
83163f7dca5684 Sean Wang        2017-12-15  1532  		 */
83163f7dca5684 Sean Wang        2017-12-15  1533  		mt7530_port_set_vlan_aware(ds, port);
563aaac5703ee8 Vladimir Oltean  2023-01-20  1534  //		mt7530_port_set_vlan_aware(ds, cpu_dp->index);
e3ee07d14fac20 Vladimir Oltean  2019-04-28  1535  	} else {
e3ee07d14fac20 Vladimir Oltean  2019-04-28  1536  		mt7530_port_set_vlan_unaware(ds, port);
83163f7dca5684 Sean Wang        2017-12-15  1537  	}
83163f7dca5684 Sean Wang        2017-12-15  1538  
83163f7dca5684 Sean Wang        2017-12-15  1539  	return 0;
83163f7dca5684 Sean Wang        2017-12-15  1540  }
83163f7dca5684 Sean Wang        2017-12-15  1541  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
