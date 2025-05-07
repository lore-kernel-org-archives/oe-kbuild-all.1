Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8A04D599
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 13:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624958; cv=none; b=dCtraMBiJv4sdcLWpWvySSSKT57llNEjNtb6s3uLDpoV0g1lGl2eZ3xSBNVXXwWjR2aFbybu70ByGwty1Q4j0yP+VsPxuogtp0533Ctclz6RWN5jGBikx6Sk89OO2XB1TqO1aKx3p+9v/9zuj1WMIKOZqUKFLn33Sb9mhwY0Rnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624958; c=relaxed/simple;
	bh=Tj1OnaF1hry55GrM4BexrmxZ+F5FgTS+H0ZfmQVOoWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nyObz68OB5VD11+fRxraNjZ/tLo/rC5e8hTVaF8nxCttmUK872/TzDEx/A2iMVdNT28egfcB+rgq4T+mtWa9gjLkF4qcKpB6Q2IT3MYRF6Dv9QBwC2LCifmg6fyPXXjG/Rtgu6EW7orEsGWLZqSdgagyr0k+R8lP8qr6kJChfhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arXyK/hq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arXyK/hq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746624957; x=1778160957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tj1OnaF1hry55GrM4BexrmxZ+F5FgTS+H0ZfmQVOoWQ=;
  b=arXyK/hqq50S+pi7PjLbsbWmGh7o8isOYZGUxrgmq4kmWC6493wO6jh7
   FGBrDjk7vZqcOc7SunTLFuaYZp7Ci40tgbmDhEQoQrkGq3MzIz3eBL3IZ
   5b6Rbc1PCV2/XqVVDVjNKxdiVZkHazlxVhtJbbqp/SMHGrmzP3ouJFBnL
   yILdw6brjH2kY/69Z329BvBIAIzVXIxBtna1B9ta1ULEAElA/y1Ig0GzO
   HUkzZVWVkD0C2iuwVt+/EQv8nxegDZnggRu0Ogeo8Mhb7hbP0eSctQNSP
   FGwr91tKv1GUIVlXqlydEK80VnXY71GlSqffgrjESdsKOyZ0fTmihuLFw
   Q==;
X-CSE-ConnectionGUID: YfsGtiPrTyuxf8Mk2MxsKw==
X-CSE-MsgGUID: euebKJozSkCtFkNRPhyeiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48062878"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48062878"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:35:57 -0700
X-CSE-ConnectionGUID: YLZVPXLUTCaYymC2h3o8Gg==
X-CSE-MsgGUID: knQAonMSSQO4Pk+MziKCBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="173154301"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 May 2025 06:35:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCewC-0007t0-2i;
	Wed, 07 May 2025 13:35:52 +0000
Date: Wed, 7 May 2025 21:35:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4134/5419] fs/bcachefs/sb-members.c:192:25:
 sparse: sparse: restricted __le64 degrades to integer
Message-ID: <202505072156.deeoT0Bc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 5359b9ec1ddce6f7a0cb80ba9b820456f0ee69b7 [4134/5419] bcachefs: BCH_FEATURE_no_alloc_info
config: microblaze-randconfig-r111-20250417 (https://download.01.org/0day-ci/archive/20250507/202505072156.deeoT0Bc-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505072156.deeoT0Bc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072156.deeoT0Bc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/sb-members.c: note: in included file:
   fs/bcachefs/bcachefs.h:1015:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/sb-members.c:192:25: sparse: sparse: restricted __le64 degrades to integer

vim +192 fs/bcachefs/sb-members.c

   153	
   154	static int validate_member(struct printbuf *err,
   155				   struct bch_member m,
   156				   struct bch_sb *sb,
   157				   int i)
   158	{
   159		if (le64_to_cpu(m.nbuckets) > BCH_MEMBER_NBUCKETS_MAX) {
   160			prt_printf(err, "device %u: too many buckets (got %llu, max %u)",
   161				   i, le64_to_cpu(m.nbuckets), BCH_MEMBER_NBUCKETS_MAX);
   162			return -BCH_ERR_invalid_sb_members;
   163		}
   164	
   165		if (le64_to_cpu(m.nbuckets) -
   166		    le16_to_cpu(m.first_bucket) < BCH_MIN_NR_NBUCKETS) {
   167			prt_printf(err, "device %u: not enough buckets (got %llu, max %u)",
   168				   i, le64_to_cpu(m.nbuckets), BCH_MIN_NR_NBUCKETS);
   169			return -BCH_ERR_invalid_sb_members;
   170		}
   171	
   172		if (le16_to_cpu(m.bucket_size) <
   173		    le16_to_cpu(sb->block_size)) {
   174			prt_printf(err, "device %u: bucket size %u smaller than block size %u",
   175				   i, le16_to_cpu(m.bucket_size), le16_to_cpu(sb->block_size));
   176			return -BCH_ERR_invalid_sb_members;
   177		}
   178	
   179		if (le16_to_cpu(m.bucket_size) <
   180		    BCH_SB_BTREE_NODE_SIZE(sb)) {
   181			prt_printf(err, "device %u: bucket size %u smaller than btree node size %llu",
   182				   i, le16_to_cpu(m.bucket_size), BCH_SB_BTREE_NODE_SIZE(sb));
   183			return -BCH_ERR_invalid_sb_members;
   184		}
   185	
   186		if (m.btree_bitmap_shift >= BCH_MI_BTREE_BITMAP_SHIFT_MAX) {
   187			prt_printf(err, "device %u: invalid btree_bitmap_shift %u", i, m.btree_bitmap_shift);
   188			return -BCH_ERR_invalid_sb_members;
   189		}
   190	
   191		if (BCH_MEMBER_FREESPACE_INITIALIZED(&m) &&
 > 192		    sb->features[0] & BIT_ULL(BCH_FEATURE_no_alloc_info)) {
   193			prt_printf(err, "device %u: freespace initialized but fs has no alloc info", i);
   194			return -BCH_ERR_invalid_sb_members;
   195		}
   196	
   197		return 0;
   198	}
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
