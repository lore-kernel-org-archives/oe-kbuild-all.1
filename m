Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5797E1B27C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 15:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dc0Na+1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697210497; x=1728746497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PQszb18M4NsntSoGEar/MFkdic7J8FjSmnvZa2ZDyXM=;
  b=Dc0Na+1YkHea72ZGnoFGJvvXPnk8SqLRyMQLBgWTVDzKE9FfS2dgIAv3
   zqkLtd6RC9HbQSIyZOawMyWkXeyqG4wD9maAwMLmYx/2AwbuVqb2K5a64
   WTa21A5o57GeeqvIvEouuoljRTMIQFDeR76t8TUMmfSZgst7e9/57uq3j
   xJZclTynpeseGNvAkCeRqVHoe+7N3MWuZxi0SWWtJNv4Qf9XSf32AaRJv
   A8K5oiY5ZrU5+GqdBia4n74SV6i1AHyPRbrh3DPaSLMzg212suDpBUWHN
   qV/zOIqME9nonGBDPKdlS1XteqHv1qwtAVrR57Zh52bghsyB18pdV/ekt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="375555097"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="375555097"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 08:21:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="704679110"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="704679110"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Oct 2023 08:21:35 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrJyn-0004yT-0b;
	Fri, 13 Oct 2023 15:21:33 +0000
Date: Fri, 13 Oct 2023 23:21:02 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [arm:aarch64/hotplug-vcpu/v6.6-rc5 31/33] acpi_processor.c:undefined
 reference to `arch_unregister_cpu'
Message-ID: <202310132342.nNTo2Coa-lkp@intel.com>
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
commit: 279ddae0aef8988861d8f41574994805885ce78e [31/33] ACPI: add support to register CPUs based on the _STA enabled bit
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20231013/202310132342.nNTo2Coa-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310132342.nNTo2Coa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310132342.nNTo2Coa-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/acpi/acpi_processor.o: in function `.L59':
>> acpi_processor.c:(.text+0x25c): undefined reference to `arch_unregister_cpu'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
