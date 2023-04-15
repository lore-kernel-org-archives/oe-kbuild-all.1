Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E60EA3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 06:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681541121; x=1713077121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K3P+pYyUtqeycPDBVmalyAIlj8cXFHBqkbSiNl0WWzA=;
  b=J3uTt/M23vnLG/R6SIz7kXrIpAQFAFHfijNtyx7ugLHLYjg1bM1mdNcb
   FF7v96gYyJYq1lBKsTff83xzYCqnU2AsATqkirpm2ruSWc+tTa02P56NJ
   hzJY/pKwGTNkMQUdPIIv7p2m/QD8GFS0gmAdDhLxmoWUEn6JsoyOi1ZIA
   Pe2mMJ4tMvGg8t+KF2LSPoh/ud7oZV/Tu3ocmF36Kzj54CWHLyBkFxoW4
   YCwhWOkiDjWbP+Py/MPPEJeAvJz+63ChGaxpylXOtsMZAi/GbeyHRwjpF
   yqXVxgWsxD/rKGF1hz5w8h9/skQzAtSx0lHvteNk2Kt9e3bPyBHqRYQxn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="346465107"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="346465107"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 23:45:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="722724083"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="722724083"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 14 Apr 2023 23:45:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnZev-000acH-2N;
	Sat, 15 Apr 2023 06:45:17 +0000
Date: Sat, 15 Apr 2023 14:45:08 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-debug 8/8] arch/x86/kernel/head64.o: warning:
 objtool: x86_64_start_reservations() falls through to next function
 clear_bss()
Message-ID: <202304151401.OyrjZ9en-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-debug
head:   e98151beddae6d081bff7091b31f5a31c1b89b02
commit: e98151beddae6d081bff7091b31f5a31c1b89b02 [8/8] objtool: Move list of noreturn functions to separate file
config: x86_64-randconfig-a014-20230410 (https://download.01.org/0day-ci/archive/20230415/202304151401.OyrjZ9en-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=e98151beddae6d081bff7091b31f5a31c1b89b02
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-debug
        git checkout e98151beddae6d081bff7091b31f5a31c1b89b02
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/ crypto// drivers/ fs/ init// io_uring// kernel// lib// sound/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151401.OyrjZ9en-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/sysrq.o: warning: objtool: sysrq_handle_crash() falls through to next function sysrq_connect()
--
>> fs/cifs/connect.o: warning: objtool: cifs_demultiplex_thread() falls through to next function cifs_match_ipaddr()
--
>> drivers/staging/rts5208/rtsx.o: warning: objtool: rtsx_scan_thread() falls through to next function rtsx_control_thread()
>> drivers/staging/rts5208/rtsx.o: warning: objtool: rtsx_control_thread() falls through to next function slave_configure()
--
>> arch/x86/kernel/traps.o: warning: objtool: exc_double_fault() falls through to next function exc_bounds()
--
>> arch/x86/kernel/reboot.o: warning: objtool: native_machine_halt() falls through to next function native_machine_restart()
--
>> arch/x86/kernel/head64.o: warning: objtool: x86_64_start_reservations() falls through to next function clear_bss()
--
>> arch/x86/mm/init_64.o: warning: objtool: mem_init() falls through to next function set_memory_block_size_order()
--
>> sound/core/init.o: warning: objtool: snd_disconnect_release() falls through to next function snd_card_set_id()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
