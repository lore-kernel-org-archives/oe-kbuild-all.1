Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2CB638
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 06:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691476791; x=1723012791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OrmqXZNL7fRw/s91iQRU2Ed2ECq483A5XEiCL+ib+mM=;
  b=PGbePuvEIhGtFQZSDkhHIsYkopWBnabN3I3Kvl72gFWJUl/R6f0hvPzI
   OWaSq5yLKl04RUnpdRdfn3N4gKsrXHNUVvs5LPcItYdXUHmZocKh0iqL6
   pNCPPz+V22WsGHzIu7d3P/XWqpPu6Qjf7jGMDdEXUthEc9cnZEf8mSKfI
   UGv2OtS6D1yyyuf7/Tn+GVVh1pAJhPrYr2/qA9RUc2W+mMzASZcZXYP+P
   PBzVPkm2tNhWyN7ZaIgijsCgNJDxhMjcO12lyiwIH+c1WJBHUjDekNzxi
   +Pjwk5xy06ffHHJhlWC4qkiQzpyvag1NkDG5fhsesczPwZgC0iU56ZEWa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457118861"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="457118861"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 23:39:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="760789217"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="760789217"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Aug 2023 23:39:49 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTGNg-00059w-1j;
	Tue, 08 Aug 2023 06:39:48 +0000
Date: Tue, 8 Aug 2023 14:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Francois Bortolotti <jeff@borto.fr>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/120-spmi 1/3]
 drivers/spmi/spmi-apple-controller.c:215:3-8: No need to set .owner here.
 The core will do it.
Message-ID: <202308081434.mKY35euw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/120-spmi
head:   ad35376547242c22bae3e65d71c17f2b8a92a2bf
commit: 08edfbcf5150edcbdd39c60083f93746d14abdac [1/3] spmi: add a first basic spmi driver for Apple SoC
config: arc-randconfig-r061-20230808 (https://download.01.org/0day-ci/archive/20230808/202308081434.mKY35euw-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081434.mKY35euw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081434.mKY35euw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spmi/spmi-apple-controller.c:215:3-8: No need to set .owner here. The core will do it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
