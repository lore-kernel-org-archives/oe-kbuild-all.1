Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EC321770B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748509317; cv=none; b=DH1xISAB/mQpH6WdFms7qFh/zq5uRw1D4qBoZeywQRjDcVEdrGY8Cp5AXBc0pzWV0B23L+KJYBCd3tY/IdCWykxYY3QVDafdZbPQiySF/1h1rnH5/lZ+ufmx9bV068t7/U9ePX5qzgq2C//zRUf6UZ6vSDwed43oVI3lg3dD+3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748509317; c=relaxed/simple;
	bh=uDyFhHrJMQ3DA75C8NhvmC8nT5htnOC/HW4+jrk8ycU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fgZc2oaetT93RodR766v7Qqot985LPGgcakbv5jLtjIadBAPgogp3kYanff6xYEb3VSeGyC9WcBxaCIrldze0vYlqndv19fzHR3WX0CDOOHthzvzRT30NgEnmykFw6bI0E5doKokCJfvTNflD7l0QL8azAtykcWy0ZrId9Y6Ano=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CU7WNWhR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CU7WNWhR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748509315; x=1780045315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uDyFhHrJMQ3DA75C8NhvmC8nT5htnOC/HW4+jrk8ycU=;
  b=CU7WNWhRSuJVVzguMGh+jwTzM9aXLijSsK9di1rfGLBX2HNDgKMnqTE1
   5dkgqwSTkRJPGO8RxeRGoAkKCo1U3vBtyANfE8FQ/gHJWFTP34/61BMLN
   I7LKGyd51rGa51Pf587fC8icRwNPEwdRj0QQQTXQqFn5PAyLGxlMwBklG
   oKWP5pOkgEEeInOk7R1co8yIkAKnc3rMvy9sgYo1brWELqUV2UlsPP6MG
   KV2kf8Xk7LlF3sNbMPFCvdxPFtjFsrEGwKln/vrUyH8ulBK83woLf658z
   q8BWtUcWzkwVx4vsCcqWcpqk7TtmJ1RVEa++Sz7Z9GNTDb57oewN/ytwl
   w==;
X-CSE-ConnectionGUID: dOd5SEBzSmKU9A3pII8WRQ==
X-CSE-MsgGUID: q32uCTABSxCNdPXWeDr4gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50259822"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="50259822"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 02:01:54 -0700
X-CSE-ConnectionGUID: DKqkQhCCRVKEQJP21n79NQ==
X-CSE-MsgGUID: Eky3ZLaIQ9KoZ7qVyNqzaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="143836185"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2025 02:01:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKZ92-000WVi-2G;
	Thu, 29 May 2025 09:01:48 +0000
Date: Thu, 29 May 2025 17:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2331/2331]
 drivers/crypto/ccp/hygon/vpsp.c:588:10: sparse: sparse: symbol
 'allow_default_vid' was not declared. Should it be static?
Message-ID: <202505291615.pbSUmoIC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d6c09e6ce9d7651c2136ae254cbc3c9845fd0317
commit: e2861aaa47961017ada7f66de11104bbf3b85eb1 [2331/2331] crypto: ccp: move vpsp-related functions to vpsp.c
config: x86_64-randconfig-121-20250529 (https://download.01.org/0day-ci/archive/20250529/202505291615.pbSUmoIC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505291615.pbSUmoIC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505291615.pbSUmoIC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/crypto/ccp/hygon/vpsp.c:72:1: sparse: sparse: symbol 'g_hbuf_wrap' was not declared. Should it be static?
   drivers/crypto/ccp/hygon/vpsp.c:559:1: sparse: sparse: symbol 'vpsp_rwlock' was not declared. Should it be static?
>> drivers/crypto/ccp/hygon/vpsp.c:588:10: sparse: sparse: symbol 'allow_default_vid' was not declared. Should it be static?
>> drivers/crypto/ccp/hygon/vpsp.c:589:6: sparse: sparse: symbol 'vpsp_set_default_vid_permission' was not declared. Should it be static?

vim +/allow_default_vid +588 drivers/crypto/ccp/hygon/vpsp.c

   582	
   583	/**
   584	 * When 'allow_default_vid' is set to 1,
   585	 * QEMU is allowed to use 'vid 0' by default
   586	 * in the absence of a valid 'vid' setting.
   587	 */
 > 588	uint32_t allow_default_vid = 1;
 > 589	void vpsp_set_default_vid_permission(uint32_t is_allow)
   590	{
   591		allow_default_vid = is_allow;
   592	}
   593	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
