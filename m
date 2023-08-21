Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38194748E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 23:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692662264; x=1724198264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EcrJm55tgIuih90gi6MvgIDfPgsc623DGONFP8w2nSM=;
  b=bgWSfU2WudO2wTU5H68P+rPsi+jJyN/0WayAM0PHcEDJpb4SoOlBo9mW
   ZkkBGZ7Sy1I4Szl/s3ILXepmRpeiaue5qIKhBIjLOsBfTTHqLOQuYQ3js
   kT76B9azXzKVoR57MIw6Pe3K77MRgEcP3v+fFiDrhOM9yewYbMVjdOB8r
   aycxA7f4w3CuDO0rTk+xrutkYSIGV5P7J3Boox3CGyMqTXh5Oo4Wju0oe
   Mf1aamzy9TQ+bVKPhDDbIJD9Ce9ctQ8JpG8lREa/v3NB88/rZBh6gDbZn
   LVmn7cn0Aqov25GP7CXPUQXzamRYzlRJ/h9Wpn/ah00rkMv94q2K6trAU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437653905"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="437653905"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 16:57:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="806092430"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="806092430"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Aug 2023 16:57:42 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYEmB-000159-0g;
	Mon, 21 Aug 2023 23:57:40 +0000
Date: Tue, 22 Aug 2023 07:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:linux-5.15.y 9987/9999] arch/x86/lib/retpoline.o:
 warning: objtool: .text.__x86.return_thunk+0xe0: unreachable instruction
Message-ID: <202308220722.fuZpZZmH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
head:   83a2789925e622472f36cd887a4dac590487e6ab
commit: 6ff8e597c2aa143efa3e362d9b62e8f30a894c9c [9987/9999] x86/cpu: Fix up srso_safe_ret() and __x86_return_thunk()
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230822/202308220722.fuZpZZmH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220722.fuZpZZmH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220722.fuZpZZmH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/lib/retpoline.o: warning: objtool: .text.__x86.return_thunk+0xe0: unreachable instruction


objdump-func vmlinux.o .text.__x86.return_thunk:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
