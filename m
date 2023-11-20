Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F461FA4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 03:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RfxUWsGU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700450964; x=1731986964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=79nx+jYDbS/YIn8ND8Ww6p1B32P9iaQpRFvr5tSfCWY=;
  b=RfxUWsGU83BkRYGr8AHGQyM6DAbglNW5bd1PoOd1KRQk2yaPaFHijite
   KppcPv6KQdJWSemACmMONFtZsP6QmoXYiCjtcwbBANJUw4dQiab5l3qtR
   cMrdOVVP8Qlo39Z2JDrV4FSpJb/J2YAuolXjfc3y6sX4qAHrF0Uk1GvHx
   fuMkL3zUbV5s1Fbesi7U7ReYObWACHAVPdz2C0y0kWXfE4KhfeyiSf0x0
   5To2BaijfDq73SCQv5HHpvMo4RJaPfhyiJxMsbzCuKT+V5tldF/rLYHUb
   FO98Dte39iCOjW7vQ853pyaoc4KxxxTD/TpZgiX7rfULwqLWdJ+xmuRj6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="370886752"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="370886752"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 19:29:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="7426029"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Nov 2023 19:29:22 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4uyN-0005tj-2K;
	Mon, 20 Nov 2023 03:29:19 +0000
Date: Mon, 20 Nov 2023 11:28:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-doc@vger.kernel.org
Subject: drivers/mmc/host/sdhci-omap.c:2: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202311201117.lFxgJTK6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   98b1cc82c4affc16f5598d4fa14b1858671b2263
commit: 7d326930d3522a1183b8d54126c524fcbccd3343 mmc: sdhci-omap: Add OMAP SDHCI driver
date:   6 years ago
config: x86_64-buildonly-randconfig-001-20231012 (https://download.01.org/0day-ci/archive/20231120/202311201117.lFxgJTK6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311201117.lFxgJTK6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201117.lFxgJTK6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mmc/host/sdhci-omap.c:265:6: warning: no previous prototype for 'sdhci_omap_set_ios' [-Wmissing-prototypes]
     265 | void sdhci_omap_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci-omap.c:326:6: warning: no previous prototype for 'sdhci_omap_set_power' [-Wmissing-prototypes]
     326 | void sdhci_omap_set_power(struct sdhci_host *host, unsigned char mode,
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci-omap.c:347:14: warning: no previous prototype for 'sdhci_omap_get_min_clock' [-Wmissing-prototypes]
     347 | unsigned int sdhci_omap_get_min_clock(struct sdhci_host *host)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/host/sdhci-omap.c:2: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * SDHCI Controller driver for TI's OMAP SoCs


vim +2 drivers/mmc/host/sdhci-omap.c

   > 2	 * SDHCI Controller driver for TI's OMAP SoCs
     3	 *
     4	 * Copyright (C) 2017 Texas Instruments
     5	 * Author: Kishon Vijay Abraham I <kishon@ti.com>
     6	 *
     7	 * This program is free software: you can redistribute it and/or modify
     8	 * it under the terms of the GNU General Public License version 2 of
     9	 * the License as published by the Free Software Foundation.
    10	 *
    11	 * This program is distributed in the hope that it will be useful,
    12	 * but WITHOUT ANY WARRANTY; without even the implied warranty of
    13	 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    14	 * GNU General Public License for more details.
    15	 *
    16	 * You should have received a copy of the GNU General Public License
    17	 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
    18	 */
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
