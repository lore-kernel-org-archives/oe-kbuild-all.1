Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745CC39F8CD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 22:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769119293; cv=none; b=JX7AqXscthMyRN/YUz0OeL9lt/IcXEzujfLs6MZ5alVvzVRSUidPk7Zzfm4l6gdT2BWKJ6+tSd/mXf8GYFPcDtfNf15fEC/XjPP1u6XUqw4A1JMgD2XzsdSoiexpgXSTX+Kpq5bcbMtyloeY1R73EphfePPbYjT/mXFxhPtd2eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769119293; c=relaxed/simple;
	bh=smq33jOaOWRmE2klSXUqT8h2Z4wl8Ts92GRbiUKezpA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o5chVWPpR+UqMVhn1bup1QTFKwKlL6Nv+lJwJU/TEmm1k+4/k6SM0Li2hoCrSyPeeXPmr151A6jrkKchMbZe+SgO8KNXwbSiWUtGI4fkkkceUY2h9soyyoZU4cG7RTDBjZoGf9nhpumQod6f7bRh8ZUQvoEVbCgghBsYk7oEO1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/V2FBVc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/V2FBVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769119287; x=1800655287;
  h=date:from:to:cc:subject:message-id;
  bh=smq33jOaOWRmE2klSXUqT8h2Z4wl8Ts92GRbiUKezpA=;
  b=a/V2FBVcFCsKjBnJ6wJ5jx050cV5CvOeUAg7n22UsG79yzarU1R7TXrF
   7qh58VF7C54WI4jRJJLCx6rvN7853sMlVh6r2Cr8KhG5UwG8IRtjYOuX1
   ID6ci0C1TbpYs1c/mg8RYyxxOlVtgsKhwIOl8YlopehSkhSaIDD0YfdRB
   OYAO2Pmk9tU9AUEj3g9FrNmk1X6VcYyDDvr6HlhZEiZH/HfaHCRsnUT1n
   hA1Z1KTjvWv12cCm00zGMMctPF9e9z8ovWv29rbdEgHf9Fr9nfS+n7kBi
   p7ulh6LN1HKeR6rKTmugKGRVM6ebQNhgBxxvTsJmy+HjRwO8qJoB59GZL
   A==;
X-CSE-ConnectionGUID: k+y2/PswQDSs/pw9yXV90w==
X-CSE-MsgGUID: lKgLuJLnQNuF5529PUY0MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70286783"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="70286783"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 14:01:23 -0800
X-CSE-ConnectionGUID: iaBvSieTQ2KMxNQrUA59Xg==
X-CSE-MsgGUID: z40TQ0TcTpam4oMmJ+knCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="238105847"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jan 2026 14:01:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj2jv-00000000TGc-0148;
	Thu, 22 Jan 2026 22:01:19 +0000
Date: Fri, 23 Jan 2026 06:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bjackman:lkp/page_alloc-unmapped 19/19] make[4]: *** No
 rule to make target 'mm/page_alloc_test.o', needed by 'mm/built-in.a'.
Message-ID: <202601230552.cgTIiGRq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bjackman/linux lkp/page_alloc-unmapped
head:   e3d15ba96c69587b064e8334327d0a581ff9a747
commit: e3d15ba96c69587b064e8334327d0a581ff9a747 [19/19] mm: Minimal KUnit tests for some new page_alloc logic
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260123/202601230552.cgTIiGRq-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230552.cgTIiGRq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601230552.cgTIiGRq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'mm/page_alloc_test.o', needed by 'mm/built-in.a'.
   make[4]: Target 'mm/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
