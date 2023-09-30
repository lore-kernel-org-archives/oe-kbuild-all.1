Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3C61385
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 06:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696056908; x=1727592908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tQIq4ld4jG2JZl9UblS1SdZ9anMZonGCZUn1Wq6P19M=;
  b=DJF1QrEmL/isUic6uycfwwz4z+fZOjhsrgDALdwHK/SbRlGylrGRXj3j
   dh++adIujkP9MSZHgYE5eH7+CmgQXNEPPdcza2q39QfBhIKFFOTSsZEbV
   m37nZgHrXx3GYMSDROXJ2Om3PToNaESLYaU3r8Z9PGc8SIbOKVdGWqddc
   yl9pwleA6XVXOdwlk1o9NcBEBLZBpHLLyVUEZ56nJNFrCM27Az+gtac+5
   b+Ks8zj/u1cK2kne6N02ZqraCOUJJOQ76KF0K3ztp1THoNF6mX5Mv5H4B
   bTDSDE6L30cmKMP7g71MFDEcMRelbpth7IuhZ2VvXX8eNlFc4Y0kmDQgZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="379710068"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="379710068"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 23:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="699856865"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="699856865"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 Sep 2023 23:55:04 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmTsU-0003oH-0O;
	Sat, 30 Sep 2023 06:55:02 +0000
Date: Sat, 30 Sep 2023 14:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wedson Almeida Filho <walmeida@microsoft.com>
Subject: Re: [PATCH 01/29] xattr: make the xattr array itself const
Message-ID: <202309301437.ZGtqFntR-lkp@intel.com>
References: <20230930050033.41174-2-wedsonaf@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930050033.41174-2-wedsonaf@gmail.com>

Hi Wedson,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2dde18cd1d8fac735875f2e4987f11817cc0bc2c]

url:    https://github.com/intel-lab-lkp/linux/commits/Wedson-Almeida-Filho/xattr-make-the-xattr-array-itself-const/20230930-130453
base:   2dde18cd1d8fac735875f2e4987f11817cc0bc2c
patch link:    https://lore.kernel.org/r/20230930050033.41174-2-wedsonaf%40gmail.com
patch subject: [PATCH 01/29] xattr: make the xattr array itself const
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230930/202309301437.ZGtqFntR-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309301437.ZGtqFntR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301437.ZGtqFntR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/reiserfs/xattr.c: In function 'listxattr_filler':
>> fs/reiserfs/xattr.c:822:57: warning: passing argument 1 of 'reiserfs_xattr_list' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     822 |                 if (!reiserfs_xattr_list(b->dentry->d_sb->s_xattr, name,
         |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
   fs/reiserfs/xattr.c:782:69: note: expected 'const struct xattr_handler **' but argument is of type 'const struct xattr_handler * const*'
     782 | static inline bool reiserfs_xattr_list(const struct xattr_handler **handlers,
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~


vim +822 fs/reiserfs/xattr.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  811  
25885a35a72007 Al Viro             2022-08-16  812  static bool listxattr_filler(struct dir_context *ctx, const char *name,
ac7576f4b1da8c Miklos Szeredi      2014-10-30  813  			    int namelen, loff_t offset, u64 ino,
ac7576f4b1da8c Miklos Szeredi      2014-10-30  814  			    unsigned int d_type)
^1da177e4c3f41 Linus Torvalds      2005-04-16  815  {
ac7576f4b1da8c Miklos Szeredi      2014-10-30  816  	struct listxattr_buf *b =
ac7576f4b1da8c Miklos Szeredi      2014-10-30  817  		container_of(ctx, struct listxattr_buf, ctx);
48b32a3553a547 Jeff Mahoney        2009-03-30  818  	size_t size;
f3fb9e27325c4e Fabian Frederick    2014-08-08  819  
48b32a3553a547 Jeff Mahoney        2009-03-30  820  	if (name[0] != '.' ||
48b32a3553a547 Jeff Mahoney        2009-03-30  821  	    (namelen != 1 && (name[1] != '.' || namelen != 2))) {
387b96a5891c07 Christian Brauner   2023-02-01 @822  		if (!reiserfs_xattr_list(b->dentry->d_sb->s_xattr, name,
387b96a5891c07 Christian Brauner   2023-02-01  823  					 b->dentry))
25885a35a72007 Al Viro             2022-08-16  824  			return true;
764a5c6b1fa430 Andreas Gruenbacher 2015-12-02  825  		size = namelen + 1;
48b32a3553a547 Jeff Mahoney        2009-03-30  826  		if (b->buf) {
a13f085d111e90 Jann Horn           2018-08-21  827  			if (b->pos + size > b->size) {
a13f085d111e90 Jann Horn           2018-08-21  828  				b->pos = -ERANGE;
25885a35a72007 Al Viro             2022-08-16  829  				return false;
a13f085d111e90 Jann Horn           2018-08-21  830  			}
764a5c6b1fa430 Andreas Gruenbacher 2015-12-02  831  			memcpy(b->buf + b->pos, name, namelen);
764a5c6b1fa430 Andreas Gruenbacher 2015-12-02  832  			b->buf[b->pos + namelen] = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  833  		}
48b32a3553a547 Jeff Mahoney        2009-03-30  834  		b->pos += size;
48b32a3553a547 Jeff Mahoney        2009-03-30  835  	}
25885a35a72007 Al Viro             2022-08-16  836  	return true;
^1da177e4c3f41 Linus Torvalds      2005-04-16  837  }
bd4c625c061c2a Linus Torvalds      2005-07-12  838  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
