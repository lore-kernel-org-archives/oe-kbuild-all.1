Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0274710F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 01:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQ7jMs4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700271472; x=1731807472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pMYJRearNjtZkenGLNFLuV6YB4UiY53eVk4RlzqHmMA=;
  b=UQ7jMs4eH7TOnR3JDpljTBRTJKn/FP/3v4XAZDw3kg1YH9YOIBKAhRNr
   MGN59ibu4jq7sjuFlPjhoJo2WnkiJCvzv0uxYF6lkYZAg4Ww/z4unNvOV
   RT2mI+iYPP/1PRdj+0OVu6cU1aBAy0yldU894mvhXpl5QLvjj9DMoNyWg
   ILQ6DWWrnMNq91lxiRLXEjOzSoMH7kzl4TX2aef6xniY0Ier+SR6K+G4U
   39zZnmUC0ur8Vt44KNqC0vlGhMK9N/PIRcMegDh+sJveO8LGxJ6FSiocn
   I8ZvLUpbSTYjSSJDulhFLYfiSLyHYVcfcoyGeqjoFe2uQQx17DXueQo/7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="394247007"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="394247007"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 17:37:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="1097265410"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="1097265410"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 17 Nov 2023 17:37:49 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4AHL-0003OZ-1R;
	Sat, 18 Nov 2023 01:37:47 +0000
Date: Sat, 18 Nov 2023 09:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: James Tai <james.tai@realtek.com>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: interrupt-controller: Add support
 for Realtek DHC SoCs
Message-ID: <202311180921.ayKhiFHL-lkp@intel.com>
References: <20231117162709.1096585-2-james.tai@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117162709.1096585-2-james.tai@realtek.com>

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on robh/for-next linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Tai/dt-bindings-interrupt-controller-Add-support-for-Realtek-DHC-SoCs/20231118-003036
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20231117162709.1096585-2-james.tai%40realtek.com
patch subject: [PATCH v2 1/6] dt-bindings: interrupt-controller: Add support for Realtek DHC SoCs
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231118/202311180921.ayKhiFHL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180921.ayKhiFHL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/interrupt-controller/realtek,rtd1619b-intc.yaml: title: 'Realtek DHC RTD1619B Interrupt Controller Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/interrupt-controller/realtek,rtd1319-intc.yaml: title: 'Realtek DHC RTD1319 Interrupt Controller Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/interrupt-controller/realtek,rtd1319d-intc.yaml: title: 'Realtek DHC RTD1319D Interrupt Controller Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/interrupt-controller/realtek,rtd1325-intc.yaml: title: 'Realtek DHC RTD1325 Interrupt Controller Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
