Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EAA1DDFF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 17:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694626076; x=1726162076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aVD/c/eL0rTobE2Tjk1qQ/UqZxZGFsD+m1EVpNEhAbQ=;
  b=nbLxAtT+1NlJt7sOlyq449yZ1jo5pdcax77KWSMQ/75BjNQ8tjXmpMxc
   bMG8LpWiisjyvQc9++mj5vPFnJ3F+dwClfCI8wyTpzaOtJQBd9HT9wBOY
   HG1naXdYQZ4tfUWpTL3RK5X2uvPfxfDEIQj38B4x0cGMbnM/z+0H8uIWy
   ii7/pexsBX7RA4Y+dWn4Sc17mq5/1c6hmiUWS/tRrTMmp7kkZHp+3ncgi
   +xFPM2NBKdOg8kQGGDIwlQnmssm+wzK6JkMB8Z+VFsjPNhNa5rTvskxY6
   QlIu5mOExYucaFX8HrkW08eyCAn/FujApN8if7T4mHXnrsDZ5GyrYrmpB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="445165781"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="445165781"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 10:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="859348444"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="859348444"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Sep 2023 10:27:54 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgTeZ-0000P1-0U;
	Wed, 13 Sep 2023 17:27:51 +0000
Date: Thu, 14 Sep 2023 01:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:virtual_cpu_hotplug/rfc/v2 32/35] acpi_processor.c:undefined
 reference to `arch_unregister_cpu'
Message-ID: <202309140131.nA1yddV0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git virtual_cpu_hotplug/rfc/v2
head:   f4bfd512821116bf949b7f1fd342ff8db1efbaf9
commit: f38a8ad1d2a9df9255261e58d938089fdeff5ab5 [32/35] ACPI: add support to register CPUs based on the _STA enabled bit
config: loongarch-randconfig-r024-20230913 (https://download.01.org/0day-ci/archive/20230914/202309140131.nA1yddV0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140131.nA1yddV0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140131.nA1yddV0-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/acpi/acpi_processor.o: in function `.L42':
>> acpi_processor.c:(.text+0x234): undefined reference to `arch_unregister_cpu'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
