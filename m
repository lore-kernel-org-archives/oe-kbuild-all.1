Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52972158851
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718561; cv=none; b=V5Zzv6jmDe92G2O3ygBmJnR21cuTVCZyRQZ/VR8gUerhdg09Zo303IuYLaLfSdOloSZfOOFyxLG/J8ujKCBXCAg/Lo+qnSHnxrgro19Q2/OIYANqHgz9lh59TYj7U0WGQAiyG1xYcfiwR18iqnXbjzetI+VFDxikx8dZoIUUtxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718561; c=relaxed/simple;
	bh=qcP3khs7G1JoHWy1MW4nS2PoU8BIjszkWd3wsPuw5UU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TMyGAauEWFPxFEAz5gc5ROJTCqfUu1TMyc2BTHZmlot2NHY+/UhzA8QYZuDlX1u1A+KkqhIw5GXoUV0NdRBSj+rIYfGcU2/T4xo//U04K+bQpPBCydmklZwbyE/44Il/GvURmBxUrIZEryr7NF0l5ZMqrVXHmYcjfVy3o4igg7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yi+Jy6PQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yi+Jy6PQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718559; x=1765254559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qcP3khs7G1JoHWy1MW4nS2PoU8BIjszkWd3wsPuw5UU=;
  b=Yi+Jy6PQJ6lEf143Z/jWf2FnN7R69Dio7Ef8WkAozxom4XNhO8olLTll
   uxo+ngGXy5+uAKSoFEAlRTFQ77u8q9pBLYSmvH1S9hKl+dKy3Rt7xo3w1
   9McXPIHmbr9iA29T2P6Wn7fVPVLJi+82ytLwiCcB5bZVG5CkE2AAdvhJ5
   GrJnx29F0oWbaSunBCdVxdQTsXTW7VaFchbluo8VxS7AQvb7MyRYz4GnL
   MjX5PW2Y/XNhYDYnehZUKBlXRu+UF3l+lVNGq9Jqjppj+CvG3ZOpxGEb4
   5zIUyWSsqWJmYwGJr9HLi7+TSEPue0jd2E3ZU02nYaCYX3Fh/DuWh1z87
   g==;
X-CSE-ConnectionGUID: B2K3LEWnTbal3v/6sNzx+Q==
X-CSE-MsgGUID: r2Ri8ByDSqSdl94y7jQ7fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34236749"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34236749"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:29:16 -0800
X-CSE-ConnectionGUID: okWGlxFcSN6yWgdnUsuksg==
X-CSE-MsgGUID: lHj7TcE+STKIVMJogxBOmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95429285"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Dec 2024 20:29:15 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVOT-0003rL-0B;
	Mon, 09 Dec 2024 04:29:13 +0000
Date: Mon, 9 Dec 2024 12:28:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 199/199]
 fs/bcachefs/alloc_background.c:2019:13: warning:
 'bch2_discard_one_bucket_fast' defined but not used
Message-ID: <202412080102.Yfb8Lo3Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   1e50bc1ed8f08e32678d83b4216f26be485d15a5
commit: 1e50bc1ed8f08e32678d83b4216f26be485d15a5 [199/199] disable bucket reuse withut flush - test
config: arc-randconfig-002-20241207 (https://download.01.org/0day-ci/archive/20241208/202412080102.Yfb8Lo3Q-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080102.Yfb8Lo3Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412080102.Yfb8Lo3Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/alloc_background.c:2019:13: warning: 'bch2_discard_one_bucket_fast' defined but not used [-Wunused-function]
    2019 | static void bch2_discard_one_bucket_fast(struct bch_dev *ca, u64 bucket)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bch2_discard_one_bucket_fast +2019 fs/bcachefs/alloc_background.c

a393f3312387597 Kent Overstreet 2024-02-16  2018  
64ee1431cc7d11e Kent Overstreet 2024-06-23 @2019  static void bch2_discard_one_bucket_fast(struct bch_dev *ca, u64 bucket)
a393f3312387597 Kent Overstreet 2024-02-16  2020  {
64ee1431cc7d11e Kent Overstreet 2024-06-23  2021  	struct bch_fs *c = ca->fs;
64ee1431cc7d11e Kent Overstreet 2024-06-23  2022  
64ee1431cc7d11e Kent Overstreet 2024-06-23  2023  	if (discard_in_flight_add(ca, bucket, false))
64ee1431cc7d11e Kent Overstreet 2024-06-23  2024  		return;
64ee1431cc7d11e Kent Overstreet 2024-06-23  2025  
5a6e43af1e5341a Kent Overstreet 2024-09-04  2026  	if (!bch2_write_ref_tryget(c, BCH_WRITE_REF_discard_fast))
64ee1431cc7d11e Kent Overstreet 2024-06-23  2027  		return;
64ee1431cc7d11e Kent Overstreet 2024-06-23  2028  
5a6e43af1e5341a Kent Overstreet 2024-09-04  2029  	if (!bch2_dev_get_ioref(c, ca->dev_idx, WRITE))
5a6e43af1e5341a Kent Overstreet 2024-09-04  2030  		goto put_ref;
64ee1431cc7d11e Kent Overstreet 2024-06-23  2031  
64ee1431cc7d11e Kent Overstreet 2024-06-23  2032  	if (queue_work(c->write_ref_wq, &ca->discard_fast_work))
64ee1431cc7d11e Kent Overstreet 2024-06-23  2033  		return;
a393f3312387597 Kent Overstreet 2024-02-16  2034  
64ee1431cc7d11e Kent Overstreet 2024-06-23  2035  	percpu_ref_put(&ca->io_ref);
5a6e43af1e5341a Kent Overstreet 2024-09-04  2036  put_ref:
5a6e43af1e5341a Kent Overstreet 2024-09-04  2037  	bch2_write_ref_put(c, BCH_WRITE_REF_discard_fast);
a393f3312387597 Kent Overstreet 2024-02-16  2038  }
a393f3312387597 Kent Overstreet 2024-02-16  2039  

:::::: The code at line 2019 was first introduced by commit
:::::: 64ee1431cc7d11e01a1007ead0afe737781cbbab bcachefs: Discard, invalidate workers are now per device

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
