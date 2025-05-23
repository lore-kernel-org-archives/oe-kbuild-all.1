Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD72A2DCBE9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 01:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747962230; cv=none; b=Fs/itsnczv1wmu2M9yZ8uUwmBJqzeRJ2Dzy/QnbkxsdTGYizxDirHscLNaKu5wUxIKBTGkRkEewmrczUkDuS3cZt8Kx13b8x1VhlGTiCPQMO2H1aarbqNZcHHJUj08YcIqZo7R/obGkw0tIE/NtCb3pq4yxbtnAJdH/qfYJ8WVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747962230; c=relaxed/simple;
	bh=Hvd4kL0g8n0jXLbrIm2yy229vozBW7lli9iZDsamzgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSWnU0GaHwBLQSAxdubG8sNrvM2uvlfIp01GCmUgzhhxlF8E2uef35XRnMlfQqLDEifNE9c+2Hxi5x8VAMxnPQQn0brXG5cMUyzGPYdZXeu2yRmbLG/wyXVhMi3E50KPWnsQ/lHSDWsHvUW5PSFfg6MQe7tICwP6J/QGObdrBUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KrFsvGL8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrFsvGL8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747962228; x=1779498228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hvd4kL0g8n0jXLbrIm2yy229vozBW7lli9iZDsamzgU=;
  b=KrFsvGL8OfTBYlW02c3I20DrGkGmEw5CmPY0dY6PIN6bWdSEjjSer9Bs
   pqG8e8Acp/Cgj4gJVCgH0Q75N9C9sDM47f0xlzJ+cq1+wZvbN0uplRtaZ
   lHzxwPj6YyAH65GYOKjK/r5eeRIW1ZCX+pV/b7PwzLDjzYhX0Sf5UdnQ3
   mu+9TWdXY9BCcEQntxpwQAJXUYeryHrzPMS0j14fFaC/dzm1pnBKiMei0
   QDwMJ6UDKSZyOJR0rvz+wHramye5Cg+w1+gaRijURa6orN/W2DJ/COava
   IhUrkVWG9WmXhBKLL6NUf/hJLXXyJSQOXaYeweuBPFlzzdTWD99wUH1w0
   Q==;
X-CSE-ConnectionGUID: W64NBGl3QpORPdmlMiBg8Q==
X-CSE-MsgGUID: Fy597QdcT0uU+dhPNE7auA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49907314"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="49907314"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 18:03:47 -0700
X-CSE-ConnectionGUID: tB4Py6rbQnubhQDJXcjjWQ==
X-CSE-MsgGUID: XiOvSAdAS9uoYS6J9gQlKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="164107529"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 May 2025 18:03:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIGp6-000Ppo-18;
	Fri, 23 May 2025 01:03:44 +0000
Date: Fri, 23 May 2025 09:03:35 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 8/8] Revert "crypto: lib/sha256 - Add helpers for
 block-based shash"
Message-ID: <202505230853.iID5luyA-lkp@intel.com>
References: <20250517022428.401622-9-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517022428.401622-9-ebiggers@kernel.org>

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1bafd82d9a40cf09c6c40f1c09cc35b7050b1a9f]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Biggers/Revert-crypto-sha256-Use-the-partial-block-API/20250517-102818
base:   1bafd82d9a40cf09c6c40f1c09cc35b7050b1a9f
patch link:    https://lore.kernel.org/r/20250517022428.401622-9-ebiggers%40kernel.org
patch subject: [PATCH 8/8] Revert "crypto: lib/sha256 - Add helpers for block-based shash"
config: arm-s5pv210_defconfig (https://download.01.org/0day-ci/archive/20250523/202505230853.iID5luyA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505230853.iID5luyA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505230853.iID5luyA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: lib/crypto/sha256.o: in function `sha256_blocks':
   lib/crypto/sha256.c:36:(.text+0x84): undefined reference to `sha256_blocks_generic'
>> arm-linux-gnueabi-ld: lib/crypto/sha256.c:36:(.text+0xc4): undefined reference to `sha256_blocks_generic'
   arm-linux-gnueabi-ld: lib/crypto/sha256.c:36:(.text+0x154): undefined reference to `sha256_blocks_generic'
   arm-linux-gnueabi-ld: lib/crypto/sha256.c:36:(.text+0x1ac): undefined reference to `sha256_blocks_generic'
   arm-linux-gnueabi-ld: lib/crypto/sha256.c:36:(.text+0x68c): undefined reference to `sha256_blocks_generic'
   arm-linux-gnueabi-ld: lib/crypto/sha256.o:lib/crypto/sha256.c:36: more undefined references to `sha256_blocks_generic' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
