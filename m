Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2331E24550
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 11:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692876265; x=1724412265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jE4qVtu2UiWGC+c25VMdEfXzSCMOjbZ3T3WD9J4tJVc=;
  b=jiZkkDaNBLZ+EHOvW8+hpJSFyvo0BTiwp8N7XySKV+HK80wG8AbOjYR5
   1ANGgDjDDRrrmCYowQNCM3femP24IhynI3Xqq2PKEDu6i877CVUyVuyH7
   WCIN1MQKajirrr6PQ/s2Z/KAgbw7HSzT4OpfdMuvCoTbHCOyrvkNWHk59
   6g+1YUYT6hKyltEg1Q/99z2iX2E0bbTU531G+6rvQhJwS5Rd1+KyYwb5v
   D1KttktfiTKva/+Gnjcnb9XdAEXgT96qtHAMliMEjhCS2BMkP/9LjJ5y6
   Zj0TmUyWAcPeqmwLBmEUSPDmvOfGose+JFZFyHFH7RDDJ5yAUwlO11GjA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="460769476"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="460769476"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 04:24:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="860668212"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="860668212"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Aug 2023 04:24:16 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ8Rj-0001z2-37;
	Thu, 24 Aug 2023 11:24:15 +0000
Date: Thu, 24 Aug 2023 19:24:07 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Rob Herring <robh@kernel.org>
Subject: [linux-next:master 11796/12477] drivers/of/unittest.c:3763:14:
 error: 'overlays' undeclared
Message-ID: <202308241954.oRNfVqmB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b3bd393093b04d4882152398019cbb96b0440ff
commit: 26409dd045892904b059dc411403e9c8ce7543ca [11796/12477] of: unittest: Add pci_dt_testdrv pci driver
config: x86_64-randconfig-r033-20230824 (https://download.01.org/0day-ci/archive/20230824/202308241954.oRNfVqmB-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241954.oRNfVqmB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241954.oRNfVqmB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/of/unittest.c: In function 'testdrv_probe':
>> drivers/of/unittest.c:3763:14: error: 'overlays' undeclared (first use in this function)
    3763 |  for (info = overlays; info && info->name; info++) {
         |              ^~~~~~~~
   drivers/of/unittest.c:3763:14: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/of/unittest.c:3763:36: error: dereferencing pointer to incomplete type 'struct overlay_info'
    3763 |  for (info = overlays; info && info->name; info++) {
         |                                    ^~
>> drivers/of/unittest.c:3763:48: error: increment of pointer to an incomplete type 'struct overlay_info'
    3763 |  for (info = overlays; info && info->name; info++) {
         |                                                ^~
>> drivers/of/unittest.c:3773:8: error: too many arguments to function 'of_overlay_fdt_apply'
    3773 |  ret = of_overlay_fdt_apply(info->dtbo_begin, size, &ovcs_id, dn);
         |        ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/of/unittest.c:15:
   include/linux/of.h:1679:19: note: declared here
    1679 | static inline int of_overlay_fdt_apply(void *overlay_fdt, u32 overlay_fdt_size,
         |                   ^~~~~~~~~~~~~~~~~~~~


vim +/overlays +3763 drivers/of/unittest.c

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
> 3773		ret = of_overlay_fdt_apply(info->dtbo_begin, size, &ovcs_id, dn);
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
