Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22AB24509
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 22:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691620551; x=1723156551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JOpnelBEhFuI//YEFaTuUtWQJDKtK8TSj2ASH79uBVI=;
  b=ANe4n6y06gif++4ibueU8vh3v1QvrX8SIvt38gqlaCy6+JjKuM2BbEYp
   RBdCMnW2c8wKqRV9URQJ6ZgBE0DKJLf5W5p9YivC0wXMDdt8CjF/3+tTZ
   ikS2QbGYiM6OZKNBzWk81IXhhTooz08cCNfQvK2mW4MsLOIZuNGPijHz2
   wbRCX+/trNscgb3LVYdi1VJGOGEXmpRNO7ZIUxQ5GTmHdBsS4yMlUBarM
   GWDsWU3H0hmb7ah6JdK8HtIPGkuDEK5dCiOEsgk0lpT3a0356TA7942EM
   Em25gh4Ku+roIA45khig/KkozK99quFbjITLahcHkPpIIKhJ86/eodSnF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="350824130"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="350824130"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 15:35:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="731979540"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="731979540"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Aug 2023 15:35:48 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTrmN-0006SS-1l;
	Wed, 09 Aug 2023 22:35:47 +0000
Date: Thu, 10 Aug 2023 06:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/srso 17/17] ld:
 vmlinux.o:(.altinstr_replacement+0x6): undefined reference to
 `zen_untrain_ret'
Message-ID: <202308100624.ncDHdemt-lkp@intel.com>
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
commit: c11a8b2bc1bb3ad76d8d28b283552768d665208c [17/17] x86/cpu: Use fancy alternatives to get rid of entry_untrain_ret()
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230810/202308100624.ncDHdemt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100624.ncDHdemt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100624.ncDHdemt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: vmlinux.o:(.altinstr_replacement+0x6): undefined reference to `zen_untrain_ret'
   ld: vmlinux.o:(.altinstr_replacement+0x7c): undefined reference to `zen_untrain_ret'
   ld: vmlinux.o:(.altinstr_replacement+0x1e9): undefined reference to `zen_untrain_ret'
   ld: vmlinux.o:(.altinstr_replacement+0x214): undefined reference to `zen_untrain_ret'
   ld: vmlinux.o:(.altinstr_replacement+0x24c): undefined reference to `zen_untrain_ret'
   ld: vmlinux.o:(.altinstr_replacement+0x27a): more undefined references to `zen_untrain_ret' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
