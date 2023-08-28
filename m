Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1D6211A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 23:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693266498; x=1724802498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P8HBY2vGb27G4/obh28UJiqKKAelolUR7nvfwR7/UDM=;
  b=n9wLkH/FuE6DfjVb5P3pqa5PSwB3y95nanGB4hIfBVp2jXI+7Ev8ApSy
   m/aP9KNjlWYYfig6X7HGPycFXD4V9QVJwheR2ny1XZfKnNWTaHV4Vz8wr
   44fNNj6yeYHtyT3yWgDx4rt176szTRK0O3DSL7qfR6MOdLggh3SFi/0B3
   FwiVWy4MbKwoIhYFqQFdMu41U6yJiY4xA7IRVJbdT1wwy3ZqI87SffE35
   n8VXAyeydGo0fIioNISkzg0vXMjzjhgCeDZTEYDCVuyFRgAyCuI4zWIgO
   swbejJ3Uw+L0Nahzi5GaIlKSfaQLUgo0jcGqLAdyZSv8RtTSC3NP0t3GG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="439182788"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="439182788"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 16:48:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="767861488"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="767861488"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Aug 2023 16:48:15 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qalxv-0008Cx-0Z;
	Mon, 28 Aug 2023 23:48:15 +0000
Date: Tue, 29 Aug 2023 07:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [pinchartl:rpi/v6.5/isp/v2 17/23] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/media/uapi/v4l/pixfmt-meta-bcm2835-isp-stats.rst
Message-ID: <202308290728.sstod46i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rpi/v6.5/isp/v2
head:   f21e9808068119a1ea8f1ddb5677c982b79ac10d
commit: fc4d9bcc01b95d18fce9347a28ca58d05ce2362d [17/23] staging: vc04_services: bcm2835-isp: Add a more complex ISP processing component
reproduce: (https://download.01.org/0day-ci/archive/20230829/202308290728.sstod46i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308290728.sstod46i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/media/uapi/v4l/pixfmt-meta-bcm2835-isp-stats.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/media/v4l-drivers/bcm2835-isp.rst
>> MAINTAINERS:8397: WARNING: unknown document: ../media/uapi/v4l/pixfmt-meta-bcm2835-isp-stats
>> MAINTAINERS:8397: WARNING: unknown document: ../media/v4l-drivers/bcm2835-isp

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
