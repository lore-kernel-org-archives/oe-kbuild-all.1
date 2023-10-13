Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD502C848
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 22:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFd7aN6h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697236259; x=1728772259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WetMu4JZfApdBjHnzyKpQ2mMfw5AdBfwRIho3/KeBes=;
  b=mFd7aN6hJ6ZExGYNSuf6amELW3GQKY5SaLLkZJG+x6qKohQeSwJXJCqM
   THYXBbFFyu8AgCs1Fs09S0y0lgLW0za5Uicbwt58r7t1sqjRol3OJWR10
   2NQJ2J0X3yKVy6eA5agwnHePDhzihWAw78JvpWkoX9VhBYf5G+BJ0nYcp
   KVboqQUhZjq32XBOXFSjtrBLNlZUrnVEYT//hwc0H3D1Pwy9aX7eAMbBP
   lrabt3pkIbeuz+YkAMCj9yrrMWmvC1O41r+btXaVy3iuPowJE3bHJRqXj
   8UnN8k8Be6MzCK2ioTpMPS8XkIFqduuQuaG0ZIjKJmLOWIsrLXvssDeDg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388131430"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="388131430"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 15:30:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871257783"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="871257783"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2023 15:30:56 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrQgI-0005TJ-2Z;
	Fri, 13 Oct 2023 22:30:54 +0000
Date: Sat, 14 Oct 2023 06:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [arm:aarch64/hotplug-vcpu/v6.6-rc5 14/33] acpi_processor.c:undefined
 reference to `arch_register_cpu'
Message-ID: <202310140628.2dMnLgkT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git aarch64/hotplug-vcpu/v6.6-rc5
head:   172379926d6aed66b10f7cf1c954bc40a3684241
commit: 2b4923da48db6379486c2025b68a41425757b10e [14/33] ACPI: processor: Register CPUs that are online, but not described in the DSDT
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20231014/202310140628.2dMnLgkT-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140628.2dMnLgkT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140628.2dMnLgkT-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/acpi/acpi_processor.o: in function `.L38':
>> acpi_processor.c:(.text+0x1a8): undefined reference to `arch_register_cpu'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
