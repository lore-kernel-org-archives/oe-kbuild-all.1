Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E14925F7A9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 03:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034823; cv=none; b=AeFdb7Tyrh937wazx/JXGkNgrG9acvshANIEedEj8T6ovUbwgz3MZ7tQ85AhRSWMKWk3QUeX0epufSGrjB193PEQv8apEKnCHayUwCQjYktLKlCks/R6uYFqtCtljvS4tPOn9Ep9Mu0Z3kZKv4i82/ZQr3l13cxXLVjtn1IFZBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034823; c=relaxed/simple;
	bh=NvUMVjrv5EtZ8b4Zq61ORP57uVsILpWEQ6w1nrJjOb8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qGNmSYel2yREcyR1ospkYdwmimfjyw1LnY/QvFePRoG7UUDoztfjEaToKg40a7CAo693jnNiC4j5Z5k56zc2NxwdAnqFIKlsKrKyoHbRDGIP6nAGJzklqHP0xnAE29I18Riisczn6qLX6UEjzHTg7Rr6lO6Yyftjo5g0ahIYpTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9fv8Fh0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9fv8Fh0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792034822; x=1823570822;
  h=date:from:to:cc:subject:message-id;
  bh=NvUMVjrv5EtZ8b4Zq61ORP57uVsILpWEQ6w1nrJjOb8=;
  b=i9fv8Fh0mfnznpzaufBkRJYDltTrmvw7/r9JhokREgAY5uMVZMqbsVR5
   E7h4UiEwfLNfdeRO9zTTUorJfEk89PeYJ6I7MicSojTMrh0gA/8qpIqJ5
   OEMLlWAeVzOPmMTk4DDPXMcujIpyL8YdDu876iTKKm79PxUlgxBRnOkvT
   W4q1XcfOcL2c0Ix6PmwnwesYXKXCDvg8CF+buHncLC9sHf+jk0DjePkwj
   2zxw8SNphzDQzGWFRNcugF84+2DBB5go5jHq7NpuxpFrVZynOO67ZU44L
   P8NMq4OfvMnrI2yzoMptAb2m4T4hE9fx1Ydi9pUL/dKd/yG0d+0VEirae
   g==;
X-CSE-ConnectionGUID: 1Vlud9wqRVqpgjItWHg7AA==
X-CSE-MsgGUID: Re94c+U7S1eQMJWdyJ+e6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="677442"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="677442"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 20:27:01 -0700
X-CSE-ConnectionGUID: 34+GwQ+eR6ip9o+JQr/vsA==
X-CSE-MsgGUID: HXll02GuRkyOe12IPdTiYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1935536"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 14 Oct 2026 20:27:00 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHC7N-00000000BaB-2XQg;
	Thu, 15 Oct 2026 03:26:57 +0000
Date: Thu, 15 Oct 2026 05:26:32 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next-3 12/13] kunit_bvecq.c:undefined
 reference to `bvecq_put'
Message-ID: <202610150526.Y43xbrSo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next-3
head:   d43a7f2a38d9f9e2d1db0b79681d6b4bfe766738
commit: 56e1580c38e2bb8b44a40513f3756e78e2823d41 [12/13] iov_iter: Add a bvecq kunit test
config: um-randconfig-2001-20261015 (https://download.01.org/0day-ci/archive/20261015/202610150526.Y43xbrSo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150526.Y43xbrSo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150526.Y43xbrSo-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: lib/tests/kunit_bvecq.o: in function `bvecq_kunit_bvecq_put':
>> kunit_bvecq.c:(.text+0x32): undefined reference to `bvecq_put'
   /usr/bin/ld: lib/tests/kunit_bvecq.o: in function `bvecq_kunit_load_chain':
>> kunit_bvecq.c:(.init.text+0x6c1): undefined reference to `bvecq_alloc_one'
   collect2: error: ld returned 1 exit status

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
