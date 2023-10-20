Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDB11EA96
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 16:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+Zw3ft+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697819781; x=1729355781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qMBFiTSU9196XMoptEv4Q0ri3spn1N+hLfaGZB97jZc=;
  b=D+Zw3ft+6ZVKlMhPDNrVyricO6pVDw9vtM7hDep2T391yktR0RaWB7/5
   N2ORRAQWXrLZSjizc0jSfuL7lsWDpnrF4m5dE0cIInLxthu2nZ1U9xTK2
   9Sz/ivFKlqnwzKasva5WAi8B3prMBMRVCtpAtxjd2N4tzcWCQPbc1t8B+
   kG0MoagGE5uZZxLE0tkanltEtlkBaAGII2bz/9ewy5JZRK49PddXhirh4
   x0IxnHTg1TGQLajMSmK3L4YJ1LrSKTWdbPyHUkrk4+1796FnTQsR8vMQD
   t3S7qHrN5WCXFNS8OLCFmIkKDOwxt1V0Dq51/DyiDfC0wc/4RkXJBYH6D
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="390417102"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="390417102"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 09:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="823306625"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="823306625"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Oct 2023 09:36:19 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtsTx-0003mC-2c;
	Fri, 20 Oct 2023 16:36:17 +0000
Date: Sat, 21 Oct 2023 00:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_sbi_dbcn_v4 26/42] checkpatch: WARNING: quoted string
 split across lines
Message-ID: <202310210034.wuXqSi2o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbcn_v4
head:   95d4d868d8dea80edceaacd07035646b10d76998
commit: fa55ccd86ac606987c36e5892771e4cc55d5a165 [26/42] irqchip/sifive-plic: Convert PLIC driver into a platform driver
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210034.wuXqSi2o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210034.wuXqSi2o-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#325: FILE: drivers/irqchip/irq-sifive-plic.c:628:
+	dev_info(dev, "mapped %d interrupts with %d handlers for"
+		" %d contexts.\n", nr_irqs, nr_handlers, nr_contexts);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
