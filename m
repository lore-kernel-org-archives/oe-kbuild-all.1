Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EC686359
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 06:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765780220; cv=none; b=VqGabxABVtw3IDTc94PI6cqD/S1xs7LdIIeXdqskdGdiDqqAi28pZIawD6NN1/BX14fEbM4J0cofjRw8VcyEqyXEsJFvxZUb6tY3NI4Cq3mOG+f+kXQM4yy/Eu7kwRB7wupE4pSZkLGjNrYTwL1bpZmfF3jIUrLcuVtPcq64WJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765780220; c=relaxed/simple;
	bh=9xXZ1DAYsUQ3SkAzxpQUreFcnbcBd+RQhFhijF5n4ag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b0JRWp24Lf5DodWZoDyYJNZlZXaNkHHGFvLU7ePW3+5tPknDDMJdVVKsynw8w8upga8OmXxAC3kwdLpG1buqmV41ErIZoR1RdoGTnhvYvQkP3z8tUXC9bmHgsrg7xA7qmxcbUcvDeHcZpP9XFCxinD100em163UGAnj0V8m/BjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rvk081Lw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rvk081Lw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765780218; x=1797316218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9xXZ1DAYsUQ3SkAzxpQUreFcnbcBd+RQhFhijF5n4ag=;
  b=Rvk081LwLhhhuU+8GEb5Q2c4/gihrOysc++D/Ma5BQu3mP2hFvGC5AKI
   cfMA8fRR/hI1cdyC9WdnVUCKYIuq2rmfupglMcj/on3vipnx/x/h4NFzz
   KH6yYUaXOBMhRPJ0AeumojqN/Bz9BqLCF3sQHRXdKkQLLSZpiW14Y4xeU
   IFA8fq5FjDAQbPs6FcJGKQek71kh0EEQLCH/imLz4RO13GqmRqb2k0UTi
   QEc4az+7MmhltpgkXtHmrh1k0V+E2Wc0Z1VKb1YfI8m3xYDLRgXv4smfq
   vNe5UykA5HMBPDbuIZjCSQKilR+JKq4w6jvwad8XwfHTgZYavtx1akjEF
   A==;
X-CSE-ConnectionGUID: D3US9U7dTxeQibCIGJBDMw==
X-CSE-MsgGUID: p5S1yB1FSHW3mvEfGgLpPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67552855"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67552855"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 22:30:17 -0800
X-CSE-ConnectionGUID: 6U8LnLK2Ts+bmuKxPbtsaA==
X-CSE-MsgGUID: gCHDNfZZSAivOhnnDawVJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="228715786"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Dec 2025 22:30:16 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV262-000000009sP-19Ho;
	Mon, 15 Dec 2025 06:30:14 +0000
Date: Mon, 15 Dec 2025 14:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 11/11]
 mm/shrinker.c:698: warning: This comment starts with '/**', but isn't a
 kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202512151426.9VIuEFif-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   0bcb74c919819123b737554f5d35edefa0555d65
commit: 1e63c23f99e1610c8c483368df6922ec9076d95a [11/11] drm/ttm: introduce pool_shrink_rwsem
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251215/202512151426.9VIuEFif-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151426.9VIuEFif-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151426.9VIuEFif-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:698: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Keep synchronize_shrinkers() here only to keep KAPI compatibility,


vim +698 mm/shrinker.c

   695	
   696	
   697	/**
 > 698	 * Keep synchronize_shrinkers() here only to keep KAPI compatibility,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
