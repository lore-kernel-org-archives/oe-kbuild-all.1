Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F81412CD84
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 17:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706722297; cv=none; b=Md7OpYbg36zxQsvRwOyjv2iz5zN9Gd9Qr6eKnM54SbtCzx7JTyv6Kqh2ACx1yiHMeFxwn7mAXPwhkzjPtXplJlC91NGSiBoqB0GOnrKlGwWkXKt9K9uApxIC6jifIG1Nq/YXuX0eEA/RTD30ZeNEEXDmgYo43beBZoQb32Oy32A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706722297; c=relaxed/simple;
	bh=W1XH3ImoA3/lo5yiQNHZi9oZAwylgh9acpLEJ+868kA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c4cvWSjZ61n/EDzGZvc++jZF1TJT4nLMT7Dw7Kja/NnxL1Amv2wsJQCQkAwFz/OredUR4V0d64G3xAeCdahGC8A9r1xA5I1Ow8EpN6/FpJ+z2a4bgOTFRnQ852Zx/TAz5xZ8Ig3kwbC3bjW+X5tAG0+ewNwXPnSAv9FOVhIxjXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBXVjhah; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBXVjhah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706722295; x=1738258295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W1XH3ImoA3/lo5yiQNHZi9oZAwylgh9acpLEJ+868kA=;
  b=PBXVjhahfku1a5LQT6c8nLtYkfm9UuEf0Ts4/sdjSOxxvf+wY7hSyIvp
   KAJgAaISL8IndNkNf+vE4y334n13ONmEBFm6Z0ExutQRlypaweeLNNjGG
   3Sbj7wK+M4KlAehJwgydmWNYT5GR8N+UQ9zOcYBTFJODGEYgIexRrZiVF
   JLwH6+PhD4Gl/u6TXCzrh/HTvWpnZdDqezirdLu/kvil4BDYy3PiZqZql
   o+/em/Uhyikxb11ZwOwbyxCj9QqTToI/P41stEhB5e+OGEMJxM6cy2ssC
   nTeJ9Pn8wMZdbI4rFF8pc8jAs1Hj09A8dcVhuHUcv6FfjwFM9wO6K7kx4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="400805096"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="400805096"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 09:31:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="738170927"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="738170927"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 31 Jan 2024 09:31:32 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVEQs-0001pu-2I;
	Wed, 31 Jan 2024 17:31:30 +0000
Date: Thu, 1 Feb 2024 01:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2855/2894] make[5]: *** No rule to make target
 'arch/x86/crypto/sm4-zhaoxin-gmi.o', needed by 'arch/x86/crypto/built-in.a'.
Message-ID: <202402010116.2hQEcT2i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f6f9abf1a5ef2fc559630c77b3570346dcd19d40
commit: 3b77535a6245966041634eaabc6fe013f20688d8 [2855/2894] Add support for Zhaoxin GMI SM4 Block Cipher algorithm
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240201/202402010116.2hQEcT2i-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402010116.2hQEcT2i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402010116.2hQEcT2i-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[5]: *** No rule to make target 'arch/x86/crypto/sm3-zhaoxin-gmi.o', needed by 'arch/x86/crypto/built-in.a'.
>> make[5]: *** No rule to make target 'arch/x86/crypto/sm4-zhaoxin-gmi.o', needed by 'arch/x86/crypto/built-in.a'.
   make[5]: Target 'arch/x86/crypto/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
