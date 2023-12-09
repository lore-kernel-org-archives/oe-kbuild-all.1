Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6114713AE3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 13:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmWgPZEf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702128200; x=1733664200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/TkXd8NOhvltLgas/D0gWt1yV/LoSRo70slT1XMVeQA=;
  b=nmWgPZEfjBrD4ZCIGHd7ngF9MpKmd9/kt5+33Z4FKOV+X9r//8DujsXH
   ji9U6t83n7oyn/exCV0FUn/5y7OqCR6wxjBXm9pzkq+1W0ediyoAaPrHj
   TQr9s8I9TVrcAk1/9ntkdudZbMFXLb/JESEi7nzvvHQJo/2RZenxT3VIT
   ba9nOAP20HtB02cgmeEiIncRNlHuTIdfunXnePbFWAlXQE/nDP7V7wk1e
   GvHHqA7o2ibZjHQYqruo/KO2cUMaS9LgfPSTVIBrGyVDU8uWJkjY9E00B
   Q3aN3H7mcmAhu+uopQIKLCTL1G2PSJRpFG8eNM3N4jfLf4mX3d7KOfKBI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="480704940"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="480704940"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 05:23:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="842930290"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="842930290"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 09 Dec 2023 05:23:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBxIZ-000FNV-33;
	Sat, 09 Dec 2023 13:23:15 +0000
Date: Sat, 9 Dec 2023 21:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [djiang:cxl-hmem-report 2/23] WARNING: modpost: vmlinux: section
 mismatch in reference: cdat_table_parse+0x60 (section: .text) ->
 acpi_parse_entries_array (section: .init.text)
Message-ID: <202312092155.I071PJA4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-hmem-report
head:   d097ef73f93c1f0d8098ecc5bbaf396ce09c75e2
commit: 13b7d7a98b65d17c9e83c6e8335243aaff70bf55 [2/23] lib/firmware_table: tables: Add CDAT table parsing support
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231209/202312092155.I071PJA4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312092155.I071PJA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312092155.I071PJA4-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: cdat_table_parse+0x60 (section: .text) -> acpi_parse_entries_array (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
