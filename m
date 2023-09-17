Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9697FF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Sep 2023 02:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694919591; x=1726455591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zFJ69BsoEQxmnE+lc1TuECaZQUCSm13Pkh/6KqsdDwI=;
  b=iSNtmS8RbOtQ7DdW3wtMOCRcD9pHOa5h4i74tEwxJwqlN9336ptzPRKk
   L6noUWaRUACF501BpkSzFe8En/vZFOyA0Xedjp2dW8oNRT4obcbBHL3U8
   xJonUOSKvi0dvgRGg8C6/CWXwHTSRAYIzTJfxtBygIL1BOHEABs74IFLg
   ChnN1WfHKJRp8gktm6vy3oeQuKE37etHxIY0QYjnhcTjuyINY4sIA6PX8
   u5y6N86ewp69Mj0QO+k7P96df6RKXpD7uN3NYx4Utxip/tMLKWf9Zf9HC
   3AH/0SYeB7Iq1MwEo0OinxycI41c1GmmnaFhqDyUDBI0paGn9vkPPgNLM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="382202305"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="382202305"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 19:59:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="738757666"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="738757666"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Sep 2023 19:59:49 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhi0g-0004sS-2x;
	Sun, 17 Sep 2023 02:59:46 +0000
Date: Sun, 17 Sep 2023 10:58:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	linux-doc@vger.kernel.org
Subject: [avpatel:riscv_acpi_b2_v1 75/85] htmldocs:
 Documentation/riscv/acpi.rst:13: WARNING: Title underline too short.
Message-ID: <202309171037.brRrJwEV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v1
head:   20e056e5bd7a90eb271eb43d1138de5bdb7bf20d
commit: a77c65d23d4bf7220d44ef8227705376d433b22a [75/85] irqchip/riscv-intc: Use swnode framework to create fwnode
reproduce: (https://download.01.org/0day-ci/archive/20230917/202309171037.brRrJwEV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309171037.brRrJwEV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/riscv/acpi.rst:13: WARNING: Title underline too short.

vim +13 Documentation/riscv/acpi.rst

    11	
    12	Interrupt Controller Drivers
  > 13	=======
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
