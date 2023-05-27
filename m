Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044B211CA5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685207118; x=1716743118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yboutVWtpGa0SETiEbDedzkoypL8l9gY6xFMh6Sm3x0=;
  b=AziLok0pV3hVfo+3elZFPN+A6G5ZlxB2m64eOibprQOD63XnAiDPtF71
   n8I4WjqhjJeahGQgo+aXHKSZlJAHdo6n9B4x9Cypl9HkLSNzLDXeSiMmP
   uZkDoA/W3hSi9PiJ5vAXEDbxaURX66bVXuheaOANW3Rbs6EE+8+CNwNlI
   qSu1VCaF1bF3d+0u8s57QvGZx1Q3HwREtJpqf+J++oK8IBJ1r9in7xJcO
   4Oaevi5FlquLC5o9Pj/YNwbuzD/MKBLUFTE1hReUqtGiYsynN5X4N56VQ
   cabEjWK/4e3ctmEeJPxMCPOjm4UvD8P4DrtoG7mWV/G3dnkJfxNJQEziu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="382674608"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="382674608"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 10:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="770628736"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="770628736"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 May 2023 10:05:09 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2xLp-000K5W-0B;
	Sat, 27 May 2023 17:05:09 +0000
Date: Sun, 28 May 2023 01:04:45 +0800
From: kernel test robot <lkp@intel.com>
To: Tristram.Ha@microchip.com, "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	UNGLinuxDriver@microchip.com,
	Tristram Ha <Tristram.Ha@microchip.com>
Subject: Re: [PATCH net-next] net: phy: smsc: add WoL support to
 LAN8740/LAN8742 PHYs.
Message-ID: <202305280053.LordyDHm-lkp@intel.com>
References: <1685151574-2752-1-git-send-email-Tristram.Ha@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1685151574-2752-1-git-send-email-Tristram.Ha@microchip.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Tristram-Ha-microchip-com/net-phy-smsc-add-WoL-support-to-LAN8740-LAN8742-PHYs/20230527-094102
base:   net-next/main
patch link:    https://lore.kernel.org/r/1685151574-2752-1-git-send-email-Tristram.Ha%40microchip.com
patch subject: [PATCH net-next] net: phy: smsc: add WoL support to LAN8740/LAN8742 PHYs.
config: x86_64-randconfig-x076-20230526 (https://download.01.org/0day-ci/archive/20230528/202305280053.LordyDHm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/a1e40c5a7a32445d5ae4541d4e57bbc4b5065057
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tristram-Ha-microchip-com/net-phy-smsc-add-WoL-support-to-LAN8740-LAN8742-PHYs/20230527-094102
        git checkout a1e40c5a7a32445d5ae4541d4e57bbc4b5065057
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305280053.LordyDHm-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/phy/smsc.o: in function `smsc_crc16':
>> drivers/net/phy/smsc.c:330: undefined reference to `crc16'


vim +330 drivers/net/phy/smsc.c

   327	
   328	static u16 smsc_crc16(const u8 *buffer, size_t len)
   329	{
 > 330		return bitrev16(crc16(0xFFFF, buffer, len));
   331	}
   332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
