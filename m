Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35A1347B4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727348233; cv=none; b=F+avq9qS41LKQxq6nf82AYU5MOmeUz66kenWgsKVkVALzj0ST4WtnAY1nTGkDnhOLzVIf9F7YaElf/r/qEViZf6V2V6DBX5DZfZ+oBY0qdY3WFmPvsW/A+7dsgHAkGGurASudmOdFJ9vWI3v+W8/wbRqA//TZ/gDc2sAmang0Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727348233; c=relaxed/simple;
	bh=nD0Tv/r/eUX/21xyS+TDCCqT7Gw3ho+I5BBKZjgMy0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NjNAWmUevMPJFcZdy9hGNKk9yy/jHo5zY6KcWa0ko7ZxMy8T3qO4uYMaDYDvSBPfrZ8Wpm5u8j/0QORZn2nunThvkC/myvaAP2moF7Y2GfspFNe6SfWGh3OH5LTPd0Im/iJKbhp/B3Y6i3EZW3domisJPR/FOZ5gN4XRb0j7LUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQiGlhu+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQiGlhu+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727348232; x=1758884232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nD0Tv/r/eUX/21xyS+TDCCqT7Gw3ho+I5BBKZjgMy0k=;
  b=bQiGlhu++o6EADvWUdD957ONzi25hyFbOmtbtLxjjBUZvoS9DbztsqQ1
   AHTQcgYxGYmoAXNp/R8nZu0LZgeWVxpFn3W3i913Mi8z2FVRrdIsD+6kF
   s4sc2qU9t5FMo9MrS07528YzhX1JZB03kkBRpH3XohfVTZuo2ULf10Hh8
   j7pS+Iw6jF88JSdQ8aqZzdPKkY7kaeAzqOSHGUck7VzWNzV6L4Gbc/7Y+
   AjqrksutcaYkHuUEFXSLSU1xp8NwZBzm4rdJ6s/TYRV8vigD0AU9zk5zc
   pcA/jp3xXLZuvVmExiELUYKaYmmv6mjfJLjbXgbB/Jxc/0HWs3HYlUoVr
   A==;
X-CSE-ConnectionGUID: g1OPgcsgT4C0WoJ6xzoFzQ==
X-CSE-MsgGUID: b30tifHTR7meI5t1jfmqSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="48964115"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="48964115"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 03:57:12 -0700
X-CSE-ConnectionGUID: a91ST73FSmeV5tR9VSnw8w==
X-CSE-MsgGUID: wOrK4P+0Txe+tIHf/ZG1Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="72912307"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Sep 2024 03:57:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stmBF-000Kad-2J;
	Thu, 26 Sep 2024 10:57:05 +0000
Date: Thu, 26 Sep 2024 18:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 4/2443]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:4493:6: warning: no previous
 prototype for 'kvm_proc_interface_uninit'
Message-ID: <202409261816.Cf5IzRKT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   9d665359e14c559b74a94a55057e9c0fbd31a81a
commit: 38a321a597765f1969576a8263318bcd51ef2c1b [4/2443] fix:Don't reclaim kvm mmu pages in mmu_shrink
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240926/202409261816.Cf5IzRKT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261816.Cf5IzRKT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409261816.Cf5IzRKT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/x86/kvm/../../../virt/kvm/kvm_main.c:18:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/export.h:42,
                    from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:674:12: warning: no previous prototype for 'kvm_arch_post_init_vm' [-Wmissing-prototypes]
     674 | int __weak kvm_arch_post_init_vm(struct kvm *kvm)
         |            ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:683:13: warning: no previous prototype for 'kvm_arch_pre_destroy_vm' [-Wmissing-prototypes]
     683 | void __weak kvm_arch_pre_destroy_vm(struct kvm *kvm)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:4493:6: warning: no previous prototype for 'kvm_proc_interface_uninit' [-Wmissing-prototypes]
    4493 | void kvm_proc_interface_uninit(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:4501:5: warning: no previous prototype for 'kvm_proc_interface_init' [-Wmissing-prototypes]
    4501 | int kvm_proc_interface_init(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_proc_interface_uninit +4493 arch/x86/kvm/../../../virt/kvm/kvm_main.c

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
