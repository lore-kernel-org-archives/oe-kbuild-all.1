Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C6432C94A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768641835; cv=none; b=rIYPijzViNiwlf+UZ0ROg/ibB4bQ+qH9Ijw6sLw9ot83y+U+hG+hyXQPHK8rRAoBStCIcSCPwxcSmeSeE7beuxmYarIUQDbVMfX5ZTRo0PPGpgs3Vf6FZ1CQXCf0vJ1c7gKXKjA2qFN4CQfFylnQP16ExHeQ/49/Qk2qE6HdKKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768641835; c=relaxed/simple;
	bh=Z/wfjETrVkibZMD5nlaQr6vrM7NHMirbYrBlCkad2I0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JxzxkbeCnNAzFEkpN6ACQgJHT2H0YDawAlUgvgktPTSVVjVOuAgkiKUtQzPu0UfxAvCN4NOAKxA14qI/c+QCec+POGSTx73QRk3s+k0viarSAfhL7e0YzcUCbpTWiATpfezB5AmIvkSctqkEXqmNrQrZycnXceqc1KomtxzZhdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRPiDIk3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRPiDIk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768641834; x=1800177834;
  h=date:from:to:cc:subject:message-id;
  bh=Z/wfjETrVkibZMD5nlaQr6vrM7NHMirbYrBlCkad2I0=;
  b=cRPiDIk3hDo46eFqLG7xixLX/0uLqvycfjf1B9IC/QhH4JwH+u5E8YyJ
   oEFha2mRrCoghSaEvIeex1S1aigASk9sANypqoLXkex0Aekxf8we8YxEe
   XciTKzWuACpCankOUIffSZzzTaoZqbnffGrJyAiw6LAZYBX/QHNzUN4z9
   knGCViCNeIqnk08M10YJcfgkRbnhffx9KpVjmIAbGilPYzHqqSjYRPNHt
   JnjkruKUNE0fAScbEuqOPNq7IfGbYjaYCF9eAYkBr+3l2KiySvSL3EQc3
   o8X/w77HkM/tpJLVdnAdkaATeNG/qwEPPB6IytUlnt6q5eGaTDRNPWefw
   Q==;
X-CSE-ConnectionGUID: 8YSEtDenRAi1EGSnsNt4cw==
X-CSE-MsgGUID: GKn73cc5R++JFFgOWFACVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="68951446"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="68951446"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 01:23:50 -0800
X-CSE-ConnectionGUID: M44sO2J3TsKE97xTUf2nMg==
X-CSE-MsgGUID: AXReYXZRTPO2GwCnkgRjYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="236716304"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jan 2026 01:23:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh2X4-00000000Li6-04B3;
	Sat, 17 Jan 2026 09:23:46 +0000
Date: Sat, 17 Jan 2026 17:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Harmstone <mark@harmstone.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
 Boris Burkov <boris@bur.io>
Subject: [btrfs:pr/1157 64/80] fs/btrfs/sysfs.c:84:34: warning:
 'btrfs_attr_features_remap_tree' defined but not used
Message-ID: <202601171733.AhYx9UGH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/btrfs/linux.git pr/1157
head:   92a19b3e78cc245671e8937ffd5530cb4bb9bcc4
commit: d93a5b066ca46e8523a884494d41ac64498bcd85 [64/80] btrfs: add definitions and constants for remap-tree
config: i386-randconfig-141-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171733.AhYx9UGH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171733.AhYx9UGH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171733.AhYx9UGH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/sysfs.c:84:34: warning: 'btrfs_attr_features_remap_tree' defined but not used [-Wunused-variable]
      84 | static struct btrfs_feature_attr btrfs_attr_features_##_name = {             \
         |                                  ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:99:9: note: in expansion of macro 'BTRFS_FEAT_ATTR'
      99 |         BTRFS_FEAT_ATTR(name, FEAT_INCOMPAT, BTRFS_FEATURE_INCOMPAT, feature)
         |         ^~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:294:1: note: in expansion of macro 'BTRFS_FEAT_ATTR_INCOMPAT'
     294 | BTRFS_FEAT_ATTR_INCOMPAT(remap_tree, REMAP_TREE);
         | ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/btrfs_attr_features_remap_tree +84 fs/btrfs/sysfs.c

9188db611dbb6b David Sterba  2019-08-02  67  
22c55e3bbb20c6 Stefan Roesch 2022-02-08  68  #define BTRFS_ATTR_W(_prefix, _name, _store)			        \
22c55e3bbb20c6 Stefan Roesch 2022-02-08  69  	static struct kobj_attribute btrfs_attr_##_prefix##_##_name =	\
22c55e3bbb20c6 Stefan Roesch 2022-02-08  70  			__INIT_KOBJ_ATTR(_name, 0200, NULL, _store)
22c55e3bbb20c6 Stefan Roesch 2022-02-08  71  
9188db611dbb6b David Sterba  2019-08-02  72  #define BTRFS_ATTR_RW(_prefix, _name, _show, _store)			\
9188db611dbb6b David Sterba  2019-08-02  73  	static struct kobj_attribute btrfs_attr_##_prefix##_##_name =	\
9188db611dbb6b David Sterba  2019-08-02  74  			__INIT_KOBJ_ATTR(_name, 0644, _show, _store)
9188db611dbb6b David Sterba  2019-08-02  75  
9188db611dbb6b David Sterba  2019-08-02  76  #define BTRFS_ATTR(_prefix, _name, _show)				\
9188db611dbb6b David Sterba  2019-08-02  77  	static struct kobj_attribute btrfs_attr_##_prefix##_##_name =	\
9188db611dbb6b David Sterba  2019-08-02  78  			__INIT_KOBJ_ATTR(_name, 0444, _show, NULL)
9188db611dbb6b David Sterba  2019-08-02  79  
9188db611dbb6b David Sterba  2019-08-02  80  #define BTRFS_ATTR_PTR(_prefix, _name)					\
9188db611dbb6b David Sterba  2019-08-02  81  	(&btrfs_attr_##_prefix##_##_name.attr)
9188db611dbb6b David Sterba  2019-08-02  82  
9188db611dbb6b David Sterba  2019-08-02  83  #define BTRFS_FEAT_ATTR(_name, _feature_set, _feature_prefix, _feature_bit)  \
9188db611dbb6b David Sterba  2019-08-02 @84  static struct btrfs_feature_attr btrfs_attr_features_##_name = {	     \
9188db611dbb6b David Sterba  2019-08-02  85  	.kobj_attr = __INIT_KOBJ_ATTR(_name, S_IRUGO,			     \
9188db611dbb6b David Sterba  2019-08-02  86  				      btrfs_feature_attr_show,		     \
9188db611dbb6b David Sterba  2019-08-02  87  				      btrfs_feature_attr_store),	     \
9188db611dbb6b David Sterba  2019-08-02  88  	.feature_set	= _feature_set,					     \
9188db611dbb6b David Sterba  2019-08-02  89  	.feature_bit	= _feature_prefix ##_## _feature_bit,		     \
9188db611dbb6b David Sterba  2019-08-02  90  }
9188db611dbb6b David Sterba  2019-08-02  91  #define BTRFS_FEAT_ATTR_PTR(_name)					     \
9188db611dbb6b David Sterba  2019-08-02  92  	(&btrfs_attr_features_##_name.kobj_attr.attr)
9188db611dbb6b David Sterba  2019-08-02  93  

:::::: The code at line 84 was first introduced by commit
:::::: 9188db611dbb6b3f68c9108265d2abd1cb5a3b44 btrfs: sysfs: move helper macros to sysfs.c

:::::: TO: David Sterba <dsterba@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
