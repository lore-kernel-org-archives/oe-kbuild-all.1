Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945B424505
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 20:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691611302; x=1723147302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7PomCXJucOQi6vKw1NJms5tTRIDdXrmXJLMnQnpUICU=;
  b=MPSj9Y83dNrZL7baGbGBB44BGidMDYCaFMob01uDN+681k7f/Dwoobhz
   XpVmPAbRRDmI+PDLVQGbw0nWYg+J88d+CCER+E8v/2k0o1JqWV6tWFqrE
   C+jF6kEl2rYRObivhInz2atatrrr9AsRNkCFxE4hAosSabgLev5nAhrVe
   Ln5W8pKF09IhKLhoN8ofPPLMWOB0TVy58mmyhjaoj01Cc52ottNlGTMjo
   XjbS9IXYKhN8Wrkrp2/6qol7T7qVoPpK2+4QT1JT2lsJHifRM9wWzChF9
   Y6CSNbM61ERkA09offxyIzSNwLu+sghRBGfAaynbGQUuNWj93okuvxjsC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="374002186"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="374002186"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 13:01:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="725516008"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="725516008"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Aug 2023 13:01:42 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTpNG-0006M8-0A;
	Wed, 09 Aug 2023 20:01:42 +0000
Date: Thu, 10 Aug 2023 04:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/srso 6/17] bugs.c:undefined reference to
 `x86_return_thunk'
Message-ID: <202308100329.IFYDlkP8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/srso
head:   c11a8b2bc1bb3ad76d8d28b283552768d665208c
commit: 953a4955188e0ec86ce13daf1e5d4fbbba2db8fc [6/17] x86/cpu: Add SRSO untrain to retbleed=
config: x86_64-buildonly-randconfig-r002-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100329.IFYDlkP8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100329.IFYDlkP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100329.IFYDlkP8-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `retbleed_select_mitigation':
>> bugs.c:(.init.text+0xfdc4): undefined reference to `x86_return_thunk'
   ld: bugs.c:(.init.text+0xfdd0): undefined reference to `x86_return_thunk'
>> ld: bugs.c:(.init.text+0xfdd4): undefined reference to `srso_return_thunk'
   ld: bugs.c:(.init.text+0xff85): undefined reference to `x86_return_thunk'
   ld: bugs.c:(.init.text+0xff91): undefined reference to `x86_return_thunk'
   ld: bugs.c:(.init.text+0xff95): undefined reference to `srso_alias_return_thunk'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
