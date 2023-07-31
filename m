Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2799D1DDC1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 23:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690845531; x=1722381531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8GipQ4hEvRJSApWGCy1qqONt5HF8VluikrhoaEThb34=;
  b=aPR6bfqXrIh4LmtF3UyurpxbQpOPgEAhEwf0QJhFxeB5O4RynEYbFqvI
   PRViC5DQnpNfiLJpwIZbaboTmuuQlVtzcLCkZilvqJIBoD8wuD1T7Yliy
   +AysVhNKJjApIuUxWDhv5/Zhq9Y/xr4p6EQRRGcrVQVUOvNdSCsVjRjnA
   yk++jhBSBPuLNKldXdawcUUUsztRIPhKyJxfkLfx4/+l5M6WftoONgvY2
   BUIlMI7nQncvMneIGEHe98v7wU861mSroY2kb1y9Uj0eBCv3ydSbC1Sh9
   uU3Sjig2B671AQzOANh0ILdRfiK30OvTf0aUoFqhhinVccalYDy4hNSrN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="366620374"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="366620374"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 16:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763548750"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="763548750"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 31 Jul 2023 16:18:47 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQcA2-0005SN-1d;
	Mon, 31 Jul 2023 23:18:46 +0000
Date: Tue, 1 Aug 2023 07:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Wang <wangzhu9@huawei.com>, linux@armlinux.org.uk,
	airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	u.kleine-koenig@pengutronix.de, arnd@arndb.de
Cc: oe-kbuild-all@lists.linux.dev, wangzhu9@huawei.com
Subject: Re: [PATCH -next] drm/i2c: tda998x: remove redundant of_match_ptr
Message-ID: <202308010739.e8CIMoSS-lkp@intel.com>
References: <20230731130257.94751-1-wangzhu9@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731130257.94751-1-wangzhu9@huawei.com>

Hi Zhu,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230731]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhu-Wang/drm-i2c-tda998x-remove-redundant-of_match_ptr/20230731-210417
base:   next-20230731
patch link:    https://lore.kernel.org/r/20230731130257.94751-1-wangzhu9%40huawei.com
patch subject: [PATCH -next] drm/i2c: tda998x: remove redundant of_match_ptr
config: i386-buildonly-randconfig-r004-20230731 (https://download.01.org/0day-ci/archive/20230801/202308010739.e8CIMoSS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010739.e8CIMoSS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308010739.e8CIMoSS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i2c/tda998x_drv.c:2106:35: error: 'tda998x_dt_ids' undeclared here (not in a function); did you mean 'tda998x_ids'?
    2106 |                 .of_match_table = tda998x_dt_ids,
         |                                   ^~~~~~~~~~~~~~
         |                                   tda998x_ids


vim +2106 drivers/gpu/drm/i2c/tda998x_drv.c

  2100	
  2101	static struct i2c_driver tda998x_driver = {
  2102		.probe = tda998x_probe,
  2103		.remove = tda998x_remove,
  2104		.driver = {
  2105			.name = "tda998x",
> 2106			.of_match_table = tda998x_dt_ids,
  2107		},
  2108		.id_table = tda998x_ids,
  2109	};
  2110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
