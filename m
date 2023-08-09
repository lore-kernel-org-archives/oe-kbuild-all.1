Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CE61D2F1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 21:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691618100; x=1723154100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NtXzPzFyioYe75Mq1LHbqRxSteuEkv4KzJ8DGNAj1YY=;
  b=SB6OV/Ubx6yEt5nlVdluy+C5ZlUZNOKvkh7+119UAQsq/Y7reDm98DqW
   x/0OanrNNwXEqku82WXnEwYaDsulsxjsfX4M4w+e25CZcrYEXaGpuDLPk
   3ZCZ6EVpMWPDxU1kxp1yrCRso6AuOv4yUf8NWq54iA1FaaNA53XyLqUFj
   gNJZTlrLQ2YQ7Q3DbnKC1BaK1KweTA9unpYeRLxbsUI0AKTbCqi0/YiNE
   RPSIUWL/a0iae3NsXlqZgfFwZgfv2sCpHSZZujYjNmehR97sT88HsdOht
   HViQvRUnwIjiCUk7Z2TRTUVIV6bBxeL7LHH4/lUJ3SH0oEI1csrOINn4L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="368698637"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="368698637"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 14:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="821991732"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="821991732"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2023 14:54:46 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTr8f-0006R2-2N;
	Wed, 09 Aug 2023 21:54:45 +0000
Date: Thu, 10 Aug 2023 05:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/srso 12/17] ld: bugs.c:undefined reference to
 `retbleed_return_thunk'
Message-ID: <202308100522.fVKAvoKO-lkp@intel.com>
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
commit: 5ea91c46f6a18720af332166f85544c31886dcdb [12/17] x86/cpu: Rename original retbleed methods
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230810/202308100522.fVKAvoKO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100522.fVKAvoKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100522.fVKAvoKO-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/bugs.o: in function `retbleed_select_mitigation':
   bugs.c:(.init.text+0x105): undefined reference to `srso_return_thunk'
>> ld: bugs.c:(.init.text+0x259): undefined reference to `retbleed_return_thunk'
   ld: bugs.c:(.init.text+0x25e): undefined reference to `x86_return_thunk'
   ld: bugs.c:(.init.text+0x3c9): undefined reference to `srso_alias_return_thunk'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
