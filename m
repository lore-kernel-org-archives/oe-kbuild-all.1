Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D10F1D63C2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 16:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746115977; cv=none; b=FPsevwVDL2OzP+A4HFDTDqcknNJ0u3+UrNxA+EVc2w1AB9a5synuLvE7V9EJOSTTUGN6+zbHmy6LdK2p5pEjQulRpqvxvSsWDvqOEw6Nxbot8hgcUbWMREgIV/hmMd75SXfzKY1afkYrzfU8zudC+oY2yoCjmQn4hiKIXfduyeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746115977; c=relaxed/simple;
	bh=A1YogmnGMKTMHm2zxZV4DBdy5txg2qSLdm1FpVZUDM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDaqFXMWPrsvwBExANFwKOZO7JikGW+GEAfUm4fbi1RLK4dGgPI436LlIgUuiFOfY2A7oggRPf4+v2aXY4wiDzEk1JyCNhtELGMIgTrOda6+6nQA8BNkWh5pYvImKSZo1cf+4WmuUKmYJlWP5IU0efsDSMK3h3VfE8IrZn9nFFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NSnp2rgp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSnp2rgp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746115976; x=1777651976;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A1YogmnGMKTMHm2zxZV4DBdy5txg2qSLdm1FpVZUDM0=;
  b=NSnp2rgpuUCfWgo4SDLgotWiLy6Wx3bsUJk2Uaer2fQafwkTjSNzTGGg
   6QqDE5CoTc8GizCeTxVQhOKTMMm7H0t7bM2Tt+JiREJ3aXZSdp6oY2pYI
   ETyVDgdBssKp9oYT3C2UpwwCv+6yIZldAcI6nvmQ64AxYKxA37JqxUrTM
   l1o8XHBNIV9kYQ75Uix/PGxELa/dFfLqROXVU6ofmOlzF3Zqd80dXyyrD
   0CYdfa94rYE9rgGl0jn4yS6+4A7vflWEuqzWYzH4cQlFVYmDOsf/CMfkb
   11gXgoz/qcEjDgPM88v1a/OQppt0SXXtXRdYC1enYP4T2/SrISB+xC1Fh
   Q==;
X-CSE-ConnectionGUID: 98dOKbuIT7uTbutDcoTVEQ==
X-CSE-MsgGUID: L5Ewz/H7SnaoRk1YEWJSEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="35412796"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="35412796"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 09:12:55 -0700
X-CSE-ConnectionGUID: FCjyJbt1S+SNYnF+XFQtRQ==
X-CSE-MsgGUID: HvgOkt6kReO2rla3g5Jwvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="171656049"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 May 2025 09:12:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAWWk-0004FN-2D;
	Thu, 01 May 2025 16:12:46 +0000
Date: Fri, 2 May 2025 00:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu <claudiu.beznea@tuxon.dev>, bhelgaas@google.com,
	lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	saravanak@google.com, p.zabel@pengutronix.de
Cc: oe-kbuild-all@lists.linux.dev, claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 1/8] soc: renesas: r9a08g045-sysc: Add max reg offset
Message-ID: <202505012344.lIxS3e4X-lkp@intel.com>
References: <20250430103236.3511989-2-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430103236.3511989-2-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus geert-renesas-devel/next geert-renesas-drivers/renesas-clk robh/for-next arm64/for-next/core linus/master v6.15-rc4 next-20250501]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudiu/soc-renesas-r9a08g045-sysc-Add-max-reg-offset/20250430-183951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250430103236.3511989-2-claudiu.beznea.uj%40bp.renesas.com
patch subject: [PATCH 1/8] soc: renesas: r9a08g045-sysc: Add max reg offset
config: arm64-randconfig-001-20250501 (https://download.01.org/0day-ci/archive/20250501/202505012344.lIxS3e4X-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505012344.lIxS3e4X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505012344.lIxS3e4X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/renesas/r9a08g045-sysc.c:23:3: error: 'const struct rz_sysc_init_data' has no member named 'max_register_offset'
      23 |  .max_register_offset = 0xe28,
         |   ^~~~~~~~~~~~~~~~~~~
   drivers/soc/renesas/r9a08g045-sysc.c:23:25: warning: excess elements in struct initializer
      23 |  .max_register_offset = 0xe28,
         |                         ^~~~~
   drivers/soc/renesas/r9a08g045-sysc.c:23:25: note: (near initialization for 'rzg3s_sysc_init_data')


vim +23 drivers/soc/renesas/r9a08g045-sysc.c

    20	
    21	const struct rz_sysc_init_data rzg3s_sysc_init_data __initconst = {
    22		.soc_id_init_data = &rzg3s_sysc_soc_id_init_data,
  > 23		.max_register_offset = 0xe28,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
