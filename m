Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6BC111B5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 21:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694036413; x=1725572413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I1IirjNlis+aHLE4TDk6uQy9afNAewYuTOip+wpfmI8=;
  b=G7HhapPYpLGc2kTXsTdxX0pP6Qn9YAVuz/Wsk0z3JtvXps/Ufyy+OLzI
   xZAMbckBi5zKIfhAmiWL6TeHP0LuRLyFBVgRcXCsK1+jjyu9lAKsZeco7
   Q80c6dI1kJCBRt5PGm8Qtf8sBK70TzLxXar4RDWDST2UrkDJqtJGeCKqQ
   wCIPOWxcZWds2r/EHga0LXMlSq0AtekQVFpgt6E37/2Go+zCZCqm7MUP0
   i5fZEOMnNtBvmtp4raTut8U/ixzakFvHAnTHVffkJL972hi6PTzXuq19h
   93byXsd6y1YJ8l1hyjWu2IJZWJO4+8l0N+fW1/iS69QozFAoGXj/akQU+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="374585470"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="374585470"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 14:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="770979787"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="770979787"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Sep 2023 14:40:04 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe0Fm-0000c7-2A;
	Wed, 06 Sep 2023 21:40:02 +0000
Date: Thu, 7 Sep 2023 05:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jon Moeller <jon.moeller@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 3915/30000]
 drivers/platform/x86/sepdk/sep/sys64.o: warning: objtool: .text+0x0:
 unreachable instruction
Message-ID: <202309070541.BeS5foCY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jon,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   6bfae51123c09ed71d82cfc739c5ccbeac60c4aa
commit: fadb19e08fbf603c6b11d9c45dbf33accdd58016 [3915/30000] platform/x86: add sep and socwatch drivers without socperf.
config: x86_64-randconfig-r031-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070541.BeS5foCY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070541.BeS5foCY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070541.BeS5foCY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/sepdk/sep/sys64.o: warning: objtool: .text+0x0: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
