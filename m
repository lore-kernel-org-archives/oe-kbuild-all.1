Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F408F4F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 19:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680377922; x=1711913922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JNRhm77EnZ2yyKKO3Zo8UK05mChzoj0Un0mQU53BlMc=;
  b=H7SVfhEAcUSBtEjwRCkoAau6KF68gL0au3goMl7ny5PW4UQU0lFyjuae
   dAFYGHJJ28wN19a6IiOoFcaXM5+Cg0JjoXBWECcMGi79tSRgLYolz6LBN
   TXl6OUdG9rg3LVfQpaO4e8ibM/EHHPsqL3VoCnl6Z4Xb0WN6u8jrdOj5i
   /WEAUiQG+k2Vxz9pD5f0nGEUYPZrObuwoBp42t70n22RTGYJbW6CYAFFN
   NLpR5VxWPXQb+aQvU5DUGFW5rJjUEj1Zn8HKNWMJOSL5npnm0mQ9r9v78
   3AWfTj9R99OGqo1gRoUCpqlvNKfYTXqCr7qGgOQH1bDlJT57qWeZH3q+o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="406721508"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="406721508"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 12:38:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="796523407"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="796523407"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Apr 2023 12:38:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pih3d-000Mzh-03;
	Sat, 01 Apr 2023 19:38:37 +0000
Date: Sun, 2 Apr 2023 03:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
	Grzegorz Bernacki <gjb@semihalf.com>,
	Mark Hasemeyer <markhas@chromium.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Felix Held <Felix.Held@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/6] i2c: designware: Add doorbell support for
 Mendocino
Message-ID: <202304020338.c4EJ0lmB-lkp@intel.com>
References: <20230329220753.7741-7-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329220753.7741-7-mario.limonciello@amd.com>

Hi Mario,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on 9117e682b8b79f7b5e2517fd28d42757d3e8b860]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/crypto-ccp-Drop-extra-doorbell-checks/20230330-060959
base:   9117e682b8b79f7b5e2517fd28d42757d3e8b860
patch link:    https://lore.kernel.org/r/20230329220753.7741-7-mario.limonciello%40amd.com
patch subject: [PATCH v7 6/6] i2c: designware: Add doorbell support for Mendocino
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230402/202304020338.c4EJ0lmB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/9696fd5743f2be39fab0ac256fad8dd9eae9930d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mario-Limonciello/crypto-ccp-Drop-extra-doorbell-checks/20230330-060959
        git checkout 9696fd5743f2be39fab0ac256fad8dd9eae9930d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304020338.c4EJ0lmB-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/i2c/busses/i2c-designware-amdpsp.o: in function `psp_send_i2c_req_doorbell':
>> i2c-designware-amdpsp.c:(.text+0x12): undefined reference to `psp_ring_platform_doorbell'
   ld: drivers/i2c/busses/i2c-designware-amdpsp.o: in function `psp_send_i2c_req_cezanne':
   i2c-designware-amdpsp.c:(.text+0x67): undefined reference to `psp_send_platform_access_msg'
   ld: drivers/i2c/busses/i2c-designware-amdpsp.o: in function `i2c_dw_amdpsp_probe_lock_support':
   i2c-designware-amdpsp.c:(.text+0x49d): undefined reference to `psp_check_platform_access_status'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
