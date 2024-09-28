Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6423C0D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 01:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727486337; cv=none; b=kZVa8RM6OzIRxnZeQCecSnbADhVhERirv8ACYxHtitNo7UnGOSXfuxaIcbJe8wCWYSnzACyU8GLWCOzM40FNcCMsJRHajteyRyk8Vj/Vipwjj6EB+ydbbn67hg9BV0niDeb62e+jDx+Epf6uJlfLXCBxfVp4378JcfGsRYcuZuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727486337; c=relaxed/simple;
	bh=TyLhGq3P1hDAh4fqzWXgOp4eHWRdAni6MVkOctuDTh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sUiLtGoCBURAa2OnxD6BDOPfNH6v6sTShkva8m9SnmG8XFpVeAOSahAPuLM02jAjfNpcZXxNzui1ZuhwupFZ20qWozkwLDjcuqO69QgQ6GO/STGGEBvVzeArWkMZ4hMfqc6SAzRzfCNxe1CMgJX6VW4ISrmSa4tqTwb/i4cmQ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VDJALVC+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDJALVC+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727486335; x=1759022335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TyLhGq3P1hDAh4fqzWXgOp4eHWRdAni6MVkOctuDTh4=;
  b=VDJALVC+Mpu5TVzsyPDpjtLRHx/tOVAEGbDGyNMHUaO4Sg7v7bLCBd0+
   5JeAOcCby3voGsFKCj5uCJkVyTlOguF5Oj5vU1BSt90voIFj2zzmCIF6B
   mQZD54JwsOlrhKU1f/JLjKBcQO3T9daO28vJwzAytILSO9iAoK2m0UAkG
   EoixhkjjnLhv60Ceh9s6xd9En3/QnUiSHwD64oRkWhgmrJAoAxxG6MDW5
   JSw2lq5gnD6N3b8bvJgwrlHDY4YSmcJEQW1SOvLnZCWAKrqxt6ChUxA50
   3RDVii/MBDSCrTrz3kegdh128DGQy5yA59kW3MDOR230T0SUs3SMYYtGI
   g==;
X-CSE-ConnectionGUID: qd2B18yoT1+12KrSMvAkiA==
X-CSE-MsgGUID: wbKoPWsQTsCwheE9AZuoSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26821134"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26821134"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 18:18:55 -0700
X-CSE-ConnectionGUID: ElV9/lKURNOA3q7ugLLkiw==
X-CSE-MsgGUID: ah5hASPgTo2zi0/BMObhrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72586780"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Sep 2024 18:18:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suM6l-000Mob-2x;
	Sat, 28 Sep 2024 01:18:51 +0000
Date: Sat, 28 Sep 2024 09:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2277/5421] fs/incfs/verity.c:167
 incfs_calc_verity_digest_from_desc() warn: unsigned 'incfs_hash_alg' is
 never less than zero.
Message-ID: <202409280939.7fCy89LV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   da0c10aefaf6089b483a9c679b7151dc316a36c7
commit: ca9597811d3918855d51caf88f8e73c68fd6fe7c [2277/5421] ANDROID: Incremental fs: Add FS_IOC_ENABLE_VERITY
config: i386-randconfig-141-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280939.7fCy89LV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280939.7fCy89LV-lkp@intel.com/

smatch warnings:
fs/incfs/verity.c:167 incfs_calc_verity_digest_from_desc() warn: unsigned 'incfs_hash_alg' is never less than zero.
fs/incfs/verity.c:167 incfs_calc_verity_digest_from_desc() warn: error code type promoted to positive: 'incfs_hash_alg'

vim +/incfs_hash_alg +167 fs/incfs/verity.c

   151	
   152	/*
   153	 * Calculate the digest of the fsverity_descriptor. The signature (if present)
   154	 * is also checked.
   155	 */
   156	static struct mem_range incfs_calc_verity_digest_from_desc(
   157						const struct inode *inode,
   158						struct fsverity_descriptor *desc,
   159						u8 *signature, size_t sig_size)
   160	{
   161		enum incfs_hash_tree_algorithm incfs_hash_alg;
   162		struct mem_range verity_file_digest;
   163		int err;
   164		struct incfs_hash_alg *hash_alg;
   165	
   166		incfs_hash_alg = incfs_convert_fsverity_hash_alg(desc->hash_algorithm);
 > 167		if (incfs_hash_alg < 0)
   168			return range(ERR_PTR(incfs_hash_alg), 0);
   169	
   170		hash_alg = incfs_get_hash_alg(incfs_hash_alg);
   171		if (IS_ERR(hash_alg))
   172			return range((u8 *)hash_alg, 0);
   173	
   174		verity_file_digest = range(kzalloc(hash_alg->digest_size, GFP_KERNEL),
   175					   hash_alg->digest_size);
   176		if (!verity_file_digest.data)
   177			return range(ERR_PTR(-ENOMEM), 0);
   178	
   179		err = incfs_compute_file_digest(hash_alg, desc,
   180						verity_file_digest.data);
   181		if (err) {
   182			pr_err("Error %d computing file digest", err);
   183			goto out;
   184		}
   185		pr_debug("Computed file digest: %s:%*phN\n",
   186			 hash_alg->name, (int) verity_file_digest.len,
   187			 verity_file_digest.data);
   188	
   189		err = __fsverity_verify_signature(inode, signature, sig_size,
   190						  verity_file_digest.data,
   191						  desc->hash_algorithm);
   192	out:
   193		if (err) {
   194			kfree(verity_file_digest.data);
   195			verity_file_digest = range(ERR_PTR(err), 0);
   196		}
   197		return verity_file_digest;
   198	}
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
