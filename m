Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0B8249E5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 20:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USb51bCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697833471; x=1729369471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vuhoCNFuxuZ6bMqCDP4RbxcrQAhDgzXstGhxK/5itH8=;
  b=USb51bCH0+fk4S6yCY77fcFmXYuU6xI+MDb6O3LNpv2r2MjAde79U6xL
   E2SMo48+3uXemfS1f2bvCr3whw2cpyLL54zsMOW188DmHvTCE7rc+JK4q
   pQXtn3gMbgti3UHq2RCJZkYeHRhy2Qa+dIcy3VrTbc+RcH6et0uCZhfbB
   zYxK4t9w6IHtdw4m3j+H0X7X7Id/czAwGweQ4Y8Gows39wpK6fIqtmDcp
   sDH88EwG1PbbfgLACMm7kanKZFBeGoLKgI7FuJjfV6FAjeHD3/g7B9LGz
   096QdLevTliBi+3LMWYMYiSdRlZ+sjdhrXG89LTmR1ws8yQAhJdkyU7UP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="5180902"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="5180902"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 13:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="901235293"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="901235293"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Oct 2023 13:22:19 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtw2l-0003xk-0h;
	Fri, 20 Oct 2023 20:24:27 +0000
Date: Sat, 21 Oct 2023 04:23:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:aarch64/hotplug-vcpu/v6.6-rc6 7/39] drivers/base/node.c:870:13:
 warning: unused variable 'cpu'
Message-ID: <202310210408.4VoVxRzH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git aarch64/hotplug-vcpu/v6.6-rc6
head:   35c66c6568cfd2b434e18ed82dcdefd03f8e986c
commit: b2e76aa62afbbd6fb72aa8485e1f042c9414da34 [7/39] drivers: base: remove unnecessary call to register_cpu_under_node()
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20231021/202310210408.4VoVxRzH-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310210408.4VoVxRzH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210408.4VoVxRzH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/node.c: In function '__register_one_node':
>> drivers/base/node.c:870:13: warning: unused variable 'cpu' [-Wunused-variable]
     870 |         int cpu;
         |             ^~~


vim +/cpu +870 drivers/base/node.c

4faf8d950ec438 Lee Schermerhorn  2009-12-14  866  
9037a9934349b0 Michal Hocko      2017-07-06  867  int __register_one_node(int nid)
0fc44159bfcb5b Yasunori Goto     2006-06-27  868  {
9037a9934349b0 Michal Hocko      2017-07-06  869  	int error;
9037a9934349b0 Michal Hocko      2017-07-06 @870  	int cpu;
0fc44159bfcb5b Yasunori Goto     2006-06-27  871  
8732794b166196 Wen Congyang      2012-12-11  872  	node_devices[nid] = kzalloc(sizeof(struct node), GFP_KERNEL);
8732794b166196 Wen Congyang      2012-12-11  873  	if (!node_devices[nid])
8732794b166196 Wen Congyang      2012-12-11  874  		return -ENOMEM;
8732794b166196 Wen Congyang      2012-12-11  875  
a7be6e5a7f8da4 Dou Liyang        2017-07-10  876  	error = register_node(node_devices[nid], nid);
76b67ed9dce69a KAMEZAWA Hiroyuki 2006-06-27  877  
08d9dbe72b1f89 Keith Busch       2019-03-11  878  	INIT_LIST_HEAD(&node_devices[nid]->access_list);
acc02a109b0497 Keith Busch       2019-03-11  879  	node_init_caches(nid);
0fc44159bfcb5b Yasunori Goto     2006-06-27  880  
0fc44159bfcb5b Yasunori Goto     2006-06-27  881  	return error;
0fc44159bfcb5b Yasunori Goto     2006-06-27  882  }
0fc44159bfcb5b Yasunori Goto     2006-06-27  883  

:::::: The code at line 870 was first introduced by commit
:::::: 9037a9934349b0e180896fc8cacaf1819418ba03 mm, memory_hotplug: split up register_one_node()

:::::: TO: Michal Hocko <mhocko@suse.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
