Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0051115A2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 18:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681238030; x=1712774030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=48BTulYeC02B0zfh8HVAmeUyk3sIhM9phnGFE/wLBqk=;
  b=WE8g1ZehyAghMu3lHcz/ANWkGC7lpyjiga3NJe4K6D8f7hBZpaPlxYvT
   zs8UhKJTc8TaW6n4F2FlkWwR6kBHeOmirWBqzYVvW0zHMOkkLiDK0NeIa
   MXT5MbbAhB6bovT+2XQOdm3KmI3sFKkZtZgfvUcY5nC9Ky9bpZ5PkvT1h
   CImvkKU9ZE6uFwuTCApDRHdues7cOECS16ovIILCyqQplzE0eVfMDhtxg
   8sAP+CQ2XHPCZOqx6lRyrfMPYdHDLrR/irTsVwHRUv/5W9sg0Tj5Y74j4
   rDTRd8VDMHUhi6ZxIaHIqgwiXqjSEyYg55rNV9T+eSFGA0RIJhpmHCw7p
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="408843063"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="408843063"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 11:33:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="778015308"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="778015308"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2023 11:33:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmIny-000Wbf-2j;
	Tue, 11 Apr 2023 18:33:22 +0000
Date: Wed, 12 Apr 2023 02:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 99/113]
 drivers/clk/mediatek/clk-mtk.c:518:2-3: Unneeded semicolon
Message-ID: <202304120208.rJqds07E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   2e7e71ff090e376766be91e585bb5c8116a3513b
commit: 3416bd4f0c0f5da4b2ef3e8314558d47a1703a6e [99/113] UPSTREAM: clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()
config: sparc64-randconfig-c043-20230409 (https://download.01.org/0day-ci/archive/20230412/202304120208.rJqds07E-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304120208.rJqds07E-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/mediatek/clk-mtk.c:518:2-3: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
