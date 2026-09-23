Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79D537BE98
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 03:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790135462; cv=none; b=NgETcsMNRXrbRZjncSIY3UOx8oGKxsbY+FhG3i/0uXyLcOZDJ1WIfNWnfUIOxpvw/Nlb91QICUy0q3XdSCjoZDQNMPkfuvwaux4sTpkVRSXMtlRyj0SCptV3oDNj6X7weWbpNlP0d/7nMbX7efbNqc2XDppWDHhwlcrZi+Jg2CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790135462; c=relaxed/simple;
	bh=Sit8RxWF2tdbdiaO2TqYp9+CRYMEknpuMJYpQ7w/xkg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AfnmYKnigituB24DpNHdcHL2aErt/yjPv4iL+/5qFnEkr9ijAOLLG0zKQDul6UYIXrZwRjhkZi6MCorif66lw7elXaUXr6oq6B2bLNA0IsxBK9zWpel08N3upRkSWJJP4O8OxrH4v+LQRiAoel9pknJCCpjXP78Hi5vth2khj2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Usesmxc6; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Usesmxc6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790135461; x=1821671461;
  h=date:from:to:cc:subject:message-id;
  bh=Sit8RxWF2tdbdiaO2TqYp9+CRYMEknpuMJYpQ7w/xkg=;
  b=Usesmxc6SqSBBfq359357s4GNbdFNhSA3P3IW0jXWUY4XhVMupHqcayH
   Lww4tuhixm0Fuc5D9cLGXWjnm7FqJN5wQbgmCsk+jm2UTqpn2OGxiy+E5
   YqEcWBkFrzPpEjvdfC//UUwcbnUig5LaNfTBFU6Xe/VusPSUrFAy0ebyc
   zDRMr/3wHofeSAS7jSp+AZYVaawUaAd48j+qJfKN+4MweyOVZ+vwp1Ge/
   mxTft9/ZNKto2lPNOWDw8HkfoJDq+U86hRICul0qCPK7O5HAYwlOibRia
   6/qQkgGZtYfQnN0I2tXLDkO0H1PxLsKAXquT1C2qeJvXQyo9KQFOCaU1/
   w==;
X-CSE-ConnectionGUID: jvE34EbdSLSVGn+EHfYdSg==
X-CSE-MsgGUID: KGWaF5ZUSBy3vcKjiQ05Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1306667"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="1306667"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 20:51:00 -0700
X-CSE-ConnectionGUID: dFKF8ancQDmHItICnTHsuw==
X-CSE-MsgGUID: xzjWLt+5Q+OTY+7VXx6abA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="273605451"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Sep 2026 20:50:58 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9E0W-00000000GVN-0Kck;
	Wed, 23 Sep 2026 03:50:56 +0000
Date: Wed, 23 Sep 2026 11:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ljs:v3-build-speed-up 40/49] cc1: warning: unrecognized
 command line option '-Wno-unterminated-string-initialization'
Message-ID: <202609231124.EiKQBwqM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ljs/linux.git v3-build-speed-up
head:   789909cb4fd0730510265f0059c1579b5687f51a
commit: 14350e00295bf82506df8e053f4cbec79913a363 [40/49] kbuild: avoid re-running compiler and linker probes
config: parisc-randconfig-1000-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231124.EiKQBwqM-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231124.EiKQBwqM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231124.EiKQBwqM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/st.c: In function 'create_one_cdev':
   drivers/scsi/st.c:4292:24: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size between 9 and 10 [-Wformat-truncation=]
    4292 |  snprintf(name, 10, "%s%s%s", rew ? "n" : "",
         |                        ^~
   drivers/scsi/st.c:4292:2: note: 'snprintf' output 1 or more bytes (assuming 33) into a destination of size 10
    4292 |  snprintf(name, 10, "%s%s%s", rew ? "n" : "",
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4293 |    tape->name, st_formats[i]);
         |    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/st.c: At top level:
>> cc1: warning: unrecognized command line option '-Wno-unterminated-string-initialization'
>> cc1: warning: unrecognized command line option '-Wno-dangling-pointer'
--
   drivers/scsi/ch.c: In function 'ch_probe':
   drivers/scsi/ch.c:923:22: warning: '%d' directive writing between 1 and 10 bytes into a region of size 6 [-Wformat-overflow=]
     923 |  sprintf(ch->name,"ch%d",ch->minor);
         |                      ^~
   drivers/scsi/ch.c:923:19: note: directive argument in the range [0, 2147483647]
     923 |  sprintf(ch->name,"ch%d",ch->minor);
         |                   ^~~~~~
   drivers/scsi/ch.c:923:2: note: 'sprintf' output between 4 and 13 bytes into a destination of size 8
     923 |  sprintf(ch->name,"ch%d",ch->minor);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ch.c: At top level:
>> cc1: warning: unrecognized command line option '-Wno-unterminated-string-initialization'
>> cc1: warning: unrecognized command line option '-Wno-dangling-pointer'
--
   st.c: In function 'create_one_cdev':
   st.c:4292:24: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size between 9 and 10 [-Wformat-truncation=]
    4292 |  snprintf(name, 10, "%s%s%s", rew ? "n" : "",
         |                        ^~
   st.c:4292:2: note: 'snprintf' output 1 or more bytes (assuming 33) into a destination of size 10
    4292 |  snprintf(name, 10, "%s%s%s", rew ? "n" : "",
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4293 |    tape->name, st_formats[i]);
         |    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   st.c: At top level:
>> cc1: warning: unrecognized command line option '-Wno-unterminated-string-initialization'
>> cc1: warning: unrecognized command line option '-Wno-dangling-pointer'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
