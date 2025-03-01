Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDC51361
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Mar 2025 04:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740803452; cv=none; b=mUThpXquzlA6k3lKw3Y7vSVJ3/i64wFbeeI73tmkQTERG4H2FiAh+37aVIxDF0NIdSOqXavV+Lmu2T4Evs9+182+oYOCxrzEsCAmnvez6VbtbgTMDb9I9f0zpaU0D0iHvhtANh+TS1wC5zvrGaVXqsyaqyhl0gVZnAbe/NTEXWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740803452; c=relaxed/simple;
	bh=b/ywwrHpFs37xuwsriE3GOwEyYfUQDfukATUyVQ4Q3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZtpVWVbhTABbWLOxeUgFDONd1kqAeWBaZmP/dbywyOGcdA3cHBx29tCP8fNu/90nEzH8A/RlGdCeEeCOSQD+ZM40Y3jlqICvKlm8j8POp1BdmNdRmYr1kcvyhF6LiVktG1o/n7oC9f2/SNg/R/koDc1Fwuhn0Q7b3+3gbM1UlBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgIx4OCM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgIx4OCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740803451; x=1772339451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b/ywwrHpFs37xuwsriE3GOwEyYfUQDfukATUyVQ4Q3A=;
  b=lgIx4OCMhTNkJ1K9c6OErjkvSoxLj7xMlFND9helm0NJ/k3+4PrYTHua
   tLzWYblRDeT3v//wRvCa5wuzCqsYKfGtUdxSqJY/c5cWCzXK1EepHk0p1
   rxxwkRBIgKaBvRCgAQoQKZgU4MBhBMhU5COkNIKGAWCTwwKhwIQgnCwsS
   OOrnWvzYZHz7kqQUDTibe9215IPfm6wrUNDqreUYkjER9iH8JYmd/ZgeT
   DZBSJ783nv8LuwsnPlhwoXPeZKj6Mf7S52ZkM+wkCNpY4phRrwMI4zE33
   teE9Bk3EItlw8kRRkM56P4Cl8zwYtP8/fh884+ZvbmzGzUS4lCA0fzK/s
   g==;
X-CSE-ConnectionGUID: 7lPqiDf4QNqlQd9fuh8K0Q==
X-CSE-MsgGUID: 1j2bi/6nTLaaYLWI31xMFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41861894"
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="41861894"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 20:30:50 -0800
X-CSE-ConnectionGUID: E4V4weqVQiGlMF/zY9LuVw==
X-CSE-MsgGUID: OuFK8H+iSeS2Ol4Dg9RW4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="118008902"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Feb 2025 20:30:49 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toEUx-000FrQ-1m;
	Sat, 01 Mar 2025 04:30:47 +0000
Date: Sat, 1 Mar 2025 12:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:futex/scope 17/18] kernel/futex/core.c:313:16:
 warning: returning 'int' from a function with return type 'struct
 futex_hash_bucket *' makes pointer from integer without a cast
Message-ID: <202503011241.ms43jiwT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git futex/scope
head:   50063817f6e71b787d3ba96cca9d2fff7b3ea7ff
commit: 07c5880a60a9773964daf0341bb41604efa8cf49 [17/18] futex: Untangle and naming
config: x86_64-buildonly-randconfig-003-20250301 (https://download.01.org/0day-ci/archive/20250301/202503011241.ms43jiwT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503011241.ms43jiwT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503011241.ms43jiwT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/futex/core.c: In function 'futex_hash':
   kernel/futex/core.c:313:16: error: implicit declaration of function '__futex_hash'; did you mean 'futex_hash'? [-Werror=implicit-function-declaration]
     313 |         return __futex_hash(key, NULL);
         |                ^~~~~~~~~~~~
         |                futex_hash
>> kernel/futex/core.c:313:16: warning: returning 'int' from a function with return type 'struct futex_hash_bucket *' makes pointer from integer without a cast [-Wint-conversion]
     313 |         return __futex_hash(key, NULL);
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/futex/core.c: At top level:
   kernel/futex/core.c:327:1: error: conflicting types for '__futex_hash'; have 'struct futex_hash_bucket *(union futex_key *, struct futex_private_hash *)'
     327 | __futex_hash(union futex_key *key, struct futex_private_hash *fph)
         | ^~~~~~~~~~~~
   kernel/futex/core.c:313:16: note: previous implicit declaration of '__futex_hash' with type 'int()'
     313 |         return __futex_hash(key, NULL);
         |                ^~~~~~~~~~~~
   kernel/futex/core.c:327:1: warning: '__futex_hash' defined but not used [-Wunused-function]
     327 | __futex_hash(union futex_key *key, struct futex_private_hash *fph)
         | ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +313 kernel/futex/core.c

   310	
   311	struct futex_hash_bucket *futex_hash(union futex_key *key)
   312	{
 > 313		return __futex_hash(key, NULL);
   314	}
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
