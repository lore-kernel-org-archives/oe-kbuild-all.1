Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83735353EDE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 10:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770718721; cv=none; b=TsZhSGzp7TLPXVwpGEijeFVNdxnPwtsq8Q0d8K9hPRjEe0ERWGICqgazO5ruw1iq+8yhkmPxcOfufAL8lwX+ATWlGVHz5TuEd9dFVzJaLqDiXPpo7xwBNy+GdH9hfkP15PZMg4DlaUM3dCQ5oDs8b08+Q862i/NLF/t2P8JRTu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770718721; c=relaxed/simple;
	bh=QgB+SrLUeVdsp9DDUKey7COjZFNal23K4OVPrOnkNWc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SoX7/tEgIVKrMzCH4BWBNGC6TsPoRc8PPCIaHWsm7284XbXVV47V7DSNRZtVwYCw6bUf2I9Qp1S9WskKmLHfFkVU6OrYy+4SS8vVIolpHKxJ72cYXWb/RgscfRpPR0m65naQxBxwlrWaqTTv51YmeQbDrfvHLiWu4Ig5cKJrh0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWOI0rjO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWOI0rjO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770718720; x=1802254720;
  h=date:from:to:cc:subject:message-id;
  bh=QgB+SrLUeVdsp9DDUKey7COjZFNal23K4OVPrOnkNWc=;
  b=EWOI0rjO8f1sFYbFeEf9+P8uVi5+ci2DOk3jCL13shb9JSesM0SVrTxg
   3T61ghQNycZsI0J4BvHA9vkPJOU5qKGzsyL+JhPm/K9YidlJjWOsNBiAF
   ASLlbE9GS7lZg/+w2MvOXO+NfD59Mp99r1l05mU3kjVlwzcQzlFc842xB
   4gC2wkUuXNb2ChQ4OsBJyKNrC9PdOlUS94km+fBPRXJd/F5Qr5FH8v7yP
   91D/GC3rDPGHSlisF4HJOXagwTZlTk/bo6nq/giFMvgVjwHL41q01Ty6S
   W1JLc00ZaCVpVVxXeK/0tinL1YySHYpNNB4KfMg69ArVtZO5eeZSBONQ0
   A==;
X-CSE-ConnectionGUID: lL2VuhX4R1KylexQMpRoGQ==
X-CSE-MsgGUID: dkU7VWl/Qp+0UBgaMd217w==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="70858100"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="70858100"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 02:18:37 -0800
X-CSE-ConnectionGUID: HYMyhYJyQnmYajIwgVtRnw==
X-CSE-MsgGUID: 1jWqUzGASYi5dMrLfWd9Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211916400"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Feb 2026 02:18:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpkpF-00000000ouK-1Ojw;
	Tue, 10 Feb 2026 10:18:33 +0000
Date: Tue, 10 Feb 2026 18:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 518/799]
 fs/bcachefs/init/chardev.c:629:56-57: Unneeded semicolon
Message-ID: <202602101812.chOHbAOA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 383cf0dacfb4922419e7d38a3c22766d62fddc05 [518/799] bcachefs: more __free() conversion
config: arc-randconfig-r063-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101812.chOHbAOA-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101812.chOHbAOA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/init/chardev.c:629:56-57: Unneeded semicolon

vim +629 fs/bcachefs/init/chardev.c

   603	
   604	static long bch2_ioctl_dev_usage_v2(struct bch_fs *c,
   605					 struct bch_ioctl_dev_usage_v2 __user *user_arg)
   606	{
   607		if (!test_bit(BCH_FS_started, &c->flags))
   608			return -EINVAL;
   609	
   610		struct bch_ioctl_dev_usage_v2 arg;
   611		try(copy_from_user_errcode(&arg, user_arg, sizeof(arg)));
   612	
   613		if ((arg.flags & ~BCH_BY_INDEX) ||
   614		    arg.pad[0] ||
   615		    arg.pad[1] ||
   616		    arg.pad[2])
   617			return -EINVAL;
   618	
   619		CLASS(bch2_device_lookup, ca)(c, arg.dev, arg.flags);
   620		errptr_try(ca);
   621	
   622		struct bch_dev_usage_full src = bch2_dev_usage_full_read(ca);
   623	
   624		arg.state		= ca->mi.state;
   625		arg.bucket_size		= ca->mi.bucket_size;
   626		arg.nr_data_types	= min(arg.nr_data_types, BCH_DATA_NR);
   627		arg.nr_buckets		= ca->mi.nbuckets - ca->mi.first_bucket;
   628	
 > 629		try(copy_to_user_errcode(user_arg, &arg, sizeof(arg)));;
   630	
   631		for (unsigned i = 0; i < arg.nr_data_types; i++) {
   632			struct bch_ioctl_dev_usage_type t = {
   633				.buckets	= src.d[i].buckets,
   634				.sectors	= src.d[i].sectors,
   635				.fragmented	= src.d[i].fragmented,
   636			};
   637	
   638			try(copy_to_user_errcode(&user_arg->d[i], &t, sizeof(t)));
   639		}
   640	
   641		return 0;
   642	}
   643	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
