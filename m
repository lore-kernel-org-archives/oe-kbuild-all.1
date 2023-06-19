Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799E811C8B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 14:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687183492; x=1718719492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cYpnh9OYCweGeWRinSKHTXm8UQx2m3pKjwDmzCbHfs8=;
  b=Oh9Rd4CQYe8K7/6qV0Hf52sOr+rpe/GBZhcJip8w0RIOXgHSyrs39wpc
   JRAZ0vTvuOm58hKYvujt5w94N4b4RQyB8fhFW9jstZAsy03nN7ItzdiV/
   TUU2X7/vJK84NPg2cXLA+8TlOu2Gm3pAtON7z1ukX/OKzaqbMUiqPrL5H
   zlw71tUvXbgnnCB+j3CR/b2WVTbf8yGh4Kh81l/OygZbhzlJDg+RWq7M7
   4epjdtg2y3tR5mZ2zHQQt911frs8mWoMD46nU2YBGpqm5lQzEszY5iMHg
   BUNpF/Ps9YW5M5Vx/YyBBqc4dQbJYqrR+nYClwno8tnZ42WJ9omwHN+RH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="357125346"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="357125346"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 07:04:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="837876412"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="837876412"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Jun 2023 07:04:31 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBFUc-0004lM-1X;
	Mon, 19 Jun 2023 14:04:30 +0000
Date: Mon, 19 Jun 2023 22:03:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-4.14 28/34]
 drivers/gpu/drm/i915/i915_pmu.c:678:34-40: ERROR: application of sizeof to
 pointer
Message-ID: <202306192145.Q68MJFgd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-4.14
head:   c6b7f293d5463f0343d6f47b54d31698e1736945
commit: a4ece481f770b7bff2125bdd421bc07fe9fbe1f0 [28/34] UPSTREAM: drm/i915/pmu: Only enumerate available counters in sysfs
config: i386-randconfig-c034-20230618 (https://download.01.org/0day-ci/archive/20230619/202306192145.Q68MJFgd-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306192145.Q68MJFgd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306192145.Q68MJFgd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/i915_pmu.c:678:34-40: ERROR: application of sizeof to pointer

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
