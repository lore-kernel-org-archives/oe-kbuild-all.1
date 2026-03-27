Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F3E3AEF24
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 10:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606856; cv=none; b=hhgkGeezLU9rhGQgH7pHE9/wrQ41OdJMMgWAjHHDrsuwzAFJYzIoOVXKtfcFMJJzFRIT8Ue5oq4OkCCcmPjvx0Vq6nLcO0CQLPvYP7kqTeDEXL/yD3UBZBnRl13pfS62/obNnzoimqYCTwARoSzsFqkRve+vhe6m+nVyv/jSysY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606856; c=relaxed/simple;
	bh=xZAFi59AJSs1E1d9hb+Z/RYKTP/h7jN0DjNoQakie6s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hofi5xkTK9DBglAYfTNaihZjD7WFKAGB/ivQrY0BSW3G/qgbJ/2POu5LGJpjFmGC3CmMV0HMXTMvyLsgVS59FCwmoaxhLQPkW3+3o057jnH6pE1sbEKWfZP3WsvjONP3Z6QOf3QARX5Mr50w1nm0zRUBh0MskBZPPv9a2vFHE4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLUSmyip; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLUSmyip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774606854; x=1806142854;
  h=date:from:to:cc:subject:message-id;
  bh=xZAFi59AJSs1E1d9hb+Z/RYKTP/h7jN0DjNoQakie6s=;
  b=jLUSmyipPLQXX49RGCOuItl6/ZNduMCodq5LGHonihWyZXPC5Atj6u8G
   FJIYmjz+PwvETxp/wAMmO7sI6fZnN+4lzpSnjlutC6POebBzSPiMCFFTl
   g7s9bUm/s4473KmzTsLG4oJv/oPkSftp4ZtHi8k3SzgAKBvxrDL827xi3
   zNfcSfX0R8RmvYNA2bWBTK6MyftJ42VnxjKIA5CSdvqZAqNtFfk3ZFa2k
   wgDGsmBVlALAa+h+Jt4pgITN7yLa6H5S+WyK5I4WfxNL0oDa2JfNF4UKf
   rdig+aH00HfAIuYN3M6joiBCDTrGcvxZPcF5bKfjrwlD8bBUQ+XvAyAED
   g==;
X-CSE-ConnectionGUID: l6IQ1rSBQayOz5ys38VbOA==
X-CSE-MsgGUID: ksm4nY58TBC/VoMsIXjYiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75793266"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75793266"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:20:54 -0700
X-CSE-ConnectionGUID: Xm6neMTrQUC8vqSJcIkEmA==
X-CSE-MsgGUID: GY0DnxXOSSOUIjBufEwuew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="230199435"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 27 Mar 2026 03:20:52 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w64J7-000000007TV-3eco;
	Fri, 27 Mar 2026 10:20:49 +0000
Date: Fri, 27 Mar 2026 11:20:28 +0100
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Chris Down <chris@chrisdown.name>
Subject: [akpm-mm:mm-unstable 199/330] vm_util.c:127:14: error: too
 few arguments to function 'pagemap_scan_supported'
Message-ID: <202603271115.uE9vpppi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   74dc4627271e6e367176b519565e901ed72d6e4c
commit: 9652b82ca963243fb80e645319d473a7dc65ee79 [199/330] selftests-mm-add-uffdio_move-huge-zeropage-pmd-regression-test-fix
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260327/202603271115.uE9vpppi-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271115.uE9vpppi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603271115.uE9vpppi-lkp@intel.com/

Note: the akpm-mm/mm-unstable HEAD 74dc4627271e6e367176b519565e901ed72d6e4c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   vm_util.c: In function 'pagemap_is_huge_zero':
>> vm_util.c:127:14: error: too few arguments to function 'pagemap_scan_supported'
     127 |         if (!pagemap_scan_supported(fd))
         |              ^~~~~~~~~~~~~~~~~~~~~~
   vm_util.c:70:13: note: declared here
      70 | static bool pagemap_scan_supported(int fd, char *start)
         |             ^~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
