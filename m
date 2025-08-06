Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E512BEFF1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 20:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754512879; cv=none; b=LGvRM9Gzp9AoYVg02YHk17KxwGmnwQ4SB8/4W5uq7qdpFuVukR2LLRrxWh/koLbJEmVLoGNHprIR9LkGj4DY1vEHdc8dx71TjoAetRBuKu65MA+jeK9Dji+WdInNmt9vEqvsqudFG5pa5QWRh0N521F6R+qlhxV+1haJnGZ0KUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754512879; c=relaxed/simple;
	bh=DFFBqOU97HE0nR2qSPkrnVv9gJuOVEFJ2zas/p2pGts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBCVOMXD7l4OjnHnRBgypSM4mo3gtdLrWZSfNK68U2w431+7n3W7BozGPiHAvsS8I1zLMMJEj1OflxtIFHDMCZPDA6ET5Pm7yAeUBRCu8z1mnqBDAPfbnj2nZ06GfXhCeZ9BL5zT2R3cfqMqyk610V/bodJUPNhaUdBp/TqREEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OI3rw4Sa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OI3rw4Sa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754512877; x=1786048877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DFFBqOU97HE0nR2qSPkrnVv9gJuOVEFJ2zas/p2pGts=;
  b=OI3rw4SaOSWO2ilx/yX9jOtir6+9ZOUBlNj+qRegcn8ZvNufJTOJv29I
   sV0FnJex4QtX0T5ZYx42S/OqOJ1I6tCGo95c8xYCGHKmOK6h6aUYXLwQk
   +YVKh1Dk1zIVkpE688v8f4gWwTlN57O/SFOTrcWYgBdgWyzoYdM6Fjn4W
   YfNuZRZ+IBQMqlmsrL07FG0nNZiB8A7v2dU8+wTIv0BLaqlAG0Uoml/fT
   jfOVKsyuw8Po3cyBsUH50mNoLpDkSyXOglU45NBDxvEZaoDifEMvTOSHW
   3sW372Ro7xu5jqfwAu7DdYkbolccasy3ZdU0sv9Kt+evll0cX5We9M2w/
   w==;
X-CSE-ConnectionGUID: puYmMzkXRrSoOgyvnu+Q7A==
X-CSE-MsgGUID: GPXRJEcXRYS1HHBEh5C8Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74303198"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="74303198"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 13:41:14 -0700
X-CSE-ConnectionGUID: DCtWjkSnRVeS+4HjoSDtRQ==
X-CSE-MsgGUID: 22OCQZEfQlCArsJ/l0JX5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164389454"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Aug 2025 13:41:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujkwa-00024u-0Q;
	Wed, 06 Aug 2025 20:41:04 +0000
Date: Thu, 7 Aug 2025 04:40:15 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 4/5] phy: renesas: rcar-gen3-usb2: Add support for RZ/T2H
 SoC
Message-ID: <202508070430.wK3sK6kB-lkp@intel.com>
References: <20250805122529.2566580-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805122529.2566580-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250805]
[also build test ERROR on linus/master]
[cannot apply to geert-renesas-devel/next robh/for-next v6.16 v6.16-rc7 v6.16-rc6 v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bindings-phy-renesas-usb2-phy-Add-RZ-T2H-and-RZ-N2H-support/20250806-122832
base:   next-20250805
patch link:    https://lore.kernel.org/r/20250805122529.2566580-5-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH 4/5] phy: renesas: rcar-gen3-usb2: Add support for RZ/T2H SoC
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508070430.wK3sK6kB-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070430.wK3sK6kB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070430.wK3sK6kB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/renesas/phy-rcar-gen3-usb2.c: In function 'rcar_gen3_init_otg':
>> drivers/phy/renesas/phy-rcar-gen3-usb2.c:82:31: error: implicit declaration of function 'FIELD_PREP_CONST'; did you mean 'FILE_REF_NOREF'? [-Werror=implicit-function-declaration]
    #define USB2_VBCTRL_VBLVL(m)  FIELD_PREP_CONST(USB2_VBCTRL_VBLVL_MASK, (m))
                                  ^~~~~~~~~~~~~~~~
   drivers/phy/renesas/phy-rcar-gen3-usb2.c:448:44: note: in expansion of macro 'USB2_VBCTRL_VBLVL'
       val = (val & ~USB2_VBCTRL_VBLVL_MASK) | USB2_VBCTRL_VBLVL(2);
                                               ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +82 drivers/phy/renesas/phy-rcar-gen3-usb2.c

    77	
    78	/* VBCTRL */
    79	#define USB2_VBCTRL_VBSTA_MASK		GENMASK(31, 28)
    80	#define USB2_VBCTRL_VBSTA_DEFAULT	2
    81	#define USB2_VBCTRL_VBLVL_MASK		GENMASK(23, 20)
  > 82	#define USB2_VBCTRL_VBLVL(m)		FIELD_PREP_CONST(USB2_VBCTRL_VBLVL_MASK, (m))
    83	#define USB2_VBCTRL_OCCLREN		BIT(16)
    84	#define USB2_VBCTRL_DRVVBUSSEL		BIT(8)
    85	#define USB2_VBCTRL_SIDDQREL		BIT(2)
    86	#define USB2_VBCTRL_VBOUT		BIT(0)
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
