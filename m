Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B081C15
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 17:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705684042; cv=none; b=ancnJe1IlVzK/qVprRLtsnNtLM+QzefEi2qcPohetOA3lc7dwxjF6JPbwwY48aP2PFb7/edPYJM1rm5Pzmu5W3oCILCK3Ljg/2nuwFypEoZieAzWJf2eOaQnTr17tVQIgDfx77DwttrXkxlG5t/M58+8sgX1fAX5dZHzTnhLfks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705684042; c=relaxed/simple;
	bh=nLk77itnQMfrjjk9tQ2lxpLd12Xbnfl6i+MHbkDp+5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fxWLLpbvWxBFiiaIDf7IYyhW75HCibf9aD8VmAGNd7nS3Hnw7YRmCxEA8wd1VMqBrPai+oW89i1L0gJ8f7aK4iw9KgL5AtNqw9AvZYftXbecuzDvmdpDl28BpWgZH3aaBd5L55Q2HTutaU1HLGstomjK/O5XTohxoUo0vfSxx8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DEtzz4ht; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DEtzz4ht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705684041; x=1737220041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nLk77itnQMfrjjk9tQ2lxpLd12Xbnfl6i+MHbkDp+5E=;
  b=DEtzz4htJwc/T1NC9KbIEsXRTIWU2Bj8fZDVtGi6vx6ATABINuNDLDWV
   pcpdPwTNrD70Eoe1jkKVA69kUn6kzCcZLiUXCPdzjTHt/jSzL/oMriVQD
   U2s5FQhSR4KoXvZyhPh0qnuF/L+V5SJjP0jO5hBzJdgjX5yKY32Z7B7ZF
   OJDyc4QOqQ64zSj2SQsSLEA1q+NTbqw/RUwJg9Fa3QbJvN8BjUhwZKjh3
   Y3P8G1saxFk1UiTo9x304ZhLiCZBezkDZ3xgpMPKRddTvXAVNqB/8J/me
   9+ZnrmwjU4bq+AOfprKCmVUCvyp5oZGLE5WSI/0pQtxPmprVMUs5Fppwn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="14313991"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="14313991"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 09:05:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="19446833"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jan 2024 09:05:10 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQsIm-0004Hm-0E;
	Fri, 19 Jan 2024 17:05:08 +0000
Date: Sat, 20 Jan 2024 01:04:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 20226/30000] kernel/static_call.c:469:5:
 warning: no previous prototype for function 'klp_static_call_register'
Message-ID: <202401200036.w24wFSeW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   26f718c6e41b3a8a59f843439fa6f2f6816427d8
commit: 1f8a38caa6fa6bd2b6165483eb2bda487cc40478 [20226/30000] livepatch: Fix patching functions which have static_call
config: x86_64-buildonly-randconfig-002-20240114 (https://download.01.org/0day-ci/archive/20240120/202401200036.w24wFSeW-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200036.w24wFSeW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200036.w24wFSeW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/static_call.c:469:5: warning: no previous prototype for function 'klp_static_call_register' [-Wmissing-prototypes]
     469 | int klp_static_call_register(struct module *mod)
         |     ^
   kernel/static_call.c:469:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     469 | int klp_static_call_register(struct module *mod)
         | ^
         | static 
   1 warning generated.


vim +/klp_static_call_register +469 kernel/static_call.c

   468	
 > 469	int klp_static_call_register(struct module *mod)
   470	{
   471		return 0;
   472	}
   473	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
