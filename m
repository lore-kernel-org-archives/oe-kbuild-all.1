Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9478B8C13
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cB5MXy2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699186933; x=1730722933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AWnU4vhr/KVP+OCfvhfjr1Y91JzeoC/E++lb6aeHgJc=;
  b=cB5MXy2t2a7XKnqjP6BrWd033Pd7SANcXT7QhFUS96n0lXbnjWoR47c0
   vYAdaxkBWBIZHUVgVk4GIhelG1/tSoidfQ/0Ra0QTtsKSWQ0bXuVGPZRd
   E6iWAhw9cPfeUzNn6n8s9bJ4ow6+Ja5zZvuEXModSo/GhSntm64HY0rgw
   R8HTc+BwAe94hrnJW8i7PR/FGxn+ekKZkSX+wIiJP+1N5bxBLpMzLSyMm
   zfq2AtnvCilzyTYgxm2/TWA/RR4nR3qelR+vobELVyrQ5rJ4QYGUr0ZUL
   XXW3pY+6e4GJ/ENgtfsI0NQKXQ2jSRSKauHof34yCQE5LZYcIMLm8U9dd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="392009505"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="392009505"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 04:22:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="935551885"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="935551885"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Nov 2023 04:22:09 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzc8l-0005Pt-0B;
	Sun, 05 Nov 2023 12:22:07 +0000
Date: Sun, 5 Nov 2023 20:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: Raghu Vatsavayi <rvatsavayi@caviumnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Derek Chickles <derek.chickles@caviumnetworks.com>,
	Satanand Burla <satananda.burla@caviumnetworks.com>,
	Felix Manlunas <felix.manlunas@caviumnetworks.com>
Subject: drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c:1069:13:
 warning: variable 'max_possible_vfs' set but not used
Message-ID: <202311052041.0lSUJmvT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c41041124bd14dd6610da256a3da4e5b74ce6b1
commit: d13520c7ca7761346d2787fff1b3b112f87da77a liquidio CN23XX: HW config for VF support
date:   7 years ago
config: x86_64-buildonly-randconfig-002-20231101 (https://download.01.org/0day-ci/archive/20231105/202311052041.0lSUJmvT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311052041.0lSUJmvT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311052041.0lSUJmvT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kobject.h:21,
                    from include/linux/pci.h:28,
                    from drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c:23:
   include/linux/sysfs.h: In function 'sysfs_get_dirent':
   include/linux/sysfs.h:517:44: warning: pointer targets in passing argument 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
     517 |         return kernfs_find_and_get(parent, name);
         |                                            ^~~~
         |                                            |
         |                                            const unsigned char *
   In file included from include/linux/sysfs.h:15:
   include/linux/kernfs.h:452:57: note: expected 'const char *' but argument is of type 'const unsigned char *'
     452 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
         |                                             ~~~~~~~~~~~~^~~~
   drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c: In function 'cn23xx_sriov_config':
   drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c:1117:24: error: 'struct octeon_sriov_info' has no member named 'sriov_enabled'
    1117 |         oct->sriov_info.sriov_enabled = 0;
         |                        ^
>> drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c:1069:13: warning: variable 'max_possible_vfs' set but not used [-Wunused-but-set-variable]
    1069 |         u32 max_possible_vfs;
         |             ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c: At top level:
   drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c:1210:6: warning: no previous declaration for 'cn23xx_dump_iq_regs' [-Wmissing-declarations]
    1210 | void cn23xx_dump_iq_regs(struct octeon_device *oct)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/max_possible_vfs +1069 drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c

  1063	
  1064	static int cn23xx_sriov_config(struct octeon_device *oct)
  1065	{
  1066		struct octeon_cn23xx_pf *cn23xx = (struct octeon_cn23xx_pf *)oct->chip;
  1067		u32 max_rings, total_rings, max_vfs, rings_per_vf;
  1068		u32 pf_srn, num_pf_rings;
> 1069		u32 max_possible_vfs;
  1070	
  1071		cn23xx->conf =
  1072			(struct octeon_config *)oct_get_config_info(oct, LIO_23XX);
  1073		switch (oct->rev_id) {
  1074		case OCTEON_CN23XX_REV_1_0:
  1075			max_rings = CN23XX_MAX_RINGS_PER_PF_PASS_1_0;
  1076			max_possible_vfs = CN23XX_MAX_VFS_PER_PF_PASS_1_0;
  1077			break;
  1078		case OCTEON_CN23XX_REV_1_1:
  1079			max_rings = CN23XX_MAX_RINGS_PER_PF_PASS_1_1;
  1080			max_possible_vfs = CN23XX_MAX_VFS_PER_PF_PASS_1_1;
  1081			break;
  1082		default:
  1083			max_rings = CN23XX_MAX_RINGS_PER_PF;
  1084			max_possible_vfs = CN23XX_MAX_VFS_PER_PF;
  1085			break;
  1086		}
  1087	
  1088		if (max_rings <= num_present_cpus())
  1089			num_pf_rings = 1;
  1090		else
  1091			num_pf_rings = num_present_cpus();
  1092	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
