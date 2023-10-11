Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FFA12E67
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 19:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbVXlKEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697051974; x=1728587974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UHqMhmNK8/htFSTg2JYqqH8j5mmsDz2UJ5n2D2v/9Ys=;
  b=nbVXlKELUBfK+3VhKYQJcnr5YiVnfa30ibsZiq8sqmLb1QrUFY91hUSI
   hwTxwGKpXfF5UOlhjDaTh/6qjk9Gpg+DBeGjM8gTg+ZPLsGuMKQAhYPHX
   JBeRlkKNvZyn2ygmzEy1EnrI8fXbs225E0ssVnfZ912kn2pInrDVK29aq
   Gp/sNCMytkh9NKqbHjqH5ZnDWPD29NlYduJhsa1p+Kx2vp/vwW6YSSX7J
   ZHDZ540boHAXwo4xJDkPxi8+Vwkk2rG3M3o/nPhHVZXAyQxESS23nG18/
   uDoR+i4UtgWCbv0am1QsBWxNehplebcTfHAFKlbw3hdIIMZsNcHhc0GBc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="384598487"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="384598487"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 12:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="897769433"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="897769433"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2023 12:17:43 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqejv-0002cT-0a;
	Wed, 11 Oct 2023 19:19:27 +0000
Date: Thu, 12 Oct 2023 03:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: Ken Xue <Ken.Xue@amd.com>, andriy.shevchenko@linux.intel.com,
	linux-acpi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, rafael@kernel.org, cwhuang@linux.org.tw,
	Ken Xue <Ken.Xue@amd.com>
Subject: Re: [PATCH V5] acpi: trigger wakeup key event from power button
Message-ID: <202310120000.LkRVKBZN-lkp@intel.com>
References: <20231007075433.555715-1-Ken.Xue@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007075433.555715-1-Ken.Xue@amd.com>

Hi Ken,

kernel test robot noticed the following build errors:

[auto build test ERROR on b483d3b8a54a544ab8854ca6dbb8d99c423b3ba4]

url:    https://github.com/intel-lab-lkp/linux/commits/Ken-Xue/acpi-trigger-wakeup-key-event-from-power-button/20231007-163549
base:   b483d3b8a54a544ab8854ca6dbb8d99c423b3ba4
patch link:    https://lore.kernel.org/r/20231007075433.555715-1-Ken.Xue%40amd.com
patch subject: [PATCH V5] acpi: trigger wakeup key event from power button
config: loongarch-randconfig-002-20231011 (https://download.01.org/0day-ci/archive/20231012/202310120000.LkRVKBZN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120000.LkRVKBZN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120000.LkRVKBZN-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/acpi/button.o: in function `acpi_power_button_wakeup':
>> button.c:(.text+0x44): undefined reference to `input_event'
>> loongarch64-linux-ld: button.c:(.text+0x58): undefined reference to `input_event'
   loongarch64-linux-ld: button.c:(.text+0x6c): undefined reference to `input_event'
   loongarch64-linux-ld: button.c:(.text+0x8c): undefined reference to `input_event'
   loongarch64-linux-ld: drivers/acpi/button.o: in function `acpi_button_notify':
   button.c:(.text+0x200): undefined reference to `input_event'
   loongarch64-linux-ld: drivers/acpi/button.o:button.c:(.text+0x214): more undefined references to `input_event' follow
   loongarch64-linux-ld: drivers/acpi/button.o: in function `.L42':
>> button.c:(.text+0x3ac): undefined reference to `input_allocate_device'
   loongarch64-linux-ld: drivers/acpi/button.o: in function `.L52':
>> button.c:(.text+0x60c): undefined reference to `input_free_device'
   loongarch64-linux-ld: drivers/acpi/button.o: in function `.L53':
>> button.c:(.text+0x67c): undefined reference to `input_set_capability'
>> loongarch64-linux-ld: button.c:(.text+0x68c): undefined reference to `input_set_capability'
   loongarch64-linux-ld: drivers/acpi/button.o: in function `.L58':
   button.c:(.text+0x6a0): undefined reference to `input_set_capability'
   loongarch64-linux-ld: drivers/acpi/button.o: in function `.L59':
   button.c:(.text+0x6b4): undefined reference to `input_set_capability'
   loongarch64-linux-ld: drivers/acpi/button.o: in function `.L60':
>> button.c:(.text+0x6c0): undefined reference to `input_register_device'
   loongarch64-linux-ld: drivers/acpi/button.o: in function `.L63':
>> button.c:(.text+0x6e0): undefined reference to `input_unregister_device'
   loongarch64-linux-ld: drivers/acpi/button.o: in function `.L87':
   button.c:(.text+0x7f8): undefined reference to `input_unregister_device'
   loongarch64-linux-ld: drivers/acpi/button.o: in function `.L99':
   button.c:(.text+0x89c): undefined reference to `input_event'
   loongarch64-linux-ld: button.c:(.text+0x8b0): undefined reference to `input_event'
   loongarch64-linux-ld: drivers/acpi/button.o: in function `.L97':
   button.c:(.text+0x8c4): undefined reference to `input_event'
   loongarch64-linux-ld: button.c:(.text+0x8d8): undefined reference to `input_event'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_BUTTON
   Depends on [m]: ACPI [=y] && INPUT [=m]
   Selected by [y]:
   - ACPI_SYSTEM_POWER_STATES_SUPPORT [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
