Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD4A28E8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 00:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736641876; cv=none; b=eX3ZhuuOBCwn+yuUIvbg4Z6wJ4WFtFf8P6sUjgj02g2P+2pujxR4ekXcBAFGcJp/YF4BuamjDNR1H/5bjLkord5an2lwV/qUSssC2jRonlKKT7B/obZaTZuKspr07eRXXgfUbIFwn+tCOD2LET5f++9kNszACzlxW2dRoMv98jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736641876; c=relaxed/simple;
	bh=e+rjMBVN2wMxezAL8goLenL66DiDWpLleD+O4uyDFVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TsLiH2Q5l9oO4+o5ae3piKIkGAoTrkrEL2CwIVaaUj9vVklLo4JfoqkgMnu9dZi9290NIUP8vQQZI3zmH85g7l/GQ2YAgpavd3DFi9jLQIrL3E0Gr8MbPdz3OMCwXDQeWh2EpJ8EsV+t06/eqfebCUeOzzAAzmMEDD3Fd4NKBKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hw0j4PDX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hw0j4PDX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736641874; x=1768177874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e+rjMBVN2wMxezAL8goLenL66DiDWpLleD+O4uyDFVU=;
  b=Hw0j4PDXKoI1sBqe/Hdmu5bwQpRguLH7Uq3ZB7zfTmnscFfzDKd4Ux21
   3ia+c2jeibim4v9sNHkrIjxbv+6qika96PrrineKaLHmFCmZRSMhdbocy
   WA057yE/VHUnT+7ZvJIR2LrXaunJbJd2LavX9ONTrm7TyaqgZFSf547Ju
   uVqVEHn33enSkqnodW7/vmOxr19S7uzJuNOgqjn+iZ13Szzanvh+U9dyD
   sozBtX8quQCDkTuDL5tC2Pr+lkew47Bvi0ERy/o7nA7v5upjnnBSeejTf
   PYSNBTf+VTFmYJW+aE39UOseQji+w6M3HDbxLRpOa2pq77AUzpCQj1AmL
   Q==;
X-CSE-ConnectionGUID: nWRnbd1MTLSaaxD+9vZBAQ==
X-CSE-MsgGUID: yT2uV68dTAWyb3vNWUVAUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="37064069"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="37064069"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 16:31:13 -0800
X-CSE-ConnectionGUID: d6J7bEJ4SlKvK6PRiOOQNw==
X-CSE-MsgGUID: HVUCjVgjQ+WDc49e37upnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="108976210"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jan 2025 16:31:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWlsk-000LMB-0x;
	Sun, 12 Jan 2025 00:31:10 +0000
Date: Sun, 12 Jan 2025 08:30:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 59/59] fs/incfs/verity.c:167
 incfs_calc_verity_digest_from_desc() warn: unsigned 'incfs_hash_alg' is
 never less than zero.
Message-ID: <202501120838.KiPNZ04C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   b430139e864d9c30ff1543b4fad517b9732e5125
commit: 5bb92dffc9cb7ead6ac1e7a38309824a4020e39a [59/59] ANDROID: Incremental fs: Add FS_IOC_ENABLE_VERITY
config: i386-randconfig-141-20250112 (https://download.01.org/0day-ci/archive/20250112/202501120838.KiPNZ04C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120838.KiPNZ04C-lkp@intel.com/

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
