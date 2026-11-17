Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898232;
	b=1qAuPKsCttYqghOmahRVuX/5rofOuLYmqQaNLSmTrNkLyd56UDdpoUkZN4Yj8vK6YKoU
	 zoxxRxnhBjOXS6+q32foW2XHsreGFy7Nxj17AXmUCtLa5MvDEi2DbB9/UP5eBWz0moQkE
	 frpDFZCxVB7zS+z0psw8BN4bsc7spMa+cP/0QRNzJo0gqhu6WTcP1iiIkMamDjH5dewQq
	 A+ZRXT2P4RPAfPCISwHEZt9r4nHvTyrvlEDk8Gw+lHppHzGRxDH4ej76Y7H8ZGTC4+/pO
	 7rZqAiViqGLekBF7S29ttSGNVuLfbbBcs6tk7QV8UGE1Id8g/YhKs0LXevvpmplz+AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898232;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=eU0pHaZ3IG0B39heoJBZr50Cg8rsubixTrSJpbDGu/M=;
	b=QDZnI5jmLdxoAIZIsFhHBYiaOTO5VRY8gRaJxAed3Ri38p3Qpub9y79m7jyaydIPe0aJ
	 oc4w0Y1pslPpG5XU34M3OZHxizKvBLtFExNSe8gf3V3SGhSwcf7jDJfFn/ZNHAUZ+4INl
	 bKUxpgntHnZU1yfQ/w2AeKW/yVF8dcTxJEGgrKuzxJfmVyTqy7MICx/r4sb6VW7WehML0
	 ZvvfsmJBK4CfMyf85MtvmmcXeI0ycOVo7aC/NVszY2r9/j6HUvU8D9nhiZuTW8Gzk1CSP
	 BlXWUmcitDs3F5cUQi2hwsLG4lrk+r9kMkGVWYspyXXXnTP/C9kPLwGTH8Imp9KwlmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nPlhEJYe;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D34B606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 06:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D34B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nPlhEJYe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794898232; x=1826434232;
  h=date:from:to:cc:subject:message-id;
  bh=4YF4GBExQUYfXNJstY7DKpePTLaB0uBplq+btaVTmAQ=;
  b=nPlhEJYetHTbpvNNQt/I6Q6fnqbwKDnUW7P+Ya5Hw/bf/ZQVPu1nbOyW
   SAA2rooOZ1hB4knYbqK6sGpxzHC6oD4OK6tZq5VTsELjQoy7wjMMAGa/i
   rOzhRXblcr2bVNJ6q/ES+CWKvkc/wSSYKlLO3+w8JwQdk4mdlwlUhVMIQ
   CQ+OV2/Wgdgp4i4iPUnlAh2H5EWVvvUWIblcPlF0Kyou6jg1uzYOZ+wgv
   6Re1OejtBrouYostAn8Y4BS63TdOhclVXsCZAbF+2wzLatNZXURWlSmbK
   hxxI/WjGEofKuLT9bH+AiCYTjHXTiONS1WhL+XhXHEB7mrph1a3MWdcBO
   g==;
X-CSE-ConnectionGUID: W+U1ALNKS2qAW5ojOLVADQ==
X-CSE-MsgGUID: CG+Rk4ubSMC39AQsIFMyaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3527862"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3527862"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 22:50:31 -0800
X-CSE-ConnectionGUID: JykEogqTS0Cvsc9gsecFuQ==
X-CSE-MsgGUID: gyHUIzJeRjK1o7KWQK/u2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9653593"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2026 22:50:28 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTD1O-0000000030I-0CUa;
	Tue, 17 Nov 2026 06:50:26 +0000
Date: Tue, 17 Nov 2026 07:49:28 +0100
From: kernel test robot <lkp@intel.com>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>
Subject: [linux-next:master 7081/7459]
 arch/arm64/boot/dts/exynos/exynos8855-smdk.dtb: /soc@0/syscon@15420000:
 failed to match any schema with compatible:
 ['samsung,exynos8855-peric-sysreg', 'syscon']
Message-ID: <202611170759.pEwFwUBI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   749a4de370409464cf8501ec5b2451df45c84eb4
commit: 14a87bfb0614d87b04134156e090d7b00590d2b2 [7081/7459] arm64: dts: exynos8855: add cmu_top & cmu_peric clock DT nodes
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261117/202611170759.pEwFwUBI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev6+ged91b647c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170759.pEwFwUBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170759.pEwFwUBI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynos8855-smdk.dtb: /soc@0/syscon@15420000: failed to match any schema with compatible: ['samsung,exynos8855-peric-sysreg', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
