Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A24C171A1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 07:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689837484; x=1721373484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=otTBBSmKhNX9hYNr3g/6JHNicG9rRkYsoupzh2M4nbk=;
  b=ZlwIP/af1UYBR915zMreMDRsGiXP0Wz3PyV2rpkIIdOby2D0cNgShwy8
   q+3S0g5IL8+vCroskdyCQRolH/gIhRaXQGBzEmp2q+Tc2ZU69TKz77DcN
   SfjswP1oH8QUw0TbfY6EsoYUMFMnTgr56agpXMN1BqJl5CMeoLF1Cie0t
   WEszFpmJcpHM56Ky0U8Lv6BQKnqf/e7rjaSm8kl+TNHo+iZuHM+AdM7oq
   3i1EoWPBhvVi12iplZiYmnv5fFsQeAMHGeV8jrXBn3dSGmoH23llG9WqZ
   3YvFLjJPg5tg8+SBbq1odz6QQcK1rDjEMN1Xk6oZI0iq1ps3ellQQLJuM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="370225267"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="370225267"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 00:18:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="898181192"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="898181192"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Jul 2023 00:18:02 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMNvG-0005sV-08;
	Thu, 20 Jul 2023 07:18:02 +0000
Date: Thu, 20 Jul 2023 15:17:56 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/210-gpu 110/110] /bin/bash: line 1: rustc: command
 not found
Message-ID: <202307201556.UXTxeJz0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   2f66e5641dd5c0f4d76f07ffcc110cdcd6e0690c
commit: 2f66e5641dd5c0f4d76f07ffcc110cdcd6e0690c [110/110] rust: 1.70 compat hack
config: sparc-randconfig-r016-20230720 (https://download.01.org/0day-ci/archive/20230720/202307201556.UXTxeJz0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307201556.UXTxeJz0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307201556.UXTxeJz0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: rustc: command not found
   expr: syntax error: unexpected argument '1.69.0'
--
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
--
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
--
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
   arch/sparc/kernel/asm-offsets.c:29:5: warning: no previous prototype for 'sparc64_foo' [-Wmissing-prototypes]
      29 | int sparc64_foo(void)
         |     ^~~~~~~~~~~
   arch/sparc/kernel/asm-offsets.c:48:5: warning: no previous prototype for 'foo' [-Wmissing-prototypes]
      48 | int foo(void)
         |     ^~~
   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
