Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D8215A4AF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 08:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722932968; cv=none; b=uWo+NWbIrqhFxx7gxp9m27I09nIRYnL+pdfhn4ojdSiv1ww6VRElEdtKYiLULPPCY28zWAd0nu2vnyNpnUF746XXXluusmqhuoEreX73ez7aRXhMBRSqTuMxmF2ARtVT2Xb7iYffrve2DofDF45hCrg1D6N/tCPrL3ChY8lsP4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722932968; c=relaxed/simple;
	bh=nQZIZqnPKLcaak9eVCsD3lCBmX3//u5NE4vlGmjUOX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jZE5gq9Nbl8jmC7cOMI705iAfwjb9xEMb5aI65bHMqn2DS0D8PQH/PDgBWd6FOued8uMyaiYvI2fNax/aO1VJNB+m+h/emd5yX08X6kviDAMMmHU21HV4NbIawkvwJL8WlQi6E3q2zah2WcUAOqiiMeFKkpI84VoE5+m6jekVwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UCTlvMDy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCTlvMDy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722932967; x=1754468967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nQZIZqnPKLcaak9eVCsD3lCBmX3//u5NE4vlGmjUOX8=;
  b=UCTlvMDy89abCShYz+3SZJ9TeiUIP9LBqZEUX8e8ud9Xpgo2RyiyMlSM
   dvIsfsMIG7S4OO0GSqESqCKPfemYUgLx4JHTqvMFBEYCOZC+O/uz364C2
   9fkTSKBODkczxP8E57VpAS4OAXRFPML/w7ccAd8VCeRnaIsYxSCBITXbI
   l1Ywo2Apj4wBeQuYZULWQhYsNzjQb1cE5C4lh0n1dDbjZfQahIjKfbJdX
   76rb5i7CnvYRkjXMAbXRjlRBZCWsKSvBKpecwSkv9ztllZK2zTRqPC75Y
   gwGl+XiPtW+fmKZyeiwO/EQ73oTc1VLlJQfabKOWZ6uJdRM0GjW3usWbQ
   g==;
X-CSE-ConnectionGUID: HdFmQKNvQbe1CNV0lJ8FJw==
X-CSE-MsgGUID: DaxiUCBpT9GayZJRYM1MTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="46336217"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="46336217"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 01:29:26 -0700
X-CSE-ConnectionGUID: 5N+SH26ARxe/kRFptzBLvg==
X-CSE-MsgGUID: 4QPxQXiSSn6LSUnYsfycVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="61405679"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Aug 2024 01:29:25 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbFZK-0004J6-2G;
	Tue, 06 Aug 2024 08:29:22 +0000
Date: Tue, 6 Aug 2024 16:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [linux-next:master 2333/3348]
 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: dma-controller@11820000:
 compatible:0: 'renesas,r9a08g045-dmac' is not one of
 ['renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac',
 'renesas,r9a07g054-dmac']
Message-ID: <202408061643.ZEa7m2ok-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d6dbc9f56c3a70e915625b6f1887882c23dc5c91
commit: 054a83a1548ce30eeebcf95c86951d3ef56e6f7d [2333/3348] arm64: dts: renesas: r9a08g045: Add DMAC node
config: arm64-randconfig-051-20240804 (https://download.01.org/0day-ci/archive/20240806/202408061643.ZEa7m2ok-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061643.ZEa7m2ok-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408061643.ZEa7m2ok-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: clock-controller@11010000: #power-domain-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzg2l-cpg.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: dma-controller@11820000: compatible:0: 'renesas,r9a08g045-dmac' is not one of ['renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac']
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
