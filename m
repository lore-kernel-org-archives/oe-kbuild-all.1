Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8C4251795
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 21:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767301852; cv=none; b=pdHaQ28+8SVLEha1mGItMIl6lbBwBtqu/8gX/lSuoGpi81UCiw11tNY9g5G/5sR+MzwFtcyDVlZFmECHUOvgk7gkrMZAApi/bLbgvh6mZW4qls1YepElEx/LK7vq2Guj7L0YY8msK6kPiOanuJJNRHnIeFMbLDMLmNeVs3q0R0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767301852; c=relaxed/simple;
	bh=utmFZR57RrcQLRfiv4eUmgfegs+CgbNvdwDyurIhMWw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VlKJ9DDYbqYZGb1h5ibL2tufQVzDGaT+o0BIVwYjaF9aKnOUbPaEIGMENuan9UWvmB7Tg8OwR9r3ib7P8OHWYQDq9lieAC/Rvl/aCadJtypmnVEDNh/1jGNMq3pJNuzGrICPdxpnuW6B9aaBYPaR47AbVK7i2hb0uFDrS4QrT6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VfsWD4cE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfsWD4cE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767301851; x=1798837851;
  h=date:from:to:cc:subject:message-id;
  bh=utmFZR57RrcQLRfiv4eUmgfegs+CgbNvdwDyurIhMWw=;
  b=VfsWD4cE73tbcRAk0kLe4EmZzugO0+tshslqw08fBctObuOloeg6LKjg
   etMRrn4QBmFEDQtWumUofyFD9/nw109HKrLtrkLM2I7OC4fMBh5BNDkM0
   Bc+HuTfnItr8HslwoGJxov6r6ZRCJTX0w61G4X5VJJUciXFH9p7Mm6Fqd
   7PIqyI8ig4VTfoogwL3OXLGWeChPcRjPOO10sBw/NNmEPAdK5YwHDk6IJ
   Qtx/BrmXsnZJEKvp6oFjwsKGKfZOLLOZisxmkuVz8EgS3FKYGWU19xE0/
   HHHDotuwQpZUETL9P8jDpV2+B7NeC+w1qzogbIVhOBhtLpUUZ+8YUiOAh
   w==;
X-CSE-ConnectionGUID: kx6YayMnQaOkfYr841gfSg==
X-CSE-MsgGUID: rec4XosxSLCs3cWeHbMH7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68887517"
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="68887517"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 13:10:50 -0800
X-CSE-ConnectionGUID: 1Vjtls+KSw+7fL4h7zEndw==
X-CSE-MsgGUID: 4hf5+joJSDOqWXXlgefQrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="200914599"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jan 2026 13:10:49 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbPwT-00000000227-3ql7;
	Thu, 01 Jan 2026 21:10:45 +0000
Date: Fri, 02 Jan 2026 05:10:40 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hans Holmberg <hans.holmberg@wdc.com>,
 "Darrick J. Wong" <djwong@kernel.org>
Subject: fs/xfs/xfs_zone_alloc.c:32:5-24: WARNING:
 atomic_dec_and_test variation before object free at line 34.
Message-ID: <202601020543.BxObPuzj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
commit: 4e4d52075577707f8393e3fc74c1ef79ca1d3ce6 xfs: add the zoned space allocator
date:   10 months ago
config: arm-randconfig-r051-20251231 (https://download.01.org/0day-ci/archive/20260102/202601020543.BxObPuzj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 86b9f90b9574b3a7d15d28a91f6316459dcfa046)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601020543.BxObPuzj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_zone_alloc.c:32:5-24: WARNING: atomic_dec_and_test variation before object free at line 34.

vim +32 fs/xfs/xfs_zone_alloc.c

    27	
    28	void
    29	xfs_open_zone_put(
    30		struct xfs_open_zone	*oz)
    31	{
  > 32		if (atomic_dec_and_test(&oz->oz_ref)) {
    33			xfs_rtgroup_rele(oz->oz_rtg);
  > 34			kfree(oz);
    35		}
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
