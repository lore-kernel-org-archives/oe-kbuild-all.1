Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0342221D58F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 15:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733414267; cv=none; b=Y2V9fGu7t94ePParXRczIKCi8/n52/TjiiX7qY1jpQlTlgICkLB+qfozntH2IuNbF3Q/rJQzxM+NwVSoBRs6eWgZweixZRCBBA41GKWneCp8hvNPMH8EOeoekLmzU71JuZqQSkMmo4rWeS2Lc1DsxMRv2/oTVD5tN+1UNvWazWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733414267; c=relaxed/simple;
	bh=pKt2LjyylvYko53aigygvSZx0SreYhY3bXAtH5iQQHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GipDzvRQOfcolSFfEo+Mr9V6jXBuf1dI6yUWS7xA7vYtf4bw0JQ2FKL+O4taYTmwcCNBjnPhighROMEj4pjB9zSuv6dmYiG985zCoc7sv24nBBz96jDn+U1q61v0+PfZA5haUj31XJEko/PE6ax4MfPJOAKn8aflDm/cO4X8Y8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQe6vRF+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQe6vRF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733414265; x=1764950265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pKt2LjyylvYko53aigygvSZx0SreYhY3bXAtH5iQQHw=;
  b=LQe6vRF+y8IBR9amXzl0ZOggZRIofwEO1XeBsJVZCcWEN2rxDTV4pFIz
   nzpQjUnZL9FF7BcoYGNQhHwpcfHuNkNqDBuNgswJxnN2CAc4JXskyWWp/
   fhh+OliWCZNgYnn8C0Ze89TdRBL1zzj5UxKHuciVjManVkUkDTqt1odN1
   79OwVLfzHI4rumsehlUTMYC/IXnb4h2hYB+vl5od/62Yn9Moe0y/dDSKw
   /UPgaV3+KIbrq2pN4Bx+XbbI+CCutV3bhwp5eiySnofj23shQXcR1NqKS
   xNtUV/hM2m1YqEjor0Z6SRg838GTB8yi1bHzUEA1B4ozGMcuDi7xI+jie
   Q==;
X-CSE-ConnectionGUID: a3Ai/0gOTbaDq2p8zTvSxQ==
X-CSE-MsgGUID: bXkc6LDORIqXHCr9NvQ/Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33976405"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="33976405"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 07:57:44 -0800
X-CSE-ConnectionGUID: L5smxyioQK+rIxIuyIPsjA==
X-CSE-MsgGUID: LUNfLXnfQbqcjzte+RrZXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="93959168"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Dec 2024 07:57:43 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJEEW-0000AJ-34;
	Thu, 05 Dec 2024 15:57:40 +0000
Date: Thu, 5 Dec 2024 23:57:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 186/189] fs/bcachefs/inode.c:819:9:
 sparse: sparse: cast to restricted __le64
Message-ID: <202412052327.TBN0gE0s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   63c87562a34eb03b4a605119b45026a342042c40
commit: 91471cac1c75158ab9b46861b84ae9619346c13b [186/189] bcachefs: bcachefs_metadata_version_persistent_inode_cursors
config: i386-randconfig-061 (https://download.01.org/0day-ci/archive/20241205/202412052327.TBN0gE0s-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412052327.TBN0gE0s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412052327.TBN0gE0s-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/inode.c: note: in included file:
   fs/bcachefs/bcachefs.h:998:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/inode.c:819:9: sparse: sparse: cast to restricted __le64
>> fs/bcachefs/inode.c:819:9: sparse: sparse: cast from restricted __le32
   fs/bcachefs/inode.c:1000:35: sparse: sparse: cast to restricted __le64
   fs/bcachefs/inode.c:1000:35: sparse: sparse: cast from restricted __le32

vim +819 fs/bcachefs/inode.c

   813	
   814	void bch2_inode_alloc_cursor_to_text(struct printbuf *out, struct bch_fs *c,
   815					     struct bkey_s_c k)
   816	{
   817		struct bkey_s_c_inode_alloc_cursor i = bkey_s_c_to_inode_alloc_cursor(k);
   818	
 > 819		prt_printf(out, "idx %llu generation %llu",
   820			   le64_to_cpu(i.v->idx),
   821			   le64_to_cpu(i.v->gen));
   822	}
   823	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
