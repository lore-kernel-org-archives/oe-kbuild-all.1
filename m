Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37D6243378
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 08:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754555916; cv=none; b=VNAGx6KkjGH/Cmdc6qB8KQVLltcMZrfJOXb4bAkn2Js9K1Jt9uAckgEehgHNWPanQOznYEXJgZ0gaLbu4hf9htGeI28YaUeAyAAUT8gVlAPk/sn7iIcOafVxW8aOivUqEr3mqdvquedxWsm0tjc/xrEeisBG3mCmfrZW2A88vjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754555916; c=relaxed/simple;
	bh=KUHgmhUGWdqmXjoZTDDKuFz/2A3jfiw1TRDE3zaX4Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RPTWEktrcPUjiUDUhu4ZQRF0wuqAgsXia7AHc57Nr56/ES7E7XTnBlwvxB2rpQWwvlyHvDo0lvHqgmt67uaqfmfPYPTsUxmmPDoGgL74Fe7uCe/haX7N80SS+OZwk6fPekOgQAqdwttiTrSlwrWRLRsbWz+9XN2iCRAr8jpr4y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=km1Q2HLT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="km1Q2HLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754555915; x=1786091915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KUHgmhUGWdqmXjoZTDDKuFz/2A3jfiw1TRDE3zaX4Bc=;
  b=km1Q2HLT6d3BxhKsUZ40diDIuJybWsfVBTWTiRGNJgMt0nrmaTZQGZwy
   iNvYTOGBiAwLcQgYtlejCkNQP0n46EdREL8m8DPE36saQPtrh5Wmhku6q
   cT1LFsw+Rmp3ZLXvWvjC1udl+Kjb8omyYIUSMmOMY9xsj5Y9OZoXGeaP/
   1FHs7Z6t5jshGLjwmciyQNrlpELnqaAf5GJ9aS+bqrd2lJAjSZg1OPzMG
   ECf37xlvsgoXP4BdIKeL78gSmCR6Vgu24OZe3G8OBsmtQ9RB1TW5wOI0w
   AJ+XRCE+Vks2iKzSxst4VVm8yGyRP7eT4Q6x6h+lrWP4nSaMYUq3BQHQP
   g==;
X-CSE-ConnectionGUID: hL3pBeu/QLe9tvwjEbxjfQ==
X-CSE-MsgGUID: nvCRutMeSFW5n8oab2D+vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56754269"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56754269"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 01:38:35 -0700
X-CSE-ConnectionGUID: OwCMuLRcSBCU1VXI8FyMLQ==
X-CSE-MsgGUID: bvLfX2hrQgaAO7Y48/qZNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165419423"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 07 Aug 2025 01:38:27 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujw8n-0002aF-0o;
	Thu, 07 Aug 2025 08:38:25 +0000
Date: Thu, 7 Aug 2025 16:35:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt-convert 132/801] Warning: Duplicate compatible "ti,opa362"
 found in schemas matching "$id":
Message-ID: <202508071601.KPU2NfSt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 3f6ae13f745f2259335db53a99da1a816f841044 [132/801] dt-bindings: display: Convert ti/ti,opa362 to DT schema
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071601.KPU2NfSt-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071601.KPU2NfSt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071601.KPU2NfSt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/devicetree/bindings/display/smi-sm501.yaml: edid: missing type definition
   Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix
   Warning: Duplicate compatible "operating-points-v2" found in schemas matching "$id":
   	http://devicetree.org/schemas/cpufreq/operating-points-v2.yaml#
   	http://devicetree.org/schemas/opp/opp-v2.yaml#
   Warning: Duplicate compatible "marvell,armada-3700-periph-clock-sb" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock-sb.yaml#
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock.yaml#
   Warning: Duplicate compatible "marvell,armada-3700-periph-clock-nb" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock-nb.yaml#
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock.yaml#
   Warning: Duplicate compatible "fsl,vf610-mscm-ir" found in schemas matching "$id":
   	http://devicetree.org/schemas/interrupt-controller/fsl,vf610-mscm-ir.yaml#
   	http://devicetree.org/schemas/arm/freescale/fsl,vf610-mscm-ir.yaml#
   Warning: Duplicate compatible "ti,omap4-dss" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/ti/ti,omap-dss.yaml#
   	http://devicetree.org/schemas/display/ti/ti,omap4-dss.yaml#
>> Warning: Duplicate compatible "ti,opa362" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/ti/ti,opa362.yaml#
   	http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   Warning: Duplicate compatible "fsl,ls1021a-dcu" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
   	http://devicetree.org/schemas/display/fsl,dcu.yaml#
   Warning: Duplicate compatible "fsl,vf610-dcu" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
   	http://devicetree.org/schemas/display/fsl,dcu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
