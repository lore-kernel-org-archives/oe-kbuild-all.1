Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781602F4B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 12:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676896278; x=1708432278;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Kn3HV4A9P3dy2rcfVINvO28tAc9045o5Hscr84UwtVY=;
  b=hJ2j6GY7/QEfrSSNhffWLANYpRJCXNTp4z3r5EL2aIkTck7WbQHAQxrL
   ekk0kvB/pQ7mya/tcgWKqZaQNzhZuTI+oAOGtq5sNmEbYF2CggnRnnaZu
   mT9Mc2GoiI3BY4Hy7/pzj4vJ5aXwn+kE8vBH5ps+FTOaXIOlFcDuKqQz3
   jaQIduw5nzJOZJpPBYKyF7PnNySu7XfDkeMSQKk6amy/mhqOTfxvJziVN
   t3Ldf8C2aLRevkXMpFAyEgLuAatbpAAZ7bhfSmEfc6PDiq0J5PIS3iuVY
   OR4JZZ3Pz6Lu8M1rXpRq7h0f7qZ/OvsmvjKcUNBEu002NVL5qRM7Jo76J
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="333751609"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="333751609"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 04:31:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="760160179"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="760160179"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Feb 2023 04:31:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU5K7-000Du9-0q;
	Mon, 20 Feb 2023 12:31:15 +0000
Date: Mon, 20 Feb 2023 20:31:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-5.10.y-cicd 22509/22695] ERROR: modpost:
 "phy_mipi_dphy_get_default_config"
 [drivers/media/platform/cadence/cdns-csi2rx.ko] undefined!
Message-ID: <202302202041.HFeVcatH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y-cicd
head:   6051924999c0571e6f4fe813db135f05d4a8f0f5
commit: d3ec6a46d66c8008088b8f104430d9c48330b53b [22509/22695] media: cadence: csi2rx: Support runtime PM
config: x86_64-randconfig-a003-20230220 (https://download.01.org/0day-ci/archive/20230220/202302202041.HFeVcatH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y-cicd
        git checkout d3ec6a46d66c8008088b8f104430d9c48330b53b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302202041.HFeVcatH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "phy_mipi_dphy_get_default_config" [drivers/media/platform/cadence/cdns-csi2rx.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
