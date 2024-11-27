Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9C0194125
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 16:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732725765; cv=none; b=QjawH8iAms7r/WwDly5ErcZAtTwj5r0CrqkmVIF6WRghfMfsxkPzUcOlsY1V9Lf8F+6f2Oj8F4HfeYDINf7Tb/wX13dG63bRwgb1m5kHlGY051kt1Kk42xs9Bw0vwH7/iUJxjYROZkBh4s9PGMOUsJnIF7Kt0fsmv/6Jg59amZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732725765; c=relaxed/simple;
	bh=jXdfwwAFly08WVa4qoIx5YljFJzA0u4Djulrm6E0kCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fCq3CRUffFP7QZNkvqV1f5PdFKrUyX5HP+MJap6/mDJY1wv/4+YU9bUvixNQN4dfK9xCcn504taE0EgB+MeNeFwaccaWDjU0DHl1qUjX7PjrBRaBvwhkrNxlLrgFZSuwUzPbL4QhH5elK8oVzPm38mL3QNAET34J/Fx1tEvs/4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6Qx+0C/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6Qx+0C/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732725763; x=1764261763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jXdfwwAFly08WVa4qoIx5YljFJzA0u4Djulrm6E0kCg=;
  b=i6Qx+0C/oYW1L3VooYLBEpjbRz0jd9xKE/p723z4FxfNUGW66SucnnDV
   CPyLxHiRHXe3ZosJZVH/vXsPHwkkmmKN2Jc0Fng6d7ZjsBA/D+rytWrkO
   vB1hpD/UHARnZ+gQdCqHaNDGZ9sTSnns8nSqHjOU5ng8Ss+kBR0/mB3yS
   f9VC011brrb2a+vqbF+PaREma4OOg7byDgSTqaSnMMOZcJ68oyq9Z0JG9
   dY1oav60i1bAdMqAhD2Y1kZytDyMPLYnkYEd+tjSJNBNLg5ijoC42RaUc
   YLOF5FBx3xxdI12dTZNS9l34AYvNFBijxKHR+SYl7gCPcxOR2+ul1Yb5y
   Q==;
X-CSE-ConnectionGUID: lInMd7h2QZWNf1oAtkIgFw==
X-CSE-MsgGUID: uPXIaJJhSV6SvgPtYX94TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="55437437"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="55437437"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 08:42:42 -0800
X-CSE-ConnectionGUID: Ln1FZwUGTxWDwMEq4y4zAQ==
X-CSE-MsgGUID: PsZp0iIrRQufOv6vkl/4Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="92462618"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Nov 2024 08:42:41 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGL7e-00089h-37;
	Wed, 27 Nov 2024 16:42:38 +0000
Date: Thu, 28 Nov 2024 00:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1308/1308] mm/.tmp_mmu_gather.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202411280047.QubAoPvR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4f763890ac28e4d36527b22a830c5e95cae55470
commit: 1f7b24152a85bec4ea4f5a6219b4702853ffd3e6 [1308/1308] mm/memory: Move mmu_gather and TLB invalidation code into its own file
config: x86_64-buildonly-randconfig-002-20241126 (https://download.01.org/0day-ci/archive/20241128/202411280047.QubAoPvR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280047.QubAoPvR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280047.QubAoPvR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/mmu_gather.c:6:
   include/linux/pagemap.h:401:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     401 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> mm/.tmp_mmu_gather.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
