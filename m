Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F3110A0E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 15:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729956673; cv=none; b=B2WfBm6FiceDeAtr3Ezp3esFyOX0LPXgjgu9EkvOjemtMJiAj0GTzz0icKkkNr0hG/9/QdEM9NFQcvKefvuAMVlPvytGRwAAeOa0AvJkyB1Vw0wfqeLyh9gmJC/2gsbZjGp9448w5yD206gs2fGD993sxlRgNnmRRRY3KICUzuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729956673; c=relaxed/simple;
	bh=JRXRk2Wlj3HSA6xw5A1ILa+m1m9480tDLJ92g8FchM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ft43iFsMtY57YbFMPk+GCvcAkdRCiEu/yQpvSlP+HL/x5bTp7+LQVz02SXvYY1qt4YtvCifwTjWZS+3f1tYU1Kn4+Mp1TQGCKJu/PxhLerc5RhQlSMBm/ihM1faaza6atPd4DT/Zt3S0gOG/apMQBs2BIW3HDbaLPODHNYwZGwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvXHbXDz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvXHbXDz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729956670; x=1761492670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JRXRk2Wlj3HSA6xw5A1ILa+m1m9480tDLJ92g8FchM0=;
  b=FvXHbXDzQbBFNwopuDw5Nq7tDZ4oOkHriDezh3lo/AIYLLxlx9SuVDlF
   8D1B/mAXvSZy2d8MG89gH9CMp8cJhJJyhAODvw3FxaUGrHCfFMyTq/OXx
   6HoHGfu1l6AEdxPUqjSt0AioiH36xdr75h69hutAOfwxUoL3K5BT/Wj/j
   axEoHHkA2josqSBNF4JxBo4qcEY3UsVkvqQkn33S8oBaMcQJKsNuR31bm
   XPR+60J0yc3oq95hfdEjwfSNgArW17f4SYp4+KUNi1pbyxg1+jyu1I7I/
   K03jlrtdan7RqlRx1jYfGp/NVKaY3KzRt0ffbyB5CIf+1Tu1tUo59RLDd
   w==;
X-CSE-ConnectionGUID: Z++Ci9mCS8WK/240ubZhVg==
X-CSE-MsgGUID: N6TsBpO2TFWy/9DU/AU/3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="47102691"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="47102691"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 08:31:10 -0700
X-CSE-ConnectionGUID: ysmeoOT0T3e5BxwvjKHAhQ==
X-CSE-MsgGUID: ZQGg2vSAT86UMjU00dG5fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="85159267"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2024 08:31:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4ikr-000Zlz-2M;
	Sat, 26 Oct 2024 15:31:05 +0000
Date: Sat, 26 Oct 2024 23:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Nagalla <hnagalla@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Beleswar Padhi <b-padhi@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 1/6]
 drivers/remoteproc/ti_k3_r5_remoteproc.c:843:21: warning: unused variable
 'core1'
Message-ID: <202410262351.hxQJIIAs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   54789d7adda6ab12b4ca38d79c2554ff8af5b54e
commit: a04282dfaa0ae1917d43cc3f0bbdd8787a4688e6 [1/6] remoteproc: k3-r5: keep the device on during stop
config: arm64-randconfig-002-20241026 (https://download.01.org/0day-ci/archive/20241026/202410262351.hxQJIIAs-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410262351.hxQJIIAs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410262351.hxQJIIAs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/remoteproc/ti_k3_r5_remoteproc.c:10:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2170:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/remoteproc/ti_k3_r5_remoteproc.c:843:21: warning: unused variable 'core1' [-Wunused-variable]
     843 |         struct k3_r5_core *core1, *core = kproc->core;
         |                            ^~~~~
   2 warnings generated.


vim +/core1 +843 drivers/remoteproc/ti_k3_r5_remoteproc.c

6dedbd1d544389 Suman Anna     2020-10-02  812  
6dedbd1d544389 Suman Anna     2020-10-02  813  /*
6dedbd1d544389 Suman Anna     2020-10-02  814   * The R5F stop function includes the following operations
6dedbd1d544389 Suman Anna     2020-10-02  815   * 1. Halt R5F core(s)
6dedbd1d544389 Suman Anna     2020-10-02  816   *
6dedbd1d544389 Suman Anna     2020-10-02  817   * The sequence is different between LockStep and Split modes, and the order
6dedbd1d544389 Suman Anna     2020-10-02  818   * of cores the operations are performed are also in general reverse to that
6dedbd1d544389 Suman Anna     2020-10-02  819   * of the start function. The LockStep mode requires each operation to be
6dedbd1d544389 Suman Anna     2020-10-02  820   * performed first on Core0 followed by Core1. The Split-mode requires that
6dedbd1d544389 Suman Anna     2020-10-02  821   * Core0 to be maintained always in a higher power state that Core1 (implying
6dedbd1d544389 Suman Anna     2020-10-02  822   * Core1 needs to be stopped first before Core0).
6dedbd1d544389 Suman Anna     2020-10-02  823   *
ee99ee7c929c3e Suman Anna     2021-03-27  824   * The Single-CPU mode on applicable SoCs (eg: AM64x) only uses Core0 to execute
ee99ee7c929c3e Suman Anna     2021-03-27  825   * code, so only Core0 needs to be halted. The function uses the same logic
ee99ee7c929c3e Suman Anna     2021-03-27  826   * flow as Split-mode for this.
ee99ee7c929c3e Suman Anna     2021-03-27  827   *
6dedbd1d544389 Suman Anna     2020-10-02  828   * Note that the R5F halt operation in general is not effective when the R5F
6dedbd1d544389 Suman Anna     2020-10-02  829   * core is running, but is needed to make sure the core won't run after
6dedbd1d544389 Suman Anna     2020-10-02  830   * deasserting the reset the subsequent time. The asserting of reset can
6dedbd1d544389 Suman Anna     2020-10-02  831   * be done here, but is preferred to be done in the .unprepare() ops - this
6dedbd1d544389 Suman Anna     2020-10-02  832   * maintains the symmetric behavior between the .start(), .stop(), .prepare()
6dedbd1d544389 Suman Anna     2020-10-02  833   * and .unprepare() ops, and also balances them well between sysfs 'state'
1168af40b1ad8c Suman Anna     2022-02-13  834   * flow and device bind/unbind or module removal. This callback is invoked
1168af40b1ad8c Suman Anna     2022-02-13  835   * only in remoteproc mode.
6dedbd1d544389 Suman Anna     2020-10-02  836   */
6dedbd1d544389 Suman Anna     2020-10-02  837  static int k3_r5_rproc_stop(struct rproc *rproc)
6dedbd1d544389 Suman Anna     2020-10-02  838  {
7aa5007e280246 Hari Nagalla   2024-07-02  839  	unsigned long to  = msecs_to_jiffies(5000);
6dedbd1d544389 Suman Anna     2020-10-02  840  	struct k3_r5_rproc *kproc = rproc->priv;
6dedbd1d544389 Suman Anna     2020-10-02  841  	struct k3_r5_cluster *cluster = kproc->cluster;
511cc951d07ede Beleswar Padhi 2024-05-02  842  	struct device *dev = kproc->dev;
511cc951d07ede Beleswar Padhi 2024-05-02 @843  	struct k3_r5_core *core1, *core = kproc->core;
7aa5007e280246 Hari Nagalla   2024-07-02  844  	unsigned long msg = RP_MBOX_SHUTDOWN;
6dedbd1d544389 Suman Anna     2020-10-02  845  	int ret;
7aa5007e280246 Hari Nagalla   2024-07-02  846  	u32 stat = 0;
6dedbd1d544389 Suman Anna     2020-10-02  847  
6dedbd1d544389 Suman Anna     2020-10-02  848  	/* halt all applicable cores */
6dedbd1d544389 Suman Anna     2020-10-02  849  	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
6dedbd1d544389 Suman Anna     2020-10-02  850  		list_for_each_entry(core, &cluster->cores, elem) {
6dedbd1d544389 Suman Anna     2020-10-02  851  			ret = k3_r5_core_halt(core);
6dedbd1d544389 Suman Anna     2020-10-02  852  			if (ret) {
6dedbd1d544389 Suman Anna     2020-10-02  853  				core = list_prev_entry(core, elem);
6dedbd1d544389 Suman Anna     2020-10-02  854  				goto unroll_core_halt;
6dedbd1d544389 Suman Anna     2020-10-02  855  			}
6dedbd1d544389 Suman Anna     2020-10-02  856  		}
6dedbd1d544389 Suman Anna     2020-10-02  857  	} else {
1dc201a1afb1fb Hari Nagalla   2024-07-11  858  		if (kproc->rproc->state == RPROC_SUSPENDED) {
1dc201a1afb1fb Hari Nagalla   2024-07-11  859  			dev_err(dev, "We can't stop in suspended state!!!!\n");
1dc201a1afb1fb Hari Nagalla   2024-07-11  860  			mbox_free_channel(kproc->mbox);
1dc201a1afb1fb Hari Nagalla   2024-07-11  861  			return 0;
1dc201a1afb1fb Hari Nagalla   2024-07-11  862  		}
1dc201a1afb1fb Hari Nagalla   2024-07-11  863  
7aa5007e280246 Hari Nagalla   2024-07-02  864  		reinit_completion(&kproc->shut_comp);
7aa5007e280246 Hari Nagalla   2024-07-02  865  		ret = mbox_send_message(kproc->mbox, (void *)msg);
7aa5007e280246 Hari Nagalla   2024-07-02  866  		if (ret < 0) {
7aa5007e280246 Hari Nagalla   2024-07-02  867  			dev_err(dev, "PM mbox_send_message failed: %d\n", ret);
7aa5007e280246 Hari Nagalla   2024-07-02  868  			return ret;
7aa5007e280246 Hari Nagalla   2024-07-02  869  		}
7aa5007e280246 Hari Nagalla   2024-07-02  870  
7aa5007e280246 Hari Nagalla   2024-07-02  871  		ret = wait_for_completion_timeout(&kproc->shut_comp, to);
7aa5007e280246 Hari Nagalla   2024-07-02  872  		if (ret == 0) {
7aa5007e280246 Hari Nagalla   2024-07-02  873  			dev_err(dev, "%s: timeout waiting for rproc completion event\n", __func__);
7aa5007e280246 Hari Nagalla   2024-07-02  874  		} else {
7aa5007e280246 Hari Nagalla   2024-07-02  875  			ret = readx_poll_timeout(is_core_in_wfi, core, stat, stat, 200, 2000);
7aa5007e280246 Hari Nagalla   2024-07-02  876  			if (ret)
7aa5007e280246 Hari Nagalla   2024-07-02  877  				goto out;
7aa5007e280246 Hari Nagalla   2024-07-02  878  		}
511cc951d07ede Beleswar Padhi 2024-05-02  879  
6dedbd1d544389 Suman Anna     2020-10-02  880  		ret = k3_r5_core_halt(core);
6dedbd1d544389 Suman Anna     2020-10-02  881  		if (ret)
6dedbd1d544389 Suman Anna     2020-10-02  882  			goto out;
6dedbd1d544389 Suman Anna     2020-10-02  883  	}
6dedbd1d544389 Suman Anna     2020-10-02  884  
6dedbd1d544389 Suman Anna     2020-10-02  885  	return 0;
6dedbd1d544389 Suman Anna     2020-10-02  886  
6dedbd1d544389 Suman Anna     2020-10-02  887  unroll_core_halt:
6dedbd1d544389 Suman Anna     2020-10-02  888  	list_for_each_entry_from_reverse(core, &cluster->cores, elem) {
6dedbd1d544389 Suman Anna     2020-10-02  889  		if (k3_r5_core_run(core))
6dedbd1d544389 Suman Anna     2020-10-02  890  			dev_warn(core->dev, "core run back failed\n");
6dedbd1d544389 Suman Anna     2020-10-02  891  	}
6dedbd1d544389 Suman Anna     2020-10-02  892  out:
6dedbd1d544389 Suman Anna     2020-10-02  893  	return ret;
6dedbd1d544389 Suman Anna     2020-10-02  894  }
6dedbd1d544389 Suman Anna     2020-10-02  895  

:::::: The code at line 843 was first introduced by commit
:::::: 511cc951d07edef8c24687e57de0029e11c136d6 remoteproc: k3-r5: Do not allow core1 to power up before core0 via sysfs

:::::: TO: Beleswar Padhi <b-padhi@ti.com>
:::::: CC: Udit Kumar <u-kumar1@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
