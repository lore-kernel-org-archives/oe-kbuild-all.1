Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF626FBE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 13:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692625881; x=1724161881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9KoGnOLgZl/iJZQITUE5VAqncVp7CwuZwAv1+YOAsYs=;
  b=ZlG1wAnX35zo7WxAoU1BUMrZWxeLpuRXof+cBglUtWhTi9st9Ggc7J6N
   mffpoaRIGb3nktkaDNlJ+t8eyXuONuqd62px/T7vE9YZHx8sZypbkoIDL
   L/z7/6TWjNI1P1ORPuN6gTKW4F8FClX+c1Y2M9Daikp2q6vlpaV3NbOMx
   de8RjuK2Cs2e3mny/JTBqQcEswpvn955zN65NiWkruo3P/qXZTDo9o7e+
   qFLPBFi0tjk/db0jFBTMlP2DvoVxg/VBKOya4NDNrcWp9xFmmRahpFy2x
   hjTQN484Qm+obg+EisesYSoR7EF7L2PNxoTeCLUMW8V1VGg311bPDdySo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377331205"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="377331205"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 06:51:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="712795942"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="712795942"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Aug 2023 06:51:19 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY5JD-0000XA-0j;
	Mon, 21 Aug 2023 13:51:11 +0000
Date: Mon, 21 Aug 2023 21:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3294/11453] {standard input}:15: Error: symbol
 `__export_symbol_alpha_mv' is already defined
Message-ID: <202308212159.b9oCNgpw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
commit: 481461f5109919babbb393d6f68002936b8e2493 [3294/11453] linux/export.h: make <linux/export.h> independent of CONFIG_MODULES
config: alpha-randconfig-r011-20230821 (https://download.01.org/0day-ci/archive/20230821/202308212159.b9oCNgpw-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308212159.b9oCNgpw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308212159.b9oCNgpw-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/alpha/kernel/sys_sio.c:312:1: warning: no previous prototype for 'sio_kill_arch' [-Wmissing-prototypes]
     312 | sio_kill_arch(int mode)
         | ^~~~~~~~~~~~~
   {standard input}: Assembler messages:
>> {standard input}:15: Error: symbol `__export_symbol_alpha_mv' is already defined

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
