Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13EB213EEE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 15:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730302461; cv=none; b=ew/dP/zkjfN7E2teQZsTKcMEVpwTWjqp5GE6TJ+ijSBtvu3xaPRL5CFeJ+yWfuRkaZloNR7QNj7oCH5DywoBzNqBNxGwr5m3eaj11ffPhuW7Vs2DLCuKSnwXcTSX1TMV/7eYLGeRi2L5NtcavWUhWBFZ3CLgCZQuZ5auG9Zc+RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730302461; c=relaxed/simple;
	bh=GaAmRc3BwxxU1L5dvHUhCxSaSjaxPeqkKl8v+WTJAjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l5LqY9kPaod1alr+mq+fnDkK/Jk0n17MK1XnRxNJVyaHf1jLFVWgsLh2OEwL7AzWwqOm/g4f7KjlttKTJoQD+KP9mbqAkgFh/ehhMRwLjlYzPsHSYTebNeP+VzIrPZJrfqk5U4sNXEEmRoIu9LptggBbhy7aKNe/UzssIqTSmg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aB4Jn3x7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aB4Jn3x7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730302459; x=1761838459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GaAmRc3BwxxU1L5dvHUhCxSaSjaxPeqkKl8v+WTJAjE=;
  b=aB4Jn3x7Th7bh4yLKIfjeh/QsGBZswRs04kfB9MTfJumiFT8MdAo/Tp+
   zQYcTT8s1AMKDovz4KT5Nq+mlumI+tOVVE6Ap6WC+fyfYwROb6cTPwnhP
   3ehSGN3P143M4JXAPfD6xhY5S5KoPUQfJDKuMEcEVrWThFygUMDXP/GfR
   am3yeq/npnUTvoTUN1kz9yktud7+b9teZ4xyOntlRyUBys/Q+Cg5d5D+8
   DmHiYiKgjQ344p7XbvJ//oM8malnMinD9X+CskbBojF9CJgKscnmaWqaB
   HAxSHRi5cg7256NDZqZtggAJJKSfbFwJ2w43fF5oTxF0U1ZaNk/Wn+1dp
   A==;
X-CSE-ConnectionGUID: R0ypVYkJS3WsoTtrqcfjCQ==
X-CSE-MsgGUID: ApZBW28/T1aC707blissNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="41381002"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="41381002"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 08:34:18 -0700
X-CSE-ConnectionGUID: +NtuYCp7RhG+V1JcwVDgNQ==
X-CSE-MsgGUID: EC45ypDdRMeF0GHh531pRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="86900275"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Oct 2024 08:34:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Ai7-000f0e-03;
	Wed, 30 Oct 2024 15:34:15 +0000
Date: Wed, 30 Oct 2024 23:33:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 2277/26644] fs/incfs/verity.c:167
 incfs_calc_verity_digest_from_desc() warn: unsigned 'incfs_hash_alg' is
 never less than zero.
Message-ID: <202410302318.9HhtWR63-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   cc3c1ec57c62cf6ce4db5d9a5e6f9980885c4fb3
commit: ca9597811d3918855d51caf88f8e73c68fd6fe7c [2277/26644] ANDROID: Incremental fs: Add FS_IOC_ENABLE_VERITY
config: i386-randconfig-141-20241029 (https://download.01.org/0day-ci/archive/20241030/202410302318.9HhtWR63-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410302318.9HhtWR63-lkp@intel.com/

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
