Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123839;
	b=uInuUNR83wzrE8yGAtoCO35AC8QnYfAnJjbtDvZmZX5CuCccMqVonp7ONp2uzCFg2Z/4
	 lCGJZRGsf+Q8nIGRRz3CmsTn45BacR5XRM0pRs+oBwDsj0kR1jlmxbStivHYRnFRJ8vBQ
	 UL/qCyq+5/k5SQmdLRXnqov3hmrDJS9q56yOmXPs4f1kEE0RWEgWujIGefhx6fQ6JvWle
	 Jccw52EOMHcpe4oU1m0xeJMcHaUFWSECfWDluNlu3MTeEnHdeJ8RvatuiZG05ndaa2SK2
	 AASkX8HUT/hUGCy8Pl/Gi15+mAvJ7GbLuvxqZgyl89exXDr9CBsyKLFUZzlKuG2uDyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123839;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=0oZlDx8Vv+0nCck+Zhk2G9X4wk2IXUKlcAG+gSxafiY=;
	b=zH1+zlpFe4QZ3DYoLlduuBmP4wi5pPUEsdJqWKyiIRuESVtjbyubfQJpMWquEgOiEx2V
	 kadkvNSaOZweuoHKtk5P07RAIQOxNv/GJqTMzTS60Tyc7OSL7Qi7cYY05wpDfH1ZSr0Gt
	 CZFU7xIovZqa0uujq6NenZ/kVj9DcYxg+ojW3/plCQOmkw8t0Yl449DGrLne6RxG4erqO
	 sexFR8imCu7j2gGDT3DrR6IBVsmofZtXlvYINQxh4LS00LQ6G8g5y9/Q5qSplHBk+HPP+
	 66GohwuvdTvp61UQzOyR2NMN880dmTx0zkDABLyUC9+j+IXer3HTLGtssGS1R3aHIGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GfhE6Xad;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD11606A325
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 21:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BD11606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GfhE6Xad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795123838; x=1826659838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mogHG+qkA4LZoztNkMUoZeinOmAAZ6RrtIKMGQTKNCI=;
  b=GfhE6XadhsQAWq0NaOAc0qhCC7CwyGPBB9wBWbNxWRzXyH1C7A3XsFoX
   MeupyXceQutM45VPYEGSi3pLRxyI5v9v6Pgt15Biyokezi5i9taxnxSN7
   IaYMBreRlbPHd+rf8yd832lLWNzliio+yKkrXldPncL45ul7VyaI2EFwK
   EgFgE1OxvC0H8j+Yxe+sm71aW3EQW5y2xIOzWrr8/KcvDj/R4/jWYOsuh
   X+yEnfOc0o6EpjUb4bcT3RrdicnbzQwgKQN3bFci6vsPda0lK+TVVszyo
   ILyw2ypwaH9p4C6C7GrgFIKSK88DnQqTZLAa+x7gUy++REc2Di0QX0Z35
   Q==;
X-CSE-ConnectionGUID: ejhKwmewQC6VbL/t+y+6SA==
X-CSE-MsgGUID: wrbhnsR5RayHTgm9K2M0Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3880869"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3880869"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:30:37 -0800
X-CSE-ConnectionGUID: ayvu9HVvTmaAM6/6QPPqcQ==
X-CSE-MsgGUID: 51LNhAD2TfeB6SnxF/DqhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10434913"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Nov 2026 13:30:15 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU9ht-00000001GbD-0pE8;
	Thu, 19 Nov 2026 21:30:13 +0000
Date: Fri, 20 Nov 2026 05:29:29 +0800
From: kernel test robot <lkp@intel.com>
To: Prakriti Sharma <Prakriti.Sharma@synopsys.com>,
	Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	Siddhant Kumar <Siddhant.Kumar@synopsys.com>,
	Prakriti Sharma <Prakriti.Sharma@synopsys.com>
Subject: Re: [PATCH 6/6] spi: dw-g2: Add XIP support
Message-ID: <202611200501.mzDpyxlW-lkp@intel.com>
References: <20261119100513.433044-7-prakriti@synopsys.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119100513.433044-7-prakriti@synopsys.com>

Hi Prakriti,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on robh/for-next linus/master v7.4-rc3 next-20261116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prakriti-Sharma/dt-bindings-spi-Add-Synopsys-DWC-SSI-v2-02a-binding/20261119-153508
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20261119100513.433044-7-prakriti%40synopsys.com
patch subject: [PATCH 6/6] spi: dw-g2: Add XIP support
config: sh-randconfig-1000-20261120 (https://download.01.org/0day-ci/archive/20261120/202611200501.mzDpyxlW-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611200501.mzDpyxlW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611200501.mzDpyxlW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/spi/spi-dw-g2-core.c:588 Incorrect use of kernel-doc format:  * dw_spi_g2_cmd_only_setup - Configure controller for command-only operation
>> Warning: drivers/spi/spi-dw-g2-core.c:596 function parameter 'dws' not described in 'dw_spi_g2_cmd_only_setup'
>> Warning: drivers/spi/spi-dw-g2-core.c:596 function parameter 'op' not described in 'dw_spi_g2_cmd_only_setup'
>> Warning: drivers/spi/spi-dw-g2-core.c:596 expecting prototype for Command(). Prototype was for dw_spi_g2_cmd_only_setup() instead
>> Warning: drivers/spi/spi-dw-g2-core.c:895 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Indirect read operations
   Warning: drivers/spi/spi-dw-g2-core.c:1082 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Indirect write operations (Page Program)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
