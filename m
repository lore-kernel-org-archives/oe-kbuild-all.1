Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A23160
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 00:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675814694; x=1707350694;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=T0qDofvWBGRq4jSk0J/MHzThisg/c9RSpSwyHjIKPI0=;
  b=OCckSLHkdzlTZTJrB0FQvrydUlfQ2jfznbmWhsntQ6GRLJ/WOoj/0tbC
   LEaVI6g6g5zFMzAhUHMKW6MFKygM0jSQ29xw7kJ/k9VupZbOGHUoHruEf
   0bj8QIGSF0BCWJPHASCczSCYv40iOs0Q1PV4gVUgSejMWWojuAU03W1WJ
   1NhUzfAUUt0sF76DGlJgG2UicD8g2iB4fRde4XFX0Jet/75umLBgwHPWI
   ZPYqlZy+F1vnsgyhW7rIuTDo1YSJW0a7/y3kMSdEUUkWnRTvGaHCzuh12
   PSVoVYMkp7UoJZCeREXa8f3z5lbFpNag7zAmMz3klyLbvUB3WrC15fhua
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="330953671"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="330953671"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 16:04:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="616996857"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="616996857"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Feb 2023 16:04:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPXx1-0003zC-27;
	Wed, 08 Feb 2023 00:04:39 +0000
Date: Wed, 08 Feb 2023 08:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+134 bytes kernel size regression] [i386-tinyconfig]
 [142fc3d31d] cpu/hotplug: Add dynamic parallel bringup states before
 CPUHP_BRINGUP_CPU
Message-ID: <63e2e6f9.QpgdPJ4JeK5tZ0Ff%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +134 bytes kernel size regression due to commit:

commit: 142fc3d31df8bb79dc1128b6d9f1a3ab562dc77e (cpu/hotplug: Add dynamic parallel bringup states before CPUHP_BRINGUP_CPU)
git://git.infradead.org/users/dwmw2/linux parallel-6.2-rc7-part1


Details as below (size data is obtained by `nm --size-sort vmlinux`):

658c4f00: cpu/hotplug: Move idle_thread_get() to <linux/smpboot.h>
142fc3d3: cpu/hotplug: Add dynamic parallel bringup states before CPUHP_BRINGUP_CPU

+----------------------------+----------+----------+-------+
|           symbol           | 658c4f00 | 142fc3d3 | delta |
+----------------------------+----------+----------+-------+
| nm.d.cpuhp_hp_states       | 4780     | 4880     | 100   |
| bzImage                    | 495904   | 495968   | 64    |
| nm.t.cpuhp_store_callbacks | 149      | 183      | 34    |
+----------------------------+----------+----------+-------+



Thanks

