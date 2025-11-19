Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893A51509AB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 03:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763522753; cv=none; b=c5Yn8Qfa7xZ1q8McOtpN78McA82HLNykokv5aAoRzQU9yQKiQNCRIl0M/MsufPa5n1zPk04ydtdnmGkjl+FXRJXXYYNYwg0RxCMN75elcor1kIRmFwDnXjnyNDPAv7YcszO3DavU2wjF9zy3K6vN/Dqfnq8C098HdLqVfLAOIkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763522753; c=relaxed/simple;
	bh=Awz63aDJvy1bG4l6wa7h57wgJ7ueWaU+5VcRubnw7QU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q6sgka4BHxpe3vLBEL/dCX4kI0IBpcX8Rqib7COwutkI8I7SNk8vxjQVD8/uco8VpybhAlzo2lgA21u1o8FRGxePYiNUpOvZ1QZAu0FVgHGxFMn88Ki5Cf1ep/4h5jHe+l9/XnKyHpQYn30bxuRTVlRTEN4LhL6rMX7imfrJP5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T5bJ7mtU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5bJ7mtU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763522751; x=1795058751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Awz63aDJvy1bG4l6wa7h57wgJ7ueWaU+5VcRubnw7QU=;
  b=T5bJ7mtUPzkV3zUsD9rM25ooPeJAHfLwJGh7uRdaYGfmtaHgmP4KGart
   HjGSjV1xteKgkJSZeMLcBuiALNExptHMU/7kDBnC4sholsIZ5kJBvxLWI
   7SG2MOHT9kM+NgJogWSAUuEPws6zvlQHyqsplsg5dpKFKqDSRE4ZcmhXW
   082gyVuVxzafaijHTSd0S+JjgfnG8ji0OL/P23RoeO1qgImftnIavKLab
   G2/lYkur+U/ERTpZ+OOtc4jIVWq8irW4rv6kh8FCdTZpSZ4W0os60Hh4P
   M29bW+Ih1A+7nnQnDYjGRuSSapWCCtCrEe4WyNRSFx4t/H7qEDdQW0DC8
   Q==;
X-CSE-ConnectionGUID: CXaMlBd0R5aA6ik4BWy4rQ==
X-CSE-MsgGUID: TO+j3EsuSU+Dd+JWAuYcww==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="83182960"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="83182960"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 19:25:51 -0800
X-CSE-ConnectionGUID: gOYnvNhhRvaWSaQ0VxQlvw==
X-CSE-MsgGUID: 4cxScp2HSUis2Lp2jSWFCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190204144"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Nov 2025 19:25:50 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLYpH-0002On-2U;
	Wed, 19 Nov 2025 03:25:47 +0000
Date: Wed, 19 Nov 2025 11:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 928/938]
 fs/bcachefs/data/compress.c:91:13: warning: 'bio_phys_contig' defined but
 not used
Message-ID: <202511191104.SG9I2ACt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   d04553e82dc579b00db91a9bf53d148425c00f7e
commit: 9d8c0abd05770eb55042839e565e3cf44302af44 [928/938] bcachefs: kill off bvec.bv_page uses
config: arm-randconfig-004-20251119 (https://download.01.org/0day-ci/archive/20251119/202511191104.SG9I2ACt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191104.SG9I2ACt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191104.SG9I2ACt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/data/compress.c:91:13: warning: 'bio_phys_contig' defined but not used [-Wunused-function]
      91 | static bool bio_phys_contig(struct bio *bio, struct bvec_iter start)
         |             ^~~~~~~~~~~~~~~


vim +/bio_phys_contig +91 fs/bcachefs/data/compress.c

2fa23a10a54b61f fs/bcachefs/data/compress.c Kent Overstreet 2025-10-30   90  
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  @91  static bool bio_phys_contig(struct bio *bio, struct bvec_iter start)
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   92  {
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   93  	struct bio_vec bv;
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   94  	struct bvec_iter iter;
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   95  	void *expected_start = NULL;
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   96  
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06   97  	__bio_for_each_bvec(bv, bio, iter, start) {
9d8c0abd05770eb fs/bcachefs/data/compress.c Kent Overstreet 2025-11-17   98  		void *bv_addr = bvec_virt(&bv);
9d8c0abd05770eb fs/bcachefs/data/compress.c Kent Overstreet 2025-11-17   99  
9d8c0abd05770eb fs/bcachefs/data/compress.c Kent Overstreet 2025-11-17  100  		if (expected_start && expected_start != bv_addr)
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  101  			return false;
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  102  
9d8c0abd05770eb fs/bcachefs/data/compress.c Kent Overstreet 2025-11-17  103  		expected_start = bv_addr + bv.bv_len;
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  104  	}
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  105  
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  106  	return true;
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  107  }
c4dd7871ef71a73 fs/bcachefs/compress.c      Kent Overstreet 2020-05-06  108  

:::::: The code at line 91 was first introduced by commit
:::::: c4dd7871ef71a7327b6b3834e2cdf6777e03eb0a bcachefs: Some compression improvements

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
