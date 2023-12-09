Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0DE10F6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 03:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgzPCbf4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702094154; x=1733630154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y0/P9ZYlnsj2VGEjMZNIbQTHM3v+Cf4A+i0BdCFxRbw=;
  b=QgzPCbf4t7jMV5SJnap1cZOIE12AV4eTGRMqJVO7vdx1/BfPVDwhZs3B
   rDGCClOos8iBesyt259pAH5NWeyJHDMBlOWHtE7GyC2qbX81sW1a+//rs
   r8e11t2/dslNI9wrH9ywh74UWRSVnoxh59EoGtpgLcyTJ3HIssU2qder1
   Af+BXP2ryiuz+SZeFKq+NaXRNmJ1wlO7S+fIjw7am/aTgrOKXTs5ptvHY
   kOSouvK5CxG8TBiOizqcvdhjcXYQWAFM3T6WEHogbKuV62vrFxcwnCIFM
   uhMBGkHxpxdP81jgTeggSxjmhuEXn5tawz4Pc9fWATaH/bAz/reWPCRM2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="480687070"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="480687070"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 19:55:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="838330438"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="838330438"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 08 Dec 2023 19:55:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBoRS-000EmR-0X;
	Sat, 09 Dec 2023 03:55:50 +0000
Date: Sat, 9 Dec 2023 11:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/bcachefs/error.h:168:9: warning: function 'bch2_bkey_fsck_err'
 might be a candidate for 'gnu_printf' format attribute
Message-ID: <202312091128.LxOCXRoz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5e3f5b81de80c98338bcb47c233aebefee5a4801
commit: b65db750e2bb9252321fd54c284edd73c1595a09 bcachefs: Enumerate fsck errors
date:   5 weeks ago
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20231209/202312091128.LxOCXRoz-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312091128.LxOCXRoz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091128.LxOCXRoz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/bcachefs.h:206,
                    from fs/bcachefs/acl.c:3:
   fs/bcachefs/bcachefs_format.h:215:25: warning: 'p' offset 3 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     215 |         struct bpos     p;
         |                         ^
   fs/bcachefs/bcachefs_format.h:217:25: warning: 'version' offset 27 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     217 |         struct bversion version;
         |                         ^~~~~~~
   In file included from fs/bcachefs/str_hash.h:8,
                    from fs/bcachefs/xattr.h:5,
                    from fs/bcachefs/acl.c:6:
   fs/bcachefs/error.h: In function 'bch2_bkey_fsck_err':
>> fs/bcachefs/error.h:168:9: warning: function 'bch2_bkey_fsck_err' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     168 |         prt_vprintf(err_msg, fmt, args);
         |         ^~~~~~~~~~~


vim +168 fs/bcachefs/error.h

   138	
   139	#define __fsck_err_on(cond, c, _flags, _err_type, ...)			\
   140		(unlikely(cond) ? __fsck_err(c, _flags, _err_type, __VA_ARGS__) : false)
   141	
   142	#define need_fsck_err_on(cond, c, _err_type, ...)				\
   143		__fsck_err_on(cond, c, FSCK_CAN_IGNORE|FSCK_NEED_FSCK, _err_type, __VA_ARGS__)
   144	
   145	#define need_fsck_err(c, _err_type, ...)				\
   146		__fsck_err(c, FSCK_CAN_IGNORE|FSCK_NEED_FSCK, _err_type, __VA_ARGS__)
   147	
   148	#define mustfix_fsck_err(c, _err_type, ...)				\
   149		__fsck_err(c, FSCK_CAN_FIX, _err_type, __VA_ARGS__)
   150	
   151	#define mustfix_fsck_err_on(cond, c, _err_type, ...)			\
   152		__fsck_err_on(cond, c, FSCK_CAN_FIX, _err_type, __VA_ARGS__)
   153	
   154	#define fsck_err(c, _err_type, ...)					\
   155		__fsck_err(c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
   156	
   157	#define fsck_err_on(cond, c, _err_type, ...)				\
   158		__fsck_err_on(cond, c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
   159	
   160	static inline void bch2_bkey_fsck_err(struct bch_fs *c,
   161					     struct printbuf *err_msg,
   162					     enum bch_sb_error_id err_type,
   163					     const char *fmt, ...)
   164	{
   165		va_list args;
   166	
   167		va_start(args, fmt);
 > 168		prt_vprintf(err_msg, fmt, args);
   169		va_end(args);
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
