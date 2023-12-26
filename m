Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD181374
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Dec 2023 19:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBSb/lek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703617638; x=1735153638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yGipo9fGvOfvoIe6CCg29NhKiF5+H1C5bglSh3Pytnc=;
  b=LBSb/lekKFB4sNVieu7SugzCDxJgnsE0+b8O/vIqE7o7VqqeCzDmDwAB
   FC+WtYgdnzWF8WSvRbOPXWgTauK3DfAxy6zyzyN2iAuNNb2sSl+ViueR4
   e9v9DaCZl/gRQ21F5emxfhh7E/fIUPuU4Th8CCGSd1fhZUTGdDjzBg5x+
   vRy2YvtVFkljCfxDlS3hOz/zOKU8XsMucYMMhnqJZktUpWGJT9xogsK75
   9sBXhoKE3h4Xcv7bwbuH5WgaA5rGnhfmORMk1VoCniXv1sE9JHTKeWucn
   QpPLffUtUEZyUxT4v0HOtJTh7kx9drDT3K15PKqfqq2FDKpO/zeSQ12V+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="3208633"
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; 
   d="scan'208";a="3208633"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 11:07:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="754243396"
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; 
   d="scan'208";a="754243396"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 26 Dec 2023 11:07:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIClk-000ElN-38;
	Tue, 26 Dec 2023 19:07:12 +0000
Date: Wed, 27 Dec 2023 03:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: Traian Schiau <traianx.schiau@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 2940/30000]
 drivers/hwtracing/intel_th/msu.c:151: warning: Function parameter or member
 'cbs' not described in 'msc_register_callbacks'
Message-ID: <202312270302.FANp2F6z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Traian,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   2b69ccfcb3117ca97de0f8d4e752e4776133afb8
commit: fa58bb9ec815252228bd8a3ec0e2a8264f5203dd [2940/30000] intel_th: New MSU kernel APIs
config: i386-randconfig-r001-20230906 (https://download.01.org/0day-ci/archive/20231227/202312270302.FANp2F6z-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231227/202312270302.FANp2F6z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312270302.FANp2F6z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7:0,
                    from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from drivers/hwtracing/intel_th/msu.c:11:
   drivers/hwtracing/intel_th/msu.c: In function 'npkt_bind_buffer':
   include/linux/kern_levels.h:5:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:308:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   drivers/hwtracing/intel_th/msu.c:1696:3: note: in expansion of macro 'pr_err'
      pr_err("ioremap failed for buffer %s 0x%llx size:0x%x\n",
      ^~~~~~
   drivers/hwtracing/intel_th/msu.c:57: warning: Function parameter or member 'msc' not described in 'msc_window'
   drivers/hwtracing/intel_th/msu.c:99: warning: bad line: 
   drivers/hwtracing/intel_th/msu.c:135: warning: Function parameter or member 'iter_list' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:151: warning: Function parameter or member 'cbs' not described in 'msc_register_callbacks'
   drivers/hwtracing/intel_th/msu.c:1174: warning: Function parameter or member 'nr_pages' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:1174: warning: Function parameter or member 'nr_wins' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:1174: warning: Excess function parameter 'size' description in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:1598: warning: Function parameter or member 'buf' not described in 'stop_buffer_trace'
   drivers/hwtracing/intel_th/msu.c:1636: warning: Function parameter or member 'file' not described in 'read_npkt_dump_buf'
   drivers/hwtracing/intel_th/msu.c:1636: warning: Function parameter or member 'user_buf' not described in 'read_npkt_dump_buf'
   drivers/hwtracing/intel_th/msu.c:1636: warning: Function parameter or member 'count' not described in 'read_npkt_dump_buf'
   drivers/hwtracing/intel_th/msu.c:1636: warning: Function parameter or member 'ppos' not described in 'read_npkt_dump_buf'
   drivers/hwtracing/intel_th/msu.c:1670: warning: Function parameter or member 'type' not described in 'npkt_bind_buffer'
   drivers/hwtracing/intel_th/msu.c:1670: warning: Function parameter or member 'abuf' not described in 'npkt_bind_buffer'
   drivers/hwtracing/intel_th/msu.c:1670: warning: Function parameter or member 'flags' not described in 'npkt_bind_buffer'
   drivers/hwtracing/intel_th/msu.c:1670: warning: Function parameter or member 'buf' not described in 'npkt_bind_buffer'
   drivers/hwtracing/intel_th/msu.c:1670: warning: Function parameter or member 'msc' not described in 'npkt_bind_buffer'
   drivers/hwtracing/intel_th/msu.c:1728: warning: Function parameter or member 'msc' not described in 'intel_th_npkt_init'
   drivers/hwtracing/intel_th/msu.c:1767: warning: Function parameter or member 'msc' not described in 'intel_th_npkt_remove'
   drivers/hwtracing/intel_th/msu.c:1785: warning: Function parameter or member 'thdev' not described in 'intel_th_msc_first_trace'


vim +151 drivers/hwtracing/intel_th/msu.c

   143	
   144	static LIST_HEAD(msc_dev_instances);
   145	static DEFINE_SPINLOCK(msc_dev_reg_lock);
   146	/**
   147	 * msc_register_callbacks()
   148	 * @cbs
   149	 */
   150	int msc_register_callbacks(struct msc_probe_rem_cb cbs)
 > 151	{
   152		struct msc_device_instance *it;
   153	
   154		spin_lock(&msc_dev_reg_lock);
   155	
   156		msc_probe_rem_cb.probe = cbs.probe;
   157		msc_probe_rem_cb.remove = cbs.remove;
   158		/* Call the probe callback for the already existing ones*/
   159		list_for_each_entry(it, &msc_dev_instances, list) {
   160			cbs.probe(it->thdev);
   161		}
   162	
   163		spin_unlock(&msc_dev_reg_lock);
   164		return 0;
   165	}
   166	EXPORT_SYMBOL_GPL(msc_register_callbacks);
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
