Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34C64435
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 07:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695281296; x=1726817296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wGmmZcCn/O+lAPzzrlE78UV/vq04lN8pfOpNrE9E5RU=;
  b=K2ofjgn6dCNXQpN9taz/Yd1GcR1Fi+1jgVT39dANBBdYERXcGqaTPNYp
   sbwMEZcrGMzoHBkq7VD+89GTWkNAbAxdWIxodVghsj/R6U8+SfGVE6Ad+
   BQ7wQMfLgbmVKvu3JgVMP8BhA/RqFqW2tMuAB2M5SLM8JmjpXj9QCM/Xb
   /qRBkcTVio2ZsnNc+VcxetPY4F+mMniNlAneeFi8GpR4oXUtI7/1NKyub
   8lvF4TdNz+yGORQm1P0gKBwHeZLEgzzV3sWI1ewPbgWGf/ej7uRJc7Ord
   +595zU9qDWX6R8CegfTXYob8qqYoAZQbjwgjQDerlwQkVR3DYcvkAqCbV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466752590"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="466752590"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 00:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="723645323"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="723645323"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Sep 2023 00:28:13 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjE6d-0009i1-16;
	Thu, 21 Sep 2023 07:28:11 +0000
Date: Thu, 21 Sep 2023 15:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Davor Joja <davor.joja@logicbricks.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 334/1365]
 drivers/media/i2c/adv7511-v4l2.c:2222:21: warning: no previous declaration
 for 'adv7511_subdev'
Message-ID: <202309211559.eXUC9TI5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   008e6788f5aa09862307822bfc396c926dc0dbac
commit: 735b2b500b004b16981ba99aed31749db2e7104a [334/1365] drivers: media: Customized adv7511 for Xylon LogiCVC (deprecated)
config: i386-buildonly-randconfig-001-20230921 (https://download.01.org/0day-ci/archive/20230921/202309211559.eXUC9TI5-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211559.eXUC9TI5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309211559.eXUC9TI5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/adv7511-v4l2.c:2222:21: warning: no previous declaration for 'adv7511_subdev' [-Wmissing-declarations]
    struct v4l2_subdev *adv7511_subdev(struct v4l2_subdev *sd)
                        ^~~~~~~~~~~~~~


vim +/adv7511_subdev +2222 drivers/media/i2c/adv7511-v4l2.c

  2221	
> 2222	struct v4l2_subdev *adv7511_subdev(struct v4l2_subdev *sd)
  2223	{
  2224		static struct v4l2_subdev *subdev;
  2225	
  2226		if (sd)
  2227			subdev = sd;
  2228	
  2229		return subdev;
  2230	}
  2231	EXPORT_SYMBOL(adv7511_subdev);
  2232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
