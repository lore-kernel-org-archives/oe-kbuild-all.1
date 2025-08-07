Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45BE2E36EC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 08:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754553721; cv=none; b=sKEBT9m+Tc3//lYvDQAtmoM9a3o1bPED8IUtFcIhmxw10u6A5pvUyrOtn0Urbfmt/vDhK9jWSQR8Jw16NMZ+n8G0CNJKakmPefSIKdpjIE15tVUM6lGQOHUCaSQd86o/gGI4aVJCZ7CCtQyFFBYwkN0S+6A6/orxI3DXxg2jxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754553721; c=relaxed/simple;
	bh=Zxa+JbmEAoJSGyTwf3KyA0BGYHCK/FS7oXcA6RCd2dE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lJ+dHvYWkskmKMTLO3ARBsTRzvz7g2dGJvyYQVET7su73Mrh47M2LxAWLfIgOCO4F0NkTwTo0sDQ8K3NxNa3ucI83TOcU5CVr+AvV1XiNBr2elJ803mUFmZU5KttdFD7R7Z8YR1kScPcKJEfV8OdVksrRidGxvryN7RbWUGVOTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FG4xN6wv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FG4xN6wv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754553720; x=1786089720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zxa+JbmEAoJSGyTwf3KyA0BGYHCK/FS7oXcA6RCd2dE=;
  b=FG4xN6wv30Fx8NiY+RCM7+UMmmlEJHmFs9sRryqHPN7mc4rfvrHXik70
   COjFlpT6u+cR5hkn3gA7dCIP1PidXXCrhanqsTMUWEjIT93mmM3vZizj7
   HP7wb993U75Gx/LFRboGftB2ezILnD5VwbYWyGOXn4y0BqIo1AdN3FY0k
   CEYlULGyyYrh2iP8mJUCFzR74QviB2XMXmhe2LgfmtQEpwZhsPpgC2V24
   SJOsILnrLiAApQzUtRpW1z53k7jyYUAYSZmBd/aTkB+KeajLXKYMCYwk3
   JjSCRtZm5U5n2TKm9PPByIjTfbvku6JC1RhQmb6ELagXZBMtMwBz0g6zi
   Q==;
X-CSE-ConnectionGUID: kEP0w/BCTVeTpEhqgo7w0w==
X-CSE-MsgGUID: zzBq7G4nQbif9KnAq8BZvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68334765"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="68334765"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 01:02:00 -0700
X-CSE-ConnectionGUID: hgN8YCQHQbqgUC5v0+vU9Q==
X-CSE-MsgGUID: XItPZeFnQqiOmgf/86R8PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169251203"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 07 Aug 2025 01:01:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujvZ5-0002Y6-2P;
	Thu, 07 Aug 2025 08:01:40 +0000
Date: Thu, 7 Aug 2025 15:59:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt-convert 131/801] Warning: Duplicate compatible
 "ti,omap4-dss" found in schemas matching "$id":
Message-ID: <202508071546.h2wRUZE3-lkp@intel.com>
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
commit: 8c1a9d6f1ab1d2e6fd82273221fe308a70017680 [131/801] dt-bindings: display: Convert ti/ti,omap-dss to DT schema
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071546.h2wRUZE3-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071546.h2wRUZE3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071546.h2wRUZE3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/devicetree/bindings/display/smi-sm501.yaml: edid: missing type definition
   Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix
   Warning: Duplicate compatible "operating-points-v2" found in schemas matching "$id":
   	http://devicetree.org/schemas/cpufreq/operating-points-v2.yaml#
   	http://devicetree.org/schemas/opp/opp-v2.yaml#
   Warning: Duplicate compatible "marvell,armada-3700-periph-clock-nb" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock-nb.yaml#
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock.yaml#
   Warning: Duplicate compatible "marvell,armada-3700-periph-clock-sb" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock-sb.yaml#
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock.yaml#
   Warning: Duplicate compatible "fsl,vf610-mscm-ir" found in schemas matching "$id":
   	http://devicetree.org/schemas/interrupt-controller/fsl,vf610-mscm-ir.yaml#
   	http://devicetree.org/schemas/arm/freescale/fsl,vf610-mscm-ir.yaml#
>> Warning: Duplicate compatible "ti,omap4-dss" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/ti/ti,omap-dss.yaml#
   	http://devicetree.org/schemas/display/ti/ti,omap4-dss.yaml#
   Warning: Duplicate compatible "fsl,vf610-dcu" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
   	http://devicetree.org/schemas/display/fsl,dcu.yaml#
   Warning: Duplicate compatible "fsl,ls1021a-dcu" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
   	http://devicetree.org/schemas/display/fsl,dcu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
