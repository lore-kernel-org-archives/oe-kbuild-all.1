Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6FC2222AF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 03:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761102724; cv=none; b=PyONpeO4yyXJvPW0YcvWvTWPL6Gx/0E1/NOeAk3tUeV7FEgcYZmrA/MWtsfHy1R4uWUL4RFIZ8Aww5HbysfYcnH/eTMZbHztGI+AMNfKUpEOND6be/AxRTyNpy5tRLIUvNzg3QKOP+5Tf2JOexMWS62WG34/oZzyQtFQ4kJkWSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761102724; c=relaxed/simple;
	bh=+J9jhXjR0XTwkd8nOF5LctS9PGPiXII7zhAPxga4zPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0v3pOhRXdAM/hzefHIx7Lf4DHuqgFJ43ljpNrA4TJi0I/SOd2WBcowH7YWkIPsP+F3L1FcLs+ev93C2euEwsHxDvAuvqzjJqLayQE2jEK1lThvXjxy0eKP0kJRVFgzpRmYCuAmXuho3t8h65mH/h89pqsTG7e+k92jz9SAIX2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2D70ek5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2D70ek5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761102723; x=1792638723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+J9jhXjR0XTwkd8nOF5LctS9PGPiXII7zhAPxga4zPs=;
  b=h2D70ek54G0zmYU0PbncNg1t79YFqjYKI5wQbMEnWy6HxHSGUbXyiCjB
   h3g8ugtkIG6S1RKbr7ebhUDKWp3zZHH0iwuX8qtFc0zaQHIbIn8TaL7sx
   f9vAlUuj5+LawHgRVhHqyuzeCh7RcYAgePqduYxbCm5YaOOi5Jf6RIuhF
   f4hfcaejteciyvBOWLciAzsqyN5PRSTbOmd/hiJT/hwZN65wnCqhFzeQ/
   0NHNl6mHC8de1h3jsQhge2+dXNAY+S9GwSYDmcfrhF4yC1h5Tdyt2PMPj
   CgZ/21modsY7duVOhlZl3ZGIhHZYhI1vWA04iws/Qku0Nb7AEGpZKKNyC
   g==;
X-CSE-ConnectionGUID: oxSAKaqiS02FYCqZf3BU+Q==
X-CSE-MsgGUID: 0RGW4Dq7QsCxfjDfUEoMow==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73530975"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="73530975"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 20:12:00 -0700
X-CSE-ConnectionGUID: iG/sRAkdQDeQ6i9jnp0mPg==
X-CSE-MsgGUID: jkNc9+nFQmipief4XusNFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="184235383"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Oct 2025 20:11:59 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBPGA-000Bx3-2q;
	Wed, 22 Oct 2025 03:11:56 +0000
Date: Wed, 22 Oct 2025 11:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 08/10] lib/crypto: tests: Add KUnit tests for BLAKE2b
Message-ID: <202510221007.WnlC6PmP-lkp@intel.com>
References: <20251018043106.375964-9-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018043106.375964-9-ebiggers@kernel.org>

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on 123fa1574bccee87da735d13e89c931e88288b40]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Biggers/lib-crypto-blake2s-Adjust-parameter-order-of-blake2s/20251018-124015
base:   123fa1574bccee87da735d13e89c931e88288b40
patch link:    https://lore.kernel.org/r/20251018043106.375964-9-ebiggers%40kernel.org
patch subject: [PATCH 08/10] lib/crypto: tests: Add KUnit tests for BLAKE2b
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20251022/202510221007.WnlC6PmP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221007.WnlC6PmP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221007.WnlC6PmP-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
>> ERROR: modpost: "blake2b_compress_neon" [lib/crypto/libblake2b.ko] undefined!
ERROR: modpost: "__ffsdi2" [drivers/spi/spi-amlogic-spifc-a4.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
