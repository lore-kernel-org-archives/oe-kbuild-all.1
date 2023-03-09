Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01E97E6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 06:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678342460; x=1709878460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2K62SrZiHQjF6e8srmIrQVlR1O8haqnD1lsxLpt8L60=;
  b=Vbt0ONvpKdpYh6tiee1BREa/KRZX+hk5Aw0E/3YT/0zqJj3tqjHvatyt
   T1+CxyyDhb6JDC83EtIUmjPyg7LQY9FOYwu5AS6cuwua6d1pz/6/UrZLE
   lhHfDm6CIYhU+Mh7x1K7hUrzZVfuCyR+6iQP3pJTqOAkzu038d6dVi2yH
   tdUZuf9qPeUQwtHKzoGEJ6x8bskQl/dVTnHU8iPh7VOr78qCWG6PxkZGa
   h8mCeo36MzwP4LPxiRt41g8zqGqSDjqh+P9LhN7atho3peSfnor34L/Bn
   yUWGKTpMKLugP2h5DMzqTLcUYxn0cAtfN+UDzeQYUl5IGhXGzNUTIQg3e
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="337889174"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="337889174"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 22:14:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="709720991"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="709720991"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Mar 2023 22:14:12 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa9XY-0002hh-08;
	Thu, 09 Mar 2023 06:14:12 +0000
Date: Thu, 9 Mar 2023 14:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-omap@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Michael Walle <michael@walle.cc>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	thomas.petazzoni@bootlin.com, Russell King <linux@armlinux.org.uk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jay Vosburgh <j.vosburgh@gmail.com>,
	Veaceslav Falico <vfalico@gmail.com>,
	Andy Gospodarek <andy@greyhouse.net>,
	Joakim Zhang <qiangqing.zhang@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	UNGLinuxDriver@microchip.com,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Minghao Chi <chi.minghao@zte.com.cn>
Subject: Re: [PATCH v3 3/5] net: Let the active time stamping layer be
 selectable.
Message-ID: <202303091304.yj8NySNz-lkp@intel.com>
References: <20230308135936.761794-4-kory.maincent@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308135936.761794-4-kory.maincent@bootlin.com>

Hi Köry,

I love your patch! Yet something to improve:

[auto build test ERROR on v6.2]
[cannot apply to robh/for-next horms-ipvs/master net/master net-next/master linus/master v6.3-rc1 next-20230309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/K-ry-Maincent/net-ethtool-Refactor-identical-get_ts_info-implementations/20230308-220453
patch link:    https://lore.kernel.org/r/20230308135936.761794-4-kory.maincent%40bootlin.com
patch subject: [PATCH v3 3/5] net: Let the active time stamping layer be selectable.
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230309/202303091304.yj8NySNz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/d81a36f239360e7e3b9ca2633e52b3cb12205590
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review K-ry-Maincent/net-ethtool-Refactor-identical-get_ts_info-implementations/20230308-220453
        git checkout d81a36f239360e7e3b9ca2633e52b3cb12205590
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091304.yj8NySNz-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: arch/x86/um/checksum_32.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: net/core/dev_ioctl.o: in function `dev_hwtstamp_ioctl':
   net/core/dev_ioctl.c:280: undefined reference to `phy_do_ioctl'
>> /usr/bin/ld: net/core/dev_ioctl.c:290: undefined reference to `phy_mii_ioctl'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
