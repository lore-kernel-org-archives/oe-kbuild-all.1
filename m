Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2117A7F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 18:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686766667; x=1718302667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cb/tlLcemQqwOI4lam9e4x+BXxVl4DZKngYTE6Dr5Cg=;
  b=V6+HFciwQuwEAyKrzLwb96LLQK2S4rWHu4XKGT+UgwfehtaXHo35k/je
   y549JPB8X0xO7MEAyuVP3OKWj8s7XJ+UuMYhvzVfCYQ91tuX+7B6Ih4er
   UP8dU5ZoCFgl/aPVE53plPszI25c4irpcq6P3VIrQwa59PGMBRwm2I5QD
   /eD+mssIrpDkE1m5fr1iH8I0gtKuZckGGLOzH0PHkCAv5OvxDV2ne1Q9P
   2myx/ot3qeIdvHgp0FauARtAZ5vQVoasDZt7JQQ/Wtj/d7o1ZivIrgwCP
   FAdHvnySJbsm6DJV3FUTv+ynhHW1JwfkH81qffYYR5CGw4rqYJ6YmDz3t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="361174994"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="361174994"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 11:17:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="836350189"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="836350189"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Jun 2023 11:17:44 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9V3p-0000w7-14;
	Wed, 14 Jun 2023 18:17:39 +0000
Date: Thu, 15 Jun 2023 02:17:10 +0800
From: kernel test robot <lkp@intel.com>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Nava kishore Manne <nava.manne@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS_2023.1_update 132/1079]
 drivers/of/configfs.c:134:9: warning: no previous prototype for
 'cfs_overlay_item_dtbo_read'
Message-ID: <202306150253.lXle1LnQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pantelis,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS_2023.1_update
head:   b8d15414a440db0904ee32f03268e2d262dbf397
commit: 698cb7a307651a82aa2786c6ae8fac13e9cddf2d [132/1079] OF: DT-Overlay configfs interface (v8)
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230615/202306150253.lXle1LnQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/Xilinx/linux-xlnx/commit/698cb7a307651a82aa2786c6ae8fac13e9cddf2d
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS_2023.1_update
        git checkout 698cb7a307651a82aa2786c6ae8fac13e9cddf2d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/clk/ drivers/gpu/drm/xlnx/ drivers/media/platform/xilinx/ drivers/net/ethernet/xilinx/ drivers/of/ drivers/staging/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306150253.lXle1LnQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/configfs.c:134:9: warning: no previous prototype for 'cfs_overlay_item_dtbo_read' [-Wmissing-prototypes]
     134 | ssize_t cfs_overlay_item_dtbo_read(struct config_item *item,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/of/configfs.c:156:9: warning: no previous prototype for 'cfs_overlay_item_dtbo_write' [-Wmissing-prototypes]
     156 | ssize_t cfs_overlay_item_dtbo_write(struct config_item *item,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cfs_overlay_item_dtbo_read +134 drivers/of/configfs.c

   133	
 > 134	ssize_t cfs_overlay_item_dtbo_read(struct config_item *item,
   135					   void *buf, size_t max_count)
   136	{
   137		struct cfs_overlay_item *overlay = to_cfs_overlay_item(item);
   138	
   139		pr_debug("%s: buf=%p max_count=%zu\n", __func__, buf, max_count);
   140	
   141		if (!overlay->dtbo)
   142			return 0;
   143	
   144		/* copy if buffer provided */
   145		if (buf) {
   146			/* the buffer must be large enough */
   147			if (overlay->dtbo_size > max_count)
   148				return -ENOSPC;
   149	
   150			memcpy(buf, overlay->dtbo, overlay->dtbo_size);
   151		}
   152	
   153		return overlay->dtbo_size;
   154	}
   155	
 > 156	ssize_t cfs_overlay_item_dtbo_write(struct config_item *item,
   157					    const void *buf, size_t count)
   158	{
   159		struct cfs_overlay_item *overlay = to_cfs_overlay_item(item);
   160		int err;
   161	
   162		/* if it's set do not allow changes */
   163		if (overlay->path[0] != '\0' || overlay->dtbo_size > 0)
   164			return -EPERM;
   165	
   166		/* copy the contents */
   167		overlay->dtbo = kmemdup(buf, count, GFP_KERNEL);
   168		if (!overlay->dtbo)
   169			return -ENOMEM;
   170	
   171		overlay->dtbo_size = count;
   172	
   173		err = create_overlay(overlay, overlay->dtbo);
   174		if (err < 0)
   175			goto out_err;
   176	
   177		return count;
   178	
   179	out_err:
   180		kfree(overlay->dtbo);
   181		overlay->dtbo = NULL;
   182		overlay->dtbo_size = 0;
   183	
   184		return err;
   185	}
   186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
