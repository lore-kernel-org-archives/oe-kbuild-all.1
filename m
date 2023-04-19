Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EF23D67
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 14:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681913453; x=1713449453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A3IjMggNIS/ZZLTC4MGOFwo6VwGYR3cGSKfWlXFLc5M=;
  b=PO3aYiyw8jMWO6E+Pl994H2vLKlOqxKk9rb+DWHRP/gCQaes8ad/yF50
   51pEYMZgowenA4sIT0vJmnXyL6hK7dz9xZQmzSA3BLAKiRz4ACpnMT365
   4cJoVxHiQd/8pgi5vb0cC+6h5ACdMKmEjX/ncNd860Yo5NlfSbWT+4kXd
   WHEhPdJ8FmxIZkhOnoRBMlP9LcqZwJaIFGPnpsgzE9XRQdGVKogFqg6Eo
   AhajF/oROgJdg+/Cpj+7iuuzNgrKI+hG4WSmrAhZCE7AMHTxoHty9wGki
   R47rsFLinzy6JcGmvxFhJZgPEsSFiVX3tMNlPJ9oC50aDm0IaP+xjQZB1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="410687024"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="410687024"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 07:10:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="1021223339"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="1021223339"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Apr 2023 07:10:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp8WJ-000ev5-20;
	Wed, 19 Apr 2023 14:10:51 +0000
Date: Wed, 19 Apr 2023 22:10:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 4666/26993] ERROR:
 "alarmtimer_get_rtcdev" [drivers/power/supply/charger-manager.ko] undefined!
Message-ID: <202304192245.yzWC85Ap-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baolin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   af542fcdb47a45f20f1010340dd51da074a728c5
commit: 3ebeb5687243e405fbf34032249cada998ee4779 [4666/26993] FROMGIT: power: supply: Allow charger manager can be built as a module
config: x86_64-randconfig-a004-20230417 (https://download.01.org/0day-ci/archive/20230419/202304192245.yzWC85Ap-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.4
        git checkout 3ebeb5687243e405fbf34032249cada998ee4779
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304192245.yzWC85Ap-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "alarmtimer_get_rtcdev" [drivers/power/supply/charger-manager.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
