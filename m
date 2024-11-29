Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449281C01
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 03:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732850885; cv=none; b=hBPLnbfnaALDtgNUmoW/eL24QTzjBfYv5bZQXDqI4YyZeFigMXokslCfj7k/r/m1Ol0faCh+7kOBv9b4cq99GjcwD068Mp++QjTisMKaqaguQRqbCsbcAxX1qG7UUo4z6BNcLptzGxH7skM8QTUq0MA/Z5wfMWN3s9mr77DCkXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732850885; c=relaxed/simple;
	bh=hALUnWOl9ffQRqcYfXB/rc562e+qF+Kmh8DBKouERiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1NgWb78Vt9iF4Uwo0W7cwGQ5R/M8KzNRzv5QY6CsOZzv1FOhkUFgAOv0ZIrWz7gBY6Z9OLOaMcsiOZgYrt3qGNVXXtayqgyoUMHAfEOl33abo8YAwPOvB/gqrFYv8SOiaJhXARY+1kpmg0kC1ENs3RPiEBSPKm7YXCVRt3BIS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E6LDDKce; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6LDDKce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732850883; x=1764386883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hALUnWOl9ffQRqcYfXB/rc562e+qF+Kmh8DBKouERiQ=;
  b=E6LDDKceg+aNug8QmzDgdFQ3k+ahsEHbGOg0yWsNbJrAYT2JjsdtD1Cv
   HLNRneBxaccpFk3zTwFlNpRt0//yrRkaRhdPk3wH4wemmMK9xzSyG9APd
   xuKdFZC01xvn/vw+N3qZNbUBLecRj95dn42eBn8Hl86YkLispwaH2s4gy
   NjutGp9JBxYviMWMqgduA3cuLn+7H1XKMTQ+OGcOSuYwDQBPspJIF/yo1
   VQ56pVkq5lBZOXMo1XI/s/N/e2MwD3y0wFbz7da5RuBIVndCPOk+h0cDv
   W1aPQS20gADIuA0Mm9pB731kPy2jFh5xQiPS1le91WL4F+H3RXKnJg3zH
   g==;
X-CSE-ConnectionGUID: ORa9v3huTLieNVg8PfTvyg==
X-CSE-MsgGUID: 4iDP25oeQJuLl0uLEzej9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36750908"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="36750908"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 19:28:03 -0800
X-CSE-ConnectionGUID: M7M73eaqRgm4kaz7z7nGAQ==
X-CSE-MsgGUID: PVfvXULtT7yP9/oURfzl3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="123247065"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Nov 2024 19:28:02 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGrfj-000AIF-1R;
	Fri, 29 Nov 2024 03:27:59 +0000
Date: Fri, 29 Nov 2024 11:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/4] tee: add restricted memory allocation
Message-ID: <202411291135.rmKWDIZ7-lkp@intel.com>
References: <20241128150927.1377981-2-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128150927.1377981-2-jens.wiklander@linaro.org>

Hi Jens,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on next-20241128]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Wiklander/tee-add-restricted-memory-allocation/20241128-231155
base:   linus/master
patch link:    https://lore.kernel.org/r/20241128150927.1377981-2-jens.wiklander%40linaro.org
patch subject: [PATCH v3 1/4] tee: add restricted memory allocation
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241129/202411291135.rmKWDIZ7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411291135.rmKWDIZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291135.rmKWDIZ7-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module tee uses symbol dma_buf_export from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module tee uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module tee uses symbol dma_buf_fd from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
