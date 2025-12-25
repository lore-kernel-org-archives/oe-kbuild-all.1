Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC1C239562
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 09:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766655349; cv=none; b=gES/Gx6buTwgyuthWZyDyJJUM73ncW7joWNHUoVpa6km23B8+5uYXviu/5DogtRDk+kNyFx9DEBJNjBR9Gtj828Ax0fvT4HlaziwMrrczna+3K+Ig8JZR1kbvq2eeDw3t+WYcW6LmwjTOZ+mu1HvYzvHM/fktAF6EwprSO1ceUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766655349; c=relaxed/simple;
	bh=t0XeGdQj1YAvAfOU1coK1DkMz4AmHrLGGN0whzkJ66Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nh0IMcyilfsSqz5sQP1/zqr2PwwFWepxZ1h4DAxQjIrtpUMOO+UtyHvoYHWhvxqZmWWHjtV/JT5TdD2N1/AG9uozVxmqKj1cfzqn0GhcyIaeTBb+rFdUFWtbGzgUQKDvFVIwWdFqD6Yh/t3C17dZMKBz+UfcWBLcVuxFxdm+BNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0Z+VPhV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0Z+VPhV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766655348; x=1798191348;
  h=date:from:to:cc:subject:message-id;
  bh=t0XeGdQj1YAvAfOU1coK1DkMz4AmHrLGGN0whzkJ66Y=;
  b=e0Z+VPhVZYn5vw0n/n14P2JoMYsp8qH67k0pbodEYDYO8iuibBQxmzb9
   UUNhUYnEE1le9mUcJ5Sa93IOwcC+zsyEKz7CU1SbKFuNIyfyESUDti9xl
   tPkqbiU3ch2OumGIzCxaDIJSuj6tC2yBur+z5lLdSQM3wT384cidBVuhM
   S9nyQkU524RbuuEo9x1z06TuoHgEsJkU24CF4kAKYazYlakqmZWCr+yHD
   TuOdBThl/hCRzWoj6QUb012v6436NKEcAd5GU10LxhEtQm8pRm4djfE2C
   QHFdJuj1PbBks+AhhEA8Eeczyky7mQiqW3H7dLow3RCh1V5JSxzBhrb28
   g==;
X-CSE-ConnectionGUID: G68dMxN/Se2A/HGXaeLAjw==
X-CSE-MsgGUID: IDuqJoJKTS6YYX/7k5KJqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="72317166"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="72317166"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 01:35:48 -0800
X-CSE-ConnectionGUID: qMq04oDWTfWMAviKF4xKaw==
X-CSE-MsgGUID: ae2Q34qnTueSib+cYmTv3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="200492630"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 25 Dec 2025 01:35:46 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYhkv-000000003x5-043X;
	Thu, 25 Dec 2025 09:35:40 +0000
Date: Thu, 25 Dec 2025 17:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 drivers/scsi/huawei/hifc/hifc_hba.c:762:37: warning: default initialization
 of an object of type 'struct unf_low_level_function_op_s' with const member
 leaves the object uninitialized
Message-ID: <202512251713.lhlEoibn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4e9c55920995d70b3e88b60c69753df54b03fdf4
commit: 7fc993d55d1b54ae40e29dfac825a18d04d644c6 [1942/1942] scsi/hifc: add hifc driver FC service module
config: x86_64-randconfig-071-20251213 (https://download.01.org/0day-ci/archive/20251225/202512251713.lhlEoibn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251713.lhlEoibn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251713.lhlEoibn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:59:
   include/linux/compiler-clang.h:20:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      20 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   drivers/scsi/huawei/hifc/hifc_hba.c:343:6: warning: no previous prototype for function 'hifc_flush_root_ctx' [-Wmissing-prototypes]
     343 | void hifc_flush_root_ctx(struct hifc_hba_s *v_hba)
         |      ^
   drivers/scsi/huawei/hifc/hifc_hba.c:343:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     343 | void hifc_flush_root_ctx(struct hifc_hba_s *v_hba)
         | ^
         | static 
   drivers/scsi/huawei/hifc/hifc_hba.c:406:6: warning: no previous prototype for function 'hifc_flush_srq_ctx' [-Wmissing-prototypes]
     406 | void hifc_flush_srq_ctx(struct hifc_hba_s *v_hba)
         |      ^
   drivers/scsi/huawei/hifc/hifc_hba.c:406:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     406 | void hifc_flush_srq_ctx(struct hifc_hba_s *v_hba)
         | ^
         | static 
>> drivers/scsi/huawei/hifc/hifc_hba.c:762:37: warning: default initialization of an object of type 'struct unf_low_level_function_op_s' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
     762 |         struct unf_low_level_function_op_s low_level_fun;
         |                                            ^
   drivers/scsi/huawei/hifc/unf_common.h:1779:21: note: member 'xchg_mgr_type' declared 'const' here
    1779 |         const unsigned int xchg_mgr_type;
         |                            ^
   drivers/scsi/huawei/hifc/hifc_hba.c:786:6: warning: no previous prototype for function 'hifc_release_probe_index' [-Wmissing-prototypes]
     786 | void hifc_release_probe_index(unsigned int probe_index)
         |      ^
   drivers/scsi/huawei/hifc/hifc_hba.c:786:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     786 | void hifc_release_probe_index(unsigned int probe_index)
         | ^
         | static 
   drivers/scsi/huawei/hifc/hifc_hba.c:1016:14: warning: no previous prototype for function 'hifc_assign_probe_index' [-Wmissing-prototypes]
    1016 | unsigned int hifc_assign_probe_index(unsigned int *v_probe_index)
         |              ^
   drivers/scsi/huawei/hifc/hifc_hba.c:1016:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1016 | unsigned int hifc_assign_probe_index(unsigned int *v_probe_index)
         | ^
         | static 
   drivers/scsi/huawei/hifc/hifc_hba.c:1038:5: warning: no previous prototype for function 'hifc_probe' [-Wmissing-prototypes]
    1038 | int hifc_probe(struct hifc_lld_dev *lld_dev, void **uld_dev, char *uld_dev_name)
         |     ^
   drivers/scsi/huawei/hifc/hifc_hba.c:1038:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1038 | int hifc_probe(struct hifc_lld_dev *lld_dev, void **uld_dev, char *uld_dev_name)
         | ^
         | static 
   drivers/scsi/huawei/hifc/hifc_hba.c:1497:6: warning: no previous prototype for function 'hifc_remove' [-Wmissing-prototypes]
    1497 | void hifc_remove(struct hifc_lld_dev *lld_dev, void *uld_dev)
         |      ^
   drivers/scsi/huawei/hifc/hifc_hba.c:1497:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1497 | void hifc_remove(struct hifc_lld_dev *lld_dev, void *uld_dev)
         | ^
         | static 
   drivers/scsi/huawei/hifc/hifc_hba.c:1570:6: warning: no previous prototype for function 'hifc_event' [-Wmissing-prototypes]
    1570 | void hifc_event(struct hifc_lld_dev *lld_dev, void *uld_dev,
         |      ^
   drivers/scsi/huawei/hifc/hifc_hba.c:1570:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1570 | void hifc_event(struct hifc_lld_dev *lld_dev, void *uld_dev,
         | ^
         | static 
   9 warnings generated.


vim +762 drivers/scsi/huawei/hifc/hifc_hba.c

31015b9ad992c4 Chenguangli 2020-11-16  758  
31015b9ad992c4 Chenguangli 2020-11-16  759  static unsigned int hifc_create_lport(struct hifc_hba_s *v_hba)
31015b9ad992c4 Chenguangli 2020-11-16  760  {
31015b9ad992c4 Chenguangli 2020-11-16  761  	void *lport = NULL;
31015b9ad992c4 Chenguangli 2020-11-16 @762  	struct unf_low_level_function_op_s low_level_fun;
31015b9ad992c4 Chenguangli 2020-11-16  763  
31015b9ad992c4 Chenguangli 2020-11-16  764  	HIFC_CHECK(INVALID_VALUE32, v_hba, return UNF_RETURN_ERROR);
31015b9ad992c4 Chenguangli 2020-11-16  765  	hifc_fun_op.dev = v_hba->pci_dev;
31015b9ad992c4 Chenguangli 2020-11-16  766  	memcpy(&low_level_fun, &hifc_fun_op,
31015b9ad992c4 Chenguangli 2020-11-16  767  	       sizeof(struct unf_low_level_function_op_s));
31015b9ad992c4 Chenguangli 2020-11-16  768  
31015b9ad992c4 Chenguangli 2020-11-16  769  	/* Update port configuration table */
31015b9ad992c4 Chenguangli 2020-11-16  770  	hifc_update_lport_config(v_hba, &low_level_fun);
31015b9ad992c4 Chenguangli 2020-11-16  771  
31015b9ad992c4 Chenguangli 2020-11-16  772  	/* Apply for lport resources */
31015b9ad992c4 Chenguangli 2020-11-16  773  	UNF_LOWLEVEL_ALLOC_LPORT(lport, v_hba, &low_level_fun);
31015b9ad992c4 Chenguangli 2020-11-16  774  	if (!lport) {
31015b9ad992c4 Chenguangli 2020-11-16  775  		HIFC_TRACE(UNF_EVTLOG_DRIVER_ERR, UNF_LOG_REG_ATT, UNF_ERR,
31015b9ad992c4 Chenguangli 2020-11-16  776  			   "[err]Port(0x%x) can't allocate Lport",
31015b9ad992c4 Chenguangli 2020-11-16  777  			   v_hba->port_cfg.port_id);
31015b9ad992c4 Chenguangli 2020-11-16  778  
31015b9ad992c4 Chenguangli 2020-11-16  779  		return UNF_RETURN_ERROR;
31015b9ad992c4 Chenguangli 2020-11-16  780  	}
31015b9ad992c4 Chenguangli 2020-11-16  781  	v_hba->lport = lport;
31015b9ad992c4 Chenguangli 2020-11-16  782  
31015b9ad992c4 Chenguangli 2020-11-16  783  	return RETURN_OK;
31015b9ad992c4 Chenguangli 2020-11-16  784  }
31015b9ad992c4 Chenguangli 2020-11-16  785  

:::::: The code at line 762 was first introduced by commit
:::::: 31015b9ad992c40fc0db81055932bbabe74f2533 scsi/hifc: add hifc driver port resource module

:::::: TO: Chenguangli <chenguangli2@huawei.com>
:::::: CC: Yang Yingliang <yangyingliang@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
