Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9335E3A1BC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 13:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707743533; cv=none; b=Vhs9P8s8A9+k5lNsuhGpnmWVqc2EdAG0iEQUuoEZTGvezbRGHpoAct5A0CCJqBuih6kYrJxgP0NBUCTeMsBtklcTU8YoZ/6xewoVtchDBnErZNoJCHilLH6YC0N/r7iIQGgrUyjnVv3dm/yh+KESEtbNf94mQcgiP4ERZBs7b+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707743533; c=relaxed/simple;
	bh=10z6cdPX5X+iDSkWJPn5PzUPkdrF0gqsXw5u1Zgn980=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KR58WABRygm2NXDl/gtsRLf9Lx+8Nwl0YPdv2wuUnzN1XL3J+3s/KITQMpiR7kKPs7H1Q0C7KuLqPsYjFIy0Iec1A+5Az/qTyr36TJjTiQlzzVHo4nHbLt3wbjaB2w1nFYeYnYycXbKrEBAdu1YXGLvmQhqNeKhcplNWYvFm5Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2KlatJ/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2KlatJ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707743531; x=1739279531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=10z6cdPX5X+iDSkWJPn5PzUPkdrF0gqsXw5u1Zgn980=;
  b=R2KlatJ/WrE582gdE8xf9k9xx0as7GCVhzh4zo4FOZO1gH4Yx8+PUo+/
   flFifNryJZY1w8zqa09M9YwjgQohgde//Fq+5slyvIfJTAtncjhrGQI20
   mQHlSFcmsdpBa2aSfHzG6bC2Thm/4EBOLOoUVipl4kauoi86p49XmDuc1
   Y5hDPWxH0+w4ZMasKxWYDWG5OPf+LEXTgeelzwkof/cocuum4+rO2FT1A
   ar5nG7FWGg+XmW+JoMBDNw42+lF0g+iv1JI89y5pJ69SGjuQxvcYULlVe
   uHS+6zDxk/u1Ip8+TRLKxpKuUPaxRq3op/IZdGqlTbr9sMYsgDO4bl6u+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="5495552"
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; 
   d="scan'208";a="5495552"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 05:12:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; 
   d="scan'208";a="7232816"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Feb 2024 05:12:09 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZW6R-00078S-03;
	Mon, 12 Feb 2024 13:12:07 +0000
Date: Mon, 12 Feb 2024 21:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fsnotify-perf 3/3]
 include/linux/fsnotify_backend.h:506:60: error: 'struct super_block' has no
 member named 's_fsnotify_marks'
Message-ID: <202402122144.9Dm8i10y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fsnotify-perf
head:   36091a66bd764d918cf5fcc5797bc82b878a2bfe
commit: 36091a66bd764d918cf5fcc5797bc82b878a2bfe [3/3] fsnotify: move s_fsnotify_connectors into sb connector
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240212/202402122144.9Dm8i10y-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240212/202402122144.9Dm8i10y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402122144.9Dm8i10y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   include/linux/fsnotify_backend.h: In function 'fsnotify_sb_connector':
>> include/linux/fsnotify_backend.h:506:60: error: 'struct super_block' has no member named 's_fsnotify_marks'
     506 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                            ^~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify_backend.h:506:48: note: in expansion of macro 'READ_ONCE'
     506 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                ^~~~~~~~~
>> include/linux/fsnotify_backend.h:506:60: error: 'struct super_block' has no member named 's_fsnotify_marks'
     506 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                            ^~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify_backend.h:506:48: note: in expansion of macro 'READ_ONCE'
     506 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                ^~~~~~~~~
>> include/linux/fsnotify_backend.h:506:60: error: 'struct super_block' has no member named 's_fsnotify_marks'
     506 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                            ^~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify_backend.h:506:48: note: in expansion of macro 'READ_ONCE'
     506 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                ^~~~~~~~~
>> include/linux/fsnotify_backend.h:506:60: error: 'struct super_block' has no member named 's_fsnotify_marks'
     506 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                            ^~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify_backend.h:506:48: note: in expansion of macro 'READ_ONCE'
     506 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                ^~~~~~~~~
>> include/linux/fsnotify_backend.h:506:60: error: 'struct super_block' has no member named 's_fsnotify_marks'
     506 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                            ^~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify_backend.h:506:48: note: in expansion of macro 'READ_ONCE'
     506 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                ^~~~~~~~~
>> include/linux/fsnotify_backend.h:506:60: error: 'struct super_block' has no member named 's_fsnotify_marks'
     506 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                            ^~
   include/linux/compiler_types.h:391:27: note: in definition of macro '__unqual_scalar_typeof'
     391 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/linux/fsnotify_backend.h:506:48: note: in expansion of macro 'READ_ONCE'
     506 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                ^~~~~~~~~
   In file included from arch/alpha/include/asm/rwonce.h:33,
                    from include/linux/compiler.h:251,
                    from include/linux/array_size.h:5,
                    from include/linux/string.h:5,
                    from fs/open.c:8:
>> include/linux/fsnotify_backend.h:506:60: error: 'struct super_block' has no member named 's_fsnotify_marks'
     506 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                            ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/fsnotify_backend.h:506:48: note: in expansion of macro 'READ_ONCE'
     506 |         struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
         |                                                ^~~~~~~~~
   In file included from fs/open.c:12:
   include/linux/fsnotify.h: In function 'fsnotify_access':
   include/linux/fsnotify.h:392:9: error: implicit declaration of function 'fsnotify_file'; did you mean 'fsnotify_link'? [-Werror=implicit-function-declaration]
     392 |         fsnotify_file(file, FS_ACCESS);
         |         ^~~~~~~~~~~~~
         |         fsnotify_link
   cc1: some warnings being treated as errors


vim +506 include/linux/fsnotify_backend.h

   502	
   503	static inline struct fsnotify_sb_connector *fsnotify_sb_connector(
   504								struct super_block *sb)
   505	{
 > 506		struct fsnotify_mark_connector *conn = READ_ONCE(sb->s_fsnotify_marks);
   507	
   508		if (!conn)
   509			return NULL;
   510	
   511		return container_of(conn, struct fsnotify_sb_connector, fsn_conn);
   512	}
   513	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
