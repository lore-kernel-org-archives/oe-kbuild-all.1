Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F7453A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VvkYbCXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700578387; x=1732114387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=//j1BpevxCdxEvuxbbYnFxlSm/E3VM8vnfUIZkGChV0=;
  b=VvkYbCXyWGLmSf9QIMFe/A1zZ4M8jnWgM4mR1haSKwNp5YF+fLaqkY1C
   /4gYVcSxnpuMAUD4hafgYhAkAhAcjre8vYrSKAJU3aCyi/+8744BmIr7Q
   JytBTtyIM6h3Imf42HhbvzvdMLvCAQAxAPfOD/1a2rtHfJdWOPj4QsTAU
   VRbED9Mn3e+KAwpeULGwXhKvXyeZwokBmprW7pGWuKq2VeYdvyJkOTsRO
   tvs3wsgCwPRVYboQEQvp59EZ7ZMKjmV6J5eDt1ZqaijLYD6iiVdLRItzg
   Xe533bfaM7+9EUXfqbo10HJpxT11p9ay7P1jgz2fzIZEpR1o7a2UXzofb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="422945827"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="422945827"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 06:53:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="884230877"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="884230877"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2023 06:53:05 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5S7V-0007w5-1c;
	Tue, 21 Nov 2023 14:52:58 +0000
Date: Tue, 21 Nov 2023 22:51:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1705/2217]
 fs/bcachefs/btree_write_buffer_types.h:23:9: warning: alignment 1 of 'struct
 <anonymous>' is less than 4
Message-ID: <202311212232.BHiGGdEF-lkp@intel.com>
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
commit: 9e5a6c7797b240f138b9bdd75d85d8f7c6f0e06d [1705/2217] bcachefs: btree write buffer now slurps keys from journal
config: i386-randconfig-141-20231121 (https://download.01.org/0day-ci/archive/20231121/202311212232.BHiGGdEF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311212232.BHiGGdEF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311212232.BHiGGdEF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/bcachefs.h:421,
                    from fs/bcachefs/acl.c:3:
>> fs/bcachefs/btree_write_buffer_types.h:23:9: warning: alignment 1 of 'struct <anonymous>' is less than 4 [-Wpacked-not-aligned]
      23 |         } __packed;
         |         ^
>> fs/bcachefs/btree_write_buffer_types.h:16:49: warning: 'pos' offset 3 in 'struct <anonymous>' isn't aligned to 4 [-Wpacked-not-aligned]
      16 |                 struct bpos                     pos;
         |                                                 ^~~
   In file included from fs/bcachefs/str_hash.h:8,
                    from fs/bcachefs/xattr.h:5,
                    from fs/bcachefs/acl.c:6:
   fs/bcachefs/error.h: In function 'bch2_bkey_fsck_err':
   fs/bcachefs/error.h:168:9: warning: function 'bch2_bkey_fsck_err' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     168 |         prt_vprintf(err_msg, fmt, args);
         |         ^~~~~~~~~~~
--
   In file included from fs/bcachefs/bcachefs.h:421,
                    from fs/bcachefs/bkey.c:3:
>> fs/bcachefs/btree_write_buffer_types.h:23:9: warning: alignment 1 of 'struct <anonymous>' is less than 4 [-Wpacked-not-aligned]
      23 |         } __packed;
         |         ^
>> fs/bcachefs/btree_write_buffer_types.h:16:49: warning: 'pos' offset 3 in 'struct <anonymous>' isn't aligned to 4 [-Wpacked-not-aligned]
      16 |                 struct bpos                     pos;
         |                                                 ^~~
--
   In file included from fs/bcachefs/bcachefs.h:421,
                    from fs/bcachefs/sb-errors.c:3:
>> fs/bcachefs/btree_write_buffer_types.h:23:9: warning: alignment 1 of 'struct <anonymous>' is less than 4 [-Wpacked-not-aligned]
      23 |         } __packed;
         |         ^
>> fs/bcachefs/btree_write_buffer_types.h:16:49: warning: 'pos' offset 3 in 'struct <anonymous>' isn't aligned to 4 [-Wpacked-not-aligned]
      16 |                 struct bpos                     pos;
         |                                                 ^~~
   fs/bcachefs/sb-errors.c:9:21: warning: initialized field overwritten [-Woverride-init]
       9 |         BCH_SB_ERRS()
         |                     ^
   fs/bcachefs/sb-errors.c:8:29: note: in definition of macro 'x'
       8 | #define x(t, n, ...) [n] = #t,
         |                             ^
   fs/bcachefs/sb-errors.c:9:9: note: in expansion of macro 'BCH_SB_ERRS'
       9 |         BCH_SB_ERRS()
         |         ^~~~~~~~~~~
   fs/bcachefs/sb-errors.c:9:21: note: (near initialization for 'bch2_sb_error_strs[50]')
       9 |         BCH_SB_ERRS()
         |                     ^
   fs/bcachefs/sb-errors.c:8:29: note: in definition of macro 'x'
       8 | #define x(t, n, ...) [n] = #t,
         |                             ^
   fs/bcachefs/sb-errors.c:9:9: note: in expansion of macro 'BCH_SB_ERRS'
       9 |         BCH_SB_ERRS()
         |         ^~~~~~~~~~~


vim +23 fs/bcachefs/btree_write_buffer_types.h

    10	
    11	struct wb_key_ref {
    12	union {
    13		struct {
    14	#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
    15			unsigned			idx:24;
  > 16			struct bpos			pos;
    17			enum btree_id			btree:8;
    18	#else
    19			enum btree_id			btree:8;
    20			struct bpos			pos;
    21			unsigned			idx:24;
    22	#endif
  > 23		} __packed;
    24		struct {
    25	#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
    26			u64 lo;
    27			u64 mi;
    28			u64 hi;
    29	#else
    30			u64 hi;
    31			u64 mi;
    32			u64 lo;
    33	#endif
    34		};
    35	};
    36	};
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
