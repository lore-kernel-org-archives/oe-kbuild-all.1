Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3911CD213
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 19:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734376045; cv=none; b=XHvu4aYjH7FWbGvapNe2W94183U2cy8OeTHscYINoFpEhodBYn+pfu6mxroo5kH/avSQICcCgSh5TglrGGeamP4ybJSzT3r4oSuZGm4IQESu6M/0I5c3kxsCT7wRZIKl9CXsAajCTezdX4Af+jJ3PqvZpBWUJmbvtxsyo0MxJSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734376045; c=relaxed/simple;
	bh=x7OOZezw40SUOCUnbPQ/U5ueBy0rYgPBlsqc3SpmBeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BEBg1DeoSCeRyT0PiuGBXNkM9uj6pJzfbWTwQZELbfUFF1i2YY6XvlBuC/9dVbZ8cC+3ds5b2u/9WQC9obRrkj5B62SOpNMQ7g8LlGk4MkQ/fB7ALifXuYRj+/f+AUfk1/0m3mXVb+7Ko/sWmmNZQ5JRkkh/B4fKW6BgHBTIWJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCFzswy3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCFzswy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734376043; x=1765912043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x7OOZezw40SUOCUnbPQ/U5ueBy0rYgPBlsqc3SpmBeA=;
  b=bCFzswy3gdTSbOjhr3vGq1iUZsJFSaBvmgzzReuoA8NNsbjpfrLh8MGY
   n8QmJhhN0Zdmabt9HBS/qr5pfGzkLIEaJyy+N7XL7PVzHNVbilangdkOr
   5M+QZwOmaxobkapzqVK28l0dJ21GtPAE6lBTqawN8410W26LgV2pe6YWC
   Ffsbc4kvrFskNNPDI16Ue73k3/y4dzBUgNEN0YQF4/Alk2R07kIm3e/2Q
   j1eN9nkltT2z7Cl8ROWIhDlZ4GF2FQ3+H8bIVc2pCWaRutaKLNu/GmAeT
   q+ZL+2boIQ8yWK4SoxUCfadvphDB1l6FBJvmvuYJtWQYSwM183sof4R3I
   Q==;
X-CSE-ConnectionGUID: s3dsMH5lSoimMtBkpD7QOQ==
X-CSE-MsgGUID: zcLzQnlQQxWaxOyX8hkbQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="45473476"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="45473476"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 11:07:22 -0800
X-CSE-ConnectionGUID: auIDMmdkRoSg5h3r+0jp4g==
X-CSE-MsgGUID: rpVi/sB8QJGSt0jOgbeCBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97148389"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Dec 2024 11:07:21 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNGR4-000EQO-24;
	Mon, 16 Dec 2024 19:07:18 +0000
Date: Tue, 17 Dec 2024 03:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: Anand Jain <anand.jain@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: [linux-next:master 3606/4379] fs/btrfs/super.c:2482
 btrfs_print_mod_info() warn: inconsistent indenting
Message-ID: <202412170215.uLhijGQD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e25c8d66f6786300b680866c0e0139981273feba
commit: 286dd5a60b7114fb8fdcabdccd01598161f67d83 [3606/4379] btrfs: modload to print RAID1 balancing status
config: i386-randconfig-141-20241216 (https://download.01.org/0day-ci/archive/20241217/202412170215.uLhijGQD-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412170215.uLhijGQD-lkp@intel.com/

smatch warnings:
fs/btrfs/super.c:2482 btrfs_print_mod_info() warn: inconsistent indenting

vim +2482 fs/btrfs/super.c

  2445	
  2446	static int __init btrfs_print_mod_info(void)
  2447	{
  2448		static const char options[] = ""
  2449	#ifdef CONFIG_BTRFS_DEBUG
  2450				", debug=on"
  2451	#endif
  2452	#ifdef CONFIG_BTRFS_ASSERT
  2453				", assert=on"
  2454	#endif
  2455	#ifdef CONFIG_BTRFS_FS_REF_VERIFY
  2456				", ref-verify=on"
  2457	#endif
  2458	#ifdef CONFIG_BLK_DEV_ZONED
  2459				", zoned=yes"
  2460	#else
  2461				", zoned=no"
  2462	#endif
  2463	#ifdef CONFIG_FS_VERITY
  2464				", fsverity=yes"
  2465	#else
  2466				", fsverity=no"
  2467	#endif
  2468	#ifdef CONFIG_BTRFS_EXPERIMENTAL
  2469				", experimental=yes"
  2470	#else
  2471				", experimental=no"
  2472	#endif
  2473				;
  2474	
  2475	#ifdef CONFIG_BTRFS_EXPERIMENTAL
  2476		if (btrfs_get_raid1_balancing() == NULL)
  2477			pr_info("Btrfs loaded%s\n", options);
  2478		else
  2479			pr_info("Btrfs loaded%s, raid1_balancing=%s\n",
  2480				 options, btrfs_get_raid1_balancing());
  2481	#else
> 2482			pr_info("Btrfs loaded%s\n", options);
  2483	#endif
  2484	
  2485		return 0;
  2486	}
  2487	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
