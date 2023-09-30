Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFF29CA60
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 03:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696046196; x=1727582196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f1o/iRbRt5CKgbm1nsZuuAokNvuRgnK+vupGHuWMOdk=;
  b=csdbv7SaSR/yY1B3QU4rCA0u3y1tPKznh4SUwHZv2It1mDx9dgNT/ilB
   NdKQAm+HZZ8jJRa2gUnce3RxJK1VOSQoPd/aldwC9cs6KZ3cgk334ZRQl
   shkk/zUXZaDPDaE4TnYbAZzRPqiWYXvlM92j/HSjn6u6BZoIlwDEnFfh8
   QN92xvZi+KC3wWHnGylJE4wUbHuBPTYBaf4lLIr+s8jZtbjjFikbqLKgh
   fDbl41eCQHyfT45yAt6mfR2liJK42hdfmyM2Scw7rAdjJesWD0wo2IhTd
   +dqt4j6HUNGObbi0BSroOzDFnzWVXF64I56X1MlfcB6gerGDoVvYaeGrI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="379703018"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="379703018"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 20:56:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="1081141730"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="1081141730"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 29 Sep 2023 20:56:29 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmR5f-0003fh-14;
	Sat, 30 Sep 2023 03:56:27 +0000
Date: Sat, 30 Sep 2023 11:55:55 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 01/53] media: videobuf2: Rework offset 'cookie'
 encoding pattern
Message-ID: <202309301123.yFQ6HRrA-lkp@intel.com>
References: <20230927153558.159278-2-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927153558.159278-2-benjamin.gaignard@collabora.com>

Hi Benjamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on sunxi/sunxi/for-next dtor-input/next dtor-input/for-linus linus/master v6.6-rc3 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/media-videobuf2-Rework-offset-cookie-encoding-pattern/20230928-003247
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230927153558.159278-2-benjamin.gaignard%40collabora.com
patch subject: [PATCH v8 01/53] media: videobuf2: Rework offset 'cookie' encoding pattern
config: powerpc64-randconfig-001-20230930 (https://download.01.org/0day-ci/archive/20230930/202309301123.yFQ6HRrA-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309301123.yFQ6HRrA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301123.yFQ6HRrA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/common/videobuf2/videobuf2-core.c:39:2: error: #error Expected PAGE_SHIFT to be 12
      39 | #error Expected PAGE_SHIFT to be 12
         |  ^~~~~


vim +39 drivers/media/common/videobuf2/videobuf2-core.c

    37	
    38	#if PAGE_SHIFT != 12
  > 39	#error Expected PAGE_SHIFT to be 12
    40	#endif
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
