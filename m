Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DBD12BF2A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 13:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713274554; cv=none; b=PmTIsdu6EAt7cfLb89RBhbN7z+7vxozxYK5GUEmgn6E6bZV6HV7Y9mN1+RaPYziWtW9WD78fJORN9u9yPIjDo0rNE/1CAg7FEnafA61wnwCntU1CvqCvQcJ+bqQVtChWHj3wkweA0SfLSytxUcNHeSGcB/dvDZXFbtihpA/YNOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713274554; c=relaxed/simple;
	bh=eZOi/mmFCp0igbm4U37BWycn1DS08o4pX2j5QgPiDGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=afVIbtWoMcFsvgmZf2+yGP2Lod2cuBZ0t7ifTTvk0+KpmU7Za0fRsO63tqjX0JRenOjeE1pAl/dcN7tbVKW8yQQU7vW6I51ybsZiYOKi64VCWvlyvNfriGaZg1UesPnYu1liigdifoOfD8P3BHbfukqC6KUG3QCJ+714CqbLtxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDr/WgBe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDr/WgBe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713274549; x=1744810549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eZOi/mmFCp0igbm4U37BWycn1DS08o4pX2j5QgPiDGU=;
  b=KDr/WgBe5TgCvcx12p0Ow24r9cK5u54BLgUm8jznl/Fz5Rlvvbp9Zilm
   e28S+ulCjA20wJ/BJ9KACr5SDFi4PkSX5valft72gEnzUsXQeKJaAaHSD
   /0wu4cHXgUuzMufqJ/Lm8KIug9AyYovs9IB2xLq6v4MjspdFSBu8vZirW
   9JvwglJmX0eU8KDeMQNDLh5q52gdNz7xQ79zMbz+5+Qyty+l1iu7w7zOK
   a6ebO5uyhgWoOGD8i47CKpdg9FOXo2ZmWs3Q+eufzK2ncxdyo8noMTPo1
   FIV6m4yPeXjJ9AYaV3UlTSYiYiTJh8zI7nsBumOyu4qnzRe3cGwQVE0gz
   Q==;
X-CSE-ConnectionGUID: zX8d981MR3KmNI4bV6pSTg==
X-CSE-MsgGUID: NTnD80B5RS2uFljJ7VYKRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8575290"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8575290"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 06:35:48 -0700
X-CSE-ConnectionGUID: 8e/h6hqkT9SYCS7FhrtXbg==
X-CSE-MsgGUID: TajxLt/USJaiQxhX9RGDbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="27057438"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 16 Apr 2024 06:35:47 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwiyO-0005J8-2n;
	Tue, 16 Apr 2024 13:35:44 +0000
Date: Tue, 16 Apr 2024 21:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 455/460]
 mean_and_variance.c:(.text+0x400): multiple definition of `u128_div';
 fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text+0x0): first
 defined here
Message-ID: <202404162114.V2QY1ZXA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   7c3356f2aba32597d2b4927b2e237bc980fe3a07
commit: 3332108f6e75ebd618bd1088a45ecb417375195e [455/460] mean and variance: Promote to lib/math
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240416/202404162114.V2QY1ZXA-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404162114.V2QY1ZXA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404162114.V2QY1ZXA-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: lib/math/mean_and_variance.o: in function `u128_div':
>> mean_and_variance.c:(.text+0x400): multiple definition of `u128_div'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text+0x0): first defined here
   ld: lib/math/mean_and_variance.o: in function `mean_and_variance_get_mean':
>> mean_and_variance.c:(.text+0x0): multiple definition of `mean_and_variance_get_mean'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text+0xc0): first defined here
   ld: lib/math/mean_and_variance.o: in function `mean_and_variance_get_variance':
>> mean_and_variance.c:(.text+0x4c0): multiple definition of `mean_and_variance_get_variance'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text+0x140): first defined here
   ld: lib/math/mean_and_variance.o: in function `mean_and_variance_get_stddev':
>> mean_and_variance.c:(.text+0x580): multiple definition of `mean_and_variance_get_stddev'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text+0x200): first defined here
   ld: lib/math/mean_and_variance.o: in function `mean_and_variance_weighted_update':
>> mean_and_variance.c:(.text+0x80): multiple definition of `mean_and_variance_weighted_update'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text+0x2c0): first defined here
   ld: lib/math/mean_and_variance.o: in function `mean_and_variance_weighted_get_mean':
>> mean_and_variance.c:(.text+0x340): multiple definition of `mean_and_variance_weighted_get_mean'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text+0x480): first defined here
   ld: lib/math/mean_and_variance.o: in function `mean_and_variance_weighted_get_variance':
>> mean_and_variance.c:(.text+0x240): multiple definition of `mean_and_variance_weighted_get_variance'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text+0x540): first defined here
   ld: lib/math/mean_and_variance.o: in function `mean_and_variance_weighted_get_stddev':
>> mean_and_variance.c:(.text+0x2c0): multiple definition of `mean_and_variance_weighted_get_stddev'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text+0x5c0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
