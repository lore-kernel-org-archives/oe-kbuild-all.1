Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BF51AD9C1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 21:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723583864; cv=none; b=GSuNKBEirFEO8Hner9R2b/TN0Fs/KC/5fHdERAw9DaAd317Qh0nB0o+8vehA7HryGdngNClgkiswzW7ENdA860hd5wpg3PScRfeN//sOt4JIcIIy9sKd5+zqVj2OETpHXEU3wdyKQy1oucN8SkfoSbk6M2HtnYVZsTvvCPD/f1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723583864; c=relaxed/simple;
	bh=vo+Vj5gbAxBwasknG+Sn7eSUsAce8VrqS+Se9zdZn+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JTLM/Z+ebAgL8b5V/8P4kM+YVmZbDuOB+TiZ734oXAzmU8AABLeTAulzZFOg2azNwal633dkFX21o2gA5JVoszf4CEYuGXezbYt0igYDPwRHJAcPRMKIcHOyjn7HwKIFPYWqoPEa3uZ+73MWRS1HpDVHnS+gKhmSYXUI9Gc49SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h16qXwIO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h16qXwIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723583862; x=1755119862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vo+Vj5gbAxBwasknG+Sn7eSUsAce8VrqS+Se9zdZn+s=;
  b=h16qXwIO12/NDPhJZPSzwgBQkPqXPdPznMfmeygpIhyAtDRy6XCBYEfe
   656+tEgIclgm2VxIR0HsnNCNvm/s2gXpjbyDseeySfhFVbkL98c8Nejp+
   S2NUJ+M/iMN/m4qGWWQapHkarnN2jFWzozl9wobdmQ059Rp3W0TbOapY7
   43b1Y89zsP9yVb6uV+wbt//ltgQwRv752/71RW493tYBmmWgs5zVAotDR
   +P1RMuyG2wuTfEKVaJMg5ztGYg8PXMUKg5sONU+1O0JjPAqV4ukMkK1xF
   wZKNPAXm2hYaA3Fs4hlZtrnQEuQT1Gc2rtqs0I3lx58Ks8bkKl/3ASpD/
   w==;
X-CSE-ConnectionGUID: rs0VJKe2RAi6+Gs4DVl++Q==
X-CSE-MsgGUID: DoLb2StRTwudIMQTd/9btA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32351349"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="32351349"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 14:17:41 -0700
X-CSE-ConnectionGUID: 3D6XaJOzQk2MHP0N0VvzQA==
X-CSE-MsgGUID: bZBiaB2mRaSXH5JPM6oDvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="58678670"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Aug 2024 14:17:39 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdytd-0000jS-0P;
	Tue, 13 Aug 2024 21:17:37 +0000
Date: Wed, 14 Aug 2024 05:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:20240812_cezary_rojewski_asoc_intel_remove_skylake_driver
 48/49] sound/soc/intel/common/soc-acpi-intel-skl-match.c:11:10: fatal error:
 ../skylake/skl.h: No such file or directory
Message-ID: <202408140512.Rt7qG5Vo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20240812_cezary_rojewski_asoc_intel_remove_skylake_driver
head:   d46748ce77e33d6a219e9e7bca25d53cbf78d518
commit: a8d5559a180c437332cf1b697776287165fdceca [48/49] ASoC: Intel: Remove skylake driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240814/202408140512.Rt7qG5Vo-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408140512.Rt7qG5Vo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408140512.Rt7qG5Vo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/intel/common/soc-acpi-intel-skl-match.c:11:10: fatal error: ../skylake/skl.h: No such file or directory
      11 | #include "../skylake/skl.h"
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> sound/soc/intel/common/soc-acpi-intel-kbl-match.c:11:10: fatal error: ../skylake/skl.h: No such file or directory
      11 | #include "../skylake/skl.h"
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> sound/soc/intel/common/soc-acpi-intel-cnl-match.c:11:10: fatal error: ../skylake/skl.h: No such file or directory
      11 | #include "../skylake/skl.h"
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> sound/soc/intel/common/soc-acpi-intel-icl-match.c:11:10: fatal error: ../skylake/skl.h: No such file or directory
      11 | #include "../skylake/skl.h"
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> sound/soc/intel/common/soc-acpi-intel-ehl-match.c:11:10: fatal error: ../skylake/skl.h: No such file or directory
      11 | #include "../skylake/skl.h"
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> sound/soc/intel/common/soc-acpi-intel-hda-match.c:11:10: fatal error: ../skylake/skl.h: No such file or directory
      11 | #include "../skylake/skl.h"
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +11 sound/soc/intel/common/soc-acpi-intel-skl-match.c

cbaa7f0bdbee19 Pierre-Louis Bossart 2018-06-18 @11  #include "../skylake/skl.h"
cbaa7f0bdbee19 Pierre-Louis Bossart 2018-06-18  12  

:::::: The code at line 11 was first introduced by commit
:::::: cbaa7f0bdbee1969bb311c641abbd0d2af6ba861 ASoC: Intel: move SKL+ codec ACPI tables to common directory

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
