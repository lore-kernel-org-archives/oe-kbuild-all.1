Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3257E8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="br68fi6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705137161; x=1736673161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jYgbc5fUAwfcRJy9NzPZkgw65yZMb/lX/tQPegvmpU0=;
  b=br68fi6p1iknbuGkNox3liBoIkhmzvyQEanwNqRIzwNwsOI8ODmrtTGk
   b788myHZHYvSE5YLErtQdyTFcMOCQMmmxLemjN8cKzhvygPIMvvtseGNh
   csZGFmi/XZSgpMVqvMtQyLiCazF683G3GfiCPUHLxTrQj/CAB50RFl3oZ
   d7tvrUcG1CoaHSGgbpB3/SwaIYk+dufvyL4TQpJS/B5mjM6C3oKZdNAGZ
   MKeSKgzlxINCKnRcKNSVDHbCkWIAywsmnbIPK9IjGYYTQcruX5eKTZfbl
   qAhr/z6AWmA7XmEzFjhoeLXvIrqD4gqCBxVuiR/977+2lY5Pzs7tBl+Vu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6728117"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="6728117"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 01:12:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="956334466"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="956334466"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Jan 2024 01:12:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOa4C-000AIb-29;
	Sat, 13 Jan 2024 09:12:36 +0000
Date: Sat, 13 Jan 2024 17:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, jdelvare@suse.com,
	linux@roeck-us.net
Cc: oe-kbuild-all@lists.linux.dev,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (acpi_power_meter) Ensure IPMI space
 handler is ready on Dell systems
Message-ID: <202401131750.F51XQF3H-lkp@intel.com>
References: <20240109041218.980674-2-kai.heng.feng@canonical.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109041218.980674-2-kai.heng.feng@canonical.com>

Hi Kai-Heng,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on groeck-staging/hwmon-next rafael-pm/acpi-bus linus/master v6.7 next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kai-Heng-Feng/hwmon-acpi_power_meter-Ensure-IPMI-space-handler-is-ready-on-Dell-systems/20240109-121520
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20240109041218.980674-2-kai.heng.feng%40canonical.com
patch subject: [PATCH v4 2/2] hwmon: (acpi_power_meter) Ensure IPMI space handler is ready on Dell systems
config: loongarch-randconfig-r112-20240113 (https://download.01.org/0day-ci/archive/20240113/202401131750.F51XQF3H-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240113/202401131750.F51XQF3H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131750.F51XQF3H-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/hwmon/acpi_power_meter.o: in function `.L212':
>> acpi_power_meter.c:(.text+0x15c0): undefined reference to `acpi_wait_for_acpi_ipmi'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
