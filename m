Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA281370
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 00:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720831560; cv=none; b=tf72SDvNjwCFM+lmnYogeVJ0r3QwBqW/aC8ErpuC4sPmUr5UWnJGtsJkLr4u3ApaY9sAPyWRssBaULMYE9giV/dg6AUfXvdh9kmaFbubKOUMbwAu+SL/gPJz8e0PpToiNecs4hWi4O8xcvtkdB46Q7S8hF3pmhipZ9/4gC9bSEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720831560; c=relaxed/simple;
	bh=7Xi0YGnPP7HcAs58P+3KetQ9lfAky9kDQM9uHsNQi+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u0ZmqVHWss96h337r2HNnPTLdsuM94EtzbtMZ0Gu7HSf70Qzp//ANhGAJp/v9n5LhbJ+kd3UhL51ho+BjJt2GjnsWO/yolmlvYEny7SoZs8NDSZAksh98uBDuPgySav93r04TJWljnFsHcukjKTuC7R+4LV4dBbePhs9jCsuLWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCKEU5jI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCKEU5jI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720831558; x=1752367558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Xi0YGnPP7HcAs58P+3KetQ9lfAky9kDQM9uHsNQi+Q=;
  b=XCKEU5jIRVN/OT7+kBdGf6zpkU3LxABhbstDBYUmyFKJ4kC1ALzHdSBm
   pvOiJOz154WhrWdF2cg11u2NxbuWPfxx7JrlBy6bSg4hbKLAta3ICL2tA
   OE02zBqI53D3GgJL8vFM4VKGmlyPthr5hxxqO/x8s83I4hsZLa1f8k9hI
   JNp6B6pSLpMFpFivKFWTIrptdGzuRZ4fsTQcKsFkoJb5P345r+DmXoNH1
   Zz82q7uBRm1W26zVcpsSmmZ3GX7ksM3dBCVaTNCR3KGxsQ+E66jkz6QJ8
   nvOwZMVIdaAKOCWPQ3TEm7Vo2WvI/6QdGgdM2kNHoJADCu5PFoc5zXqjQ
   w==;
X-CSE-ConnectionGUID: VgHJuneXQXWP2YYZb5RWSA==
X-CSE-MsgGUID: EpOccQkiSYKyGBgJLCtnIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="40822428"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="40822428"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 17:45:57 -0700
X-CSE-ConnectionGUID: fZ4BFwLaSeiXDmxlBt3f0w==
X-CSE-MsgGUID: wm4zO1rmRKqjHJc/mF3Xtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="49150568"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jul 2024 17:45:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSQtd-000bUf-2G;
	Sat, 13 Jul 2024 00:45:53 +0000
Date: Sat, 13 Jul 2024 08:45:08 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 10945/12880]
 arch/powerpc/boot/dts/fsl/b4420qds.dtb: global-utilities@e1000: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202407130834.LU8N7pGT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fe121b622825ff8cc995a1e6b026181c48188db
commit: 0d796569e13b7b2d2a98880d3f0968dff8105f07 [10945/12880] dt-bindings: clock: qoriq-clock: convert to yaml format
config: powerpc-randconfig-051-20240713 (https://download.01.org/0day-ci/archive/20240713/202407130834.LU8N7pGT-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407130834.LU8N7pGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407130834.LU8N7pGT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/msi@41c00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,b4420-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,b4420-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: global-utilities@e1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,b4420-clockgen', 'fsl,b4-clockgen', 'fsl,qoriq-clockgen-2.0'] is too long
   	'fsl,b4420-clockgen' is not one of ['fsl,p2041-clockgen', 'fsl,p3041-clockgen', 'fsl,p4080-clockgen', 'fsl,p5020-clockgen', 'fsl,p5040-clockgen']
   	'fsl,b4420-clockgen' is not one of ['fsl,t1023-clockgen', 'fsl,t1024-clockgen', 'fsl,t1040-clockgen', 'fsl,t1042-clockgen', 'fsl,t2080-clockgen', 'fsl,t2081-clockgen', 'fsl,t4240-clockgen']
   	'fsl,b4420-clockgen' is not one of ['fsl,ls1012a-clockgen', 'fsl,ls1021a-clockgen', 'fsl,ls1028a-clockgen', 'fsl,ls1043a-clockgen', 'fsl,ls1046a-clockgen', 'fsl,ls1088a-clockgen', 'fsl,ls2080a-clockgen', 'fsl,lx2160a-clockgen']
   	'fsl,qoriq-clockgen-1.0' was expected
   	'fsl,qoriq-clockgen-2.0' was expected
   	from schema $id: http://devicetree.org/schemas/clock/fsl,qoriq-clock.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,b4420-rcpm', 'fsl,qoriq-rcpm-2.0']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,b4420-rcpm', 'fsl,qoriq-rcpm-2.0']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/dma@100300: failed to match any schema with compatible: ['fsl,elo3-dma']
--
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/msi@41c00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,b4860-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,b4860-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: global-utilities@e1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,b4860-clockgen', 'fsl,b4-clockgen', 'fsl,qoriq-clockgen-2.0'] is too long
   	'fsl,b4860-clockgen' is not one of ['fsl,p2041-clockgen', 'fsl,p3041-clockgen', 'fsl,p4080-clockgen', 'fsl,p5020-clockgen', 'fsl,p5040-clockgen']
   	'fsl,b4860-clockgen' is not one of ['fsl,t1023-clockgen', 'fsl,t1024-clockgen', 'fsl,t1040-clockgen', 'fsl,t1042-clockgen', 'fsl,t2080-clockgen', 'fsl,t2081-clockgen', 'fsl,t4240-clockgen']
   	'fsl,b4860-clockgen' is not one of ['fsl,ls1012a-clockgen', 'fsl,ls1021a-clockgen', 'fsl,ls1028a-clockgen', 'fsl,ls1043a-clockgen', 'fsl,ls1046a-clockgen', 'fsl,ls1088a-clockgen', 'fsl,ls2080a-clockgen', 'fsl,lx2160a-clockgen']
   	'fsl,qoriq-clockgen-1.0' was expected
   	'fsl,qoriq-clockgen-2.0' was expected
   	from schema $id: http://devicetree.org/schemas/clock/fsl,qoriq-clock.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,b4860-rcpm', 'fsl,qoriq-rcpm-2.0']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,b4860-rcpm', 'fsl,qoriq-rcpm-2.0']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/dma@100300: failed to match any schema with compatible: ['fsl,elo3-dma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
