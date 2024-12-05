Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C078FC0A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 02:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733365683; cv=none; b=VEQEaU9uypwsPmC+2NomZUtDX2B2exR4ziloowCNa0NSeJYwtYPkmxOhnmF8+nJZUYFLR5mjE60ZQ244MZtsGvfp4I/qrKbzCdNhzsh9xCmO2qDpm7Xf1VBduirTlf9lsvjqzVB4s8mzk7CreYADc2yRkbQ1rk0zv2nsVcFFHew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733365683; c=relaxed/simple;
	bh=uW2pCTH1q9vv4fd+jyCL2REKRt/PJXiJlQnUzjRAnOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qc5CsocpA2jGuvYiSsIuO1Zfw8eaTO4zeDb8/w2Js/MgZCyqBPxU24gg/vcL69wuXHQPVRhAnRYSdOkYdj9nrMjKs1L4CDiq7/A4B11MrUNibO2itobq0Bm69WAcgFR0SCn7RQ1Ew070wgE++YpHDsDmYyRkpLlQ7UTjt91XWI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGIJdH/E; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGIJdH/E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733365681; x=1764901681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uW2pCTH1q9vv4fd+jyCL2REKRt/PJXiJlQnUzjRAnOU=;
  b=HGIJdH/EmlZGrk+sEb9r5uFQPLAwmv9Tf+SD/2qiOjSKxNWLfWcAVp8a
   iTPCiBVtQwsaZfO0LxwQji6XWcSh8/RaL6Glkg6qmaWwC1ijFnhDKoCh8
   9VNRw04v8MpTs2dP8KyC3bwUgN95OQTzHatuFMKjsGgD9mw/fLZLS2nMj
   bVGWVjzGbwMKAkaPNRs67zlzXTDu3PKxJKt5XjCNcT/mGcWSwHRJSDCDG
   4k98862fWWrGET4xzlphgxj5DZ4u+wzbBeGuU5nOEG7rfMF1x+1G11xRl
   RavPkZIfFVd8udkPwTfj+XccBQbN0DLOHBRw7J99GJaEDskfoAou4juYa
   A==;
X-CSE-ConnectionGUID: VVLrFotPRju6xWjWJry08A==
X-CSE-MsgGUID: GIiv4Vs9TPG3kVWzOIytlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33906099"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33906099"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 18:28:00 -0800
X-CSE-ConnectionGUID: 3TC4K9+PQ7S5vYldTD2TXA==
X-CSE-MsgGUID: lCMOREQLT96qll9mev4RGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="98025660"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Dec 2024 18:27:57 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ1as-0003gt-2o;
	Thu, 05 Dec 2024 02:27:54 +0000
Date: Thu, 5 Dec 2024 10:27:18 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 arch/arm64/kvm/../../../virt/kvm/kvm_main.c:4493:6: warning: no previous
 prototype for 'kvm_proc_interface_uninit'
Message-ID: <202412051048.nRj9CQbE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chen,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: 38a321a597765f1969576a8263318bcd51ef2c1b [1/1] fix:Don't reclaim kvm mmu pages in mmu_shrink
config: arm64-randconfig-r051-20241204 (https://download.01.org/0day-ci/archive/20241205/202412051048.nRj9CQbE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051048.nRj9CQbE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051048.nRj9CQbE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:674:12: warning: no previous prototype for 'kvm_arch_post_init_vm' [-Wmissing-prototypes]
     674 | int __weak kvm_arch_post_init_vm(struct kvm *kvm)
         |            ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:683:13: warning: no previous prototype for 'kvm_arch_pre_destroy_vm' [-Wmissing-prototypes]
     683 | void __weak kvm_arch_pre_destroy_vm(struct kvm *kvm)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/kvm_main.c:4493:6: warning: no previous prototype for 'kvm_proc_interface_uninit' [-Wmissing-prototypes]
    4493 | void kvm_proc_interface_uninit(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/kvm_main.c:4501:5: warning: no previous prototype for 'kvm_proc_interface_init' [-Wmissing-prototypes]
    4501 | int kvm_proc_interface_init(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_proc_interface_uninit +4493 arch/arm64/kvm/../../../virt/kvm/kvm_main.c

  4492	
> 4493	void kvm_proc_interface_uninit(void)
  4494	{
  4495		remove_proc_entry("kvm_control/kvmmmu_reclaim_times", NULL);
  4496		remove_proc_entry("kvm_control/kvmmmu_reclaim_try_times", NULL);
  4497		remove_proc_entry("kvm_control/kvmmmu_limit_nr", NULL);
  4498		remove_proc_entry("kvm_control", NULL);
  4499	}
  4500	
> 4501	int kvm_proc_interface_init(void)
  4502	{
  4503		int ret = -ENOMEM;
  4504		if (!proc_mkdir("kvm_control", NULL))
  4505			goto err;
  4506	
  4507		if (!proc_create("kvm_control/kvmmmu_limit_nr", 0, NULL, &kvmmmu_limit_nr_proc_fops))
  4508			goto err;
  4509	
  4510		if (!proc_create("kvm_control/kvmmmu_reclaim_try_times", 0, NULL, &kvmmmu_reclaim_try_times_proc_fops))
  4511			goto err;
  4512	
  4513		if (!proc_create("kvm_control/kvmmmu_reclaim_times", 0, NULL, &kvmmmu_reclaim_times_proc_fops))
  4514			goto err;
  4515	
  4516		return 0;
  4517	err:
  4518		kvm_proc_interface_uninit();
  4519		return ret;
  4520	}
  4521	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
