Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D641FDA61
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 05:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754544143; cv=none; b=WDCEMPa4oXr1e35w8ZSAIhtaytHDIY96p5P+J/YXLLqcv/dYQ2RHytDMAjKW9nhHoWxvRYplQe6qqO36rLv05bqgzH1MT/s+nzSDUH6AWISeVwY0LxTaBAQuyfu602uakQiJoYWsBXyFSM3wa7P8UPTc/xJT81BfUnNffTfs6gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754544143; c=relaxed/simple;
	bh=pjCuhEIRcmzP2Nw6kgGFg9CKbtHon6RukC3cgPwFWD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZUBCzOlsOlrs/FEn4b/tyhJwCBoL6PNppeWgLAzdCVMRExoamt18yPMPkquqcZ6TY3LLeepRJ/52TKxU7jH4zCvvkWgsYy4/Df8g7qLskRmkW8ZhJw/x0x7LaJc8iySTT4QL0bjHBTDz2gguFfV+f9fyQPobdybCHyskYsYhaPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HnQIhOAK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HnQIhOAK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754544142; x=1786080142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pjCuhEIRcmzP2Nw6kgGFg9CKbtHon6RukC3cgPwFWD8=;
  b=HnQIhOAKxSZ4wUUi2einnf3slvIFPk75xJkppZ6js1HWPjrHkj7E6l9A
   W6zyxyu+8OdF0aKUrHLPlju+knPU5Z+XptfZ8tKN4DcI7fCpa8X1CUuJ9
   lRdrxAWvORcbDNoxNpabhC9BH5H7QRR4fXdQ3wyk2KMCv9zZruEGMyd+H
   XD4/QrOtyhdFWgFdDrAvOnYFiEClhcvvfd63hjp7CBpaCqUKiY1cdzkJv
   +8kalAGsEA6mOPwjVHkI4LQ57yRV5pQak0N6TRrxjvcxDT9DTM+IG+X1t
   P7JiK9BXJmcyr+TH+/0xAJVlkQ8LAGgccbW5YNb8xxD8HmBmpWqzBT5Xu
   A==;
X-CSE-ConnectionGUID: xm+9N1fnQqy3Esp8g+2KCw==
X-CSE-MsgGUID: sN7eX3DmS+COedtdPgm3pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56949677"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56949677"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 22:22:22 -0700
X-CSE-ConnectionGUID: A+j/nxHrT36crbJ/h39DbA==
X-CSE-MsgGUID: gGJ1r8uuT+CzoOrlitqP6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="170339459"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 06 Aug 2025 22:22:20 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujt50-0002PQ-1C;
	Thu, 07 Aug 2025 05:22:18 +0000
Date: Thu, 7 Aug 2025 13:21:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt-convert 19/801] Warning: Duplicate compatible
 "fsl,vf610-mscm-ir" found in schemas matching "$id":
Message-ID: <202508071324.WHDjg9Yl-lkp@intel.com>
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
commit: 9f6ebe12c1044937f8859d70bf089d41d715063f [19/801] dt-bindings: arm: Convert freescale/fsl,vf610-mscm-ir to DT schema
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071324.WHDjg9Yl-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071324.WHDjg9Yl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071324.WHDjg9Yl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Duplicate compatible "fsl,vf610-mscm-ir" found in schemas matching "$id":
   	http://devicetree.org/schemas/interrupt-controller/fsl,vf610-mscm-ir.yaml#
   	http://devicetree.org/schemas/arm/freescale/fsl,vf610-mscm-ir.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
