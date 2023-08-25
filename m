Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C18B2915
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 19:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692990363; x=1724526363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ulHi7/K1qlSeCKhv0ydBA572/EkXfIF/8m+cnpKza3I=;
  b=QeLsezVf3EcrRNOjS6lc7IAUGbOcHINT62Zi+tcKNCUYvXwjKKnuKuyk
   hta6iEuAva4m2EdvUNdVZQZJ6gcI4BHTylbN7YACzbFI60qR3d/YTz2h9
   pLSLDSJOtQn4COFkdoXP79NyOZnZcNCI/HiSh+zvqwL/1KJcRSGEmHjPm
   ml+0LAchofhYqahhk+uJln9UyZntCt9r/CFe5rkCxsjSesQ/kW6gsZAWu
   O1QNprAX5olwhL5Aw7+AWfRh1RVTsKYwh20vmx3lCY0RmPycQQi9t7xrU
   Ozy0mXuSccJbHUEP+vHAUK5riTIsxzbrvH2cEHdJ71cHaCBMMz7swuaCK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="461145625"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="461145625"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 12:06:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="772584199"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="772584199"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Aug 2023 12:05:59 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZc86-0003vD-22;
	Fri, 25 Aug 2023 19:05:58 +0000
Date: Sat, 26 Aug 2023 03:05:48 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Rob Herring <robh@kernel.org>
Subject: [linux-next:master 11860/12910] drivers/of/unittest.c:3763:43:
 error: invalid use of undefined type 'struct overlay_info'
Message-ID: <202308260218.hAEW63gz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6269320850097903b30be8f07a5c61d9f7592393
commit: 26409dd045892904b059dc411403e9c8ce7543ca [11860/12910] of: unittest: Add pci_dt_testdrv pci driver
config: alpha-randconfig-r006-20230826 (https://download.01.org/0day-ci/archive/20230826/202308260218.hAEW63gz-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260218.hAEW63gz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260218.hAEW63gz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/of/unittest.c: In function 'testdrv_probe':
   drivers/of/unittest.c:3763:21: error: 'overlays' undeclared (first use in this function)
    3763 |         for (info = overlays; info && info->name; info++) {
         |                     ^~~~~~~~
   drivers/of/unittest.c:3763:21: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/of/unittest.c:3763:43: error: invalid use of undefined type 'struct overlay_info'
    3763 |         for (info = overlays; info && info->name; info++) {
         |                                           ^~
   drivers/of/unittest.c:3763:55: error: increment of pointer to an incomplete type 'struct overlay_info'
    3763 |         for (info = overlays; info && info->name; info++) {
         |                                                       ^~
   drivers/of/unittest.c:3764:33: error: invalid use of undefined type 'struct overlay_info'
    3764 |                 if (!strcmp(info->name, "overlay_pci_node"))
         |                                 ^~
   drivers/of/unittest.c:3767:27: error: invalid use of undefined type 'struct overlay_info'
    3767 |         if (!info || !info->name) {
         |                           ^~
   drivers/of/unittest.c:3772:20: error: invalid use of undefined type 'struct overlay_info'
    3772 |         size = info->dtbo_end - info->dtbo_begin;
         |                    ^~
   drivers/of/unittest.c:3772:37: error: invalid use of undefined type 'struct overlay_info'
    3772 |         size = info->dtbo_end - info->dtbo_begin;
         |                                     ^~
   drivers/of/unittest.c:3773:40: error: invalid use of undefined type 'struct overlay_info'
    3773 |         ret = of_overlay_fdt_apply(info->dtbo_begin, size, &ovcs_id, dn);
         |                                        ^~
   drivers/of/unittest.c:3773:15: error: too many arguments to function 'of_overlay_fdt_apply'
    3773 |         ret = of_overlay_fdt_apply(info->dtbo_begin, size, &ovcs_id, dn);
         |               ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/of/unittest.c:15:
   include/linux/of.h:1679:19: note: declared here
    1679 | static inline int of_overlay_fdt_apply(void *overlay_fdt, u32 overlay_fdt_size,
         |                   ^~~~~~~~~~~~~~~~~~~~


vim +3763 drivers/of/unittest.c

  3749	
  3750	static int testdrv_probe(struct pci_dev *pdev, const struct pci_device_id *id)
  3751	{
  3752		struct overlay_info *info;
  3753		struct device_node *dn;
  3754		int ret, ovcs_id;
  3755		u32 size;
  3756	
  3757		dn = pdev->dev.of_node;
  3758		if (!dn) {
  3759			dev_err(&pdev->dev, "does not find bus endpoint");
  3760			return -EINVAL;
  3761		}
  3762	
> 3763		for (info = overlays; info && info->name; info++) {
  3764			if (!strcmp(info->name, "overlay_pci_node"))
  3765				break;
  3766		}
  3767		if (!info || !info->name) {
  3768			dev_err(&pdev->dev, "no overlay data for overlay_pci_node");
  3769			return -ENODEV;
  3770		}
  3771	
  3772		size = info->dtbo_end - info->dtbo_begin;
  3773		ret = of_overlay_fdt_apply(info->dtbo_begin, size, &ovcs_id, dn);
  3774		of_node_put(dn);
  3775		if (ret)
  3776			return ret;
  3777	
  3778		of_platform_default_populate(dn, NULL, &pdev->dev);
  3779		pci_set_drvdata(pdev, (void *)(uintptr_t)ovcs_id);
  3780	
  3781		return 0;
  3782	}
  3783	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
