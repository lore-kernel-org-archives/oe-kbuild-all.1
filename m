Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F7613AF6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhTdn1ZL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697795523; x=1729331523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nVn1Qc/A1cvcGK9wDdgvG8yXHkIcxBUTdkT/dS3zELo=;
  b=RhTdn1ZL/DsGz3VtZRqXl8WDPzFiBuw+ASEedhmwQ5sGDCsn2iARNBY3
   33Gi107sMIJp8x/LqBpv0ILiNXuOJ80ubDQ5NzdNXYoqMpmBvv/M4AWkl
   uJsdMTV+z/jaBrZWZfHN7vznNMbnuUCkNiCo7TjKNGJVrhpvLF0ylEZ5t
   FK0p61U5ZOwwSCz2jYKtx7QXdCkoa0aTBfAaABrD7S4NSMnk5o11RUw1i
   ri3G8TkKlFrQ6NQZYEjJh8dCrGa9WrHcTbZq1OXr50gR33jgbehli182u
   ebBRcLH+MUXsWU5OvcbXzOQyjVIV72tdYpiUFFAsDb77v2x1wqPWIPCUN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="390352386"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="390352386"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 02:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="733909188"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="733909188"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Oct 2023 02:52:02 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtmAi-0003Lw-09;
	Fri, 20 Oct 2023 09:52:00 +0000
Date: Fri, 20 Oct 2023 17:51:44 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_sbi_dbcn_v3 21/42] checkpatch: WARNING: quoted string
 split across lines
Message-ID: <202310201742.AeqGx4XU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbcn_v3
head:   3fac62e1a8dcd108cabe190f1cd7730e8af1f605
commit: 971d777fc083b572da6a5e30c1b1222006678ded [21/42] irqchip/sifive-plic: Convert PLIC driver into a platform driver
reproduce: (https://download.01.org/0day-ci/archive/20231020/202310201742.AeqGx4XU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201742.AeqGx4XU-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#325: FILE: drivers/irqchip/irq-sifive-plic.c:628:
+	dev_info(dev, "mapped %d interrupts with %d handlers for"
+		" %d contexts.\n", nr_irqs, nr_handlers, nr_contexts);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
