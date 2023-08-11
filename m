Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D443FA40
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 02:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691722169; x=1723258169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ojlsu/J1ejgentHCcjzGC29TlZRaYN0+poe3VrpBmUY=;
  b=UgFd95gm/rWFkGGBFQRPkANvWckXr3P46sE3vEwhEomZ8NJIp32UXBa7
   2p6v6mynQ9miWgUUMpFYhgN89rgcBn5TrGjvMQCOCfpfME1JhqyW3uQIn
   +LU1JfYLfh20omj1Uh+0g4JKyKRl9ifvH+yzJd0/2h2MFYv+GW0as5MhI
   U0kFTmIPkluWGNO11YdH915fZFdGGzQHCggXb1wl0K2uV+gJ37V1L9l12
   JjaBK2B3VkGvRk8c3LVIDG3ZvfVVWNyMrv0jBJfOKk3NzSrGwVuSRPqpD
   x3q4A1OlIo7YCwFQ7WwFX7bDKsT2nQA3Zf/UgbrdnUZGssU6LNcBRyjPL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="369050264"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="369050264"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 19:49:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="726086693"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="726086693"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Aug 2023 19:49:27 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUIDO-0007RM-30;
	Fri, 11 Aug 2023 02:49:26 +0000
Date: Fri, 11 Aug 2023 10:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: vmlinux.o: warning: objtool: .altinstr_replacement: unexpected end
 of section
Message-ID: <202308111023.TGLhfA02-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   25aa0bebba72b318e71fe205bfd1236550cc9534
commit: fb3bd914b3ec28f5fb697ac55c4846ac2d542855 x86/srso: Add a Speculative RAS Overflow mitigation
date:   2 weeks ago
config: x86_64-randconfig-x001-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111023.TGLhfA02-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111023.TGLhfA02-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111023.TGLhfA02-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .altinstr_replacement: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
