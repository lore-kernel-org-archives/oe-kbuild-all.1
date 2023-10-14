Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7A91CF80
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 18:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5UagbBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697309008; x=1728845008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ahSehQzi9MzDQEq7Utruutrdo7amqrX9TJsafzRNkUU=;
  b=N5UagbBsmR3nU+8ci5duEmoTL9R/gM4FiavdnDhB23ovvjxMITzCqnzy
   iTGypVii9GRAWJ3l/7PXWFQHIJOFZMqwMeINMNp6/e7QpGI7j7Tlsb+wy
   27FGL61JNjyCsK0DS7koMUVUHCh4CfgBdjXioM4wNbPfu4b6WYnH5l1ro
   RAI61vr2trqEhoru2+80xWLuVpBv5KW8BuDQCr1PKi2TvTRRPKm8YD0QN
   38rrfcS7F0conCICzRgJTB1t+C6RVqkoVKbiLR3BAkSE4tEbhxpQd+t1b
   yE4AdkHapz2bocvGzvr54SYL8x5vG7FMI5mQgAj9Y3eYzZA6YPTzz45Mz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="471573423"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="471573423"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 11:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825437494"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="825437494"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Oct 2023 11:43:26 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrjbf-0006WP-2H;
	Sat, 14 Oct 2023 18:43:23 +0000
Date: Sun, 15 Oct 2023 02:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_sbi_dbcn_v3 21/41] checkpatch: WARNING: quoted string
 split across lines
Message-ID: <202310150205.a0vK7zUq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbcn_v3
head:   4456810ee10bd8cd15905fd0f2e54e697e41b7be
commit: 971d777fc083b572da6a5e30c1b1222006678ded [21/41] irqchip/sifive-plic: Convert PLIC driver into a platform driver
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150205.a0vK7zUq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150205.a0vK7zUq-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#325: FILE: drivers/irqchip/irq-sifive-plic.c:628:
+	dev_info(dev, "mapped %d interrupts with %d handlers for"
+		" %d contexts.\n", nr_irqs, nr_handlers, nr_contexts);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
