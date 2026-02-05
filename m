Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A93A22339
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Feb 2026 17:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311186; cv=none; b=FBEUNBVZDRacqtmzkwvK8gk5WwJ0Nd/eSKZhSpCtcp4wwsnRJpaoqDqswBdcwRWVMxHUJCTUCJ+sQPazkOyj/azIafHk6VuDrkodzf3uGEuQNJKrm1fisVOlU1FFeY0sPfY0n092ydgqTwYMISd/jz2VkbioMdSCSkxHk3uKA6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311186; c=relaxed/simple;
	bh=BtERxkLlgQOeHOfqxSbze3GOEo4aGTDLvhYilC6BWtY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DrAfGq3s3lujHF9LsJSEoCYPiOzioUgeXgMOfsBsB2nk3iiF0lcWNKOfzvkpzcuYSXtD1QcX+r5rNcHQLSNT3k1iLvoHwMKGIRqzRZoFJCPmJtehRe4w2efDn5FQuXVL5itXMHCsMj0HKEtmlFv7GSkmhXar1g7HuvGANry/9Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XkoV7ET4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XkoV7ET4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770311185; x=1801847185;
  h=date:from:to:cc:subject:message-id;
  bh=BtERxkLlgQOeHOfqxSbze3GOEo4aGTDLvhYilC6BWtY=;
  b=XkoV7ET44+4sR1AFRK2trIHcEJLGZIRQ+W+bwCxaOEwXadwVOKatGVkk
   wYLSJVI0KtJtXyoFrYmDUf5qTn7RH5jQNU5OOOgTwVTzfSTyot4AlS4Sk
   qx9zXkhVAJ3UDcDsM8RQkk/UYu6VkEsIiguJXjyLqW7fgEtA69IYLe1QR
   WyjHFz+JFDclXT5PchuQVDS9sU9V7lzv1Vpxor8QTMJrRUsmGKoub/u6Z
   c5WgWDw4AyKU9RbMtnhHbK5pouYkhicnl+6KuThTghC+TjFeskT96+9A/
   afBCqAb4ZY83oQ4RO0bW+S+NZHH2Mo8G+66SRrhn0QmuvkjSezPS8BXQP
   A==;
X-CSE-ConnectionGUID: fevwc+/qSt63is9evofvTw==
X-CSE-MsgGUID: vZU/r4wjR92pwKUCsoZoEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="70535650"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="70535650"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 09:06:23 -0800
X-CSE-ConnectionGUID: Lp+7Ck60QRqtzG52dEaQWg==
X-CSE-MsgGUID: /ymExG8bTbW7IIBlDx6lDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="210027820"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Feb 2026 09:06:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vo2o8-00000000k2O-07f2;
	Thu, 05 Feb 2026 17:06:20 +0000
Date: Fri, 06 Feb 2026 01:05:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-bpf 102/103]
 fs/fuse/fuse_iomap_bpf.c:193:1: sparse: sparse: symbol
 'btf_fuse_iomap_bpf_ops_id' was not declared. Should it be static?
Message-ID: <202602060016.ZbAIHixg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-bpf
head:   92d07c9947216ee03cbfd2835d5f96c1530cb1c2
commit: 18d872ec03f998f61034ab6229b213ea7884e28f [102/103] fuse: enable fuse servers to upload BPF programs to handle iomap requests
config: x86_64-randconfig-123-20260205 (https://download.01.org/0day-ci/archive/20260206/202602060016.ZbAIHixg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060016.ZbAIHixg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602060016.ZbAIHixg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/fuse_iomap_bpf.c:193:1: sparse: sparse: symbol 'btf_fuse_iomap_bpf_ops_id' was not declared. Should it be static?
>> fs/fuse/fuse_iomap_bpf.c:195:1: sparse: sparse: symbol 'btf_fuse_iomap_begin_out_id' was not declared. Should it be static?
>> fs/fuse/fuse_iomap_bpf.c:197:1: sparse: sparse: symbol 'btf_fuse_iomap_ioend_out_id' was not declared. Should it be static?

vim +/btf_fuse_iomap_bpf_ops_id +193 fs/fuse/fuse_iomap_bpf.c

   191	
   192	/* Register key structures with BTF so that BPF programs can use structs */
 > 193	BTF_ID_LIST_GLOBAL_SINGLE(btf_fuse_iomap_bpf_ops_id,
   194			struct, fuse_iomap_bpf_ops)
 > 195	BTF_ID_LIST_GLOBAL_SINGLE(btf_fuse_iomap_begin_out_id,
   196			struct, fuse_iomap_begin_out)
 > 197	BTF_ID_LIST_GLOBAL_SINGLE(btf_fuse_iomap_ioend_out_id,
   198			struct, fuse_iomap_ioend_out)
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
