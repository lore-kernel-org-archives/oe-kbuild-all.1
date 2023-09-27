Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11446D19
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 16:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695833850; x=1727369850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/HGO9rJznbG1IP0p5cQlZ6+H5DOdv5m0TtGoMqn4cgE=;
  b=i1Bfl0s2hB48WtCKe4Ggddm3Y1yH9pIDuCMrwhika7T8sP9p/NMoF4eG
   O+1KhV4e/7cwynsPlI9ke2fPnlglINda2NY7Iv7A49+RYKPWN5DXX5XvJ
   5LRVQROu7BbYJVDF0qI5+FYI0cVxl+dqhgujh2LyxNIdT/t9YjL0DGLtg
   Cb6tV4vgAMMiuXEbhU0/sNtSfcGQY1QTlc+g/swz38opL8HcOSnG8OQe/
   NF16g37GjmGkxHc8V7c2m4x9O/G6fOoXYlA3tAcUfb9xlSRYw8iEqXiZY
   zEnL6jfvYQJ7AwDpm9BT+us4BzNAdVDLM5UkcWZHtRUCxwIdDCc6NVIGP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="412787279"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="412787279"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="996224469"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="996224469"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 27 Sep 2023 09:57:27 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlXqn-0000SP-2D;
	Wed, 27 Sep 2023 16:57:25 +0000
Date: Thu, 28 Sep 2023 00:57:21 +0800
From: kernel test robot <lkp@intel.com>
To: Suma Hegde <suma.hegde@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo 4/6]
 drivers/platform/x86/amd/hsmp.c:449:63: warning: '%d' directive output may
 be truncated writing between 1 and 10 bytes into a region of size 9
Message-ID: <202309280057.XklWpUEN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo
head:   e17b4df0af1c21b767067b42c227d24d61b3ad15
commit: 7cede5a2d3af4df5cfe5cb18fcfbdfa9b9cb413c [4/6] platform/x86/amd/hsmp: add support for metrics tbl
config: x86_64-buildonly-randconfig-001-20230927 (https://download.01.org/0day-ci/archive/20230928/202309280057.XklWpUEN-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309280057.XklWpUEN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280057.XklWpUEN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/amd/hsmp.c: In function 'hsmp_pltdrv_probe':
>> drivers/platform/x86/amd/hsmp.c:449:63: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 9 [-Wformat-truncation=]
     449 |   snprintf((char *)attr_grp->name, HSMP_GRP_NAME_SIZE, "socket%d", i);
         |                                                               ^~
   drivers/platform/x86/amd/hsmp.c:449:56: note: directive argument in the range [0, 2147483646]
     449 |   snprintf((char *)attr_grp->name, HSMP_GRP_NAME_SIZE, "socket%d", i);
         |                                                        ^~~~~~~~~~
   drivers/platform/x86/amd/hsmp.c:449:3: note: 'snprintf' output between 8 and 17 bytes into a destination of size 15
     449 |   snprintf((char *)attr_grp->name, HSMP_GRP_NAME_SIZE, "socket%d", i);
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +449 drivers/platform/x86/amd/hsmp.c

   428	
   429	static int hsmp_create_sysfs_file(void)
   430	{
   431		const struct attribute_group **hsmp_attr_grps;
   432		struct bin_attribute **hsmp_bin_attrs;
   433		struct attribute_group *attr_grp;
   434		int ret, i;
   435	
   436		hsmp_attr_grps = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group *) *
   437					      (plat_dev.num_sockets + 1), GFP_KERNEL);
   438		if (!hsmp_attr_grps)
   439			return -ENOMEM;
   440	
   441		for (i = 0; i < plat_dev.num_sockets; i++) {
   442			attr_grp = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group), GFP_KERNEL);
   443			if (!attr_grp)
   444				return -ENOMEM;
   445	
   446			attr_grp->name = devm_kzalloc(plat_dev.dev, HSMP_GRP_NAME_SIZE, GFP_KERNEL);
   447			if (!attr_grp->name)
   448				return -ENOMEM;
 > 449			snprintf((char *)attr_grp->name, HSMP_GRP_NAME_SIZE, "socket%d", i);
   450	
   451			hsmp_bin_attrs = devm_kzalloc(plat_dev.dev, sizeof(struct bin_attribute *) *
   452						      (NUM_ATTRS + 1), GFP_KERNEL);
   453			if (!hsmp_bin_attrs)
   454				return -ENOMEM;
   455	
   456			attr_grp->bin_attrs		= hsmp_bin_attrs;
   457			attr_grp->is_bin_visible	= hsmp_metric_table_visible;
   458			hsmp_attr_grps[i]		= attr_grp;
   459	
   460			ret = hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, i);
   461			if (ret)
   462				return ret;
   463		}
   464		ret = devm_device_add_groups(plat_dev.dev, hsmp_attr_grps);
   465		if (ret)
   466			return ret;
   467	
   468		return 0;
   469	}
   470	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
