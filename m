Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3651860
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 May 2023 02:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684808201; x=1716344201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O3Nuri+DG1gTT8nlRY3lmDXYmBR5yEt4so5n7inqQsU=;
  b=at/Dz0dTo7lrd61c9rWI3hwcbBOAKVz7/pN+fcjKgSmVlLwPw3AIHeWR
   HcoQTDtv7gMiE3xlb096kXwsi9d8K9AWBFvIfDIzTDPpkji979Kjr2+vw
   osZNOi+pozTOgJHmCx6m3X/pSJDzAbqH30lU2YotH8HwFh3dyAHt+v/NZ
   CRh7Z/9HioINtYv6jxPdj6UJBdWl8mp0otCdT+bNDlf06LVmvAuGwPooU
   V24m5o9RXoWV3wwiGL8Zl3SqVeC8tj55JtrS7+g70z6TWbFiOsBBQyt86
   7aAw7FMBtWOxNkjOrVhyI7XkT8EfVjILPtUct4STHlM/ZhQgq3aR8B1Em
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="351949734"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="351949734"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 19:16:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="654183381"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="654183381"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 May 2023 19:16:38 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q1HZl-000DRT-1v;
	Tue, 23 May 2023 02:16:37 +0000
Date: Tue, 23 May 2023 10:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai1@huaweicloud.com>, song@kernel.org, neilb@suse.de,
	akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org, yukuai3@huawei.com,
	yukuai1@huaweicloud.com, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH v2] md: fix duplicate filename for rdev
Message-ID: <202305230956.Zk6vAYvj-lkp@intel.com>
References: <20230522133225.2983667-1-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522133225.2983667-1-yukuai1@huaweicloud.com>

Hi Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on song-md/md-next]
[also build test WARNING on linus/master v6.4-rc3 next-20230522]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/md-fix-duplicate-filename-for-rdev/20230522-221940
base:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git md-next
patch link:    https://lore.kernel.org/r/20230522133225.2983667-1-yukuai1%40huaweicloud.com
patch subject: [PATCH v2] md: fix duplicate filename for rdev
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230523/202305230956.Zk6vAYvj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/b6addfb36d27d4c98b397edec92ed6feeaf7afab
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yu-Kuai/md-fix-duplicate-filename-for-rdev/20230522-221940
        git checkout b6addfb36d27d4c98b397edec92ed6feeaf7afab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305230956.Zk6vAYvj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/md.c:90:33: warning: 'md_rdev_misc_wq' defined but not used [-Wunused-variable]
      90 | static struct workqueue_struct *md_rdev_misc_wq;
         |                                 ^~~~~~~~~~~~~~~


vim +/md_rdev_misc_wq +90 drivers/md/md.c

edb39c9deda87d Goldwyn Rodrigues 2014-03-29  86  
90b08710e41a07 Bernd Schubert    2008-05-23  87  static DECLARE_WAIT_QUEUE_HEAD(resync_wait);
e804ac780e2f01 Tejun Heo         2010-10-15  88  static struct workqueue_struct *md_wq;
e804ac780e2f01 Tejun Heo         2010-10-15  89  static struct workqueue_struct *md_misc_wq;
cc1ffe61c026e2 Guoqing Jiang     2020-04-04 @90  static struct workqueue_struct *md_rdev_misc_wq;
90b08710e41a07 Bernd Schubert    2008-05-23  91  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
