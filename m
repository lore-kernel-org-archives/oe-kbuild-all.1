Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E601A2395
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 09:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736329977; cv=none; b=EGXFwJSkayvfXbf52A+snPRJyi54ya7rhDBpDHT2reX6SXGzhLjXeFCkozqz8r/mmUhtO7Zd2gKKkokA6DlX83CwXpzWYBqq56XaOScPgCaGhvG4laW/Jr1nFdUZENJr78jdfpr4JfsrpabH3D64As1mAaG87shs4VCnBRb9GtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736329977; c=relaxed/simple;
	bh=f3AqsAeaVs8IrFNKKzvU71sRcsSXET+u91qXy5XWUyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bq4KQ4khQAdigbBJiaJmuxP+sPWxZRPafzLqMFrYel525MC8E9cNWdpgXRM2vWkucX/oN0kHH6N1ru1d08B88mwjfaVCwFYDfQhIh/JUsiSdafGlvEN5bp7D5YABRhR5hEfnTbcWV0gbtAVZy16VCqLesUdviIy+WpPCKbwyLLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWmnjOjA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWmnjOjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736329972; x=1767865972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f3AqsAeaVs8IrFNKKzvU71sRcsSXET+u91qXy5XWUyU=;
  b=iWmnjOjAlGtoxpWZdGsPaYDBDoBEqj+9yxWqR7BBck5sQ/PYgc0sdcRB
   Vr++bQOBYCkZsyWOwZGa09nHvNWiuRoTtrZr7S32gZGhZCMDjeTZJTQdv
   52eFWy2crTg3g8gZEKS1uKBJvou+hbuq71qidw16yqQCRfs0kcA8S9jh0
   CHRIjML27wpghaNl4uNTxOGPnNkNWJIROxbjNrcbfZPRe+ANf+xwpe32y
   +kc77uVmrPR0ME1uf1dVHm0n5q0s8wAWAAmL5pb/Igf+xqYOeD3cUrTZc
   1gHXDg3x5S/Ycg+3C37LxgdP0Zdtwv0NcUpKT1Z4oqsK0Lp1oJ/RVcS8G
   w==;
X-CSE-ConnectionGUID: SJAjquXgR5KHv+a8yYFLfw==
X-CSE-MsgGUID: i6rSSkc6RHGlwbspZOqOMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47903993"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="47903993"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 01:52:51 -0800
X-CSE-ConnectionGUID: f1oH634vQA6Cx4iZOCv8jA==
X-CSE-MsgGUID: E8OZzD+8THCE08CpIttQWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126329246"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jan 2025 01:52:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVSk4-000FtX-0w;
	Wed, 08 Jan 2025 09:52:48 +0000
Date: Wed, 8 Jan 2025 17:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6698/6768]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: interrupt-controller@b220000:
 compatible:0: 'qcom,sm8750-pdc' is not one of ['qcom,qcs615-pdc',
 'qcom,qcs8300-pdc', 'qcom,qdu1000-pdc', 'qcom,sa8255p-pdc',
 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc'...
Message-ID: <202501081729.5vR6A0bs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7b4b9bf203da94fbeac75ed3116c84aa03e74578
commit: dad7f74076e488d91e21a8da68d198b14c2530c1 [6698/6768] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
config: arm64-randconfig-051-20250107 (https://download.01.org/0day-ci/archive/20250108/202501081729.5vR6A0bs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081729.5vR6A0bs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081729.5vR6A0bs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/dma-controller@800000: failed to match any schema with compatible: ['qcom,sm8750-gpi-dma', 'qcom,sm6350-gpi-dma']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dma-controller@a00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
   	'qcom,sm8750-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
   	'qcom,sm8750-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
   	'qcom,sm8750-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
   	'qcom,sdm845-gpi-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,sm8750-gpi-dma', 'qcom,sm6350-gpi-dma']
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: interrupt-controller@b220000: compatible:0: 'qcom,sm8750-pdc' is not one of ['qcom,qcs615-pdc', 'qcom,qcs8300-pdc', 'qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,sm8750-pdc', 'qcom,pdc']
--
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/dma-controller@800000: failed to match any schema with compatible: ['qcom,sm8750-gpi-dma', 'qcom,sm6350-gpi-dma']
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dma-controller@a00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
   	'qcom,sm8750-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
   	'qcom,sm8750-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
   	'qcom,sm8750-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
   	'qcom,sdm845-gpi-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,sm8750-gpi-dma', 'qcom,sm6350-gpi-dma']
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: interrupt-controller@b220000: compatible:0: 'qcom,sm8750-pdc' is not one of ['qcom,qcs615-pdc', 'qcom,qcs8300-pdc', 'qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,sm8750-pdc', 'qcom,pdc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
