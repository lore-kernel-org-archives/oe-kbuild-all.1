Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A331A9F82
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 23:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762298139; cv=none; b=SyKSYN2n7bwES/vYulmaBlyozVD3uSEdzNW83ZrPmRzxzZPZ6d7qO/9m8lS/5C0SAoR3AfRJ92j0in3WnnWWkKI08zSocsBhnQ1OVeO0h11l/fBIFBKFGb3SwDevZJ3L7d9YsvDuzAoZtIvSBWRXJAHsduw40CD7grLZ0k9hckQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762298139; c=relaxed/simple;
	bh=5FzMxmsnnMI6iEWbGWYMjpuof9Q20uo2BdQ1iMH4P6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWPIKZwAkyNTSlRpY6zcAwsoNGQ3N8TLvldQcnbpsfCYhWtZeYDpr8e8oG9J+OGiMUYG+yE+nJ1uxPFlHHnVGaabq9jmKWcAaQ7uDiHwXzgeqc/1OyTl1HQFTWUDD44wnIjlVl62joP9ecx25m6Nqlcsc791sFujB0ooMV4aEVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8Nz9PIP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8Nz9PIP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762298138; x=1793834138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5FzMxmsnnMI6iEWbGWYMjpuof9Q20uo2BdQ1iMH4P6U=;
  b=l8Nz9PIPo/moMcyLoMHOZER3i6MQGTs3tGv32U0gYRclLUKU0xXI7cFl
   GKf+LqpFAPyxNgxbnv3kv3LWRScE1djzvDBCqedDwHXYniSXj8zcEh3DU
   LqfoyLU2uIfQ0EqlyDiydkytxzukTdie/XDm0kkg1gMz7wQD+b6kscdqx
   kS0+NkjJeKOOonT5yrDVyP2cGjcJ4Wli9XWvoWI/H9Ry53moB/U5Mpo85
   9dt716c36Q/SiBSOWMLVv77iy05frusyf1F02R5kdRK/mFEGuBgwJ3fl5
   c81Yco4d4TQBfi6MhXFubnG9BfS6ZnKEW4lE7ZxOPNMDhoucWfOx/5axS
   w==;
X-CSE-ConnectionGUID: 2Jju60a/SkCkALgCTHnBEg==
X-CSE-MsgGUID: 83yLRVmYQJeQs+On/LB2YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64312224"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64312224"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 15:15:37 -0800
X-CSE-ConnectionGUID: wjt6xLDaT+uGk/zSP4IGlw==
X-CSE-MsgGUID: PMp4CIS+S3mJaVfp3g4bRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="186963412"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 04 Nov 2025 15:15:35 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGQFR-000RvO-0F;
	Tue, 04 Nov 2025 23:15:33 +0000
Date: Wed, 5 Nov 2025 07:14:58 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] kernel-doc: Issue warnings that were silently
 discarded
Message-ID: <202511050706.NIxJwZER-lkp@intel.com>
References: <20251104215502.1049817-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104215502.1049817-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on next-20251104]
[cannot apply to linus/master v6.18-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/kernel-doc-Issue-warnings-that-were-silently-discarded/20251105-055629
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20251104215502.1049817-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] kernel-doc: Issue warnings that were silently discarded
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20251105/202511050706.NIxJwZER-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050706.NIxJwZER-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050706.NIxJwZER-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/sh/intc/irqdomain.c:29 function parameter 'd' not described in 'intc_evt_xlate'
>> Warning: drivers/sh/intc/irqdomain.c:29 function parameter 'ctrlr' not described in 'intc_evt_xlate'
>> Warning: drivers/sh/intc/irqdomain.c:29 function parameter 'intspec' not described in 'intc_evt_xlate'
>> Warning: drivers/sh/intc/irqdomain.c:29 function parameter 'intsize' not described in 'intc_evt_xlate'
>> Warning: drivers/sh/intc/irqdomain.c:29 function parameter 'out_hwirq' not described in 'intc_evt_xlate'
>> Warning: drivers/sh/intc/irqdomain.c:29 function parameter 'out_type' not described in 'intc_evt_xlate'
>> Warning: drivers/sh/intc/irqdomain.c:29 expecting prototype for intc_irq_domain_evt_xlate(). Prototype was for intc_evt_xlate() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
