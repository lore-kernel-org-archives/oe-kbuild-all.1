Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C7B1DFF2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 13:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyigYz2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696945765; x=1728481765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LQctcXMDHN/WotrOPXjOP430w1cu271qBo2NNhWho4s=;
  b=QyigYz2S7hTiAi9bPHN3p7Hk8UJNHCIGX9o6Jmq9wzE9KMqa+kJruUoi
   wT9k7wG3vQXblZP/abvCusTu63EgCt4yK+rA6CCVB7DYMPLDcgM0S9MhR
   51LzaoI2rrONhMs8DtuSRJd60koDIpuJdmyrNgMzZCGOzSj48/PTYokuH
   +CMBntFSkDSoAQqjSS7gjJ39H4TL6l8ddG9xGnvtEqaJORcdJSzYe/6Cz
   TtJaarmfqVsKITt5CxHEovUVgal/CxpMz2PvF/v9JDWWRo/fRWlzrzdBp
   feky2NVNsDWU7IT/ZHGoK9Vt0WkwEMExfC3b4mIO7dTdiNaROBQrD2ySD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="5962434"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="5962434"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 06:49:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="823788515"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="823788515"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Oct 2023 06:49:16 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqD6o-0000Vo-0K;
	Tue, 10 Oct 2023 13:49:14 +0000
Date: Tue, 10 Oct 2023 21:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 10/38] checkpatch: WARNING:
 Missing a blank line after declarations
Message-ID: <202310102108.UMZsG1Rt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc5-esp32
head:   224f43124c24326eb21de553984a58d8528a48d0
commit: 9c252d1433dab3a668159a0d033972cf41efa367 [10/38] irqchip: irq-xtensa-pic: add support for domain hierarchy
reproduce: (https://download.01.org/0day-ci/archive/20231010/202310102108.UMZsG1Rt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102108.UMZsG1Rt-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#112: FILE: drivers/irqchip/irq-xtensa-pic.c:131:
+		struct irq_data *d = irq_domain_get_irq_data(domain, virq + i);
+		irq_domain_reset_irq_data(d);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
