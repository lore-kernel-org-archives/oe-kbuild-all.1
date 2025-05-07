Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD8B211A05
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 10:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613592; cv=none; b=V33To6eHlXX1KtCAObm7zklHhAYQirIpUt0Q6c+v5VABx/fxzXOlNS6/5QRAIqpncn/tCwHYSJGjJzBh7WIrb44cf/Dj3EGqLeBNwssPvjm55B4hAG2Xxedd9Ba92XK58TfvSFVSuZGw5+NDQRirjZom8VIDdyAVHUVeoEZtYAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613592; c=relaxed/simple;
	bh=E54rAglGCy4vkPBXB2wvFZ5jfbG9okbnssuynJMwwXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VvaNIUBROaHONhrFfcihg+Q3xccN6UMVawKbcuWc9698jPYjoOE/3fxDcrobIaKUc1BnagqmaTdT1Qu0JBwkk7ITVpimibdBw3og4HwSdKzkrBEbRjP9/qbgrmNJcRlfb4mLTAgJT3iwKMYlckPnOlQVdYN9Z4ezP+kAMSTSKIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LvIRc/Ok; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LvIRc/Ok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746613591; x=1778149591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E54rAglGCy4vkPBXB2wvFZ5jfbG9okbnssuynJMwwXM=;
  b=LvIRc/OkTY/jvVuZyfEXMwF0cN9b5/bCm59FRoDvYSkKhfWjQYYQnlEN
   nwZKypsR/qdOcQPU8vLP9MO8PjTg3XSHZpZhxMxLpoBIp/T58222ZY1cu
   xbcXdbAyqJj7GNDYiY/BbQoNWlXX03lBkxu0viyJZ0aUBNh/wcnbQwkYg
   puqdk3UILhHOIScmvouz8VxxwU58yBrEhlY6k6JYn+aghooLkqova8Pi3
   53EL8QlHNfRfa5TtO9Xrx05MmSfiCjAan+Ly8wAfvvCSUo7s4F0cplQJN
   /CUMi52IZqszOCrQwE/qd4DJprvCenGCgl8H2h1v/qr5cT7xmv7ySZ8JR
   w==;
X-CSE-ConnectionGUID: qS/hakThTOymqw110ugGfg==
X-CSE-MsgGUID: gCiad7lQTO2uyTShdwxbdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48484142"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48484142"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:26:14 -0700
X-CSE-ConnectionGUID: Jsu6UzWoTQ25gM7FuWRq8g==
X-CSE-MsgGUID: pbxLQdP0SnK5coDfI5/HQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135819765"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2025 03:26:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCbyc-0007bA-2r;
	Wed, 07 May 2025 10:26:10 +0000
Date: Wed, 7 May 2025 18:25:14 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Subject: [ebiggers:sha256-lib-v4 4/13] /tmp/ccoCWqTC.s: Error: local label
 `"3" (instance number 1 of a fb label)' is not defined
Message-ID: <202505071811.yYpLUbav-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha256-lib-v4
head:   849682242c36727c23430b6cfed12e4422313931
commit: 9f2dd94847c914bb716be744e12cb02f175638db [4/13] crypto: arm64/sha256 - implement library instead of shash
config: arm64-randconfig-003-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071811.yYpLUbav-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071811.yYpLUbav-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071811.yYpLUbav-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccoCWqTC.s: Assembler messages:
>> /tmp/ccoCWqTC.s: Error: local label `"3" (instance number 1 of a fb label)' is not defined

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
