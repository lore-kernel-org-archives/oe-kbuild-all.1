Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4854223AE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Dec 2023 09:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4Bfimrb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703927185; x=1735463185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QKVamjYJckiSquGzM+hpv1HCDiZOCSHypWvMK/6o/Oo=;
  b=C4BfimrbPGRDHYBpafrg+XUgmWgHJ8lBCYWrebt5XnSo5MegnHuzIzv5
   MEnJCf5BlBd0HJ8QWQ2tKGpIngwqhOHHuQWMrN7KOgy8yM1A+xjILK5ol
   Uw2eRN60Cfd0sUud8JB6dEITw+pUTlU4HdmBl/yGnwZx8cSvWQgpfde+2
   K2CKEvoxa8TQf4o1NvZITEjG4D1+06vAdVO0QOw6Kpw8wSK4Re8AxRbqH
   s0UOGfWg3eVUN8kw7j38bbMmNwTA3ISmsGEWwTtyhL2EbKU0rliJf/jWv
   W/5IA+u69cxv0dirEusIFAa6OwuJZms3BBvZaZMjmHCTS18dM74/i9oSg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="400509817"
X-IronPort-AV: E=Sophos;i="6.04,317,1695711600"; 
   d="scan'208";a="400509817"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 01:06:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="922529662"
X-IronPort-AV: E=Sophos;i="6.04,317,1695711600"; 
   d="scan'208";a="922529662"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2023 01:06:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJVIS-000IHj-2V;
	Sat, 30 Dec 2023 09:06:20 +0000
Date: Sat, 30 Dec 2023 17:05:37 +0800
From: kernel test robot <lkp@intel.com>
To: Bauerchen <bauerchen@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev,
	kaixuxiakx <60962168+kaixuxiakx@users.noreply.github.com>,
	Jiang Biao <benbjiang@tencent.com>, Bin Lai <robinlai@tencent.com>
Subject: kernel/cgroup/mbuf.c:293:6: warning: no previous prototype for
 'mbuf_reset'
Message-ID: <202312301626.z7m09rci-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 7600f2ca4450f694f3d0ae89dbd741ea1d0f8ffa tqos/rqm: Tencent Quality Monitor Buffer
date:   2 years, 2 months ago
config: x86_64-oc_base_config (https://download.01.org/0day-ci/archive/20231230/202312301626.z7m09rci-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312301626.z7m09rci-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312301626.z7m09rci-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/mbuf.c:293:6: warning: no previous prototype for 'mbuf_reset' [-Wmissing-prototypes]
     293 | void mbuf_reset(struct mbuf_ring *mring)
         |      ^~~~~~~~~~
   kernel/cgroup/mbuf.c: In function 'mbuf_write':
>> kernel/cgroup/mbuf.c:308:9: warning: function 'mbuf_write' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     308 |         t_len = vscnprintf(text, sizeof(buf), fmt, args);
         |         ^~~~~


vim +/mbuf_reset +293 kernel/cgroup/mbuf.c

   292	
 > 293	void mbuf_reset(struct mbuf_ring *mring)
   294	{
   295		mring->first_idx = mring->base_idx;
   296		mring->first_seq = 0;
   297		mring->next_idx = mring->base_idx;
   298		mring->next_seq = 0;
   299	}
   300	
   301	static ssize_t mbuf_write(struct cgroup *cg, const char *fmt, va_list args)
   302	{
   303		static char buf[MBUF_MSG_LEN_MAX];
   304		char *text = buf;
   305		size_t t_len;
   306		ssize_t ret;
   307		/* Store string to buffer */
 > 308		t_len = vscnprintf(text, sizeof(buf), fmt, args);
   309	
   310		/* Write string to mbuf */
   311		ret = do_mbuf_write(cg, text, t_len);
   312	
   313		return ret;
   314	}
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
