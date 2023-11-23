Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846689453
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Nov 2023 03:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ea0l3FcU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700709442; x=1732245442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iAcQ4HN8CRNfclzvo2vl89aCCXDlyLDgI/O6GQnrGRM=;
  b=ea0l3FcUituq4hBWh14qMWQxASeem0LHsqmKHUYpBGEm8KGKSObJdS/Q
   ZhZANqzYxfUNGVnNw8sBzNFEXYqFSk3MT3OCK69sS4G+r69BDfE3F2Gb3
   oslP5fQbvcUW78VK+Z9xPbSgqRj2P5l5TuQjjA8scOcMqHZBzD0VEobOo
   U76/ylVpYbBEVb9FpFmVvxwq3epZ2IFqoRzVWmyk/Q+ZhuJUvMT6ZJPjg
   MfI6W1PXet/sNY2cdCa9EKYj5/pVPBxdbkbqw4o2foEf9ZqDdjp89MTEX
   a9Je6aCQPQCFDsKrfUBveqT8d+1wACtgLeQp/mb2RaWoY2SlWcD4kUD78
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="372348546"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="372348546"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 19:17:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="8521855"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Nov 2023 19:17:15 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r60DI-0001As-0h;
	Thu, 23 Nov 2023 03:17:12 +0000
Date: Thu, 23 Nov 2023 11:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>, conor@kernel.org,
	linux-kernel@vger.kernel.org, michal.simek@xilinx.com,
	git@xilinx.com, robh@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: xilinx: Move xilinx.yaml from
 arm to soc
Message-ID: <202311231036.ZQvuqOs2-lkp@intel.com>
References: <281ed28bccc14e7006caf17d6cfeb2a679b0e255.1700648588.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <281ed28bccc14e7006caf17d6cfeb2a679b0e255.1700648588.git.michal.simek@amd.com>

Hi Michal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc2 next-20231122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Simek/dt-bindings-soc-Add-new-board-description-for-MicroBlaze-V/20231122-234634
base:   linus/master
patch link:    https://lore.kernel.org/r/281ed28bccc14e7006caf17d6cfeb2a679b0e255.1700648588.git.michal.simek%40amd.com
patch subject: [PATCH v3 1/2] dt-bindings: soc: xilinx: Move xilinx.yaml from arm to soc
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231123/202311231036.ZQvuqOs2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311231036.ZQvuqOs2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
    	 $id: http://devicetree.org/schemas/arm/xilinx.yaml
    	file: Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
