Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F46B273D4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jpgxu28Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697115607; x=1728651607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KCph8VGfHRF4BLptr4XG667ePTXQcupxtO7nSHytZis=;
  b=Jpgxu28QTeOeSZK7S0BXUUA9I4q088qDO9nh5Ic2x2SaaorUKMl/Oez7
   7LbkXFqJdqnpoyG5jNBYaLtm50TRm58OiSJXFjuRBgayLPAujRKxisix5
   +EXo5+hElZNdVrNJGi/I8J/NUxGxCtTWyc52FiYmnMBHnfvqMD5pzOIpZ
   oNoRXocV3xaJQmInCcjE6mm8+CeRmlX8E85qaTwsb+xQ/eL4CX3ChtfiH
   7U/GkeX6esjWHDiO/Av6T2fHCpGZFwJvN66JKtN2BBkRq2Y2GmrCGC0yb
   1c7KAWqRSpeoMBHPkwHhM5i7Q3kvZXDrE9pjjzZ98BtU7Y2AAxfnsJwpF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="369977118"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="369977118"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 06:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="704150324"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="704150324"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 12 Oct 2023 06:00:02 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqvIG-0003SK-0T;
	Thu, 12 Oct 2023 13:00:00 +0000
Date: Thu, 12 Oct 2023 20:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm:ktext 3/20] checkpatch: WARNING: please, no spaces at the start
 of a line
Message-ID: <202310122011.vD7J81PV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext
head:   7fa946ce05c273d5ff092c814efe64978e5faf45
commit: e4881183f9059ed8aaa3f16857fd9e0c1db5c168 [3/20] arm64: place kernel in its own L0 page table entry
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310122011.vD7J81PV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310122011.vD7J81PV-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#72: FILE: arch/arm64/include/asm/memory.h:57:
+    (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \$

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#73: FILE: arch/arm64/include/asm/memory.h:58:
+    (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
