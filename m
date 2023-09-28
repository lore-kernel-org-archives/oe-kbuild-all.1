Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370D879CC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 04:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695874498; x=1727410498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GwP9umabTNj/I3TajuKB8yrF7oglKW+Svf3wzmzOnTY=;
  b=ivfNGjxE/XVpmSXTP4i0xa2PNiG5/jGh3Yiej4D5JgB2y83f81xPO61Z
   CLFhD/Qv1tWtDM5DXwjmkWm9cULSL/YcLauI4ivrrWJAzeSxKIkl/8O2J
   ZDxIKdSQwImaJFyvDMMKs45UsBjFNNiekKvrz9sIgBX4lVmbd8A+Nb2Fb
   i4kSpddE/bLcQzk0L4wMcJJLJhCBRdFnan4stYFyyFcCxQqA33STXQErz
   VuxJG05e/pLIc/4wdKUJoTM8+NplALhBp0lR7baH0ZjPeiWdn6Jq4L4rH
   FtKvsGzILkJIeYAThHCZH1AlTZCMJ7OGHUS3X+2WMIsRk8xYGVE6uOEyq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="3539115"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="3539115"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 21:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="996422237"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="996422237"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 27 Sep 2023 21:14:15 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qliPl-00016f-2A;
	Thu, 28 Sep 2023 04:14:13 +0000
Date: Thu, 28 Sep 2023 12:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Lyude Paul <lyude@redhat.com>
Subject: [skeggsb-nouveau:00.02-gsp-rm 8/88]
 drivers/gpu/drm/nouveau/nvif/outp.c:230:10-17: WARNING opportunity for
 kmemdup
Message-ID: <202309281243.c0lQzeUz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   3897e2d444b49105470ddf8b6beed3f183bc4886
commit: 32daa03ccbfc420542ff9b3f69fa8f5f3bad3cb6 [8/88] drm/nouveau/disp: add output method to fetch edid
config: i386-randconfig-053-20230928 (https://download.01.org/0day-ci/archive/20230928/202309281243.c0lQzeUz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230928/202309281243.c0lQzeUz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309281243.c0lQzeUz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvif/outp.c:230:10-17: WARNING opportunity for kmemdup

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
