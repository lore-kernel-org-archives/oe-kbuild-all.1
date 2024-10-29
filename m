Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9DF206066
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730208605; cv=none; b=Oc0njajbhWIIDaUxCKHn7vL2lQlM32SepluD069Kft2Ib8iO0TlNDzbUQ5N64vs0CjQrxEJmIK6ScydTjnkueyVf9sRKKoZ5OzpE11Ln7QrhcW8x2SZ1ilCHxOI+aS/SvrtoWn4hXmXzCQQhwRKORovGW+JEf/5WZoNym77uAlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730208605; c=relaxed/simple;
	bh=Tp4PxNSG7rXGLTUr5JYKAzNu3K8bV4SIcQ74aYgYunE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OQTORgbAh8MCauxbnNKXuFXGbR9rcL/WNvMgXAo8dzv/RuPv/Uwt5PvMCCE2STglCVpSE2KeNnMjdj5ZM59yhhPnjpMqwSnionyy6ut9CV3841es7It6mc0Lq1mXULkUVn74O3aLzKAujuPu6G0egZkfOKiZM9BziK0BVCS0Hh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6QkFCHa; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6QkFCHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730208603; x=1761744603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tp4PxNSG7rXGLTUr5JYKAzNu3K8bV4SIcQ74aYgYunE=;
  b=J6QkFCHa1x1Kk1I3K28lT+2qYgV0+bPKabEdqBdOyo/EWAR0M0B0+oOZ
   yCObYNrqFkNTjGDUDZ4QOSr2OfaeThPQee4zAJz+mjothiTsVadmJLs+E
   ehogZg/wZ9WdsFvXlYfaPZl7ITySs6Zh1SmwfjwsT7fNxCgb5SWENHTRf
   9pgELxHExlRAJ+fMmXKoymzGNJAZl3QxBPL/InpI/2dXlTa3qh//xK1xG
   iPt6dku97pZy8X4CmXJMYKPJHy4KAorJJid3nsOFVMt8ecOteAk7xQQ3f
   gnQS8f5MDTgv4aoqL6qcPggPUxorlBNdOcCYQzIE8ytnB39tcabnEeNzj
   g==;
X-CSE-ConnectionGUID: I8drBV/LR3Gwns8GTy05pQ==
X-CSE-MsgGUID: QFzq9Xo2QueOLgojS1Mk3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40945539"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40945539"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 06:30:03 -0700
X-CSE-ConnectionGUID: plJtyZojRIC6yJpQ9R1b5A==
X-CSE-MsgGUID: CGBmqqf+TYa82a8GQO8OMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="86719337"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2024 06:30:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5mII-000dhU-2Y;
	Tue, 29 Oct 2024 13:29:58 +0000
Date: Tue, 29 Oct 2024 21:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 2277/24845] fs/incfs/verity.c:167
 incfs_calc_verity_digest_from_desc() warn: unsigned 'incfs_hash_alg' is
 never less than zero.
Message-ID: <202410292116.1hEnIpBD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   06dc7d296d1dccf627a4cf8cfdb976808330ce02
commit: ca9597811d3918855d51caf88f8e73c68fd6fe7c [2277/24845] ANDROID: Incremental fs: Add FS_IOC_ENABLE_VERITY
config: i386-randconfig-141-20241029 (https://download.01.org/0day-ci/archive/20241029/202410292116.1hEnIpBD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410292116.1hEnIpBD-lkp@intel.com/

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
