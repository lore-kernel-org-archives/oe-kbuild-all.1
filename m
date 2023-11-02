Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5413721352
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 21:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqNsPMY2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698960273; x=1730496273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bPfOcqDTzdNZ4kIxeX8t+lJcJLFCB5AWv71jFxY+5gM=;
  b=hqNsPMY2ohuJUmQrEhl7DN7mDhTT8XzzHupD2pji7HQ6WbIUo2lBbnEt
   65wCR/twyPMESLLWDp1CkBFFNt80hPYw1EVIRCSZ9KjKDnMiaYLgEI7yR
   sRTUqlwiUe+th3cqsmjvtRWw8bFawXKlrme32Aux5oBFRSPtfbLu/NJhe
   j1W9A2ek3xjZ7Wj+fTjK4o6WqhUg4JixfAHnoGNWknnMH5K7iMOpzGGwB
   SW7Rn3wgQlOMbBWUkro8Rc1sLT2fe23sQSMSzGMm7fbCWfROmvonzTcE/
   jO4CTSQccnugerU4jdfpcZCMGqR2aqaR9OsrrYeLHR8xpRR4sq0oSkSPe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="368173225"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="368173225"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 14:24:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="754929610"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="754929610"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 Nov 2023 14:24:31 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyfAy-0001s0-2x;
	Thu, 02 Nov 2023 21:24:28 +0000
Date: Fri, 3 Nov 2023 05:23:53 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:patchset/meminfo/v2.1 1/1] csky-linux-ld:
 meminfo.c:undefined reference to `mem_fill_meminfo'
Message-ID: <202311030532.pLUhv7aO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git patchset/meminfo/v2.1
head:   5c1ab96e56a4029a8145ea39d829c1ae3c70b275
commit: 5c1ab96e56a4029a8145ea39d829c1ae3c70b275 [1/1] proc: Implement /proc/self/meminfo
config: csky-randconfig-002-20231103 (https://download.01.org/0day-ci/archive/20231103/202311030532.pLUhv7aO-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030532.pLUhv7aO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030532.pLUhv7aO-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: fs/proc/meminfo.o: in function `proc_meminfo_show':
   meminfo.c:(.text+0x644): undefined reference to `mem_fill_meminfo'
>> csky-linux-ld: meminfo.c:(.text+0x674): undefined reference to `mem_fill_meminfo'
   fs/f2fs/file.o: in function `f2fs_truncate_data_blocks_range':
   file.c:(.text+0x718e): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   file.c:(.text+0x719e): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   file.c:(.text+0x71a8): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   file.c:(.text+0x71b4): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   file.c:(.text+0x7218): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   file.c:(.text+0x7258): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   file.c:(.text+0x7292): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/f2fs/file.o: in function `f2fs_do_truncate_blocks':
   file.c:(.text+0x72ec): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   file.c:(.text+0x72fe): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   file.c:(.text+0x7330): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   file.c:(.text+0x733c): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
