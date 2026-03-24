Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C110394497
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 03:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774324614; cv=none; b=S0w28AZbrMCzRoEbwKLgl+sAyVH0qJVtSe/lILHYNsw6bMlB3wJ8NfyerFQh/2RZSzz15D/eY/xSoIUpzu8U1f7uXM9/G9BxvLncCYCEBlWqdV+oK+MapQcou1skz3nm5hC87oUPE7vipsz2l24JCsLewNShKQgbSiqSCsOfVqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774324614; c=relaxed/simple;
	bh=ELsxeFMYSxzD2stSHigboF+6daCnsTgR4C7JxMPxKgw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ModKsVkH19CMNW+5Xs7dn4PP8w8hml6tTdijhcHqPCuA0O+t0N17k7B9OrosSe+J3KJZ43q5ZzrSRhiaPc41mn7XvTBlGFUAtWMqGDbphXQ1m9A82cL0Z7zUlsFciPyVzJ1R2aMLWPvCRYF4qJzeIqRK5YzdkbRRd+IKH4ipZcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b11ON+8O; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b11ON+8O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774324612; x=1805860612;
  h=date:from:to:cc:subject:message-id;
  bh=ELsxeFMYSxzD2stSHigboF+6daCnsTgR4C7JxMPxKgw=;
  b=b11ON+8OdkUabu9sNAbHqpK5+OGRcpga61G0UKJucPBcYi9hkG2zGnIg
   HDM66DL+F2Kkn4WNCvv7usxWqw1pgG0eqXbBREs0vH3IQGSV9TpoBN1H0
   H1VlOapLbXQkj8PJlA6xMlK1gD4zVywDa3LM9fNXicLWmX1iFswMtq5st
   7Hgu9p8NKdSPLCv09zaGYEPx/8HR5iKxGFDjTnW2/eIwLnirKJipr8QoD
   GH8lEaP4nvDH9RNpBd7U6jC7vG5muN9+1cLK1oro5gzNvtr+qH5Yqu2w/
   lQo9Ju+TmCHwve60GA/F9c1lKq42Pasnoi2lH9c5M6azboHU+6G7gRH2a
   Q==;
X-CSE-ConnectionGUID: fSkQtmbcQCiAEZqqx20JZQ==
X-CSE-MsgGUID: //HsE+xySCSiU6CKcsGjlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74354645"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="74354645"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 20:56:51 -0700
X-CSE-ConnectionGUID: LDewt1/+QC2AXBrz3PVybA==
X-CSE-MsgGUID: jY6ttlqiSaqDbVCZR8SPsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="223304104"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Mar 2026 20:56:50 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4sso-000000003kP-3duk;
	Tue, 24 Mar 2026 03:56:46 +0000
Date: Tue, 24 Mar 2026 11:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yongpeng Yang <yangyongpeng@xiaomi.com>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:dev-test 2/13] fs/f2fs/node.h:425:49: sparse: sparse:
 incorrect type in argument 2 (different modifiers)
Message-ID: <202603241133.zSMXZWTC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
head:   b559609da002e5c06340a56ff23ad93cac4f4f9a
commit: 819157dce25d2c894a6c24f04e418dc680477c2a [2/13] f2fs: refactor node footer flag setting related code
config: s390-randconfig-r131-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241133.zSMXZWTC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241133.zSMXZWTC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241133.zSMXZWTC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/f2fs/node.c: note: in included file:
>> fs/f2fs/node.h:425:49: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct folio *folio @@     got struct folio const *folio @@
   fs/f2fs/node.h:425:49: sparse:     expected struct folio *folio
   fs/f2fs/node.h:425:49: sparse:     got struct folio const *folio
>> fs/f2fs/node.h:425:49: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct folio *folio @@     got struct folio const *folio @@
   fs/f2fs/node.h:425:49: sparse:     expected struct folio *folio
   fs/f2fs/node.h:425:49: sparse:     got struct folio const *folio
>> fs/f2fs/node.h:425:49: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct folio *folio @@     got struct folio const *folio @@
   fs/f2fs/node.h:425:49: sparse:     expected struct folio *folio
   fs/f2fs/node.h:425:49: sparse:     got struct folio const *folio
>> fs/f2fs/node.h:425:49: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct folio *folio @@     got struct folio const *folio @@
   fs/f2fs/node.h:425:49: sparse:     expected struct folio *folio
   fs/f2fs/node.h:425:49: sparse:     got struct folio const *folio
>> fs/f2fs/node.h:425:49: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct folio *folio @@     got struct folio const *folio @@
   fs/f2fs/node.h:425:49: sparse:     expected struct folio *folio
   fs/f2fs/node.h:425:49: sparse:     got struct folio const *folio
>> fs/f2fs/node.h:425:49: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct folio *folio @@     got struct folio const *folio @@
   fs/f2fs/node.h:425:49: sparse:     expected struct folio *folio
   fs/f2fs/node.h:425:49: sparse:     got struct folio const *folio

vim +425 fs/f2fs/node.h

819157dce25d2c Yongpeng Yang           2026-03-18  419  
819157dce25d2c Yongpeng Yang           2026-03-18  420  static inline void set_mark(const struct folio *folio, bool mark, int type)
819157dce25d2c Yongpeng Yang           2026-03-18  421  {
819157dce25d2c Yongpeng Yang           2026-03-18  422  	__set_mark(folio, mark, type);
54c55c4e4fc7ec Weichao Guo             2018-03-09  423  
54c55c4e4fc7ec Weichao Guo             2018-03-09  424  #ifdef CONFIG_F2FS_CHECK_FS
e3f1b76d877c14 Matthew Wilcox (Oracle  2025-07-08 @425) 	f2fs_inode_chksum_set(F2FS_F_SB(folio), folio);

:::::: The code at line 425 was first introduced by commit
:::::: e3f1b76d877c14897b4776fc5dd08af3c7751976 f2fs: Pass a folio to f2fs_inode_chksum_set()

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
