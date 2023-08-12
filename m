Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65259EA1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 03:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691809563; x=1723345563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Wo3CkUo9Zjt3KhXcz9R3YCdbQZuqCg6JOHgJ1oZht0=;
  b=Us4QEAvpRA+SGWm21siPTinU+yD0jEI34hqsN2NdbCeNwnFAHWC/zbsg
   jkS9WCuAais/uQsM0Rg1CjKCjs/yhuRUbD4hjsR9J9Rcwj4jk+JmF7ttm
   hIiZdPlYNo0xTkE/3rQFCrny042Fu7tY6EfJnvX3fOP5L4Efn60dxireL
   FO/G0NNTQ80lRYYlTE+Kap9eeRN91FhdsjUyFiEO2GZdKSp1XvprzHlmS
   9gYDXgKYk/Z1SQGDm4O53lpV2P1BcbEe8zH0ALuNcJfWSQnRlkrISKj4x
   V28ag6wIXAsPcAnKDfafmwILwEP2ASOexlX/NJI/Ay9q/DnId2BePyG4g
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438132854"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="438132854"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 20:06:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="802876760"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="802876760"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2023 20:06:01 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUewy-0008Dk-1P;
	Sat, 12 Aug 2023 03:06:00 +0000
Date: Sat, 12 Aug 2023 11:05:47 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: hostaudio_kern.c:undefined reference to `unregister_sound_mixer'
Message-ID: <202308121029.peTEFwvG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   190bf7b14b0cf3df19c059061be032bd8994a597
commit: 0bbadafdc49d11a1836e5946f517d18cceaea6c8 um: allow disabling NO_IOMEM
date:   2 years, 2 months ago
config: um-randconfig-r025-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121029.peTEFwvG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121029.peTEFwvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121029.peTEFwvG-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: net/bpfilter/bpfilter_umh_blob.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: net/bpfilter/bpfilter_umh_blob.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: arch/um/drivers/hostaudio_kern.o: in function `hostaudio_cleanup_module':
>> hostaudio_kern.c:(.exit.text+0x1c): undefined reference to `unregister_sound_mixer'
>> /usr/bin/ld: hostaudio_kern.c:(.exit.text+0x2b): undefined reference to `unregister_sound_dsp'
   /usr/bin/ld: arch/um/drivers/hostaudio_kern.o: in function `hostaudio_init_module':
>> hostaudio_kern.c:(.init.text+0xb1): undefined reference to `register_sound_dsp'
>> /usr/bin/ld: hostaudio_kern.c:(.init.text+0x11f): undefined reference to `register_sound_mixer'
>> /usr/bin/ld: hostaudio_kern.c:(.init.text+0x186): undefined reference to `unregister_sound_dsp'
   collect2: error: ld returned 1 exit status

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LOCKDEP
   Depends on [n]: DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y] && (FRAME_POINTER [=n] || MIPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86)
   Selected by [y]:
   - DEBUG_LOCK_ALLOC [=y] && DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
