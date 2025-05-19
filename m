Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC3E27AC2D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663957; cv=none; b=LotsczAsEDCpTYMvsL09cW9y1UeFRCYNgpmwVKY4GzilfSVqL89IcFUkzHYeJQnWiFYAkZ8p9BUkJS/GnNHNH9t/3SKOCkYl4mWg4F4NJVmo0K5BMcqs7U7DwpVI22Dw9rQ1oFyHANejhNNcZVhvGYRQxNOes1fYM2FNdzmzZAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663957; c=relaxed/simple;
	bh=AdaXsaox4CQ/wEuMkwaEzOkPYTabCFS8HkSWCk0YOWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YAf/kB9Igp+T8LvA9AnFQ9/1Yqst7drl5blAzJBtP481sAJB0IidomTI6OBOHfR9VJjWHU8M7Z6On+dJDdRVZvY4eEmPK3wxzz7befZp4cXOsKZFnm2UDu4uS7h5gbhujLBkIU80dINNGMddGvW29C5AOZ1AxfRnwtzMP4Or2QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yne6NFQM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yne6NFQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747663955; x=1779199955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AdaXsaox4CQ/wEuMkwaEzOkPYTabCFS8HkSWCk0YOWU=;
  b=Yne6NFQMl2n0PqwGPjAsazO5WRbRhfmC5+kN3ZtN7cF2mNXH8MAQULga
   DIZyqnechvR626Cz4y2FJDQDBesMWzwHzVSWa1E/QWKHDTBJi2Q1baXVu
   TSj8ZnElLGbnHSljEr4M+TReVPpzf+e3MKf0M/0NuKwv/0UFLWlfgirG9
   KUpqnwCW0P91aI+Z8S2fsshdYDL8xKHWFCqU6gq1hf68qMi4WJkSZLeB/
   80EkZU9bJjHufuSO8Kn+j/zD916ScMQc7tIAZVl0lc8sMngS9AgoDefve
   diUxGWV0WQuOk6J67huVK7GisJ2f5xq9xl+tNxTHZmwS3pTeAvlIHw73g
   Q==;
X-CSE-ConnectionGUID: 9dcxMx+/Rk+2irlMvUIkqA==
X-CSE-MsgGUID: Ien52WAXQj2TO6XXqW1xkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60597821"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="60597821"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 07:12:33 -0700
X-CSE-ConnectionGUID: JOKixLRTQ1259tSIthgJZA==
X-CSE-MsgGUID: 1C54Cl0KTWGG9kCUoPjwbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="176493892"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 May 2025 07:12:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH1ED-000LYk-3A;
	Mon, 19 May 2025 14:12:29 +0000
Date: Mon, 19 May 2025 22:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:fuad-mroth-2M 21/35]
 arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c:323:30: error:
 'GUEST_MEMORY_MAGIC' undeclared
Message-ID: <202505192228.kq45aX5Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git fuad-mroth-2M
head:   e7a0e768b14b70e6723b2800c0d108cf449c534e
commit: f93278c76ec7ae69d137795d16c13c231db0e65f [21/35] KVM: guest_memfd: Make guest mem use guest mem inodes instead of anonymous inodes
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20250519/202505192228.kq45aX5Q-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505192228.kq45aX5Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505192228.kq45aX5Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_init_fs_context':
>> arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c:323:30: error: 'GUEST_MEMORY_MAGIC' undeclared (first use in this function)
     323 |         if (!init_pseudo(fc, GUEST_MEMORY_MAGIC))
         |                              ^~~~~~~~~~~~~~~~~~
   arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c:323:30: note: each undeclared identifier is reported only once for each function it appears in
   arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_create':
   arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c:643:13: error: implicit declaration of function 'kvm_arch_vm_supports_gmem_shared_mem' [-Wimplicit-function-declaration]
     643 |         if (kvm_arch_vm_supports_gmem_shared_mem(kvm))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/GUEST_MEMORY_MAGIC +323 arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c

   318	
   319	static int kvm_gmem_init_fs_context(struct fs_context *fc)
   320	{
   321		struct pseudo_fs_context *ctx;
   322	
 > 323		if (!init_pseudo(fc, GUEST_MEMORY_MAGIC))
   324			return -ENOMEM;
   325	
   326		ctx = fc->fs_private;
   327		ctx->ops = &kvm_gmem_super_operations;
   328	
   329		return 0;
   330	}
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
