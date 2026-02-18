Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB2926CE39
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 11:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771413171; cv=none; b=luP6NTl5e/lXlAroVUfIMuXvYKwnYzKzjVnVNMA0pwdmlQ3zd4hYi8IE2WXrKzGosKvwwAb/FXZQ85dMpsz7sEozQVcpJO0AtFXJuotbQtNY+3T5OxgI7bgvvb9L2BF6I0ATNVQYZb+4s8uORKDCpH9nTWnaB9no941XC/tJtt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771413171; c=relaxed/simple;
	bh=wQTBYH3/B7a4YCT3Xcuk5YPla3iGjR56JsUwLEr3neA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hk5ufExv1WlwHrAQY1WwbR1VhlGy0uGLaMUumulrwsDf2qw22pSjAPE+z18XmC3ZXOTkhvVKgWCqZb2IfRnKXOcYZhiBr0mifD7LfRNwHmv2I5h4p2pYqYGIxOnRUKqg+2oeXk7WoLbd2ejCBd5W0AzTjLJ4QQFqvF7UPYTkKOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGFqmjBA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGFqmjBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771413170; x=1802949170;
  h=date:from:to:cc:subject:message-id;
  bh=wQTBYH3/B7a4YCT3Xcuk5YPla3iGjR56JsUwLEr3neA=;
  b=KGFqmjBApJYy5wr8cEoMF3GxUaoTWaDdwR1YIG90ftSKY+ACAPxDGvtp
   D7eHtKYukSnIwAjIRX3hJ94KOryYUqNAZqzh5IvE1YEr5sI/vpg6QsxbW
   wiZXl4VwFb3E4Be/qgm8E3Vrvx7ZHdTEo6DVZNzZdPUchmuFPZiCxOruv
   9eFflEF3G8sBUD+QjDjJYTmwEYQLbGe4AkJXxQFshdosxDJ5r9viaEi5r
   JmeuND+/GOP2j6DFu9G02bJeLMdyLBD1JBgUeCvUwNTDCTdB6FFqS2NNE
   WgcuVu/3jrWoaTMRBvS3HNASjFDFzg3JlO0nKnCblDlk2YwdG5e5BOvh7
   w==;
X-CSE-ConnectionGUID: t8p9N7QsRrCite7jxQedKw==
X-CSE-MsgGUID: l2x1rqEzQp+KyIOYYxPJIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="71507176"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="71507176"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 03:12:49 -0800
X-CSE-ConnectionGUID: fLlN9HLCQfSxQaIK1RHyXg==
X-CSE-MsgGUID: z6x//jHOTk+B3mDezW3xyQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Feb 2026 03:12:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsfU5-000000012IW-3chj;
	Wed, 18 Feb 2026 11:12:45 +0000
Date: Wed, 18 Feb 2026 19:12:14 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:xor-improvements 16/26] ERROR: modpost:
 "xor_block_rvv" [lib/raid/xor/xor.ko] undefined!
Message-ID: <202602181924.JA3BrYmq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git xor-improvements
head:   ec3f2acc271aa72c99391335901d8bb75103127a
commit: 336c9851ab698039ef8c9eda949c09a79ae77172 [16/26] riscv: move the XOR code to lib/raid/
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260218/202602181924.JA3BrYmq-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602181924.JA3BrYmq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602181924.JA3BrYmq-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "xor_block_rvv" [lib/raid/xor/xor.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
