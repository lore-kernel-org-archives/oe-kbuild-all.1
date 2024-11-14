Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0295EEAD0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Nov 2024 06:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731653182; cv=none; b=AzJwKQar9dcZMD9YlaTMRBFZmXJZPUvRBWZtc5wwVDIS/AR2qXG8rbb5SxN2rWybW6TfWICvF0y5HX0HAAsUGrYtz9BYNkVIlTXC/icQSHhfbrRcH9z2hnwWL+P16JszD2FOhFiaSru9og5P4ZXZIfx8IO2JXAP74+NIZu/95ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731653182; c=relaxed/simple;
	bh=IY1tZ8nvV2U5GgSy3E0dDCNvs7sCe/1agHrt7fdNyAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gqNb+LH0VBLOE+kmvSjhHI9wHK6+Tdu761k7QrNIfywrMcyhU/QJNh2onXY25RkPr6sdqgN0zwXYpa7bAnoelc7aXunLNK8/GAvHR/FJjwrWIlE37/Jxdj2bFWR7j/n+yN6/zfinzCqpY7f94sUIxXoHNZ0ouuEsFh60Pry7Je0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lt9CQhmu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lt9CQhmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731653180; x=1763189180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IY1tZ8nvV2U5GgSy3E0dDCNvs7sCe/1agHrt7fdNyAQ=;
  b=lt9CQhmuR6c3xyL3Hpd4fmhbb7wxsNuso73tbh9Roo1s2y/Sen7db3Ld
   Secy3eKy9SsTciw/Ce8VU3y4wHgENB82wIiPph614pAucknnjrFvTv2l2
   TLgSaKwOXSNQiSJMX49RvWa5aC5cuORvn6fZ0FhesvhPC8IrgCbvY+S4S
   tVlW6icQRQlhVrmDn5UrgFfGdUXTPQU7LtUKFFkiintTnXqrQtTdSkvzh
   Gyi9Jbv0bLAIjhzoj4GecWoMYQVu5NO47kcyYSDHYSAB+Aj+g0zbz7IWJ
   3+X6QTbgE2OKxyNFQ/joWbm9I0fhn/fqlsiOFFffoF6ltPabG24Jy9678
   A==;
X-CSE-ConnectionGUID: EaVG+aJvTUu5oRcXS9Xezg==
X-CSE-MsgGUID: 0whJ3t0PTNilkVuELBT4Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31584357"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; 
   d="scan'208";a="31584357"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 14:12:29 -0800
X-CSE-ConnectionGUID: CYkycrCJTgaYuNXmEw+70g==
X-CSE-MsgGUID: JtWGEoJSRCmTFjlC2E/KTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="119271515"
Received: from lkp-server02.sh.intel.com (HELO f5eddd9a323a) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 14 Nov 2024 14:12:27 -0800
Received: from kbuild by f5eddd9a323a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBi3B-000045-0y;
	Thu, 14 Nov 2024 22:11:14 +0000
Date: Fri, 15 Nov 2024 06:10:18 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:io-uring-bpf/v1 2/3] io_uring/bpf.h:38:1: warning: no
 return statement in function returning non-void
Message-ID: <202411150647.YcXkuiUU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux io-uring-bpf/v1
head:   e4c5bc9551109bef91c53be43a4296f3d317f19a
commit: cffec449e9f6a37b0701f2a8fdd37688db25be55 [2/3] io_uring/bpf: allow to register and run BPF programs
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241115/202411150647.YcXkuiUU-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241115/202411150647.YcXkuiUU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411150647.YcXkuiUU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:107:
   io_uring/bpf.h: In function 'io_run_bpf':
>> io_uring/bpf.h:38:1: warning: no return statement in function returning non-void [-Wreturn-type]
      38 | }
         | ^


vim +38 io_uring/bpf.h

    25	
    26	#else
    27	static inline int io_register_bpf(struct io_ring_ctx *ctx, void __user *arg,
    28					  unsigned int nr_args)
    29	{
    30		return -EOPNOTSUPP;
    31	}
    32	static inline int io_unregister_bpf(struct io_ring_ctx *ctx)
    33	{
    34		return -EOPNOTSUPP;
    35	}
    36	static inline int io_run_bpf(struct io_ring_ctx *ctx)
    37	{
  > 38	}
    39	#endif
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
