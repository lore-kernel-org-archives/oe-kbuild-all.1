Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95E517A309
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 22:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739917452; cv=none; b=fOWqkZPTVfNvBk05hyyDqW1X5moKN48UEUuBVxdzvHRIEgtDH/7/2h4CGY6+KtXk7jMad6jrwEVxdmQBtGlJq4vzfK3kwrxJmX599vKGZ+RRW0U5zM7PfozAM1KQO4CbNTHKV1oLq52tE16hNxCRvxb8ytzF/yfK2jz49zcJUCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739917452; c=relaxed/simple;
	bh=5NRgVdMQmS8pMsNInCB9iH3rXluhtPu8Cc3GeDdomXY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qUWKiEyJHIelCiknHTGTQA8oa5akFpyO7SS9Lo8VeZmokN0p7r2zodiA/6B7ooo87qDv1MilYgCZ5oelxeJPw7UKnqBfE5yeAXWMSdf18UfD1/blXgMnWBtHkaTz5tPucMC5Chjfk+yIrv6vqhYHsqltdpdT0rjVg1tIw/rtN+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3j2AxZQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3j2AxZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739917449; x=1771453449;
  h=date:from:cc:subject:message-id:mime-version;
  bh=5NRgVdMQmS8pMsNInCB9iH3rXluhtPu8Cc3GeDdomXY=;
  b=E3j2AxZQBA9me/2R/uzxuUXIgCSQIBDsOWMLqaN+eU+zZERTxnlD2/lQ
   NFWTgj4QAk5QFJQZ3mibLFkCTmGXGSCGsSz4vVT1xpOLnG1yfVM/Pj3qn
   TapZ2CCVEIlZkwW56nCWmQI9dCCZLckVYsb4BiOvpkWjsiPN9Zca3QA/S
   i0qhhaZ3FssAg0RuOhpWRufjOeaycLBY0+kdN1xC7aqgoFakaoBCDdyts
   JcU0d8gakze+5wcyfjttvXmVC8NVHXxAwvTberKqD1luJMcFOWrXOWTMO
   cbc64m8EuYgIudmTrDT/VQ/g0f09T3bZ1f6cXK0dW/BB/CpQan2HgJyNA
   A==;
X-CSE-ConnectionGUID: 6B7ye0HzTd6+AfZdO2gdOw==
X-CSE-MsgGUID: IN1YyZpNQmKXOcu/p/fjaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40891099"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="40891099"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 14:24:09 -0800
X-CSE-ConnectionGUID: /NYicvoaQ6O2AW2PKaiLLA==
X-CSE-MsgGUID: G9hm2dm6Qq6sp1M295Oj/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115424080"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 Feb 2025 14:24:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkW0b-0000vH-1E
	for oe-kbuild-all@lists.linux.dev;
	Tue, 18 Feb 2025 22:24:05 +0000
Date: Wed, 19 Feb 2025 06:24:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1] include/linux/ceph/ceph_features.h:14:24:
 warning: 'CEPH_FEATUREMASK_RESERVED2' defined but not used
Message-ID: <202502190647.zCEapbwa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ilya,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: f179d3ba8cb9073c2d96315b79ff7bc658a1feee [1/1] libceph: new features macros
config: sh-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250219/202502190647.zCEapbwa-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502190647.zCEapbwa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502190647.zCEapbwa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/ceph/ceph_features.h:152:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(52, 1, OSD_PROXY_WRITE_FEATURES)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:152:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:153:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(53, 1, ERASURE_CODE_PLUGINS_V3)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:153:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:154:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(54, 1, OSD_HITSET_GMT)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:154:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:155:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(55, 1, HAMMER_0_94_4)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:155:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:156:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(56, 1, NEW_OSDOP_ENCODING)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:156:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:157:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(57, 1, MON_STATEFUL_SUB)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:157:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:158:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(57, 1, MON_ROUTE_OSDMAP) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:158:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:159:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(57, 1, OSDSUBOP_NO_SNAPCONTEXT) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:159:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:160:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(57, 1, SERVER_JEWEL) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:160:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:161:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(58, 1, CRUSH_TUNABLES5)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:161:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:162:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(58, 1, NEW_OSDOPREPLY_ENCODING) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:162:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:163:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(58, 1, FS_FILE_LAYOUT_V2) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:163:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:164:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(59, 1, FS_BTIME)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:164:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:165:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(59, 1, FS_CHANGE_ATTR) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:165:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:166:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(59, 1, MSG_ADDR2) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:166:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:167:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(60, 1, BLKIN_TRACING)  // *do not share this bit*
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:167:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:169:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(61, 1, RESERVED2)          // unused, but slow down!
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:169:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:170:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(62, 1, RESERVED)           // do not use; used as a sentinal
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:170:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:171:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE_DEPRECATED(63, 1, RESERVED_BROKEN, LUMINOUS) // client-facing
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:171:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:20:24: warning: 'DEPRECATED_CEPH_FEATUREMASK_RESERVED_BROKEN' defined but not used [-Wunused-const-variable=]
     const static uint64_t DEPRECATED_CEPH_FEATUREMASK_##name =  \
                           ^
   include/linux/ceph/ceph_features.h:171:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE_DEPRECATED'
    DEFINE_CEPH_FEATURE_DEPRECATED(63, 1, RESERVED_BROKEN, LUMINOUS) // client-facing
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:19:24: warning: 'DEPRECATED_CEPH_FEATURE_RESERVED_BROKEN' defined but not used [-Wunused-const-variable=]
     const static uint64_t DEPRECATED_CEPH_FEATURE_##name = (1ULL<<bit); \
                           ^
   include/linux/ceph/ceph_features.h:171:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE_DEPRECATED'
    DEFINE_CEPH_FEATURE_DEPRECATED(63, 1, RESERVED_BROKEN, LUMINOUS) // client-facing
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_RESERVED' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:170:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(62, 1, RESERVED)           // do not use; used as a sentinal
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_RESERVED' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:170:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(62, 1, RESERVED)           // do not use; used as a sentinal
    ^~~~~~~~~~~~~~~~~~~
>> include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_RESERVED2' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:169:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(61, 1, RESERVED2)          // unused, but slow down!
    ^~~~~~~~~~~~~~~~~~~
>> include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_RESERVED2' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:169:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(61, 1, RESERVED2)          // unused, but slow down!
    ^~~~~~~~~~~~~~~~~~~
>> include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_BLKIN_TRACING' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:167:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(60, 1, BLKIN_TRACING)  // *do not share this bit*
    ^~~~~~~~~~~~~~~~~~~
>> include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_BLKIN_TRACING' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:167:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(60, 1, BLKIN_TRACING)  // *do not share this bit*
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_MSG_ADDR2' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:166:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(59, 1, MSG_ADDR2) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_MSG_ADDR2' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:166:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(59, 1, MSG_ADDR2) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_FS_CHANGE_ATTR' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:165:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(59, 1, FS_CHANGE_ATTR) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_FS_CHANGE_ATTR' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:165:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(59, 1, FS_CHANGE_ATTR) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_FS_BTIME' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:164:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(59, 1, FS_BTIME)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_FS_BTIME' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:164:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(59, 1, FS_BTIME)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_FS_FILE_LAYOUT_V2' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:163:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(58, 1, FS_FILE_LAYOUT_V2) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_FS_FILE_LAYOUT_V2' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:163:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(58, 1, FS_FILE_LAYOUT_V2) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_NEW_OSDOPREPLY_ENCODING' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:162:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(58, 1, NEW_OSDOPREPLY_ENCODING) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_CRUSH_TUNABLES5' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:161:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(58, 1, CRUSH_TUNABLES5)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_SERVER_JEWEL' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:160:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(57, 1, SERVER_JEWEL) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_SERVER_JEWEL' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:160:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(57, 1, SERVER_JEWEL) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_OSDSUBOP_NO_SNAPCONTEXT' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:159:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(57, 1, OSDSUBOP_NO_SNAPCONTEXT) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_OSDSUBOP_NO_SNAPCONTEXT' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:159:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(57, 1, OSDSUBOP_NO_SNAPCONTEXT) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_MON_ROUTE_OSDMAP' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:158:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(57, 1, MON_ROUTE_OSDMAP) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_MON_ROUTE_OSDMAP' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:158:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(57, 1, MON_ROUTE_OSDMAP) // overlap
--
    DEFINE_CEPH_FEATURE(57, 1, MON_ROUTE_OSDMAP) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:158:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:159:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(57, 1, OSDSUBOP_NO_SNAPCONTEXT) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:159:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:160:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(57, 1, SERVER_JEWEL) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:160:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:161:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(58, 1, CRUSH_TUNABLES5)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:161:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:162:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(58, 1, NEW_OSDOPREPLY_ENCODING) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:162:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:163:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(58, 1, FS_FILE_LAYOUT_V2) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:163:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:164:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(59, 1, FS_BTIME)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:164:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:165:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(59, 1, FS_CHANGE_ATTR) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:165:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:166:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(59, 1, MSG_ADDR2) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:166:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:167:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(60, 1, BLKIN_TRACING)  // *do not share this bit*
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:167:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:169:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(61, 1, RESERVED2)          // unused, but slow down!
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:169:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:170:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE(62, 1, RESERVED)           // do not use; used as a sentinal
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:170:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   include/linux/ceph/ceph_features.h:171:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    DEFINE_CEPH_FEATURE_DEPRECATED(63, 1, RESERVED_BROKEN, LUMINOUS) // client-facing
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:171:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   In file included from include/linux/printk.h:329:0,
                    from include/linux/kernel.h:13,
                    from include/linux/list.h:8,
                    from include/linux/wait.h:6,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:4,
                    from net/ceph/messenger.c:5:
   net/ceph/messenger.c: In function 'ceph_sock_state_change':
   include/linux/dynamic_debug.h:123:4: warning: this statement may fall through [-Wimplicit-fallthrough=]
    do {        \
       ^
   include/linux/printk.h:333:2: note: in expansion of macro 'dynamic_pr_debug'
     dynamic_pr_debug(fmt, ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_debug.h:34:25: note: in expansion of macro 'pr_debug'
    # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                            ^~~~~~~~
   net/ceph/messenger.c:431:3: note: in expansion of macro 'dout'
      dout("%s TCP_CLOSE\n", __func__);
      ^~~~
   net/ceph/messenger.c:432:2: note: here
     case TCP_CLOSE_WAIT:
     ^~~~
   In file included from net/ceph/messenger.c:20:0:
   At top level:
   include/linux/ceph/ceph_features.h:20:24: warning: 'DEPRECATED_CEPH_FEATUREMASK_RESERVED_BROKEN' defined but not used [-Wunused-const-variable=]
     const static uint64_t DEPRECATED_CEPH_FEATUREMASK_##name =  \
                           ^
   include/linux/ceph/ceph_features.h:171:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE_DEPRECATED'
    DEFINE_CEPH_FEATURE_DEPRECATED(63, 1, RESERVED_BROKEN, LUMINOUS) // client-facing
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:19:24: warning: 'DEPRECATED_CEPH_FEATURE_RESERVED_BROKEN' defined but not used [-Wunused-const-variable=]
     const static uint64_t DEPRECATED_CEPH_FEATURE_##name = (1ULL<<bit); \
                           ^
   include/linux/ceph/ceph_features.h:171:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE_DEPRECATED'
    DEFINE_CEPH_FEATURE_DEPRECATED(63, 1, RESERVED_BROKEN, LUMINOUS) // client-facing
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_RESERVED' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:170:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(62, 1, RESERVED)           // do not use; used as a sentinal
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_RESERVED' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:170:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(62, 1, RESERVED)           // do not use; used as a sentinal
    ^~~~~~~~~~~~~~~~~~~
>> include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_RESERVED2' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:169:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(61, 1, RESERVED2)          // unused, but slow down!
    ^~~~~~~~~~~~~~~~~~~
>> include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_RESERVED2' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:169:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(61, 1, RESERVED2)          // unused, but slow down!
    ^~~~~~~~~~~~~~~~~~~
>> include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_BLKIN_TRACING' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:167:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(60, 1, BLKIN_TRACING)  // *do not share this bit*
    ^~~~~~~~~~~~~~~~~~~
>> include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_BLKIN_TRACING' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:167:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(60, 1, BLKIN_TRACING)  // *do not share this bit*
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_MSG_ADDR2' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:166:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(59, 1, MSG_ADDR2) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_MSG_ADDR2' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:166:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(59, 1, MSG_ADDR2) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_FS_CHANGE_ATTR' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:165:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(59, 1, FS_CHANGE_ATTR) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_FS_CHANGE_ATTR' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:165:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(59, 1, FS_CHANGE_ATTR) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_FS_BTIME' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:164:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(59, 1, FS_BTIME)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_FS_BTIME' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:164:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(59, 1, FS_BTIME)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_FS_FILE_LAYOUT_V2' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:163:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(58, 1, FS_FILE_LAYOUT_V2) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_FS_FILE_LAYOUT_V2' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:163:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(58, 1, FS_FILE_LAYOUT_V2) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_NEW_OSDOPREPLY_ENCODING' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:162:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(58, 1, NEW_OSDOPREPLY_ENCODING) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_NEW_OSDOPREPLY_ENCODING' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:162:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(58, 1, NEW_OSDOPREPLY_ENCODING) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_CRUSH_TUNABLES5' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:161:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(58, 1, CRUSH_TUNABLES5)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_CRUSH_TUNABLES5' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:161:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(58, 1, CRUSH_TUNABLES5)
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_SERVER_JEWEL' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:160:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(57, 1, SERVER_JEWEL) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_SERVER_JEWEL' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:160:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(57, 1, SERVER_JEWEL) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:14:24: warning: 'CEPH_FEATUREMASK_OSDSUBOP_NO_SNAPCONTEXT' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATUREMASK_##name =   \
                           ^
   include/linux/ceph/ceph_features.h:159:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(57, 1, OSDSUBOP_NO_SNAPCONTEXT) // overlap
    ^~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_features.h:13:24: warning: 'CEPH_FEATURE_OSDSUBOP_NO_SNAPCONTEXT' defined but not used [-Wunused-const-variable=]
     const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);  \
                           ^
   include/linux/ceph/ceph_features.h:159:1: note: in expansion of macro 'DEFINE_CEPH_FEATURE'
    DEFINE_CEPH_FEATURE(57, 1, OSDSUBOP_NO_SNAPCONTEXT) // overlap


vim +/CEPH_FEATUREMASK_RESERVED2 +14 include/linux/ceph/ceph_features.h

    11	
    12	#define DEFINE_CEPH_FEATURE(bit, incarnation, name)			\
  > 13		const static uint64_t CEPH_FEATURE_##name = (1ULL<<bit);		\
  > 14		const static uint64_t CEPH_FEATUREMASK_##name =			\
    15			(1ULL<<bit | CEPH_FEATURE_INCARNATION_##incarnation);
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
