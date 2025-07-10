Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A514E28C2D6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 08:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752135642; cv=none; b=gdE5GIrMb+/NH1HwLyyPV6Vs/sYyn0566K9d+zzBR8KanPlgz9WbkLajxOnMTTpt7Hlbe0uYt4FFPaRaltUo6A9vAe5gzjuUcbNY9X/6Z1BZaTnnbg+tA6R10hthtOvxs6BdbZlLMxEBZBpICYBbnxUvMUl/ZMzpkp5GySlUhng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752135642; c=relaxed/simple;
	bh=shJwFqgMArdLMFoaqcQN6wS/mwgqrzRBCd5mRUJqrA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SFTy10FUX0cKDq3PUMzHs00C7BCPf6RwKiyTQNEgIBvN9jdj8URQYaEDuUFAY3/eHL1QnABmp48iIvSG2Jaie+cloX6lfcEFnNtqo0GorF0QZuz6XqSmVCml2N7wvk7FkV9fLtKyqMvkSXCkk25ygnHm22we39G0m7bCaDxl1TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLtXFaqQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLtXFaqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752135640; x=1783671640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=shJwFqgMArdLMFoaqcQN6wS/mwgqrzRBCd5mRUJqrA0=;
  b=jLtXFaqQkRSwMH/qnNTwNy/j8oiKVOdG2rqrAvyeCgTHn+0lxuV1YQTZ
   TL7U4uyzjaEDtf7JWxu+vU8v1FTcEOeW3q0/JhlGUdjDR6unv8T7BFQEr
   MwHidlqDStvv5KGvEd+7jK2gb7OqS8NTXtEtDzNn/6tAX1oDEDMRuMyMQ
   +EWZVPij0fCRmn5BTUm+eIhNEetFs+y86dJ8XJ9kVxJxFF+Owus8m0GBx
   dBY6lWTAEQabDJ5on9fp5RewP1DB2myhKHKh3UzoBC8LKFVHwjTAYlHo1
   u2NooSGd0g/Zzsg8qd+QU228pzL9SQdXN2Yc8V++jIlhgOIPqVwbJwlUS
   Q==;
X-CSE-ConnectionGUID: pR3JowkjQvyVFSugocNYqQ==
X-CSE-MsgGUID: U9YMea7HRhKGFWsjEkfTJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="64988513"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="64988513"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 01:20:40 -0700
X-CSE-ConnectionGUID: 0HVE70btSYOW6ZSnTn7P7g==
X-CSE-MsgGUID: bRhbI7NaSy+0/sGnXbBxLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="160548462"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jul 2025 01:20:38 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZmWC-0004mB-1I;
	Thu, 10 Jul 2025 08:20:36 +0000
Date: Thu, 10 Jul 2025 16:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:fnb 33/37]
 drivers/net/ethernet/mellanox/mlxsw/spectrum1_kvdl.c:282:13: warning: unused
 variable 'occ'
Message-ID: <202507101628.5BZpvwdU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux fnb
head:   870b9f6edf53871a5cc4aaf858054d8362c49989
commit: a56fd4e0a4b6111bffdf5ece29e9ff46d4ae654d [33/37] mlxsw: simplify mlxsw_sp1_kvdl_part_occ()
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250710/202507101628.5BZpvwdU-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507101628.5BZpvwdU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507101628.5BZpvwdU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlxsw/spectrum1_kvdl.c: In function 'mlxsw_sp1_kvdl_part_occ':
>> drivers/net/ethernet/mellanox/mlxsw/spectrum1_kvdl.c:282:13: warning: unused variable 'occ' [-Wunused-variable]
     282 |         u64 occ = 0;
         |             ^~~
>> drivers/net/ethernet/mellanox/mlxsw/spectrum1_kvdl.c:281:13: warning: unused variable 'bit' [-Wunused-variable]
     281 |         int bit = -1;
         |             ^~~


vim +/occ +282 drivers/net/ethernet/mellanox/mlxsw/spectrum1_kvdl.c

ebcff74386e6fb Jiri Pirko 2018-07-08  276  
ebcff74386e6fb Jiri Pirko 2018-07-08  277  static u64 mlxsw_sp1_kvdl_part_occ(struct mlxsw_sp1_kvdl_part *part)
ebcff74386e6fb Jiri Pirko 2018-07-08  278  {
ebcff74386e6fb Jiri Pirko 2018-07-08  279  	const struct mlxsw_sp1_kvdl_part_info *info = &part->info;
ebcff74386e6fb Jiri Pirko 2018-07-08  280  	unsigned int nr_entries;
ebcff74386e6fb Jiri Pirko 2018-07-08 @281  	int bit = -1;
ebcff74386e6fb Jiri Pirko 2018-07-08 @282  	u64 occ = 0;
ebcff74386e6fb Jiri Pirko 2018-07-08  283  
ebcff74386e6fb Jiri Pirko 2018-07-08  284  	nr_entries = (info->end_index -
ebcff74386e6fb Jiri Pirko 2018-07-08  285  		      info->start_index + 1) /
ebcff74386e6fb Jiri Pirko 2018-07-08  286  		      info->alloc_size;
a56fd4e0a4b611 Yury Norov 2025-07-07  287  	return (u64)info->alloc_size * bitmap_weight(part->usage, nr_entries);
ebcff74386e6fb Jiri Pirko 2018-07-08  288  }
ebcff74386e6fb Jiri Pirko 2018-07-08  289  

:::::: The code at line 282 was first introduced by commit
:::::: ebcff74386e6fbfe1d5dc406b99db63481f9c2c7 mlxsw: spectrum_kvdl: Push out KVD linear management into ops

:::::: TO: Jiri Pirko <jiri@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
