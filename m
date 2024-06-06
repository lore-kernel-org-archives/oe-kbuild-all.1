Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93086199E9A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 20:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717706115; cv=none; b=ceGXJwkl5b08cCWFT+tpZ+AGlxuQ2ntnfVxrvxV3T+fpr/InRNYhD7UUnRIQefIxwbg8Szs/S83ROmdPLKllX8CT2ujnupThlp2yT5Fi8EGrP8ZLzxEK2mmh6Eu5VsAI30EnC2fG9XYWZ0lCUQ9/eI5aEjeuWmc08mBs21tgMJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717706115; c=relaxed/simple;
	bh=nhXf8eSvkloqZ8P33sV7YhNFzeOdKj1NPqkLgfGyFUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txM5A2ctNTT/etpFAMCfg2jXyi0PXpoRAArMPO+U3uYRhhlrTlN7fFfdezVI1HZUYtxZcyLLRMzNLGpbB9oxMNODSHmMCKeA1zOQyQpVIMpKJz2j986cWvUIILbQbLuW4o0EN/gFHo6qecjHzkVKJAtIgdK37xVv+EeRfK85ooI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwhqYBCO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwhqYBCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717706112; x=1749242112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nhXf8eSvkloqZ8P33sV7YhNFzeOdKj1NPqkLgfGyFUo=;
  b=TwhqYBCO7bidxIj6EqMfp7Geeu0KwWqbuSX2PP6HSgIWFEWKbv+gGoZ9
   DkfRRvl0EuKmTiJg2UtGkyAWtB9W9BaxGICfOIe+6pIyclJ+uB8vgB0f9
   YKFCDYSCd0qPYU13rS7MbmALoBMqZWhoPU1w3jH538JsZdMl0GOtdgPKe
   n74BfFFXv8PEZGrWZVsxMqoHTaGYoc0yyF9VrX/56gn8ZcsuE/JOGjQfw
   QZhwPFiXVy9UceYm2W/ufELTdOBCX8M+EMx30lqexhH0rMDc2XTbfDAqn
   eU7hQUxMpCGEIl+ShC3GYqCTVAqlVYxBW8dMg6i4qsGjY5Pji/KSwgMup
   w==;
X-CSE-ConnectionGUID: PWq/7cBGQv22UXV9OQsYxg==
X-CSE-MsgGUID: T1yFFfibQ8OaLFIGM4Q4Uw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14244965"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14244965"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 13:35:11 -0700
X-CSE-ConnectionGUID: 95PXqdiHRVqk7lnI60X+eA==
X-CSE-MsgGUID: MDjjan1aTiS9rovMoWiiCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="37943332"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jun 2024 13:35:07 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFJpB-0003gH-1a;
	Thu, 06 Jun 2024 20:35:05 +0000
Date: Fri, 7 Jun 2024 04:34:06 +0800
From: kernel test robot <lkp@intel.com>
To: Haylen Chu <heylenay@outlook.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Haylen Chu <heylenay@outlook.com>
Subject: Re: [PATCH v2 2/3] riscv: dts: sophgo: cv18xx: Add sensor device and
 thermal zone
Message-ID: <202406070442.HO8jNHCo-lkp@intel.com>
References: <SG2PR01MB42184CFE2C3D3E210CC6F7DAD7F82@SG2PR01MB4218.apcprd01.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SG2PR01MB42184CFE2C3D3E210CC6F7DAD7F82@SG2PR01MB4218.apcprd01.prod.exchangelabs.com>

Hi Haylen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on robh/for-next linus/master v6.10-rc2 next-20240606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haylen-Chu/dt-bindings-thermal-sophgo-cv180x-thermal-Add-Sophgo-CV180x-thermal/20240604-205916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/SG2PR01MB42184CFE2C3D3E210CC6F7DAD7F82%40SG2PR01MB4218.apcprd01.prod.exchangelabs.com
patch subject: [PATCH v2 2/3] riscv: dts: sophgo: cv18xx: Add sensor device and thermal zone
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce: (https://download.01.org/0day-ci/archive/20240607/202406070442.HO8jNHCo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070442.HO8jNHCo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: thermal-zones: 'soc-thermal-0' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
