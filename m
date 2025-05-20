Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B282673BF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 10:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737330; cv=none; b=YJ6IWwslyszy6S1W0J+ZPCoMluNk+enOXekU/z3FrQ6N3hfc/SNPyqFiDd9VM0iZT4hHDKs4h7ZmTMD8vGQK9XlfKmsk4jLI00kZa16OkkZ9g+C0UK+cJ4WElimBUZ0SzTmHnQ6gtP/4Y26RjiDGF8JV2ChUfRtSKXVkx9Te8ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737330; c=relaxed/simple;
	bh=dXo6SGuXbAF9WMc+a1rAec7JrIlHarRG0aqXbcVpfTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RUhOeJ3ffeENUGKJfGPZYCjhrcR70FPLtLEP9HuNtiddnPDLRMYFHhu1wxOaxOo3RbESMOnOamjtDgfKyfudpklRsUCTalx7c6b8kyD6PDuFH1yvXTk8n5FAwjOF8/vr/DQijMD6n0xEUYlJ8fgxd/xHUIjRRHqz/r7XxfIgmk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d8tiRG1l; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d8tiRG1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747737326; x=1779273326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dXo6SGuXbAF9WMc+a1rAec7JrIlHarRG0aqXbcVpfTA=;
  b=d8tiRG1lXsjNMrxg5S1AWnj8mFoRB7gMFbSh04pZqrb4rqlqb29SGPMO
   l+slnWcSzlA3iEUADu1nBE/iAavyUwh6u/h76yxDOufv804tODyJlX6B6
   kdOvfKzgd7GfZvWHNVsFThDAGPRRcRJf0e/IyiLPa5OWlvrP7iZMFLpRN
   aGpurog2VbjNfjZVw22j6tSEGR3e+lOdt57Z4QhFj4sJcuCYVPhVeZLrD
   8Pz5j8KrpwJXpqqgaj/ZuMNjpua+COKIuRyBVIeP9EEZEtx4iaDQijp8F
   8DWULbIEVR/YIhI51tIi+t7IXBsCzsI0vFW8+bb14be/IdWFMbAHGj/ek
   g==;
X-CSE-ConnectionGUID: pX1manszQUu7xY8fvFjZgQ==
X-CSE-MsgGUID: k1JXKSxnTaaSCjpFpYIK5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49567336"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49567336"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:35:25 -0700
X-CSE-ConnectionGUID: RRSV9netQiGtdhWTfUcTcw==
X-CSE-MsgGUID: MM8iGlnhTT+9CJk6qzb7mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144776602"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 May 2025 03:35:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHKJc-000MSO-0m;
	Tue, 20 May 2025 10:35:20 +0000
Date: Tue, 20 May 2025 18:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	linux-doc@vger.kernel.org
Subject: [mips-linux:mips-next 19/19] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
Message-ID: <202505201832.NNOJ4E78-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-next
head:   faefb0a59c5914b7b8f737e2ec5c82822e5bc4c7
commit: faefb0a59c5914b7b8f737e2ec5c82822e5bc4c7 [19/19] MAINTAINERS: Add entry for newly added EcoNet platform.
reproduce: (https://download.01.org/0day-ci/archive/20250520/202505201832.NNOJ4E78-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201832.NNOJ4E78-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1801: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
