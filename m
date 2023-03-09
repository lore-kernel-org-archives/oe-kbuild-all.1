Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2968A321E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 09:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678353681; x=1709889681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=67afobgoDefrjo6psyl8xChLrsRTiBGNgjSv+P5ImBs=;
  b=lDjC5IYCER9hde0JzO8UBU2gG8iZoF9nA9I3fnaYZd5hFg2IL9XL3ZcP
   CFmh7nMdAZco3oJdoHwqBZts7ALj/E1B6jO+VfZZVh2GLETP5B/BRtSg9
   oQcmvCZO1IgAEIBSbdAOtccwFG/6NpW5c3fMZ3cq+MvyjdlFTjLfrerb2
   sQnLbUdlxPSPBwGwQac4YBWdLQSoTGSkihl0XT2SR8mK7q4/pqS4ZbimJ
   QenT7lwiD6851I7HGimdVH8aET+UmPjY8Y/gH3NAfezs2IDXyos0hNwK/
   dm6wNxnvq8C48ozYtOp52/Pb/Mje2YU+RC/5U+NO5r1gZnjcqZiS1TeBN
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="364039026"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="364039026"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 01:21:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="627290745"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="627290745"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Mar 2023 01:21:18 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paCSc-0002q9-0l;
	Thu, 09 Mar 2023 09:21:18 +0000
Date: Thu, 9 Mar 2023 17:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [linux-next:master 1604/2428] ERROR: modpost:
 "intel_soc_pmic_exec_mipi_pmic_seq_element"
 [drivers/platform/x86/x86-android-tablets/x86-android-tablets.ko] undefined!
Message-ID: <202303091711.howZNrIY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2c6433e9294b6d0f4d8f08c3c70a3eac434d3ec8
commit: 9b1d2662b8c586eb10cb939c7ae2c25bb36d2b61 [1604/2428] platform/x86: x86-android-tablets: Add touchscreen support for Lenovo Yoga Tab 3 Pro YT3-X90F
config: i386-randconfig-a016-20230206 (https://download.01.org/0day-ci/archive/20230309/202303091711.howZNrIY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=9b1d2662b8c586eb10cb939c7ae2c25bb36d2b61
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 9b1d2662b8c586eb10cb939c7ae2c25bb36d2b61
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091711.howZNrIY-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "intel_soc_pmic_exec_mipi_pmic_seq_element" [drivers/platform/x86/x86-android-tablets/x86-android-tablets.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
