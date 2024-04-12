Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E38134CC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 05:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712898454; cv=none; b=r1M1NLvZHo/r+huzrxW0YXmycLpnAi9ENczbppOyooj7oBFoT1dRCuUumAAKlB5b4zM0+IuA8ADTT64jwU9LKlGgvhkOt1jJRydmIArq2HGzpnFyy3qKa2Zt9cCTadOP2wiJ37RsUJQZtY0kVFycwWKaMyOhaSpSrMU+FwNBiRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712898454; c=relaxed/simple;
	bh=O24TCv4hC0dFEF2MSnFqtF48Sn+x5uGIXU3ZaSk5erQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M2nlh1ja/AEFFGsOzOiGP9pEsHsPFKofauGJJj3qslapYDVc2fa2ze0dphcJvGu/yhrTzDZJwygbloiEpipVoVeVa3kRcoMW6ZuuKEnNgIfm0aybj6/iU24Bxegz1n9tYpkbTsW6q+p0Xu8w0hKTrrcn1fZeKGSQsSRSY8cOdh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qna3ZuGL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qna3ZuGL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712898453; x=1744434453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O24TCv4hC0dFEF2MSnFqtF48Sn+x5uGIXU3ZaSk5erQ=;
  b=Qna3ZuGL60yk6OANWL/yIAaWfs9D0bKCUenlwH59kg5D3ybDtKlRHfD6
   AJdr4FkXFoSDahakv+1mADeIUcwMJ282zwQ0Re//hEEaebFRMqYoYj6gH
   H6eCZnpEksHb2H8/Fb6fTnff+eMUqub+4JvwkzmGQDRW4/6m0DOulR31e
   6By+Sgl8s6W7HIFwllfEP54q+4BZFDSQ+1emCOJGeaikoFV0FzZFd9NeT
   ZwooFrawy7AEUmsuAh2xBM9Lzt3g+zaePcYV0+MBbRIaXzhxonO4riWC+
   a1K5qFy89PMl4xKw38dj9k0JfC/B0laClhnUHeWWvj4z8i55sjN2aEbQs
   A==;
X-CSE-ConnectionGUID: eey++czTTn6wB5QZY+tTeg==
X-CSE-MsgGUID: yDoeK/FVSYqLF+YwfIlQpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19053404"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="19053404"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 22:07:31 -0700
X-CSE-ConnectionGUID: w0B/XKqLS0abMXNRCDAngg==
X-CSE-MsgGUID: T/bv7qqRRD2jn+Da5IUbvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="52291777"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Apr 2024 22:07:30 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv98K-0009Oo-0a;
	Fri, 12 Apr 2024 05:07:28 +0000
Date: Fri, 12 Apr 2024 13:06:05 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 529/552] ld.lld: error: undefined symbol:
 __tracepoint_page_pool_state_hold
Message-ID: <202404121233.J2v2Jr6C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   145e80df1ac4e2380f8753660781bdc2c3350206
commit: 5f3dc7a7063de124afcb40cbee6150ee7f0078c2 [529/552] memory-provider: dmabuf devmem memory provider
config: i386-defconfig (https://download.01.org/0day-ci/archive/20240412/202404121233.J2v2Jr6C-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404121233.J2v2Jr6C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404121233.J2v2Jr6C-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __tracepoint_page_pool_state_hold
   >>> referenced by devmem.c
   >>>               net/core/devmem.o:(mp_dmabuf_devmem_alloc_pages) in archive vmlinux.a
   >>> referenced by devmem.c
   >>>               net/core/devmem.o:(__jump_table+0x8) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __SCT__tp_func_page_pool_state_hold
   >>> referenced by devmem.c
   >>>               net/core/devmem.o:(mp_dmabuf_devmem_alloc_pages) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
