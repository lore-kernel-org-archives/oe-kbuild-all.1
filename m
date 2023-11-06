Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351A7A55
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 03:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6PlyZ3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699240448; x=1730776448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q3lw8Av1SW+w91e7mVWch1TkLU53z7jwJzxt8Bntw5I=;
  b=m6PlyZ3cziq1Cw6bVy6LU1TqhIx4hhcXwyYNpqZVncTizX078YdUanYd
   4ML4WatRFajzS4zatFKse3jXAACnfgbUhSI/rdJYUSWYjQu9Go6JRZoeH
   REJSLsWdBgX7xFtvOJwLebv1XmlXAuxTJP0dq+hGVmA9Izpjm94qp1jRl
   KVsdRIkWeEYn3QQRt4EfJrPD9iCXDurXUS8wj53x1CQZnqD3ej1Vr05by
   0kRl6E2WTqlWePWR/3x3MDgIrck6V+SGQe88mCsHp5Iazw+aVbNzrnZ2O
   1CVIcYA64p8jrF6aPhJ03cO9WOLDl1z18XI2b6M+972EF78XL+/7ANDiy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="374231525"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="374231525"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 19:14:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="762189124"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="762189124"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Nov 2023 19:14:06 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzq3v-00063f-2f;
	Mon, 06 Nov 2023 03:14:03 +0000
Date: Mon, 6 Nov 2023 11:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: lib/test_ida.c:16:6: warning: no previous prototype for 'ida_dump'
Message-ID: <202311061056.8cCxGEcI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   77fa2fbe87fc605c4bfa87dff87be9bfded0e9a3
commit: 8ab8ba38d48867aac01812e18f48fc9173ccd400 ida: Start new test_ida module
date:   5 years ago
config: x86_64-randconfig-r025-20230725 (https://download.01.org/0day-ci/archive/20231106/202311061056.8cCxGEcI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061056.8cCxGEcI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061056.8cCxGEcI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/test_ida.c:16:6: warning: no previous prototype for 'ida_dump' [-Wmissing-prototypes]
      16 | void ida_dump(struct ida *ida) { }
         |      ^~~~~~~~


vim +/ida_dump +16 lib/test_ida.c

    14	
    15	#ifdef __KERNEL__
  > 16	void ida_dump(struct ida *ida) { }
    17	#endif
    18	#define IDA_BUG_ON(ida, x) do {						\
    19		tests_run++;							\
    20		if (x) {							\
    21			ida_dump(ida);						\
    22			dump_stack();						\
    23		} else {							\
    24			tests_passed++;						\
    25		}								\
    26	} while (0)
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
