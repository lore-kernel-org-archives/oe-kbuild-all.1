Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426BE18C38
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 21:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695333329; x=1726869329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AcAlZpYbvVfrIOL6ESzFoFf6b1b7MmaI1+TjVthvUD8=;
  b=Z3BwYQlu9QWw28xTJobHvn70dJIYQxlHVchoS8Y3YRy6I/d5+d+O0UV2
   KPyHZOpdm0GF26zgZsk4v2WdKUqeUFbEq4AgtOM/FGUIZsp5wlXjxWW2H
   Y/CTinYZ5mMB9MhNwRnZ5+QQfuRcowyARtn+X2MWkc318z4sdyIQm28+s
   38aLTgVyHKaCtaSiETPVyPejhsbOga/4k9nEBE2m4x2GQePuFUXYxhdqY
   lywqLLxiSfsHXzqI3S+Nlypjv2knHPXthMPNYC4J4JPQ3EnUChlrQ/YfB
   DFs5aM3Typb6OtUvXSwKs+frZTUYxio80lE3PYOndbb6Fgf4/kva7kNO7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="447156684"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="447156684"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 14:55:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="740849976"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="740849976"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Sep 2023 14:55:05 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjRdT-0000SJ-2l;
	Thu, 21 Sep 2023 21:55:01 +0000
Date: Fri, 22 Sep 2023 05:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4164/6975] fs/bcachefs/fs-io-pagecache.c:25:35:
 sparse: sparse: invalid assignment: &=
Message-ID: <202309220540.Tdv1xssY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   940fcc189c51032dd0282cbee4497542c982ac59
commit: 0060c68159fc4cc2beb2e184ba0b5677ff6ada05 [4164/6975] bcachefs: Split up fs-io.[ch]
config: x86_64-randconfig-122-20230922 (https://download.01.org/0day-ci/archive/20230922/202309220540.Tdv1xssY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309220540.Tdv1xssY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220540.Tdv1xssY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/fs-io-pagecache.c:25:35: sparse: sparse: invalid assignment: &=
>> fs/bcachefs/fs-io-pagecache.c:25:35: sparse:    left side has type int
>> fs/bcachefs/fs-io-pagecache.c:25:35: sparse:    right side has type restricted fgf_t
>> fs/bcachefs/fs-io-pagecache.c:31:69: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted fgf_t [usertype] fgp_flags @@     got int fgp_flags @@
   fs/bcachefs/fs-io-pagecache.c:31:69: sparse:     expected restricted fgf_t [usertype] fgp_flags
   fs/bcachefs/fs-io-pagecache.c:31:69: sparse:     got int fgp_flags
>> fs/bcachefs/fs-io-pagecache.c:41:49: sparse: sparse: restricted fgf_t degrades to integer
--
>> fs/bcachefs/fs-io-buffered.c:833:65: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected int @@     got restricted fgf_t @@
   fs/bcachefs/fs-io-buffered.c:833:65: sparse:     expected int
   fs/bcachefs/fs-io-buffered.c:833:65: sparse:     got restricted fgf_t

vim +25 fs/bcachefs/fs-io-pagecache.c

    13	
    14	int bch2_filemap_get_contig_folios_d(struct address_space *mapping,
    15					     loff_t start, u64 end,
    16					     int fgp_flags, gfp_t gfp,
    17					     folios *folios)
    18	{
    19		struct folio *f;
    20		u64 pos = start;
    21		int ret = 0;
    22	
    23		while (pos < end) {
    24			if ((u64) pos >= (u64) start + (1ULL << 20))
  > 25				fgp_flags &= ~FGP_CREAT;
    26	
    27			ret = darray_make_room_gfp(folios, 1, gfp & GFP_KERNEL);
    28			if (ret)
    29				break;
    30	
  > 31			f = __filemap_get_folio(mapping, pos >> PAGE_SHIFT, fgp_flags, gfp);
    32			if (IS_ERR_OR_NULL(f))
    33				break;
    34	
    35			BUG_ON(folios->nr && folio_pos(f) != pos);
    36	
    37			pos = folio_end_pos(f);
    38			darray_push(folios, f);
    39		}
    40	
  > 41		if (!folios->nr && !ret && (fgp_flags & FGP_CREAT))
    42			ret = -ENOMEM;
    43	
    44		return folios->nr ? 0 : ret;
    45	}
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
