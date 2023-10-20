Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A813550C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 23:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwepizQw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697845300; x=1729381300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aPWX+OGk/jXn3xdhid9y6Np8R/YsWmOHK+epmm6yxS0=;
  b=bwepizQwIdnmgxBjVkoWJwX9hrd95jwFalXUozE9czpeYvq7WWzML1no
   nJdIoLibPoDHgxcLXf87Pc+gwc+kqa293VbWUKI42peH7oW0idWETUZPv
   wtsoZIyVf9g/WoFZiwxT2mqYhyZC+f6m2xM4yacrSO3Fl/FhefuXJBfJH
   K09jrABIlS9zY4sg/TM5Gm0G1rlqElL5+QIATHas/eMGY8GtXbgbF0JFr
   b9UsZCWfXfG4nuUzRnuSH8Ducxgd/LRFmnE7KI+PXVakyq9zjYVZXYwdU
   8204MPa/39kiPAQWfhj9cdMuNTq2l1S/PdrOxdnzG7TRtMaW4y3EAiuGJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="389445378"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="389445378"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 16:41:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="707372665"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="707372665"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Oct 2023 16:41:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtz7V-00047K-19;
	Fri, 20 Oct 2023 23:41:33 +0000
Date: Sat, 21 Oct 2023 07:40:59 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc6-esp32 13/43] checkpatch: WARNING:
 suspect code indent for conditional statements (16, 20)
Message-ID: <202310210722.nJT0Pb9m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc6-esp32
head:   7b60fbaf629519456a4de1b76bf9edfb331ffb50
commit: 036b41b47ea27912b4dfac0940ac2f548d26d2fe [13/43] WIP: irqchip: add driver for the ESP32 interrupt matrix
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210722.nJT0Pb9m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210722.nJT0Pb9m-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (16, 20)
#119: FILE: drivers/irqchip/irq-esp32-intc.c:63:
+		if (fwspec[i].param_count != 2 ||
[...]
+		    return -EINVAL;

WARNING:TABSTOP: Statements should start on a tabstop
#121: FILE: drivers/irqchip/irq-esp32-intc.c:65:
+		    return -EINVAL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
