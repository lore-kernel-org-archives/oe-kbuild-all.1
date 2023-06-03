Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223821FB4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 22:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685832542; x=1717368542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SeXlg/j3HDDqZMdjZWeKEwbvExXnEWjxRy9FATglmu4=;
  b=hgOubvdLHCs5C6HvnvMnA8GptP1UPh2Qvg7AXCPNitgr2QIAKdUY3A4C
   iqT47rKRHh384vs0Yr7WEGHaRYFbnIof4xVe4kXhVRnChqXMwEFv60N8l
   wkgU3No22B01D0uBt3EgdTZCXjlrY7xG+Fliv2ds5sETKtWvgrAjPE7Sf
   bleY711mX/AIb/hxPDUAuFOPB2A9aSbs+2GhoAxZyHn+fCCmzzW+gWWtb
   2mAKPhT/WOqeWs8uu1/v8Ig4PaSAxNA3FVYP3q6M/eWR4DjzaWUO5Q/UV
   g5cT+ahLfVSr5RWW+ERpv9EDE6mU6pTJIfi4RAbyauTv5/3NaZZqTjmvQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="353614277"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="353614277"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 15:49:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="708217966"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="708217966"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Jun 2023 15:48:59 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5a3P-00025F-0M;
	Sat, 03 Jun 2023 22:48:59 +0000
Date: Sun, 4 Jun 2023 06:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6832/6849] drivers/input/tests/input_test.o:
 warning: objtool: input_test_grab() falls through to next function
 input_test_match_device_id()
Message-ID: <202306040600.A514Y0hC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc708bbd8260ee4eb3428b0109f5f3be661fae46
commit: d6a727ed1c395a6b128b58b96cb4a160d35b746c [6832/6849] Merge branch 'kunit' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
config: x86_64-buildonly-randconfig-r005-20230604 (https://download.01.org/0day-ci/archive/20230604/202306040600.A514Y0hC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d6a727ed1c395a6b128b58b96cb4a160d35b746c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d6a727ed1c395a6b128b58b96cb4a160d35b746c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/input/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306040600.A514Y0hC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/tests/input_test.o: warning: objtool: input_test_grab() falls through to next function input_test_match_device_id()
   drivers/input/tests/input_test.o: warning: objtool: input_test_match_device_id() falls through to next function input_test_timestamp()
   drivers/input/tests/input_test.o: warning: objtool: input_test_polling() falls through to next function input_test_exit()
   drivers/input/tests/input_test.o: warning: objtool: .text: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
