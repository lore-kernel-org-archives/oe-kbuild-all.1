Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D7B4C7C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 02:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717121663; cv=none; b=eMQ53FeoHxI4mHHv6wHyFMtSxHTdH5Gff0cT9BICFnhEjCPadApujNTJlRaVUhtH6ebwNI8ypE8NmtZ01lUQMo02Jp+s5YEwn27c04I/9Elab9e4n0DSEh6ZP3VkiH5dR7J8jRIYVBmiWvXq0iSOImRITw/vFjqRcC22CS6c87Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717121663; c=relaxed/simple;
	bh=kt9NoaJEjSYsMazAc7t78FsmcqIFzLhjYQO6/PgEdkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e1riNbGiJPfcBoX1CdfDXVfT7gYqgmhaZ8t+EqziqzQQPwjhebj8Iu/x9Hr2+G44CDnRPaOBvtEeV3v7d1SQsKoQROk/zThrNWkEy+KCy3FVgShGUnZz4dkRWZYukdrDFIOhK7w7SBh/VanzLvef5Dw9093NaGmXulfsm1xNH1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtRLq3xn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtRLq3xn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717121663; x=1748657663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kt9NoaJEjSYsMazAc7t78FsmcqIFzLhjYQO6/PgEdkY=;
  b=YtRLq3xn3sfT3lUa9wv0LYqTEveV6CvHkb33oHsCOVFNj9VqIZhbegD3
   UhaHi30ltO68d0E4w2fu4K9GmJmPTHZoAiRZCPOWDLJJ+O8e8cR9HvVSO
   kD7q5o5SqvyNNtnnIr84IMvYVkVCZ1L8jfTU/RktMFTxzj+ykOrMfB3ux
   z72wy5KBXww1b5HSWw/fEk5YAU7RT58mRhY56rTW55vIF5X7+2CfwYI0p
   c2eANeI5Fs0RVC+LOgo6w3fwjPPe2O0B/WSKZHhjHywO0tU0H7jMDLJtt
   ul2A+81f/GXpKNOf1bfXj2yyRGgkT8+1NU9DQy25azOgf0brV3hbVP5jQ
   Q==;
X-CSE-ConnectionGUID: Hp7vj9ooSo++ETTbaTFRnQ==
X-CSE-MsgGUID: M4LqRjWmTHKma144quN4bg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17480808"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="17480808"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 19:14:23 -0700
X-CSE-ConnectionGUID: K/BGPYq7QDKP6Ndo90+hmQ==
X-CSE-MsgGUID: 6JraTLxcT2afhAbPChGQjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="40940466"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 30 May 2024 19:14:20 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCrmc-000GOJ-08;
	Fri, 31 May 2024 02:14:18 +0000
Date: Fri, 31 May 2024 10:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9622/9794]
 arch/x86/kernel/zhaoxin_kh40000.c:35:15: sparse: sparse: symbol
 'zhaoxin_patch_code' was not declared. Should it be static?
Message-ID: <202405311007.oNegiICq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   147f67b8431ec3c45060ee19e8458bec4354b6b8
commit: 4332dbb07181359cccca3ba757ef54e434fb1296 [9622/9794] Add kh40000_direct_dma_ops for KH-40000 platform
config: x86_64-randconfig-123-20240531 (https://download.01.org/0day-ci/archive/20240531/202405311007.oNegiICq-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311007.oNegiICq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311007.oNegiICq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/zhaoxin_kh40000.c:35:15: sparse: sparse: symbol 'zhaoxin_patch_code' was not declared. Should it be static?

vim +/zhaoxin_patch_code +35 arch/x86/kernel/zhaoxin_kh40000.c

    34	
  > 35	unsigned long zhaoxin_patch_code = ZHAOXIN_PATCH_CODE_DEFAULT;
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
