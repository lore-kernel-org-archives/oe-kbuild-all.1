Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D6B233956
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Sep 2026 04:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788927522; cv=none; b=H5QVP0NnPR1EieNY4KziwJlpcALqTxjHOgNlgj7jdzrQJRAjeLOHrfVCk74FjJY+iYz7t5bYFTaF37PR0WobDAkFyVpL2NW5NnZCWJDMhFsIAdseOrTy1ticx2xIj3O2s9vyqUcXEZDxGQpLrsXDBPvCgKodEhnUAToy0ttx77w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788927522; c=relaxed/simple;
	bh=d3KpAhyeChNQ8T83CDJ8uu72etQu1ZTlhaZhFgYKSsQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ljyaAQSzrqAE4eghyxfPdJTsrltB1vi9OdzgESKz4ncSmoGJq+R3Lwgm4unOAerGhe7IPgmUw3Jy60hlxXEhlfXLyUezUnloDE7uv4rt08i1HOf7EbqI6NXI9Qbmfq/xS/5+qvMAkmEPjaVdRr5CnMjsMBncTwbpgXZWKvpLWg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DredVgkz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DredVgkz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788927519; x=1820463519;
  h=date:from:to:cc:subject:message-id;
  bh=d3KpAhyeChNQ8T83CDJ8uu72etQu1ZTlhaZhFgYKSsQ=;
  b=DredVgkzESVwzE+9T9T9mANlaNEYf2th1tiLDVGsUkq4jUU5Ima4643d
   aoOi7nTogaTtvUlql2gVmsp3cbi83+Rs70BSZLKGwCaK0oUNWxoiPHTJo
   glVJt+Db/sD8sXrVP3RcLSaPsB2eszCuO1Mnz9lKgryPDW5rifjseOAR9
   /0jaUsqz6fgBefbH57g8xxqk2q8nFX0t1MW8nJEGoz9lHh4vujJpClNWd
   MsSoCctJHpDwdV9dS/EJJq01RYTNB6F/G0qzhfXgw1vRuZsefGdLlPVtS
   BMXkpUdIfcRazcHFpTBO6QPULKF86zvi+JEXc1Ixh50djWon78Z8Gb5S1
   Q==;
X-CSE-ConnectionGUID: j9wn+AEySWmXiuu9GyLZSw==
X-CSE-MsgGUID: 4XR8rjXBTkylxfqcmjI0/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="76902604"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="76902604"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 21:18:39 -0700
X-CSE-ConnectionGUID: e1uuohL3RtKXXbcIndQ6Sw==
X-CSE-MsgGUID: HrT/nYyUQvixXK/L0tU7bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="267532528"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Sep 2026 21:18:37 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x49lb-000000001Jf-0ztQ;
	Wed, 09 Sep 2026 04:18:35 +0000
Date: Wed, 09 Sep 2026 12:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:rxrpc-fixes 10/14] ld.lld: error: undefined
 symbol: crypto_krb5_find_enctype
Message-ID: <202609091134.hK2U38EZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-fixes
head:   2083867f36fd87cee21ef081aa3d537798b141fd
commit: 84a9706597ab00ef41c2b98c6a248298c0b36e5a [10/14] rxrpc: Fix RxGK key parser to check enctype is supported
config: hexagon-randconfig-r123-20260908 (https://download.01.org/0day-ci/archive/20260909/202609091134.hK2U38EZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609091134.hK2U38EZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609091134.hK2U38EZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: crypto_krb5_find_enctype
   >>> referenced by key.c:233 (net/rxrpc/key.c:233)
   >>>               net/rxrpc/key.o:(rxrpc_preparse_xdr_yfs_rxgk) in archive vmlinux.a
   >>> referenced by key.c:233 (net/rxrpc/key.c:233)
   >>>               net/rxrpc/key.o:(rxrpc_preparse_xdr_yfs_rxgk) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
