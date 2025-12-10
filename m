Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5847C21C16A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 04:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765342041; cv=none; b=awyKpQkbxYEw/ReBlVoafPDkogBfEq+cjuuRc2CHzKYAtqLqBd3mweNFcUC27pgFiyWQu1Bk8D+cn+BKvCkAgHtU+jBjfMpK5WESWEtpOEL2ZQlmitEsCsIgNUBTPx6uqdgnkWx6wLJaOVSLmqYX5Vvn2v9vPCuj2JJWiZnY8Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765342041; c=relaxed/simple;
	bh=t17See3zeO7wLqDbjtstgmERhJfDwrBr2Wn6gUM1DP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kNzK+gBYaHqF835mxuMkDg9qkarWALRokmGoFsKI66x3NyY7HFj7aBkAyoBSSAbdlp7YYC+LR9J7nkc7jUTC3fYhTFN0X+Q4DC+dNAQJP/m49xJb3pVXhzPCrWySCGG5dQJfZDMxbxzOmGfhDtdgeTpcm7VPRZExDFc3O2fhhVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+iRVqoR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+iRVqoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765342041; x=1796878041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t17See3zeO7wLqDbjtstgmERhJfDwrBr2Wn6gUM1DP0=;
  b=R+iRVqoR4k8kkR6NH4Skd/76yLhOf1KLYSc3ZXllScPsOwi5KMufEcur
   IG8LZQ+sQ1kGme6WOHyp+zG/JiFNzUJ4OBc43wK+LdRFAan37hItjDHN2
   IokBpzoyVHOhmKfvJ26OgY7ieXEkNtOt2RYq/blsHFuIvOrShriHeaYA1
   n2VeDu8YiurpD58fj8prN8OcXHdCMrrdFn63OFRBX6oQ+e1BksL/LyzGl
   GDqaX1HOTRoO36zkBQiCFfV8BgvWWpUvy6YBzh/rHtxShlxH5ht257CB0
   OExXmzmStewB5nz5yQjdseksq1BafR6Ilh50USXZDMKYmYf0fXIlI8htP
   w==;
X-CSE-ConnectionGUID: yZANiYvxRaamst1wYMk1oA==
X-CSE-MsgGUID: 1ripQvs0TemKoSvXEbKVvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="70927564"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="70927564"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 20:47:20 -0800
X-CSE-ConnectionGUID: 0EJjttR2Sa+2/QVIy6J/kQ==
X-CSE-MsgGUID: YEtOOhjRSW+oKUbowLPdvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="196012399"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 09 Dec 2025 20:47:18 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTC6e-000000000Ue-0xm4;
	Wed, 10 Dec 2025 04:47:16 +0000
Date: Wed, 10 Dec 2025 05:46:35 +0100
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SIFIVE_CCACHE when selected by ERRATA_STARFIVE_JH7100
Message-ID: <202512100509.g6llkMMr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c9b47175e9131118e6f221cc8fb81397d62e7c91
commit: 4d1608d0ab3365d1ef9447bdbc0cb4c0962f1774 cache: Make top level Kconfig menu a boolean dependent on RISCV
date:   3 weeks ago
config: riscv-kismet-CONFIG_SIFIVE_CCACHE-CONFIG_ERRATA_STARFIVE_JH7100-0-0 (https://download.01.org/0day-ci/archive/20251210/202512100509.g6llkMMr-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251210/202512100509.g6llkMMr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100509.g6llkMMr-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SIFIVE_CCACHE when selected by ERRATA_STARFIVE_JH7100
   WARNING: unmet direct dependencies detected for SIFIVE_CCACHE
     Depends on [n]: CACHEMAINT_FOR_DMA [=n] && (ARCH_SIFIVE [=n] || ARCH_STARFIVE [=y])
     Selected by [y]:
     - ERRATA_STARFIVE_JH7100 [=y] && ARCH_STARFIVE [=y] && !DMA_DIRECT_REMAP [=n] && NONPORTABLE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
