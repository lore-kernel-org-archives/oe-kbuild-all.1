Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E5B335086
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 07:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954825; cv=none; b=ZR///LL0U4qmu+ItE66YzKWx9dZ9O6m36JXwakx80rwmYHkvbKNSSZi056JRggKhVBFpDE9KJoFOi3V8kI37xL0jySiX/7D3P0cH70JnCOBTUE18zlzd/r3rL54+L7YskOEmstjzDVzArRYv+DrK3W5MEhx8+Wv1yr03aZNMQhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954825; c=relaxed/simple;
	bh=ixiCHs68OVhN8Mw3P9mN6bITLbPSuK8Cd4sCrT7YrMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dFVGqGnTktFoaR7KirELgujTnJoKKO3lG8zl5YJvlrv+XN/mgN448Jsz49qmCyXoXtSKe5blhsflAENPVxcg26MDIo06EbmtvdEsxOCP1JtzjASGdRzG0KRg8hasctIuM+CLkfyX0V08c1UTnC47ECnnTQYcFOWH93aON/LSLhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uqg2fEgy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uqg2fEgy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765954817; x=1797490817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ixiCHs68OVhN8Mw3P9mN6bITLbPSuK8Cd4sCrT7YrMs=;
  b=Uqg2fEgy37UaQDEjUIcQkSB3igT/J7tRKtMq30TrfXVrcCZhEe2z/pjO
   sh5tXE5QZ0bkmU2QEbdu6++6sqzdyj8dvnAfktiXfXvgQRSv10fZRV2Pu
   XEn/tV60trBv3lVbJRlmwOrHLqdtGF0/Y2G+Jbflu4Ly0qmZDHeXv0mdO
   lp4+pg5kYpu8+e9RNdP0zHhloxDjtd6BEQ2NaNV0Wctxz0/OQgpdIuSwe
   jVcghRD3uZS+P5+R3/P5oes4FwT9k1Xe9PM8Wl65nue3xZf+d6B5nlCNM
   AvlEG3BPENudKtbLPnpq9Y7Jhq6awEyoXFFgTYPUMKGLvxlavbzGm6K1I
   A==;
X-CSE-ConnectionGUID: SI9H/MdMTbKDMunGLflBYg==
X-CSE-MsgGUID: WrOC+pXmQXWERVdi65k3wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71742610"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="71742610"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 23:00:16 -0800
X-CSE-ConnectionGUID: QdMjsLMGTHqCS4eznrVHIQ==
X-CSE-MsgGUID: Y8DU0QR6SASMO+qdL8/Dqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="197978073"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Dec 2025 23:00:15 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVlW8-0000000007Z-1j2f;
	Wed, 17 Dec 2025 07:00:12 +0000
Date: Wed, 17 Dec 2025 14:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sameeksha Sankpal <sameekshasankpal@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 60/60] undefined reference to `envp_init'
Message-ID: <202512171450.PtEMRk88-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   036a67646ce675ebc350c4f60b67578cf9b246dc
commit: 88800d4048f5ffd0dfd05dd82b89affe6b74e55b [60/60] init: mark envp_init as static
config: parisc64-defconfig (https://download.01.org/0day-ci/archive/20251217/202512171450.PtEMRk88-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171450.PtEMRk88-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171450.PtEMRk88-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: init/do_mounts_initrd.o: in function `handle_initrd':
>> (.init.text+0x254): undefined reference to `envp_init'
>> hppa-linux-ld: (.init.text+0x258): undefined reference to `envp_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
