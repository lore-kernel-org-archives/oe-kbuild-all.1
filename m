Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74598B679
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 21:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694555390; x=1726091390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8c3AlO8PBtO5Q8LR1lCzc5UiCpzDk6phi7ZBAGbhAfA=;
  b=OffHMfhn/9bqVOUI9fMZbMVyVVIH59jT2Frw6jyqat9BZlwgHgkOydfI
   41sgLdTqorjz5jqOOGcGRiJ3u+g5/p6hFjC/MHOcxiBtChuwwuhqa+SIO
   zfxRO4nzkCCQymY7tcyQ8QQFhyhfGD3M+wgI09ZvkFaxLH391DQEHSmRz
   E/J58uw0MBKSotNEDCUj5AhoBfvvaWu5azVjozRr0WtgwB9XNJVk9vbzh
   BROEGL5MwAQY7dMplu/R/0p/NKLyk4n92I0NapBJjkS2k38nGDaFcXlaG
   wg1IaxLXovN1mEtMENfXuRbqhUxJhRGpipWWIqTf3dLe86/lS3JjFvFQq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="444939178"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="444939178"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 14:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="809421557"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="809421557"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 12 Sep 2023 14:49:45 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgBGR-0000JF-0o;
	Tue, 12 Sep 2023 21:49:43 +0000
Date: Wed, 13 Sep 2023 05:49:32 +0800
From: kernel test robot <lkp@intel.com>
To: sunying@nj.iscas.ac.cn, lgirdwood@gmail.com, broonie@kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, pengpeng@iscas.ac.cn,
	renyanjie01@gmail.com, Ying Sun <sunying@nj.iscas.ac.cn>
Subject: Re: [PATCH] regulator: mtk-dvfsrc: remove non-existent configuration
 dependency "MTK_DVFSRC"
Message-ID: <202309130559.z9VcY7Ak-lkp@intel.com>
References: <20230912013929.658-1-sunying@nj.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912013929.658-1-sunying@nj.iscas.ac.cn>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on linus/master v6.6-rc1 next-20230912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sunying-nj-iscas-ac-cn/regulator-mtk-dvfsrc-remove-non-existent-configuration-dependency-MTK_DVFSRC/20230912-101109
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20230912013929.658-1-sunying%40nj.iscas.ac.cn
patch subject: [PATCH] regulator: mtk-dvfsrc: remove non-existent configuration dependency "MTK_DVFSRC"
config: sparc64-allyesconfig (https://download.01.org/0day-ci/archive/20230913/202309130559.z9VcY7Ak-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130559.z9VcY7Ak-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130559.z9VcY7Ak-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/mtk-dvfsrc-regulator.c:9:10: fatal error: linux/of_.h: No such file or directory
       9 | #include <linux/of_.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +9 drivers/regulator/mtk-dvfsrc-regulator.c

a0db6b0aa670ba henryc.chen 2020-12-24   4  
a0db6b0aa670ba henryc.chen 2020-12-24   5  #include <linux/err.h>
a0db6b0aa670ba henryc.chen 2020-12-24   6  #include <linux/init.h>
a0db6b0aa670ba henryc.chen 2020-12-24   7  #include <linux/module.h>
a0db6b0aa670ba henryc.chen 2020-12-24   8  #include <linux/platform_device.h>
045a44d4c9b325 Rob Herring 2023-07-14  @9  #include <linux/of_.h>
a0db6b0aa670ba henryc.chen 2020-12-24  10  #include <linux/regulator/driver.h>
a0db6b0aa670ba henryc.chen 2020-12-24  11  #include <linux/regulator/of_regulator.h>
a0db6b0aa670ba henryc.chen 2020-12-24  12  #include <linux/soc/mediatek/mtk_dvfsrc.h>
a0db6b0aa670ba henryc.chen 2020-12-24  13  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
