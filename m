Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B161B7F4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 04:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712981231; cv=none; b=qCfSpMfIQpkDeUb0MQePaohlKKk3Z6d2Tss2afuGge6HYfWW5tQQ1ZVCUmB4mR4gJLdSEF/PHbmKWWYKXmKb4Z2yAihgl+amacBEy5ftvJe4pirCUPBovGTj2Fo9boW3k/13k9fGMFWc1B6PuGv8DI9Lxcb/BKM+LFJ5eD8m9iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712981231; c=relaxed/simple;
	bh=1EY3IGtwMkOFw0TklQ7aSbe9h/hYj+kwKN2R737hg6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jsEiU94oHMIOaExm2tvKnS8yv1kYs8PXfxTcifgyOcdVs0jKkNoVO+I8k7KJmPUJ+OWFVbW7huKqFQ+DtMMb5oDYcXvQ9iCvF0iH2MRhr+yJxMZa/64BsT23kJhMD0IbI0in/JB3tnPpZIjHgfyYknfd4DOOCS/dsbQnFuEMzwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSaPyUeA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSaPyUeA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712981229; x=1744517229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1EY3IGtwMkOFw0TklQ7aSbe9h/hYj+kwKN2R737hg6Y=;
  b=XSaPyUeAWcZolcfPRIreupg1G+1AbuZtYlwMXOdotDQTOPIRgBWfAeqo
   3y28LB3bx9jOROHWxv5TT1soMCcl3ikPKCrAnlkqPF7Fd4lHdFLJHCN7j
   DFa1I54mnhAqoZHBtLE1ta9zlMlk1U3kLPJWDUQhMgyPUknVVuRWfN41B
   9F3G+8oCC5qxMXMzvxFdD7kO6dl5g4WHoyYaogDIdtSMsjrDiH0ydd6Az
   CuTpa/NuKl/5FACV8XY4D+1enAwkamqDEmZxTn9fT4r422th3ObOzK1jq
   +OFgO25tQBRel8Sh6OwdkivEMKvWVMY3eX0acUyPEOVvwx0BuvwK7cWxu
   g==;
X-CSE-ConnectionGUID: o7shRs+mTTeZDdz5fkXokg==
X-CSE-MsgGUID: Q43huTq5Te25IseDA8oqvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19050386"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="19050386"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 21:07:08 -0700
X-CSE-ConnectionGUID: pJXlKOTXTwSyoIz1iFm+2w==
X-CSE-MsgGUID: jr68S9LXSzi1kmR6an8ueA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="21397035"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 12 Apr 2024 21:07:07 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvUfQ-0001hY-2I;
	Sat, 13 Apr 2024 04:07:04 +0000
Date: Sat, 13 Apr 2024 12:06:51 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 2630/6010] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/reserved-memory/qcom
Message-ID: <202404131117.Sr7Fe9G5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ed46da14b9b9b2ad4edb3b0c545b6dbe5c00d39
commit: 8b90269ee6d7f8e714a1ba57a85444a67b9f0104 [2630/6010] MAINTAINERS: Split Qualcomm SoC and linux-arm-msm entries
reproduce: (https://download.01.org/0day-ci/archive/20240413/202404131117.Sr7Fe9G5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131117.Sr7Fe9G5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
   Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
