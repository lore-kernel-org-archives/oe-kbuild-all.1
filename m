Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D09438B133
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 01:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520488; cv=none; b=KnpFp1zu8qeUBrFklDd/qv91+Bj/W9jGvpSqrTQxJOfFQa109/46ErQMCuOwVg9hEzRkGesveaAQtqJczh6Kcdym/wpzz1b58UPhxaU08z/VInDviOr3v1bNoodTYSUxy3MmKnM/+N9LDRswHz+ulufqEBlkcGhW+Tn4pORutYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520488; c=relaxed/simple;
	bh=5qzPsIPai01QJppkqExygLq3O7RMIHSoGXttUqHL5X0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rb64pxh3dlBp/lQMICMfb5vbmPjbftUJRrA2aFH3IVf2C1Fhx9/m9O7IFjHtwCzk0aks4VGEwP3s+PvDtiAZ5otr8hHnQAMV1rYnPrNVcoQuOamlP/55yHdU1iWfu/j/5RD3mTQ5U1iO0DBvatcGX87PclBD2Za1RmuIhozP5k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCoX2wF9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCoX2wF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789520487; x=1821056487;
  h=date:from:to:cc:subject:message-id;
  bh=5qzPsIPai01QJppkqExygLq3O7RMIHSoGXttUqHL5X0=;
  b=KCoX2wF9NzH2CrXwHmLMXoZarY5zj0xYBwfGMUcrYLtwm7jl0q/w0cus
   m1l4mQHLuQrU7VsRVa/6fzCgEN0vYn7WbWuc+ra2VEMwlabY/gS7+o3LY
   8JWgVBMU/CbIYTyzbCmAqHKnFsaHyziFTvttDhsf9QOkyy+MnJYgEzWen
   VXXZEYtxtCd97eD4YTQPPwk8HsHXmK4D/JD2Imj6uUuPnD68Zw+HHrmCy
   Bpx3scK35oxtl9KXt4tEvInLql7XjW+LVw+4/ekY9eBJHfAAOAzOX9kYb
   JCDU1QtECUqfGZQqogxRQjbcjc8bYlZCUXpEMJrB3grzh3jLL0atvE4Ai
   g==;
X-CSE-ConnectionGUID: PwrrwBYeS9meqvuRXXJGiw==
X-CSE-MsgGUID: qEHNndveRVSWPnxcB+wuDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107263247"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107263247"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 18:01:27 -0700
X-CSE-ConnectionGUID: cy6/DoWiTGy2TL3D7eUPCg==
X-CSE-MsgGUID: wUVJt+GURQq6pSGxbWreMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="275135975"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Sep 2026 18:01:25 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6e1b-000000005Gn-0WfI;
	Wed, 16 Sep 2026 01:01:23 +0000
Date: Wed, 16 Sep 2026 09:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 1108/1155] fs/bcachefs/btree/cache.c:26:6:
 sparse: sparse: symbol 'bch2_mm_avoid_compaction' was not declared. Should it
 be static?
Message-ID: <202609160801.XnPCWp3l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 090d4a4b1567ae743f1342c976b449d104c53a6f [1108/1155] bcachefs: Avoid waiting on compaction when allocating btree node bufs
config: openrisc-randconfig-r112-20260915 (https://download.01.org/0day-ci/archive/20260916/202609160801.XnPCWp3l-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160801.XnPCWp3l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160801.XnPCWp3l-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree/cache.c:26:6: sparse: sparse: symbol 'bch2_mm_avoid_compaction' was not declared. Should it be static?

vim +/bch2_mm_avoid_compaction +26 fs/bcachefs/btree/cache.c

    25	
  > 26	bool bch2_mm_avoid_compaction = true;
    27	module_param_named(mm_avoid_compaction, bch2_mm_avoid_compaction, bool, 0644);
    28	MODULE_PARM_DESC(force_read_device, "");
    29	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
