Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FC77E576
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 12:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718024202; cv=none; b=VUf/xDpQX1BCIRVPkcNlDmdOjDI19YkrY4U3qS1sNHhfwEfMe9I9tZOAzr+lb0GTSLkN4iaSxT0NvvF90DN/HJ38pr762G0z4WuvQJ+yUeNO0m+eHCNSGhnnwFi1pewnvb2WUrnOLF9rKatSazzjU1IwSwYx0u9RkCvRY978qPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718024202; c=relaxed/simple;
	bh=kkED4L8j8vNz/46nIaJiSdXbpeZaf4HZgBLFBSjQVOg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KN1cX5wzDHXRVhNFG57e5sYPBdtx/b7FUmTtfcpsaSrtSGv0p8K6LCrsR/NjiFsUHoOggFps09V2pf65x04pYxSWslmveL8OVRyxujsr5J+iCvgBWqcrk10gu0CA2afzfPp1+NOeoystyw1nHl6y2tnsVCxWiFaeeBCL9cDPmQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdFn03z7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdFn03z7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718024201; x=1749560201;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kkED4L8j8vNz/46nIaJiSdXbpeZaf4HZgBLFBSjQVOg=;
  b=fdFn03z7jlzTVcAu+f22BnLdTJHKgWt3O+qxcXsTiRrrG+SxaKT8rJ3E
   C991Z5VsUGEqgsdHEAOedvs581+wQuRF6A+axKX78l8D6IiAKadLTdoNr
   VyUHu8rEgVdK1MgIycp3uuiR6vDHwiWkiOzsBhDffbRHLiCFs4Y14CF3a
   gcMF5pPcIZ9TWvQCWK6CG35crsj9l+6KV7qgvYCKKrOvaXvw/sx6fH+MG
   cASvMgDLsRwDvc2Fwk+liPTM4k5pR4ZofuRuNHUYV5qBPEgjJ5eyihKU1
   LGs90T+MezQDBvfUcQN599Ub2HtAmbLV59hkKGx2Hr671mGXJKjyFjXwi
   w==;
X-CSE-ConnectionGUID: xYpL+TBtQ5y96CLD+n9oKg==
X-CSE-MsgGUID: h/z7OJtmT2eCWiEnRP1Ghw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14809650"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14809650"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 05:56:41 -0700
X-CSE-ConnectionGUID: QVVOuIQyS9iF8qZfKl5O8Q==
X-CSE-MsgGUID: 4UrjiN2ZRRqdfZY0OQDI8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="44197310"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jun 2024 05:56:39 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGeZg-00029D-2S;
	Mon, 10 Jun 2024 12:56:36 +0000
Date: Mon, 10 Jun 2024 20:55:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Manorit Chawdhry <m-chawdhry@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 252/339]
 arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb:
 /bus@f4000/spi@20100000/tpm@1: failed to match any schema with compatible:
 ['infineon,slb9670', 'tcg,tpm_tis-spi']
Message-ID: <202406102057.71AYupJq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   2cceab3b4473f10ed67af5ba77fdcbcff77d48d9
commit: a82cd18e65a787340a5f9ed6f858c36ce4e51dd6 [252/339] arm64: dts: ti: k3-am642-phyboard-electra: Add TPM support
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/archive/20240610/202406102057.71AYupJq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406102057.71AYupJq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406102057.71AYupJq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: syscon@43000000: 'mux-controller' does not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,j721e-system-controller.yaml#
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: /bus@f4000/spi@20100000/tpm@1: failed to match any schema with compatible: ['infineon,slb9670', 'tcg,tpm_tis-spi']
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: /bus@f4000/spi@20100000/tpm@1: failed to match any schema with compatible: ['infineon,slb9670', 'tcg,tpm_tis-spi']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
