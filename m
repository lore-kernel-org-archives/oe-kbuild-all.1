Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C96139B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Nov 2022 03:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668397343; x=1699933343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8z0ajpLc6gE5Alh3knu25MNIVWlVtSK35cju1Sh60bo=;
  b=Rj7VYvE67u0N7B1ui1FWR4x3B6I3u7J+LkZN3ZWZpQcCn8uweubEI6EV
   LNhu1rx97nHOGNFLVbyc1G9IyXjPpip/viZwNLFquxbWxm1heXp1oyBRm
   lki/oTxZMw+kK1STxVtAUsc9xO5fjuWsPfR+s4dfEDM12vEN9eOigQzZM
   tmHrfnDRIxJE8nME73diC9SwjUUldNDknCogOxvAbQCdJplpj/g4HAdbV
   mSKr09+U6YFP69GYqObUm/GnHOoioVQgqJLwpnI2AQrsqZpmP9jyvP56B
   6B3bmlFLvRv9w/C7zg4U+xMPWLCTk/Th/6yoSsdQnHiQojRVOurUg7TIR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="338657051"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="338657051"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2022 19:42:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="638305672"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="638305672"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Nov 2022 19:42:21 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ouQMW-00004Z-1a;
	Mon, 14 Nov 2022 03:42:20 +0000
Date: Mon, 14 Nov 2022 11:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: Meng Li <li.meng@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: spdxcheck: drivers/cpufreq/amd-pstate-ut.c: 1:28 Invalid License ID:
 GPL-1.0-or-later
Message-ID: <202211141151.NSoxwxUi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   094226ad94f471a9f19e8f8e7140a09c2625abaa
commit: 14eb1c96e3a3fd9cd377ac9af3c7a410f8bf1015 cpufreq: amd-pstate: Add test module for amd-pstate driver
date:   6 weeks ago
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

spdxcheck warnings: (new ones prefixed by >>)
>> drivers/cpufreq/amd-pstate-ut.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/spi/spi-gxp.c: 1:35 Invalid token: =or-later

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
