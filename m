Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91E0339875
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jul 2026 15:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734412; cv=none; b=kcaaTCR3flNxZTnIiRhiyg0CfznfKVb6Kxdg/aYsDHMYhWGPzwiv90onDpvIcRIW9u+UlG7Ua2GYoNCT66llNOQQhr0CXuFjvX8+9Xk8kpQfl6Uzr5tarOAcd8Gtm0Lqi0Wt5dbOxWMzsvSP1wYU9hzGmfrtYW3CExHkhTg11MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734412; c=relaxed/simple;
	bh=yWOsaQ+LyhCXQ8YPnIAhi+lWQ5DrtXcAWsup0X6T7dA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SeI181tPW7cS81HXPMM1fupjnicx7rYmhzsctNeyV1AvW2D55HtU1b3r0q8i/klfsVUcyAjhPATXM3Z4wbJpRDd89pWY6MISFDYAHgx0Ld7ha18M/rJO6gsFdeYAE+PXz3tWG1Qfc5NmT3iO9TK5JcejAAksjV+fTvdPRHv4nDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JAsoB1UM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JAsoB1UM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784734411; x=1816270411;
  h=date:from:to:cc:subject:message-id;
  bh=yWOsaQ+LyhCXQ8YPnIAhi+lWQ5DrtXcAWsup0X6T7dA=;
  b=JAsoB1UMoWMyGu87UDtpynd6jrDebcIuLO55dzwiJOKxfrTC28Z6b7cA
   OTY1/IL2oJMH0aMx0fJAKQniixQ4eC2XjsIpnWS0XzPYTFvyBZDbYZ7Kx
   8u2+pwhYbkcMXujwdsMmvZHx2XQniFe27MYtiR334VcA5kri9OwqgrZ/e
   2hcTvv/bnx32O42FSTHk5lZ8lH64UClSQpRBGZK90HPVgONILpfbUJDxq
   GoNpmR9cWLh7xQFJHowWJzkul6o41PDWAN4ihvOOj2JYiQ2hHIDz9dEN/
   HUaKx7AwSN1M9TwHMKDIhjBm8HFYbvUphMySONbPwiQV/XyggQFFSK8Ch
   w==;
X-CSE-ConnectionGUID: RGCsH5jjTuqZeY5DswjEpg==
X-CSE-MsgGUID: A1/UTowbRdKizBbUmFBuoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89192867"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="89192867"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 08:33:30 -0700
X-CSE-ConnectionGUID: V4FNtAu2TeCDTwT/XtdjBA==
X-CSE-MsgGUID: fwFJehxISl+Toccw3PSXUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="254208636"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jul 2026 08:33:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmYwo-00000000YqH-1AjR;
	Wed, 22 Jul 2026 15:33:26 +0000
Date: Wed, 22 Jul 2026 23:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 22/57] fs/iomap/ioend.c:370:6-25: WARNING:
 atomic_dec_and_test variation before object free at line 374.
Message-ID: <202607222303.8pqqTuaz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   b119b814b2ff02941ccebfaddf61a22af4ebc521
commit: 95385d758fbe8e650aec920bd9633248688f5a69 [22/57] iomap: add support for data checksumming
config: x86_64-randconfig-104-20260722 (https://download.01.org/0day-ci/archive/20260722/202607222303.8pqqTuaz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607222303.8pqqTuaz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/iomap/ioend.c:370:6-25: WARNING: atomic_dec_and_test variation before object free at line 374.

vim +370 fs/iomap/ioend.c

8f02cecd80b993 Christoph Hellwig 2025-07-10  357  
63b66913d11c5f Christoph Hellwig 2025-02-06  358  static u32 iomap_finish_ioend(struct iomap_ioend *ioend, int error)
63b66913d11c5f Christoph Hellwig 2025-02-06  359  {
95385d758fbe8e Christoph Hellwig 2026-07-19  360  	if (ioend->io_flags & IOMAP_IOEND_CHAINED) {
63b66913d11c5f Christoph Hellwig 2025-02-06  361  		struct bio *bio = &ioend->io_bio;
63b66913d11c5f Christoph Hellwig 2025-02-06  362  
63b66913d11c5f Christoph Hellwig 2025-02-06  363  		ioend = ioend->io_parent;
63b66913d11c5f Christoph Hellwig 2025-02-06  364  		bio_put(bio);
63b66913d11c5f Christoph Hellwig 2025-02-06  365  	}
63b66913d11c5f Christoph Hellwig 2025-02-06  366  
63b66913d11c5f Christoph Hellwig 2025-02-06  367  	if (error)
63b66913d11c5f Christoph Hellwig 2025-02-06  368  		cmpxchg(&ioend->io_error, 0, error);
63b66913d11c5f Christoph Hellwig 2025-02-06  369  
63b66913d11c5f Christoph Hellwig 2025-02-06 @370  	if (!atomic_dec_and_test(&ioend->io_remaining))
63b66913d11c5f Christoph Hellwig 2025-02-06  371  		return 0;
0b10a370529cbd Christoph Hellwig 2026-02-23  372  
95385d758fbe8e Christoph Hellwig 2026-07-19  373  	if (iomap_has_csum(ioend))
95385d758fbe8e Christoph Hellwig 2026-07-19 @374  		iomap_csum_free(ioend);
95385d758fbe8e Christoph Hellwig 2026-07-19  375  
e523f2d4c974a8 Christoph Hellwig 2025-02-06  376  	if (ioend->io_flags & IOMAP_IOEND_DIRECT)
e523f2d4c974a8 Christoph Hellwig 2025-02-06  377  		return iomap_finish_ioend_direct(ioend);
e8f9cf03c9dc94 Christoph Hellwig 2026-02-23  378  	if (bio_op(&ioend->io_bio) == REQ_OP_READ)
e8f9cf03c9dc94 Christoph Hellwig 2026-02-23  379  		return iomap_finish_ioend_buffered_read(ioend);
e8f9cf03c9dc94 Christoph Hellwig 2026-02-23  380  	return iomap_finish_ioend_buffered_write(ioend);
63b66913d11c5f Christoph Hellwig 2025-02-06  381  }
63b66913d11c5f Christoph Hellwig 2025-02-06  382  

:::::: The code at line 370 was first introduced by commit
:::::: 63b66913d11c5f3572dfdee38e78d510d0f90aa8 iomap: move common ioend code to ioend.c

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christian Brauner <brauner@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
