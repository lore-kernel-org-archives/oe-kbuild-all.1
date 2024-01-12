Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B281ED5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 00:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TUPFYdWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705019237; x=1736555237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Arzk1NtrzKwyNx5ofjA2ZGzdFFK+flwk+mf7DnG9aR0=;
  b=TUPFYdWyiL76H/6YmbTmP/QbydFaJzMm8n++Z5RqKpZXo6mZHubf0CZm
   uhOinpr1y2WP25sW1i069dYRQHPHjV5ro6B0g7Ztz7f2gtYLfGtx0hc9z
   MaFRyS8+ppszIE7koPwitHzGlh+H78VeXvLMgCOLY8O1jPnIoKTpAagvW
   VOHFRgPmNAsKtOXmKsVwO1tu9Sk7xCFsbBziMwO6naQsxQWqeEWBBLkBt
   klnFNsFQdmGzrHQ+or6lp1s4qcyioari4qBIHn0dmeMffigocvvjKuM0k
   MgRCa1LvNA1NSdiqZlAEs1y1VH8LKnjCptLjHi9GUqFtfj3VnHv98aoH0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="397919469"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="397919469"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 16:27:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="853121899"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="853121899"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 11 Jan 2024 16:27:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rO5OB-0008tQ-1j;
	Fri, 12 Jan 2024 00:27:11 +0000
Date: Fri, 12 Jan 2024 08:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13240/13245] powerpc-linux-ld: warning: orphan
 section `.bss..Lubsan_data279' from `kernel/ptrace.o' being placed in
 section `.bss..Lubsan_data279'
Message-ID: <202401120827.fAJNcWMO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9e21984d62c56a0f6d1fc6f76b646212cfd7fe88
commit: 7511709cfbd438b90467726e4c107edf5b53815c [13240/13245] Merge branch 'bitmap-for-next' of https://github.com/norov/linux.git
config: powerpc-buildonly-randconfig-r002-20230209 (https://download.01.org/0day-ci/archive/20240112/202401120827.fAJNcWMO-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401120827.fAJNcWMO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401120827.fAJNcWMO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data279' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data279'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data279' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data279'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data279' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data279'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
