Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527FD19539
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 16:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687364251; x=1718900251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XqwcmVewCriPa0+XZEvQeDjgcmuKyAyCXkh5dhorvsU=;
  b=Z5eFW2hKx43LcDGvuw/9OKuSooyZbHssW5tl8if1z5F8DbQJy071ANFQ
   32k/Ngh10b+zcH20tQ1zpQSj6uxzZKbEKQeDPIEc8yk8OEJRfutQOO0F0
   FYDPg/PO+ZWk0rMOKnD/AokceBfN9ODbqmGZpXSRVws4VGPDivnPixHmY
   I4Br8ENtI6e2LpdkC4NIjlFIhNvjZc6mRrAaC0SiQQ3wSeTQsIo1s8VJD
   yjYdcbqVJ7UxEQMuj1wcUBE279wne36hlxxKFupTB9lSxmfF+ZcEC47vS
   gOWZbAtAWgcd7TqENIuTB5fdJ0aV4KENNTk1QH1OG9tghPCpH0/po2UBa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="340568368"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="340568368"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 09:17:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="691901282"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="691901282"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Jun 2023 09:17:12 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC0W7-0006w5-1E;
	Wed, 21 Jun 2023 16:17:11 +0000
Date: Thu, 22 Jun 2023 00:16:56 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 7464/9999] arch/x86/kernel/smp.o: warning:
 objtool: sysvec_reboot()+0x49: unreachable instruction
Message-ID: <202306220054.mef0Phks-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   471e639e59d128f4bf58000a118b2ceca3893f98
commit: 54aa76ad5f0148ad54fc7ad42ad5a079bc12efee [7464/9999] x86: Mark stop_this_cpu() __noreturn
config: x86_64-randconfig-a004-20230621 (https://download.01.org/0day-ci/archive/20230622/202306220054.mef0Phks-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220054.mef0Phks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220054.mef0Phks-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/smp.o: warning: objtool: sysvec_reboot()+0x49: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
