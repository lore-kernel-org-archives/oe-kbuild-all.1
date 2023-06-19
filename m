Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BBA290E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 08:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687162280; x=1718698280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a+Nh0p7dHK89AvixHNurq8ZYoI3jcgLf032FyUREK2M=;
  b=Zcs5p8+R5NYvEEwKwD4c3PHE8X6+e6NZjXfBeFps8F7uV2dvlzsc88Ee
   QTtj+HOggWrBcI6EywsIXkSvY3aFO8x35uxwWKGDvYOxHDgrsfTdsO1Q8
   Xuf8VoVHhQ3bd7WPYtQP10OmR/u+xS8E145O8J8bxCZ7/+/zv1MvBC0Es
   ZZvhFMF0IY+8jQRBnpOciGy3q3jsDcLw5zCZA9y4msdlpPni4n606B1G1
   pNLTFe5/C4i+b59+DzjRQE0sj41VJwPtt/1YFERmPw5bTkO1ESyk2Du3B
   rdy8i5ELBUWCMgN7jN8/0gZABonV66yK7zuEcppnQHC8iwDz8y3hCMSrA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="445951718"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="445951718"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 01:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="837787251"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="837787251"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Jun 2023 01:11:18 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qB9yn-0004Xs-1X;
	Mon, 19 Jun 2023 08:11:17 +0000
Date: Mon, 19 Jun 2023 16:11:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-futex 5/9] io_uring/futex.c:213:2-7: WARNING:
 NULL check before some freeing functions is not needed.
Message-ID: <202306191618.vZjdPRNY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-futex
head:   fb7ef0b7370b8878fffc37ed55bece254ce1f97f
commit: 420eb7af69a81f8e1e2f414e55eb82ead69ffc2d [5/9] io_uring: add support for futex wake and wait
config: csky-randconfig-c031-20230618 (https://download.01.org/0day-ci/archive/20230619/202306191618.vZjdPRNY-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306191618.vZjdPRNY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306191618.vZjdPRNY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/futex.c:213:2-7: WARNING: NULL check before some freeing functions is not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
