Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8990817A2FC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Oct 2025 03:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759288694; cv=none; b=iSgK9SfwQcTmh74+G1+mLav27o3mz5gnccUAoYleAnD/5vbrAgcDKlo9C77aMxoOPEx7FdLYpeJdN8xMq2Bv2SGqvii6bTIQX6UsGMjVuPPa1TVbBoUMPj/46D++90DuC2wNJcKpgv115Qhs0l/UUYRLaB3jb86lWILamlZYZ7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759288694; c=relaxed/simple;
	bh=rTbp0EdmSmZgibvGHmR2mGGCzWCK078e4fDNK/nUpNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K/Av7Nte/DQqJzHVpCf0Buz9cI/LuB40Zk5/ecz09uIMgowDbAoYKbbW3ctPUD4pPecYmFUilprmH1oxn+56G1BRHo8xYmZne2T5h1tQ+Lu6KfpwsnQ6sMCO/Di5ytLQo0bAXx7lR5yk7LMLvODvfkyzbd+gCnqtwdWbpVDzce4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jn5qceje; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jn5qceje"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759288692; x=1790824692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rTbp0EdmSmZgibvGHmR2mGGCzWCK078e4fDNK/nUpNs=;
  b=Jn5qcejecBOJ32YEXgSajIRpObmTaCv8bfTtY5sSKfR2Us+txibGVyGX
   20OWwd980dDt9DSNebFCokLWF3+WY1AREf5tZ/gtNBsjyVBdCbIreSMZO
   coEmTgVdDww7OePWTy1t7HdhYK6tsTjzLZK7YeU1nt2Pb2slDT6J7VFHM
   pe4Tc48WfwbKeTApD9fvwBDVtxmYafJsCmxu6IZXT8G4Z84fCtIY2yElC
   xpj4l46u+vK6HVsEBduDiSUsCrBA9RU6h9O73s1yiIYQibMFnNKUYYWYe
   GjTXv+Y89hSpm3XoUhqtUnEdjk++38F/vd2GHFhqf2F/5iy6702AkXp6+
   g==;
X-CSE-ConnectionGUID: 8qW+0o0ETAyUznPhUcx1SA==
X-CSE-MsgGUID: j7jwoyLXQ1C8+lNt57bWsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61664387"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="61664387"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 20:18:11 -0700
X-CSE-ConnectionGUID: q7RpMTHwTlGAGLFV4Vc/pQ==
X-CSE-MsgGUID: 3BjQnDw8QkCsWBJXdVx3AA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Sep 2025 20:18:10 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3nLz-0002fp-39;
	Wed, 01 Oct 2025 03:18:07 +0000
Date: Wed, 1 Oct 2025 11:17:16 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for-nicolin 21/28] drivers/iommu/msm_iommu.c:408:25:
 error: continue statement not within a loop
Message-ID: <202510011143.HU3rrRe6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-nicolin
head:   88dcad1e4861f296ede23d6aa870ccedb3033a8b
commit: 2a389bb80a0cb2e1e92eb5bbcb54aec2d70afe68 [21/28] iommu/msm_iommu: Implement msm_iommu_domain_test_dev
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20251001/202510011143.HU3rrRe6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510011143.HU3rrRe6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510011143.HU3rrRe6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm/include/asm/traps.h:6,
                    from arch/arm/include/asm/thread_info.h:43,
                    from include/linux/thread_info.h:60,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/iommu/msm_iommu.c:10:
   drivers/iommu/msm_iommu.c: In function 'msm_iommu_domain_test_dev':
>> include/linux/list.h:770:9: error: expected ',' or ';' before 'for'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |         ^~~
   drivers/iommu/msm_iommu.c:403:9: note: in expansion of macro 'list_for_each_entry'
     403 |         list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:22,
                    from drivers/iommu/msm_iommu.c:8:
>> include/linux/container_of.h:24:55: error: expected statement before ')' token
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                                                       ^
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/iommu/msm_iommu.c:403:9: note: in expansion of macro 'list_for_each_entry'
     403 |         list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:771:14: warning: value computed is not used [-Wunused-value]
     771 |              !list_entry_is_head(pos, head, member);                    \
         |              ^
   drivers/iommu/msm_iommu.c:403:9: note: in expansion of macro 'list_for_each_entry'
     403 |         list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:772:48: error: expected ';' before ')' token
     772 |              pos = list_next_entry(pos, member))
         |                                                ^
   drivers/iommu/msm_iommu.c:403:9: note: in expansion of macro 'list_for_each_entry'
     403 |         list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:772:48: error: expected statement before ')' token
     772 |              pos = list_next_entry(pos, member))
         |                                                ^
   drivers/iommu/msm_iommu.c:403:9: note: in expansion of macro 'list_for_each_entry'
     403 |         list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {
         |         ^~~~~~~~~~~~~~~~~~~
>> drivers/iommu/msm_iommu.c:408:25: error: continue statement not within a loop
     408 |                         continue;
         |                         ^~~~~~~~
>> drivers/iommu/msm_iommu.c:398:35: warning: unused variable 'master' [-Wunused-variable]
     398 |         struct msm_iommu_ctx_dev *master;
         |                                   ^~~~~~


vim +408 drivers/iommu/msm_iommu.c

   393	
   394	static int msm_iommu_domain_test_dev(struct iommu_domain *domain,
   395					     struct device *dev, ioasid_t pasid,
   396					     struct iommu_domain *old)
   397	{
 > 398		struct msm_iommu_ctx_dev *master;
   399		struct msm_iommu_dev *iommu;
   400	
   401		guard(spinlock_irqsave)(&msm_iommu_lock)
   402	
   403		list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {
   404			struct msm_iommu_ctx_dev *master = list_first_entry(
   405				&iommu->ctx_list, struct msm_iommu_ctx_dev, list);
   406	
   407			if (master->of_node != dev->of_node)
 > 408				continue;
   409			list_for_each_entry(master, &iommu->ctx_list, list) {
   410				if (master->num) {
   411					dev_dbg(dev, "domain already attached");
   412					return -EBUSY;
   413				}
   414			}
   415		}
   416	
   417		return 0;
   418	}
   419	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
