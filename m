Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25AE51C4A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 16:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQNUwyL3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700585829; x=1732121829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EtbLH0mnynHvZjeOf6TfI9t71CQ+EeT42p4Nm6HpPp4=;
  b=GQNUwyL317HDJVVsEzLeDg3wFCAFi+0HKA4Ma86GLU8q3ZAozJ/nLzZM
   28MfqAJSjjPZkdlBU6+zOc34u3whS1U5qu4Y+XUrxOGSTXbUE3wgaMuqZ
   Lx3pN2gTbhM1FskXWsPqjwLNnd+kKqWyVDi+kABTwbQq35IZ7ZIovsvhB
   Moczc27SEKaKiXhGxTDgqjnfSl2b0HpTsZsqHmsl6P3mw8wO+LsfXGABn
   j5SCgEyZw6niPt5jr8qdvlJi4iQyMl/acv74I58EZ+yFp6YxHAuSSyz4E
   QIkgmTbAW09tFrK2CpSRRC+4j5c9clGqJbY6XScf7yzwuQafumUaShqlX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="390739170"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="390739170"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 08:57:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="890305279"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="890305279"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Nov 2023 08:57:07 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5U3c-00083y-2W;
	Tue, 21 Nov 2023 16:57:04 +0000
Date: Wed, 22 Nov 2023 00:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Hill <daniel@gluo.nz>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kent Overstreet <kmo@daterainc.com>
Subject: [linux-next:master 1707/2217] fs/bcachefs/super-io.c:661:5: warning:
 no previous prototype for '__bch2_read_super'
Message-ID: <202311220009.ykeIWLVS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   07b677953b9dca02928be323e2db853511305fa9
commit: 700b6aa33cac353aadde200e10391ec19905451c [1707/2217] bcachefs: add a quieter bch2_read_super
config: i386-randconfig-141-20231121 (https://download.01.org/0day-ci/archive/20231122/202311220009.ykeIWLVS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220009.ykeIWLVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311220009.ykeIWLVS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/bcachefs.h:421,
                    from fs/bcachefs/super-io.c:3:
   fs/bcachefs/btree_write_buffer_types.h:23:9: warning: alignment 1 of 'struct <anonymous>' is less than 4 [-Wpacked-not-aligned]
      23 |         } __packed;
         |         ^
   fs/bcachefs/btree_write_buffer_types.h:16:49: warning: 'pos' offset 3 in 'struct <anonymous>' isn't aligned to 4 [-Wpacked-not-aligned]
      16 |                 struct bpos                     pos;
         |                                                 ^~~
   In file included from fs/bcachefs/super-io.c:8:
   fs/bcachefs/error.h: In function 'bch2_bkey_fsck_err':
   fs/bcachefs/error.h:168:9: warning: function 'bch2_bkey_fsck_err' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     168 |         prt_vprintf(err_msg, fmt, args);
         |         ^~~~~~~~~~~
   fs/bcachefs/super-io.c: At top level:
>> fs/bcachefs/super-io.c:661:5: warning: no previous prototype for '__bch2_read_super' [-Wmissing-prototypes]
     661 | int __bch2_read_super(const char *path, struct bch_opts *opts,
         |     ^~~~~~~~~~~~~~~~~


vim +/__bch2_read_super +661 fs/bcachefs/super-io.c

   660	
 > 661	int __bch2_read_super(const char *path, struct bch_opts *opts,
   662			    struct bch_sb_handle *sb, bool ignore_notbchfs_msg)
   663	{
   664		u64 offset = opt_get(*opts, sb);
   665		struct bch_sb_layout layout;
   666		struct printbuf err = PRINTBUF;
   667		struct printbuf err2 = PRINTBUF;
   668		__le64 *i;
   669		int ret;
   670	#ifndef __KERNEL__
   671	retry:
   672	#endif
   673		memset(sb, 0, sizeof(*sb));
   674		sb->mode	= BLK_OPEN_READ;
   675		sb->have_bio	= true;
   676		sb->holder	= kmalloc(1, GFP_KERNEL);
   677		if (!sb->holder)
   678			return -ENOMEM;
   679	
   680		sb->sb_name = kstrdup(path, GFP_KERNEL);
   681		if (!sb->sb_name)
   682			return -ENOMEM;
   683	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
