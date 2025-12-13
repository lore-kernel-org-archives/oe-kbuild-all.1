Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641302DFA5B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 17:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765645989; cv=none; b=I0K+yqfgbwC1PNDhxuOiAWUbPaw7z8HhYxbTtYmDFAjzBafFQEoPYMO9rhMB94cN5X46r/i/F2eHTLilrlz11Snum0S61KCnYsJ2AnAQyviB/91hW8hQWQYE+BE0hQNERlqLvFMs8rTsVJLAVAfNID9rF8pB1KqRvRDjpvLNrus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765645989; c=relaxed/simple;
	bh=CbwC38lqlu8O6+6/AmAdypPyslMDgxBejV1p2e5+d8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ap63ME82Gazsv8dF1Q292izCr07/R5NQwyW3LHzer/PFk8OsK6LrBQd/Q73jaudoSCkAPjkUQvS4e1cEDT5EbGI1K5ZhT6Gh09QPd7MVp3QdjyTomU+c4W5iC201gUkHtf1aCnJuZlzTCBXSqWmqsJiU/EC+7RLLDzF5wTu+Ofk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLNtXO2f; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLNtXO2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765645988; x=1797181988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CbwC38lqlu8O6+6/AmAdypPyslMDgxBejV1p2e5+d8k=;
  b=cLNtXO2fAAO3QlbjHrvoxlLLBEEpyg/wi+yUZfAs1ddeHsaRf94XdXxu
   zVo8sSuz616/apgb8zunFKoHURZtakoqJnL/R0U3trXQpwYzk6ytX1bWa
   theyH98eOgxPYhcpXNCAYWeILLW+adiLMf2jy+Hm/Fyr9y9kAcvvBNEg1
   v2lolQaUYq8Aie3GNyXTY2yDbu01vdigG02b5v5YbbLbyJ+ndI6XhCL1g
   ffEhOg0uTuWa33KnQw2ut2jHYkYbYjVjYj9g0dc8AS/ZsEwAGvNIO1V7D
   uHF1v9f1zKoy4F3IDCSoaB2XjTXvY91TAwZhl9cKWy8a3+3YP/SqD4m5j
   Q==;
X-CSE-ConnectionGUID: Qxj4rSFVTLaxnQF6tQ9BJQ==
X-CSE-MsgGUID: 2Tm9fVSlQEO/bwupYCxImw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78256668"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="78256668"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 09:13:08 -0800
X-CSE-ConnectionGUID: 7JSF3OX3S5CaFr3YrmWKhw==
X-CSE-MsgGUID: qKh4tJYASZSVAkgG69dAMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196622761"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 09:13:07 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUTB1-000000007yJ-3Ycm;
	Sat, 13 Dec 2025 17:13:03 +0000
Date: Sun, 14 Dec 2025 01:12:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dave Airlie <airlied@redhat.com>, Timur Tabi <ttabi@nvidia.com>
Subject: drivers/gpu/drm/nouveau/nvif/chanc36f.c:36:9: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202512140137.EYqILJ1z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 862450a85b85a3e88e9065c9d2421f3ef17d054c drm/nouveau/gf100-: track chan progress with non-WFI semaphore release
date:   7 months ago
config: powerpc-randconfig-r121-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140137.EYqILJ1z-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140137.EYqILJ1z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140137.EYqILJ1z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvif/chanc36f.c:36:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvif/chanc36f.c:36:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvif/chanc36f.c:36:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvif/chanc36f.c:36:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvif/chanc36f.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvif/chanc36f.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +36 drivers/gpu/drm/nouveau/nvif/chanc36f.c

    25	
    26	static int
    27	nvif_chanc36f_sem_release(struct nvif_chan *chan, u64 addr, u32 data)
    28	{
    29		struct nvif_push *push = &chan->push;
    30		int ret;
    31	
    32		ret = PUSH_WAIT(push, NVIF_CHANC36F_SEM_RELEASE_SIZE);
    33		if (ret)
    34			return ret;
    35	
  > 36		PUSH_MTHD(push, NVC36F, SEM_ADDR_LO, lower_32_bits(addr),
    37	
    38					SEM_ADDR_HI, upper_32_bits(addr),
    39	
    40					SEM_PAYLOAD_LO, data);
    41	
    42		PUSH_MTHD(push, NVC36F, SEM_EXECUTE,
    43			  NVDEF(NVC36F, SEM_EXECUTE, OPERATION, RELEASE) |
    44			  NVDEF(NVC36F, SEM_EXECUTE, RELEASE_WFI, DIS) |
    45			  NVDEF(NVC36F, SEM_EXECUTE, PAYLOAD_SIZE, 32BIT) |
    46			  NVDEF(NVC36F, SEM_EXECUTE, RELEASE_TIMESTAMP, DIS));
    47	
    48		return 0;
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
