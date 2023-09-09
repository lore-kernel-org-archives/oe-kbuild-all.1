Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C77C1377
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 21:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694296013; x=1725832013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pr3OkVlXYhMjbQD+RltjOT/YDZvS6el9Gytd45V+mQ8=;
  b=H+OItrl+Q5aUhlbPjjUtdrXrAoxqf1iJxEVx1apeRN3NuNBRkOVNWK6G
   l6UL3I7VXbRlvWP1clP9KAyCPdi+k6J3uSdrnuqHf1tmmBG4MQUy6mqZF
   bKZLYiyBPssdslzkSA4Y4AcKylsha0kdkzmXys24zoh+SD/IY/WZ7iGVi
   nV8WFihfv19V4BE8S9AUXRxlY8KbVC8iJ0nluKKkKC24Ow9RfhIgJm+Xc
   /7tSPYc+pKWZ+Yw9m4i18JAUMAW1M6D7zpYXWNWf/oVriKnjKP/UeVk4N
   HW6yw3X3WP1macny4AlALscH6KIxEBwupR8bycSmY7ayJNi6NUqvV97+N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357315028"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="357315028"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 14:46:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="857814540"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="857814540"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Sep 2023 14:46:51 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qf5my-0003yc-39;
	Sat, 09 Sep 2023 21:46:48 +0000
Date: Sun, 10 Sep 2023 05:46:41 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-lvts 14474/14520] hppa-linux-ld:
 drivers/mtd/mtdsplit/mtdsplit_fit.c:311:undefined reference to
 `fdt_next_node'
Message-ID: <202309100530.1G8nprv2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-lvts
head:   f57e179d55d63bf610762bac281150fed3113091
commit: 5faa51c4316aeefc510197b28bdd6c5a16446f73 [14474/14520] OWRT BUILD: mtd: mtdsplit support
config: parisc-randconfig-r004-20230910 (https://download.01.org/0day-ci/archive/20230910/202309100530.1G8nprv2-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309100530.1G8nprv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309100530.1G8nprv2-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `mtdsplit_fit_parse':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:303:(.text+0x388): undefined reference to `fdt_path_offset'
>> hppa-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.c:311:(.text+0x39c): undefined reference to `fdt_next_node'
   hppa-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.c:313:(.text+0x3d0): undefined reference to `fdt_next_node'
   hppa-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `fit_image_get_data_position':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:110:(.text+0x3fc): undefined reference to `fdt_getprop'
   hppa-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `fit_image_get_data_size':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:134:(.text+0x418): undefined reference to `fdt_getprop'
   hppa-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `mtdsplit_fit_parse':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:313:(.text+0x440): undefined reference to `fdt_next_node'
   hppa-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `fit_image_get_data_offset':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:85:(.text+0x514): undefined reference to `fdt_getprop'
   hppa-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `fit_image_get_data':
   drivers/mtd/mtdsplit/mtdsplit_fit.c:59:(.text+0x548): undefined reference to `fdt_getprop'
   hppa-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `mtdsplit_fit_parse':
>> drivers/mtd/mtdsplit/mtdsplit_fit.c:305:(.text+0x608): undefined reference to `fdt_strerror'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
