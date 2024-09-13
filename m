Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BAF1D86D8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 11:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726226877; cv=none; b=EE7aUfyWD5KfBI5C4aUoOyRoMg0kYPxkTA8QseIv9qhM9fmpUDce2uXfGSt0WFnvHmVdsMcdnLSFrVv/Z39q1oVPz/F9I77ebKqjQrdOEyMKbmt02Rx5eWHsRwjHMwhUB3OJ/tt2MhhvNXOEj456AykYsQdOykoWsjAnE76JIEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726226877; c=relaxed/simple;
	bh=O+Cz5E51BuCBRQUQGGersaLbVdDJxGlFWHmIu1NiKcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BjUundD3ZtxyPFFvAlb1q2jT86YkIahHJOtQ00PqYJ/Be6HrrcEcxE+omabVE3Da1Ww4pcBKPRFfSYqC3NPzfSLEuaDYkFVSrh0dhIA5e6skhzRREPPu5dnWCzovqWm00pE4NwjhwVQZ+9VSdToimoCG1odFTacRRrj4nKj/5FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ncyfree5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncyfree5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726226875; x=1757762875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+Cz5E51BuCBRQUQGGersaLbVdDJxGlFWHmIu1NiKcc=;
  b=ncyfree5FXQ7bJPCttD0QWrJYwyHCaiVZW9FNJHd62EhRDKiKHW9BqJK
   qDSMLufEqRaIXDlvKHOyQSBysSbbSdBICtezfUYIBYwc+QzGfkOsPM3UU
   DjnBc8eUATOu/WIu/luGjqP+1DpXoK/ezuzIwWvj55TBeQDTFnWYyo6C8
   LKY6PzbWw46+EbW2zZ0nzRRIt2S+koGbafDxx3AhgEQ3LWx6R2/lNmk1T
   48Ck0xCbPuI6J4AbZQY0e43ChKtLcaFNyfZJGKmxSRQjWyLAeMYaNrZng
   lKjHMAoQJstU+Y3pCnsOoxLo/WLbNFUuBnyHiiDX8v4qzzgvcaB8OqefO
   A==;
X-CSE-ConnectionGUID: v6ITdkR8Si2JY3PhgyiZ4A==
X-CSE-MsgGUID: hSFyZnmcR7SyxygMo3pXSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25000066"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25000066"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 04:27:54 -0700
X-CSE-ConnectionGUID: onUN7YsWT7G3Uejw4h4LZA==
X-CSE-MsgGUID: XS2TTLeQSM63Ui0/yk2lsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="105479724"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Sep 2024 04:27:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp4St-0006SQ-16;
	Fri, 13 Sep 2024 11:27:51 +0000
Date: Fri, 13 Sep 2024 19:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11090/11210]
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: pcie-ep@33800000:
 reg: [[864026624, 4194304], [402653184, 134217728]] is too short
Message-ID: <202409131940.gkwdcLJ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   57f962b956f1d116cd64d5c406776c4975de549d
commit: b099c3ac1a08c08517c1ff05c52a7f5476020b02 [11090/11210] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
config: arm64-randconfig-051-20240911 (https://download.01.org/0day-ci/archive/20240913/202409131940.gkwdcLJ6-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131940.gkwdcLJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131940.gkwdcLJ6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
