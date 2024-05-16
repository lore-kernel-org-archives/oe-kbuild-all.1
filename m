Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAF0143747
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 May 2024 11:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715857557; cv=none; b=gm11gXQL340Qb80W1k902r7gaQdFbyPORhjTt1MLf0Dx+7TPBISAUvEzmZuEWMN65qlmnziNCMBt0q14sVP2xvQMPx6fnFydILvKqBtcTvAknbERv1rwJSju64Y/VSLhuAhzWNaxcZMstm7ML0Hphp5N/9UOyOq5rgql9OD9mhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715857557; c=relaxed/simple;
	bh=oecSgwWAaBbLf9uMoV2JMcbyb+nZTh4LGiIufZsakjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dTtsx4Ps6Cr2LxjPjEwQ6/r6upxPq0ZoWUdBlFWYNQBanbesmFWfGTywpQZdwNHxW+8+pieLUm4y2RZ3Bat7xf5UdQvcEjyhpDIHoP0htGrcJPaaOkAKebZg4b+zkOb+qQ45EGiNUy3uKAvMhsCsQkjCj9Yv9WDjmKlF1Y0CREQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zc/6jXuK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zc/6jXuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715857556; x=1747393556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oecSgwWAaBbLf9uMoV2JMcbyb+nZTh4LGiIufZsakjY=;
  b=Zc/6jXuKaCLZ88GuVgQRqyQTh3YYEDSIYRWlVJtQ1X9AR/uK2XEG393O
   yRb32UcHFLG8whctnN/GZPEpY4UUZQc6sM2fKlSLi8d1QGUeBmDcQZzl4
   7EsWs/XuxUe+HFlaIIR4QRGm5vGE3T0NFDZNaxxnod1ri3Xh9QwmqJaOH
   qIz9eRxyJ3Th2JhrZE8VfkMIRNk5qxyQerVNBLIjoo0LZeycEifc68H5g
   pLkLIfE7FsexZinzSTm6IpD8D3oFG9GIJxIqyk3b1WGUH0vR1Swt3Cb/1
   qc/WDZeTVm4DwiYcblZkVOsFqREApq0bOCzXZvALrrAE1ZC+EXdHWpnPt
   g==;
X-CSE-ConnectionGUID: stpZWMOCR9+SH0FLRkvwJw==
X-CSE-MsgGUID: c5NyB33PTtC+A0+Q1M53/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22563469"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="22563469"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 04:05:55 -0700
X-CSE-ConnectionGUID: VyeCpRwFR86ijlEhxv5Gyw==
X-CSE-MsgGUID: 5G7at1s4Qt2AENeiDbj/JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="31520113"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 May 2024 04:05:54 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7Yvn-000EB5-1c;
	Thu, 16 May 2024 11:05:51 +0000
Date: Thu, 16 May 2024 19:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 2277/21666] fs/incfs/verity.c:167
 incfs_calc_verity_digest_from_desc() warn: unsigned 'incfs_hash_alg' is
 never less than zero.
Message-ID: <202405161800.CTOM1HyP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   2dca19b0a7e69d92441f241b8597bee11dd0d094
commit: ca9597811d3918855d51caf88f8e73c68fd6fe7c [2277/21666] ANDROID: Incremental fs: Add FS_IOC_ENABLE_VERITY
config: x86_64-randconfig-161-20240516 (https://download.01.org/0day-ci/archive/20240516/202405161800.CTOM1HyP-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405161800.CTOM1HyP-lkp@intel.com/

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
