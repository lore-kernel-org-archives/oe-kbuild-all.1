Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1412105
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683726814; x=1715262814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6YBuJqo6VR0HO8LD3YQ0MqtV9rRzA7pUh0U7MtgcK38=;
  b=LTFnr9xknmN5vhlQfsXOB4GL0JualaMssxYlPAn7pgRJN3ydkWOG+GWx
   yzkr/3wW3q0voeDTgbC4JP4RiOpIpvyM5mhDaZLGxivBRiX5iJ8ZIL4kp
   cYLPMcf+iXCIjfGqYyR0l8dW1d0NPuCOdJOjLHeHbBlBK4GMnGR86q52b
   AFAmJj+IMG/TGDENyupN7kHXUpFdA0x8K8NjBq9MSUzMbtKpquVKYPnwY
   ATlPkhr9U1PKb6snSppeEqV+istHreB2am39A5ApOiyVSEkJWJLKy9/oW
   P3SRnsNWqz3S14+Wv7s0JsT547AdfoI+xTKFIqFvr990tpKUI5yuNvVAU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="353290489"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="353290489"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 06:53:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="702264669"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="702264669"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 May 2023 06:53:33 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwkG4-0003L8-0o;
	Wed, 10 May 2023 13:53:32 +0000
Date: Wed, 10 May 2023 21:52:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 6/6]
 drivers/cpuidle/governors/teo.c:294:10-11: Unneeded semicolon
Message-ID: <202305102129.70aT3IQt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   c10825dec4b35de3c9bbf441be9986a762ebfb67
commit: c10825dec4b35de3c9bbf441be9986a762ebfb67 [6/6] UPSTREAM: cpuidle: teo: Change the main idle state selection logic
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/20230510/202305102129.70aT3IQt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305102129.70aT3IQt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/cpuidle/governors/teo.c:294:10-11: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
