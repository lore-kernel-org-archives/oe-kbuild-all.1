Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE165FDBC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 19:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706987607; cv=none; b=F/z7Hqf6fSfKnOkaheN8wA0MTApmFUDeODZk9dKIE1an4F1+PKf/dwW4rmM8wEEOn1xCae7s2+Iu/QyRb5JJyIfzKH0fTRRwHxrRUelLLhlVSYEhm0q7fZia6FL4uQB3V2wLAu7KEu/YT0k4AkALPHTGh0dsYrSu4wwR0XvfZaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706987607; c=relaxed/simple;
	bh=bIPMpFjD1pvjkAH4OMizyGb/amhD2LuI3/49DWsDDFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sGjtuooNt2Fh2KUbWMW2EHPCqfGhgzl2P/Graol3a3VC0ngSVyiGC19PX9auQ98lCMKagtNQPWp8ZxiJ+H2Gsa/F2d55BvABb2r1XNt0tgQ/x3gV8ZCToVWRlNzi0QFBLDsNH8b0Tqja2fzf1GJB6GAZXjr9790zDDrjjOM1HiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFFMyY5v; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFFMyY5v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706987604; x=1738523604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bIPMpFjD1pvjkAH4OMizyGb/amhD2LuI3/49DWsDDFc=;
  b=QFFMyY5v+ER4xImWh+y6U8iTNSMfVE8IqEB/29ifNT7QSRGAkucOZb9I
   Uv9Q7tHH92HFvDgZr6M0NudspSF86kBFXowh4ZqbMUXmBZfIH0Em8dTwo
   TWfg/6C6JYVUgEPvC8AW+5P8gytSpxmoX8EmInwIYXwTU23t+RCiP2mv6
   gNr4iecOPaoZJ0DmzlRnagiT+oq5lzltWsC0c/dh7hW9A27yck/Awh72S
   +X0qmSrQPAE/ZlNvzncCigtQkcAK4bOW5PI+iAhhr/BfYCOL8xhJagXsF
   br2Xcxfk2Na4fDs9taL4gaf+k2aIEERSr0Uz00pkOnbVn69pK1uNDfuLe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="435476114"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="435476114"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 11:13:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="4973113"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Feb 2024 11:13:21 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWLS2-0005Ui-1u;
	Sat, 03 Feb 2024 19:13:18 +0000
Date: Sun, 4 Feb 2024 03:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Liu <weix.w.liu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Zhao Yakui <yakui.zhao@intel.com>
Subject: [intel-lts:4.19/android_s 2639/30000]
 drivers/char/vhm/vhm_dev.c:213:21: error: result of comparison of constant
 -1 with expression of type 'uint16_t' (aka 'unsigned short') is always false
Message-ID: <202402040356.1EzMoPhY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   f2b228e8331cfde18e95b9fdeb61f16ae51d0c48
commit: d565882f6078a9021084cdf146dff014265f5dca [2639/30000] vhm: enable -Werror while compiling vhm/vbs/hyper-dmabuf
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240204/202402040356.1EzMoPhY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402040356.1EzMoPhY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402040356.1EzMoPhY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/vhm/vhm_dev.c:67:
   include/linux/pagemap.h:401:21: error: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
     401 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/char/vhm/vhm_dev.c:213:21: error: result of comparison of constant -1 with expression of type 'uint16_t' (aka 'unsigned short') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
     213 |                         (created_vm.vmid == ACRN_INVALID_VMID)) {
         |                          ~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> drivers/vbs/vq.c:69:8: error: no previous prototype for function 'paddr_guest2host' [-Werror,-Wmissing-prototypes]
      69 | void * paddr_guest2host(struct ctx *ctx, uintptr_t gaddr, size_t len)
         |        ^
   drivers/vbs/vq.c:69:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      69 | void * paddr_guest2host(struct ctx *ctx, uintptr_t gaddr, size_t len)
         | ^
         | static 
   1 error generated.
--
>> drivers/vhm/vhm_msi.c:96:6: error: no previous prototype for function 'acrn_write_msi_msg' [-Werror,-Wmissing-prototypes]
      96 | void acrn_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
         |      ^
   drivers/vhm/vhm_msi.c:96:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      96 | void acrn_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
         | ^
         | static 
   1 error generated.


vim +213 drivers/char/vhm/vhm_dev.c

620cc8723a316c liang ding    2018-08-31  154  
620cc8723a316c liang ding    2018-08-31  155  static long vhm_dev_ioctl(struct file *filep,
620cc8723a316c liang ding    2018-08-31  156  		unsigned int ioctl_num, unsigned long ioctl_param)
620cc8723a316c liang ding    2018-08-31  157  {
620cc8723a316c liang ding    2018-08-31  158  	long ret = 0;
620cc8723a316c liang ding    2018-08-31  159  	struct vhm_vm *vm;
3938b6b8c84f86 Binbin Wu     2018-08-31  160  	struct ic_ptdev_irq ic_pt_irq;
3938b6b8c84f86 Binbin Wu     2018-08-31  161  	struct hc_ptdev_irq hc_pt_irq;
620cc8723a316c liang ding    2018-08-31  162  
620cc8723a316c liang ding    2018-08-31  163  	trace_printk("[%s] ioctl_num=0x%x\n", __func__, ioctl_num);
620cc8723a316c liang ding    2018-08-31  164  
8e944e51a35be9 Jason Chen CJ 2018-08-31  165  	if (ioctl_num == IC_GET_API_VERSION) {
8e944e51a35be9 Jason Chen CJ 2018-08-31  166  		struct api_version api_version;
8e944e51a35be9 Jason Chen CJ 2018-08-31  167  
8e944e51a35be9 Jason Chen CJ 2018-08-31  168  		api_version.major_version = VHM_API_VERSION_MAJOR;
8e944e51a35be9 Jason Chen CJ 2018-08-31  169  		api_version.minor_version = VHM_API_VERSION_MINOR;
8e944e51a35be9 Jason Chen CJ 2018-08-31  170  
8e944e51a35be9 Jason Chen CJ 2018-08-31  171  		if (copy_to_user((void *)ioctl_param, &api_version,
8e944e51a35be9 Jason Chen CJ 2018-08-31  172  			sizeof(struct api_version)))
8e944e51a35be9 Jason Chen CJ 2018-08-31  173  			return -EFAULT;
8e944e51a35be9 Jason Chen CJ 2018-08-31  174  
8e944e51a35be9 Jason Chen CJ 2018-08-31  175  		return 0;
873306e1558851 Victor Sun    2018-08-31  176  	} else if (ioctl_num == IC_PM_SET_SSTATE_DATA) {
873306e1558851 Victor Sun    2018-08-31  177  		struct acpi_sstate_data host_sstate_data;
873306e1558851 Victor Sun    2018-08-31  178  
873306e1558851 Victor Sun    2018-08-31  179  		if (copy_from_user(&host_sstate_data,
873306e1558851 Victor Sun    2018-08-31  180  			(void *)ioctl_param, sizeof(host_sstate_data)))
873306e1558851 Victor Sun    2018-08-31  181  			return -EFAULT;
873306e1558851 Victor Sun    2018-08-31  182  
873306e1558851 Victor Sun    2018-08-31  183  		ret = hcall_set_sstate_data(virt_to_phys(&host_sstate_data));
873306e1558851 Victor Sun    2018-08-31  184  		if (ret < 0) {
873306e1558851 Victor Sun    2018-08-31  185  			pr_err("vhm: failed to set host Sstate data!");
873306e1558851 Victor Sun    2018-08-31  186  			return -EFAULT;
873306e1558851 Victor Sun    2018-08-31  187  		}
873306e1558851 Victor Sun    2018-08-31  188  		return 0;
8e944e51a35be9 Jason Chen CJ 2018-08-31  189  	}
8e944e51a35be9 Jason Chen CJ 2018-08-31  190  
3938b6b8c84f86 Binbin Wu     2018-08-31  191  	memset(&hc_pt_irq, 0, sizeof(hc_pt_irq));
3938b6b8c84f86 Binbin Wu     2018-08-31  192  	memset(&ic_pt_irq, 0, sizeof(ic_pt_irq));
620cc8723a316c liang ding    2018-08-31  193  	vm = (struct vhm_vm *)filep->private_data;
620cc8723a316c liang ding    2018-08-31  194  	if (vm == NULL) {
620cc8723a316c liang ding    2018-08-31  195  		pr_err("vhm: invalid VM !\n");
620cc8723a316c liang ding    2018-08-31  196  		return -EFAULT;
620cc8723a316c liang ding    2018-08-31  197  	}
620cc8723a316c liang ding    2018-08-31  198  	if ((vm->vmid == ACRN_INVALID_VMID) && (ioctl_num != IC_CREATE_VM)) {
620cc8723a316c liang ding    2018-08-31  199  		pr_err("vhm: invalid VM ID !\n");
620cc8723a316c liang ding    2018-08-31  200  		return -EFAULT;
620cc8723a316c liang ding    2018-08-31  201  	}
620cc8723a316c liang ding    2018-08-31  202  
620cc8723a316c liang ding    2018-08-31  203  	switch (ioctl_num) {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  204  	case IC_CREATE_VM: {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  205  		struct acrn_create_vm created_vm;
620cc8723a316c liang ding    2018-08-31  206  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  207  		if (copy_from_user(&created_vm, (void *)ioctl_param,
6ad7b799a12c19 Mingqiang Chi 2018-08-31  208  			sizeof(struct acrn_create_vm)))
6ad7b799a12c19 Mingqiang Chi 2018-08-31  209  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  210  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  211  		ret = hcall_create_vm(virt_to_phys(&created_vm));
6ad7b799a12c19 Mingqiang Chi 2018-08-31  212  		if ((ret < 0) ||
6ad7b799a12c19 Mingqiang Chi 2018-08-31 @213  			(created_vm.vmid == ACRN_INVALID_VMID)) {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  214  			pr_err("vhm: failed to create VM from Hypervisor !\n");
6ad7b799a12c19 Mingqiang Chi 2018-08-31  215  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  216  		}
6ad7b799a12c19 Mingqiang Chi 2018-08-31  217  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  218  		if (copy_to_user((void *)ioctl_param, &created_vm,
708fcc4b9ac8de Shuo Liu      2018-08-31  219  			sizeof(struct acrn_create_vm))) {
708fcc4b9ac8de Shuo Liu      2018-08-31  220  			ret = -EFAULT;
708fcc4b9ac8de Shuo Liu      2018-08-31  221  			goto create_vm_fail;
708fcc4b9ac8de Shuo Liu      2018-08-31  222  		}
6ad7b799a12c19 Mingqiang Chi 2018-08-31  223  		vm->vmid = created_vm.vmid;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  224  
70e00450a2cde4 Mingqiang Chi 2018-08-31  225  		if (created_vm.vm_flag & SECURE_WORLD_ENABLED) {
70e00450a2cde4 Mingqiang Chi 2018-08-31  226  			ret = init_trusty(vm);
70e00450a2cde4 Mingqiang Chi 2018-08-31  227  			if (ret < 0) {
70e00450a2cde4 Mingqiang Chi 2018-08-31  228  				pr_err("vhm: failed to init trusty for VM!\n");
708fcc4b9ac8de Shuo Liu      2018-08-31  229  				goto create_vm_fail;
70e00450a2cde4 Mingqiang Chi 2018-08-31  230  			}
70e00450a2cde4 Mingqiang Chi 2018-08-31  231  		}
70e00450a2cde4 Mingqiang Chi 2018-08-31  232  
7a284034cd73da Shuo Liu      2018-08-31  233  		if (created_vm.req_buf) {
7a284034cd73da Shuo Liu      2018-08-31  234  			ret = acrn_ioreq_init(vm, created_vm.req_buf);
7a284034cd73da Shuo Liu      2018-08-31  235  			if (ret < 0)
7a284034cd73da Shuo Liu      2018-08-31  236  				goto ioreq_buf_fail;
7a284034cd73da Shuo Liu      2018-08-31  237  		}
7a284034cd73da Shuo Liu      2018-08-31  238  
b2da3a3e004570 Yin Fengwei   2018-08-31  239  		pr_info("vhm: VM %d created\n", created_vm.vmid);
620cc8723a316c liang ding    2018-08-31  240  		break;
7a284034cd73da Shuo Liu      2018-08-31  241  ioreq_buf_fail:
7a284034cd73da Shuo Liu      2018-08-31  242  		if (created_vm.vm_flag & SECURE_WORLD_ENABLED)
7a284034cd73da Shuo Liu      2018-08-31  243  			deinit_trusty(vm);
708fcc4b9ac8de Shuo Liu      2018-08-31  244  create_vm_fail:
708fcc4b9ac8de Shuo Liu      2018-08-31  245  		hcall_destroy_vm(created_vm.vmid);
708fcc4b9ac8de Shuo Liu      2018-08-31  246  		vm->vmid = ACRN_INVALID_VMID;
708fcc4b9ac8de Shuo Liu      2018-08-31  247  		break;
708fcc4b9ac8de Shuo Liu      2018-08-31  248  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  249  	}
620cc8723a316c liang ding    2018-08-31  250  
b2da3a3e004570 Yin Fengwei   2018-08-31  251  	case IC_START_VM: {
b2da3a3e004570 Yin Fengwei   2018-08-31  252  		ret = hcall_start_vm(vm->vmid);
6ad7b799a12c19 Mingqiang Chi 2018-08-31  253  		if (ret < 0) {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  254  			pr_err("vhm: failed to start VM %ld!\n", vm->vmid);
6ad7b799a12c19 Mingqiang Chi 2018-08-31  255  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  256  		}
620cc8723a316c liang ding    2018-08-31  257  		break;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  258  	}
620cc8723a316c liang ding    2018-08-31  259  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  260  	case IC_PAUSE_VM: {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  261  		ret = hcall_pause_vm(vm->vmid);
6ad7b799a12c19 Mingqiang Chi 2018-08-31  262  		if (ret < 0) {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  263  			pr_err("vhm: failed to pause VM %ld!\n", vm->vmid);
6ad7b799a12c19 Mingqiang Chi 2018-08-31  264  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  265  		}
620cc8723a316c liang ding    2018-08-31  266  		break;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  267  	}
620cc8723a316c liang ding    2018-08-31  268  
af3aec8d03b10c Yin Fengwei   2018-08-31  269  	case IC_RESET_VM: {
af3aec8d03b10c Yin Fengwei   2018-08-31  270  		ret = hcall_reset_vm(vm->vmid);
6316a2c85a06f9 Yin Fengwei   2018-08-31  271  		if (ret < 0) {
6316a2c85a06f9 Yin Fengwei   2018-08-31  272  			pr_err("vhm: failed to restart VM %ld!\n", vm->vmid);
6316a2c85a06f9 Yin Fengwei   2018-08-31  273  			return -EFAULT;
6316a2c85a06f9 Yin Fengwei   2018-08-31  274  		}
6316a2c85a06f9 Yin Fengwei   2018-08-31  275  		break;
6316a2c85a06f9 Yin Fengwei   2018-08-31  276  	}
6316a2c85a06f9 Yin Fengwei   2018-08-31  277  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  278  	case IC_DESTROY_VM: {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  279  		ret = hcall_destroy_vm(vm->vmid);
6ad7b799a12c19 Mingqiang Chi 2018-08-31  280  		if (ret < 0) {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  281  			pr_err("failed to destroy VM %ld\n", vm->vmid);
6ad7b799a12c19 Mingqiang Chi 2018-08-31  282  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  283  		}
947248aecd8c8c Jason Chen CJ 2018-09-08  284  		if (vm->trusty_host_gpa)
947248aecd8c8c Jason Chen CJ 2018-09-08  285  			deinit_trusty(vm);
6ad7b799a12c19 Mingqiang Chi 2018-08-31  286  		vm->vmid = ACRN_INVALID_VMID;
620cc8723a316c liang ding    2018-08-31  287  		break;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  288  	}
6ad7b799a12c19 Mingqiang Chi 2018-08-31  289  
2ef00321e436b2 Yin Fengwei   2018-08-31  290  	case IC_CREATE_VCPU: {
2ef00321e436b2 Yin Fengwei   2018-08-31  291  		struct acrn_create_vcpu cv;
2ef00321e436b2 Yin Fengwei   2018-08-31  292  
2ef00321e436b2 Yin Fengwei   2018-08-31  293  		if (copy_from_user(&cv, (void *)ioctl_param,
2ef00321e436b2 Yin Fengwei   2018-08-31  294  				sizeof(struct acrn_create_vcpu)))
2ef00321e436b2 Yin Fengwei   2018-08-31  295  			return -EFAULT;
2ef00321e436b2 Yin Fengwei   2018-08-31  296  
2ef00321e436b2 Yin Fengwei   2018-08-31  297  		ret = acrn_hypercall2(HC_CREATE_VCPU, vm->vmid,
2ef00321e436b2 Yin Fengwei   2018-08-31  298  				virt_to_phys(&cv));
2ef00321e436b2 Yin Fengwei   2018-08-31  299  		if (ret < 0) {
b2da3a3e004570 Yin Fengwei   2018-08-31  300  			pr_err("vhm: failed to create vcpu %d!\n", cv.vcpu_id);
2ef00321e436b2 Yin Fengwei   2018-08-31  301  			return -EFAULT;
2ef00321e436b2 Yin Fengwei   2018-08-31  302  		}
9e93f374b20e04 Shuo Liu      2018-08-31  303  		atomic_inc(&vm->vcpu_num);
2ef00321e436b2 Yin Fengwei   2018-08-31  304  
2ef00321e436b2 Yin Fengwei   2018-08-31  305  		return ret;
2ef00321e436b2 Yin Fengwei   2018-08-31  306  	}
2ef00321e436b2 Yin Fengwei   2018-08-31  307  
a3516e45df8bf0 Jason Chen CJ 2018-08-31  308  	case IC_SET_MEMSEG: {
a3516e45df8bf0 Jason Chen CJ 2018-08-31  309  		struct vm_memmap memmap;
a3516e45df8bf0 Jason Chen CJ 2018-08-31  310  
a3516e45df8bf0 Jason Chen CJ 2018-08-31  311  		if (copy_from_user(&memmap, (void *)ioctl_param,
a3516e45df8bf0 Jason Chen CJ 2018-08-31  312  			sizeof(struct vm_memmap)))
a3516e45df8bf0 Jason Chen CJ 2018-08-31  313  			return -EFAULT;
a3516e45df8bf0 Jason Chen CJ 2018-08-31  314  
a3516e45df8bf0 Jason Chen CJ 2018-08-31  315  		ret = map_guest_memseg(vm, &memmap);
a3516e45df8bf0 Jason Chen CJ 2018-08-31  316  		break;
a3516e45df8bf0 Jason Chen CJ 2018-08-31  317  	}
a3516e45df8bf0 Jason Chen CJ 2018-08-31  318  
c6736f665a4c22 Edwin Zhai    2018-09-05  319  	case IC_UNSET_MEMSEG: {
c6736f665a4c22 Edwin Zhai    2018-09-05  320  		struct vm_memmap memmap;
c6736f665a4c22 Edwin Zhai    2018-09-05  321  
c6736f665a4c22 Edwin Zhai    2018-09-05  322  		if (copy_from_user(&memmap, (void *)ioctl_param,
c6736f665a4c22 Edwin Zhai    2018-09-05  323  			sizeof(struct vm_memmap)))
c6736f665a4c22 Edwin Zhai    2018-09-05  324  			return -EFAULT;
c6736f665a4c22 Edwin Zhai    2018-09-05  325  
c6736f665a4c22 Edwin Zhai    2018-09-05  326  		ret = unmap_guest_memseg(vm, &memmap);
c6736f665a4c22 Edwin Zhai    2018-09-05  327  		break;
c6736f665a4c22 Edwin Zhai    2018-09-05  328  	}
c6736f665a4c22 Edwin Zhai    2018-09-05  329  
18c3251b679455 Jason Chen CJ 2018-08-31  330  	case IC_SET_IOREQ_BUFFER: {
18c3251b679455 Jason Chen CJ 2018-08-31  331  		/* init ioreq buffer */
18c3251b679455 Jason Chen CJ 2018-08-31  332  		ret = acrn_ioreq_init(vm, (unsigned long)ioctl_param);
7a284034cd73da Shuo Liu      2018-08-31  333  		if (ret < 0 && ret != -EEXIST)
18c3251b679455 Jason Chen CJ 2018-08-31  334  			return ret;
7a284034cd73da Shuo Liu      2018-08-31  335  		ret = 0;
18c3251b679455 Jason Chen CJ 2018-08-31  336  		break;
18c3251b679455 Jason Chen CJ 2018-08-31  337  	}
18c3251b679455 Jason Chen CJ 2018-08-31  338  
18c3251b679455 Jason Chen CJ 2018-08-31  339  	case IC_CREATE_IOREQ_CLIENT: {
18c3251b679455 Jason Chen CJ 2018-08-31  340  		int client_id;
18c3251b679455 Jason Chen CJ 2018-08-31  341  
18c3251b679455 Jason Chen CJ 2018-08-31  342  		client_id = acrn_ioreq_create_fallback_client(vm->vmid, "acrndm");
18c3251b679455 Jason Chen CJ 2018-08-31  343  		if (client_id < 0)
18c3251b679455 Jason Chen CJ 2018-08-31  344  			return -EFAULT;
18c3251b679455 Jason Chen CJ 2018-08-31  345  		return client_id;
18c3251b679455 Jason Chen CJ 2018-08-31  346  	}
18c3251b679455 Jason Chen CJ 2018-08-31  347  
18c3251b679455 Jason Chen CJ 2018-08-31  348  	case IC_DESTROY_IOREQ_CLIENT: {
18c3251b679455 Jason Chen CJ 2018-08-31  349  		int client = ioctl_param;
18c3251b679455 Jason Chen CJ 2018-08-31  350  
18c3251b679455 Jason Chen CJ 2018-08-31  351  		acrn_ioreq_destroy_client(client);
18c3251b679455 Jason Chen CJ 2018-08-31  352  		break;
18c3251b679455 Jason Chen CJ 2018-08-31  353  	}
18c3251b679455 Jason Chen CJ 2018-08-31  354  
18c3251b679455 Jason Chen CJ 2018-08-31  355  	case IC_ATTACH_IOREQ_CLIENT: {
18c3251b679455 Jason Chen CJ 2018-08-31  356  		int client = ioctl_param;
18c3251b679455 Jason Chen CJ 2018-08-31  357  
18c3251b679455 Jason Chen CJ 2018-08-31  358  		return acrn_ioreq_attach_client(client, 0);
18c3251b679455 Jason Chen CJ 2018-08-31  359  	}
18c3251b679455 Jason Chen CJ 2018-08-31  360  
18c3251b679455 Jason Chen CJ 2018-08-31  361  	case IC_NOTIFY_REQUEST_FINISH: {
5e6f50d6887923 Jason Chen CJ 2018-08-31  362  		struct ioreq_notify notify;
18c3251b679455 Jason Chen CJ 2018-08-31  363  
18c3251b679455 Jason Chen CJ 2018-08-31  364  		if (copy_from_user(&notify, (void *)ioctl_param,
18c3251b679455 Jason Chen CJ 2018-08-31  365  					sizeof(notify)))
18c3251b679455 Jason Chen CJ 2018-08-31  366  			return -EFAULT;
18c3251b679455 Jason Chen CJ 2018-08-31  367  
5e6f50d6887923 Jason Chen CJ 2018-08-31  368  		ret = acrn_ioreq_complete_request(notify.client_id, notify.vcpu);
18c3251b679455 Jason Chen CJ 2018-08-31  369  		if (ret < 0)
18c3251b679455 Jason Chen CJ 2018-08-31  370  			return -EFAULT;
18c3251b679455 Jason Chen CJ 2018-08-31  371  		break;
18c3251b679455 Jason Chen CJ 2018-08-31  372  	}
18c3251b679455 Jason Chen CJ 2018-08-31  373  
8273ff9cd59a21 liang ding    2017-12-29  374  	case IC_ASSERT_IRQLINE: {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  375  		struct acrn_irqline irq;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  376  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  377  		if (copy_from_user(&irq, (void *)ioctl_param, sizeof(irq)))
6ad7b799a12c19 Mingqiang Chi 2018-08-31  378  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  379  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  380  		ret = hcall_assert_irqline(vm->vmid, virt_to_phys(&irq));
6ad7b799a12c19 Mingqiang Chi 2018-08-31  381  		if (ret < 0) {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  382  			pr_err("vhm: failed to assert irq!\n");
6ad7b799a12c19 Mingqiang Chi 2018-08-31  383  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  384  		}
8273ff9cd59a21 liang ding    2017-12-29  385  		break;
8273ff9cd59a21 liang ding    2017-12-29  386  	}
8273ff9cd59a21 liang ding    2017-12-29  387  	case IC_DEASSERT_IRQLINE: {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  388  		struct acrn_irqline irq;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  389  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  390  		if (copy_from_user(&irq, (void *)ioctl_param, sizeof(irq)))
6ad7b799a12c19 Mingqiang Chi 2018-08-31  391  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  392  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  393  		ret = hcall_deassert_irqline(vm->vmid, virt_to_phys(&irq));
6ad7b799a12c19 Mingqiang Chi 2018-08-31  394  		if (ret < 0) {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  395  			pr_err("vhm: failed to deassert irq!\n");
6ad7b799a12c19 Mingqiang Chi 2018-08-31  396  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  397  		}
8273ff9cd59a21 liang ding    2017-12-29  398  		break;
8273ff9cd59a21 liang ding    2017-12-29  399  	}
8273ff9cd59a21 liang ding    2017-12-29  400  	case IC_PULSE_IRQLINE: {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  401  		struct acrn_irqline irq;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  402  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  403  		if (copy_from_user(&irq, (void *)ioctl_param, sizeof(irq)))
6ad7b799a12c19 Mingqiang Chi 2018-08-31  404  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  405  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  406  		ret = hcall_pulse_irqline(vm->vmid,
6ad7b799a12c19 Mingqiang Chi 2018-08-31  407  					virt_to_phys(&irq));
6ad7b799a12c19 Mingqiang Chi 2018-08-31  408  		if (ret < 0) {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  409  			pr_err("vhm: failed to assert irq!\n");
6ad7b799a12c19 Mingqiang Chi 2018-08-31  410  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  411  		}
8273ff9cd59a21 liang ding    2017-12-29  412  		break;
8273ff9cd59a21 liang ding    2017-12-29  413  	}
8273ff9cd59a21 liang ding    2017-12-29  414  
8273ff9cd59a21 liang ding    2017-12-29  415  	case IC_INJECT_MSI: {
8273ff9cd59a21 liang ding    2017-12-29  416  		struct acrn_msi_entry msi;
8273ff9cd59a21 liang ding    2017-12-29  417  
8273ff9cd59a21 liang ding    2017-12-29  418  		if (copy_from_user(&msi, (void *)ioctl_param, sizeof(msi)))
8273ff9cd59a21 liang ding    2017-12-29  419  			return -EFAULT;
8273ff9cd59a21 liang ding    2017-12-29  420  
8273ff9cd59a21 liang ding    2017-12-29  421  		ret = hcall_inject_msi(vm->vmid, virt_to_phys(&msi));
8273ff9cd59a21 liang ding    2017-12-29  422  		if (ret < 0) {
8273ff9cd59a21 liang ding    2017-12-29  423  			pr_err("vhm: failed to inject!\n");
8273ff9cd59a21 liang ding    2017-12-29  424  			return -EFAULT;
8273ff9cd59a21 liang ding    2017-12-29  425  		}
8273ff9cd59a21 liang ding    2017-12-29  426  		break;
8273ff9cd59a21 liang ding    2017-12-29  427  	}
8273ff9cd59a21 liang ding    2017-12-29  428  
e7ba98183b63f4 Binbin Wu     2018-08-31  429  	case IC_ASSIGN_PTDEV: {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  430  		uint16_t bdf;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  431  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  432  		if (copy_from_user(&bdf,
6ad7b799a12c19 Mingqiang Chi 2018-08-31  433  				(void *)ioctl_param, sizeof(uint16_t)))
6ad7b799a12c19 Mingqiang Chi 2018-08-31  434  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  435  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  436  		ret = hcall_assign_ptdev(vm->vmid, virt_to_phys(&bdf));
6ad7b799a12c19 Mingqiang Chi 2018-08-31  437  		if (ret < 0) {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  438  			pr_err("vhm: failed to assign ptdev!\n");
6ad7b799a12c19 Mingqiang Chi 2018-08-31  439  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  440  		}
e7ba98183b63f4 Binbin Wu     2018-08-31  441  		break;
e7ba98183b63f4 Binbin Wu     2018-08-31  442  	}
e7ba98183b63f4 Binbin Wu     2018-08-31  443  	case IC_DEASSIGN_PTDEV: {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  444  		uint16_t bdf;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  445  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  446  		if (copy_from_user(&bdf,
6ad7b799a12c19 Mingqiang Chi 2018-08-31  447  				(void *)ioctl_param, sizeof(uint16_t)))
6ad7b799a12c19 Mingqiang Chi 2018-08-31  448  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  449  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  450  		ret = hcall_deassign_ptdev(vm->vmid, virt_to_phys(&bdf));
6ad7b799a12c19 Mingqiang Chi 2018-08-31  451  		if (ret < 0) {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  452  			pr_err("vhm: failed to deassign ptdev!\n");
6ad7b799a12c19 Mingqiang Chi 2018-08-31  453  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  454  		}
e7ba98183b63f4 Binbin Wu     2018-08-31  455  		break;
e7ba98183b63f4 Binbin Wu     2018-08-31  456  	}
e7ba98183b63f4 Binbin Wu     2018-08-31  457  
e7ba98183b63f4 Binbin Wu     2018-08-31  458  	case IC_SET_PTDEV_INTR_INFO: {
ad11ecb66019bf Shiqing Gao   2018-08-31  459  		struct table_iomems *new;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  460  
3938b6b8c84f86 Binbin Wu     2018-08-31  461  		if (copy_from_user(&ic_pt_irq,
3938b6b8c84f86 Binbin Wu     2018-08-31  462  				(void *)ioctl_param, sizeof(ic_pt_irq)))
6ad7b799a12c19 Mingqiang Chi 2018-08-31  463  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  464  
3938b6b8c84f86 Binbin Wu     2018-08-31  465  		memcpy(&hc_pt_irq, &ic_pt_irq, sizeof(hc_pt_irq));
3938b6b8c84f86 Binbin Wu     2018-08-31  466  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  467  		ret = hcall_set_ptdev_intr_info(vm->vmid,
3938b6b8c84f86 Binbin Wu     2018-08-31  468  				virt_to_phys(&hc_pt_irq));
6ad7b799a12c19 Mingqiang Chi 2018-08-31  469  		if (ret < 0) {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  470  			pr_err("vhm: failed to set intr info for ptdev!\n");
6ad7b799a12c19 Mingqiang Chi 2018-08-31  471  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  472  		}
6ad7b799a12c19 Mingqiang Chi 2018-08-31  473  
b02474f101c81e Shiqing Gao   2018-08-31  474  		if ((ic_pt_irq.type == IRQ_MSIX) &&
b02474f101c81e Shiqing Gao   2018-08-31  475  				ic_pt_irq.msix.table_paddr) {
ad11ecb66019bf Shiqing Gao   2018-08-31  476  			new = kmalloc(sizeof(struct table_iomems), GFP_KERNEL);
ad11ecb66019bf Shiqing Gao   2018-08-31  477  			if (new == NULL)
ad11ecb66019bf Shiqing Gao   2018-08-31  478  				return -EFAULT;
3938b6b8c84f86 Binbin Wu     2018-08-31  479  			new->phys_bdf = ic_pt_irq.phys_bdf;
ad11ecb66019bf Shiqing Gao   2018-08-31  480  			new->mmap_addr = (unsigned long)
3938b6b8c84f86 Binbin Wu     2018-08-31  481  				ioremap_nocache(ic_pt_irq.msix.table_paddr,
3938b6b8c84f86 Binbin Wu     2018-08-31  482  					ic_pt_irq.msix.table_size);
ad11ecb66019bf Shiqing Gao   2018-08-31  483  
ad11ecb66019bf Shiqing Gao   2018-08-31  484  			mutex_lock(&table_iomems_lock);
ad11ecb66019bf Shiqing Gao   2018-08-31  485  			list_add(&new->list, &table_iomems_list);
ad11ecb66019bf Shiqing Gao   2018-08-31  486  			mutex_unlock(&table_iomems_lock);
6ad7b799a12c19 Mingqiang Chi 2018-08-31  487  		}
e7ba98183b63f4 Binbin Wu     2018-08-31  488  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  489  		break;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  490  	}
e7ba98183b63f4 Binbin Wu     2018-08-31  491  	case IC_RESET_PTDEV_INTR_INFO: {
b02474f101c81e Shiqing Gao   2018-08-31  492  		struct table_iomems *ptr;
b02474f101c81e Shiqing Gao   2018-08-31  493  		int dev_found = 0;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  494  
3938b6b8c84f86 Binbin Wu     2018-08-31  495  		if (copy_from_user(&ic_pt_irq,
3938b6b8c84f86 Binbin Wu     2018-08-31  496  				(void *)ioctl_param, sizeof(ic_pt_irq)))
6ad7b799a12c19 Mingqiang Chi 2018-08-31  497  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  498  
3938b6b8c84f86 Binbin Wu     2018-08-31  499  		memcpy(&hc_pt_irq, &ic_pt_irq, sizeof(hc_pt_irq));
3938b6b8c84f86 Binbin Wu     2018-08-31  500  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  501  		ret = hcall_reset_ptdev_intr_info(vm->vmid,
3938b6b8c84f86 Binbin Wu     2018-08-31  502  				virt_to_phys(&hc_pt_irq));
6ad7b799a12c19 Mingqiang Chi 2018-08-31  503  		if (ret < 0) {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  504  			pr_err("vhm: failed to reset intr info for ptdev!\n");
6ad7b799a12c19 Mingqiang Chi 2018-08-31  505  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  506  		}
6ad7b799a12c19 Mingqiang Chi 2018-08-31  507  
b02474f101c81e Shiqing Gao   2018-08-31  508  		if (ic_pt_irq.type == IRQ_MSIX) {
ad11ecb66019bf Shiqing Gao   2018-08-31  509  			mutex_lock(&table_iomems_lock);
b02474f101c81e Shiqing Gao   2018-08-31  510  			list_for_each_entry(ptr, &table_iomems_list, list) {
b02474f101c81e Shiqing Gao   2018-08-31  511  				if (ptr->phys_bdf == ic_pt_irq.phys_bdf) {
b02474f101c81e Shiqing Gao   2018-08-31  512  					dev_found = 1;
b02474f101c81e Shiqing Gao   2018-08-31  513  					break;
b02474f101c81e Shiqing Gao   2018-08-31  514  				}
b02474f101c81e Shiqing Gao   2018-08-31  515  			}
b02474f101c81e Shiqing Gao   2018-08-31  516  			if (dev_found) {
b02474f101c81e Shiqing Gao   2018-08-31  517  				iounmap((void __iomem *)ptr->mmap_addr);
b02474f101c81e Shiqing Gao   2018-08-31  518  				list_del(&ptr->list);
b02474f101c81e Shiqing Gao   2018-08-31  519  			}
ad11ecb66019bf Shiqing Gao   2018-08-31  520  			mutex_unlock(&table_iomems_lock);
6ad7b799a12c19 Mingqiang Chi 2018-08-31  521  		}
6ad7b799a12c19 Mingqiang Chi 2018-08-31  522  
e7ba98183b63f4 Binbin Wu     2018-08-31  523  		break;
e7ba98183b63f4 Binbin Wu     2018-08-31  524  	}
e7ba98183b63f4 Binbin Wu     2018-08-31  525  
e7ba98183b63f4 Binbin Wu     2018-08-31  526  	case IC_VM_PCI_MSIX_REMAP: {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  527  		struct acrn_vm_pci_msix_remap msix_remap;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  528  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  529  		if (copy_from_user(&msix_remap,
6ad7b799a12c19 Mingqiang Chi 2018-08-31  530  			(void *)ioctl_param, sizeof(msix_remap)))
6ad7b799a12c19 Mingqiang Chi 2018-08-31  531  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  532  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  533  		ret = hcall_remap_pci_msix(vm->vmid, virt_to_phys(&msix_remap));
6ad7b799a12c19 Mingqiang Chi 2018-08-31  534  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  535  		if (copy_to_user((void *)ioctl_param,
6ad7b799a12c19 Mingqiang Chi 2018-08-31  536  				&msix_remap, sizeof(msix_remap)))
6ad7b799a12c19 Mingqiang Chi 2018-08-31  537  			return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  538  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  539  		if (msix_remap.msix) {
6ad7b799a12c19 Mingqiang Chi 2018-08-31  540  			void __iomem *msix_entry;
ad11ecb66019bf Shiqing Gao   2018-08-31  541  			struct table_iomems *ptr;
b02474f101c81e Shiqing Gao   2018-08-31  542  			int dev_found = 0;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  543  
ad11ecb66019bf Shiqing Gao   2018-08-31  544  			mutex_lock(&table_iomems_lock);
ad11ecb66019bf Shiqing Gao   2018-08-31  545  			list_for_each_entry(ptr, &table_iomems_list, list) {
b02474f101c81e Shiqing Gao   2018-08-31  546  				if (ptr->phys_bdf == msix_remap.phys_bdf) {
b02474f101c81e Shiqing Gao   2018-08-31  547  					dev_found = 1;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  548  					break;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  549  				}
b02474f101c81e Shiqing Gao   2018-08-31  550  			}
ad11ecb66019bf Shiqing Gao   2018-08-31  551  			mutex_unlock(&table_iomems_lock);
6ad7b799a12c19 Mingqiang Chi 2018-08-31  552  
b02474f101c81e Shiqing Gao   2018-08-31  553  			if (!dev_found || !ptr->mmap_addr)
6ad7b799a12c19 Mingqiang Chi 2018-08-31  554  				return -EFAULT;
6ad7b799a12c19 Mingqiang Chi 2018-08-31  555  
ad11ecb66019bf Shiqing Gao   2018-08-31  556  			msix_entry = (void __iomem *) (ptr->mmap_addr +
6ad7b799a12c19 Mingqiang Chi 2018-08-31  557  				msix_remap.msix_entry_index *
ad11ecb66019bf Shiqing Gao   2018-08-31  558  				PCI_MSIX_ENTRY_SIZE);
6ad7b799a12c19 Mingqiang Chi 2018-08-31  559  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  560  			/* mask the entry when setup */
6ad7b799a12c19 Mingqiang Chi 2018-08-31  561  			writel(PCI_MSIX_ENTRY_CTRL_MASKBIT,
6ad7b799a12c19 Mingqiang Chi 2018-08-31  562  				msix_entry + PCI_MSIX_ENTRY_VECTOR_CTRL);
6ad7b799a12c19 Mingqiang Chi 2018-08-31  563  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  564  			/* setup the msi entry */
6ad7b799a12c19 Mingqiang Chi 2018-08-31  565  			writel((uint32_t)msix_remap.msi_addr,
6ad7b799a12c19 Mingqiang Chi 2018-08-31  566  				msix_entry + PCI_MSIX_ENTRY_LOWER_ADDR);
6ad7b799a12c19 Mingqiang Chi 2018-08-31  567  			writel((uint32_t)(msix_remap.msi_addr >> 32),
6ad7b799a12c19 Mingqiang Chi 2018-08-31  568  				msix_entry + PCI_MSIX_ENTRY_UPPER_ADDR);
6ad7b799a12c19 Mingqiang Chi 2018-08-31  569  			writel(msix_remap.msi_data,
6ad7b799a12c19 Mingqiang Chi 2018-08-31  570  				msix_entry + PCI_MSIX_ENTRY_DATA);
6ad7b799a12c19 Mingqiang Chi 2018-08-31  571  
6ad7b799a12c19 Mingqiang Chi 2018-08-31  572  			/* unmask the entry */
6ad7b799a12c19 Mingqiang Chi 2018-08-31  573  			writel(msix_remap.vector_ctl &
6ad7b799a12c19 Mingqiang Chi 2018-08-31  574  				PCI_MSIX_ENTRY_CTRL_MASKBIT,
6ad7b799a12c19 Mingqiang Chi 2018-08-31  575  				msix_entry + PCI_MSIX_ENTRY_VECTOR_CTRL);
6ad7b799a12c19 Mingqiang Chi 2018-08-31  576  		}
e7ba98183b63f4 Binbin Wu     2018-08-31  577  		break;
e7ba98183b63f4 Binbin Wu     2018-08-31  578  	}
e7ba98183b63f4 Binbin Wu     2018-08-31  579  
c9e419acb2397a Victor Sun    2018-08-31  580  	case IC_PM_GET_CPU_STATE: {
c9e419acb2397a Victor Sun    2018-08-31  581  		uint64_t cmd;
c9e419acb2397a Victor Sun    2018-08-31  582  
c9e419acb2397a Victor Sun    2018-08-31  583  		if (copy_from_user(&cmd,
c9e419acb2397a Victor Sun    2018-08-31  584  				(void *)ioctl_param, sizeof(cmd)))
c9e419acb2397a Victor Sun    2018-08-31  585  			return -EFAULT;
c9e419acb2397a Victor Sun    2018-08-31  586  
c9e419acb2397a Victor Sun    2018-08-31  587  		switch (cmd & PMCMD_TYPE_MASK) {
d0d437d637d602 Victor Sun    2018-04-19  588  		case PMCMD_GET_PX_CNT:
d0d437d637d602 Victor Sun    2018-04-19  589  		case PMCMD_GET_CX_CNT: {
d0d437d637d602 Victor Sun    2018-04-19  590  			uint64_t pm_info;
c9e419acb2397a Victor Sun    2018-08-31  591  
d0d437d637d602 Victor Sun    2018-04-19  592  			ret = hcall_get_cpu_state(cmd, virt_to_phys(&pm_info));
c9e419acb2397a Victor Sun    2018-08-31  593  			if (ret < 0)
c9e419acb2397a Victor Sun    2018-08-31  594  				return -EFAULT;
c9e419acb2397a Victor Sun    2018-08-31  595  
c9e419acb2397a Victor Sun    2018-08-31  596  			if (copy_to_user((void *)ioctl_param,
d0d437d637d602 Victor Sun    2018-04-19  597  					&pm_info, sizeof(pm_info)))
c9e419acb2397a Victor Sun    2018-08-31  598  					ret = -EFAULT;
c9e419acb2397a Victor Sun    2018-08-31  599  
c9e419acb2397a Victor Sun    2018-08-31  600  			break;
c9e419acb2397a Victor Sun    2018-08-31  601  		}
c9e419acb2397a Victor Sun    2018-08-31  602  		case PMCMD_GET_PX_DATA: {
c9e419acb2397a Victor Sun    2018-08-31  603  			struct cpu_px_data px_data;
c9e419acb2397a Victor Sun    2018-08-31  604  
c9e419acb2397a Victor Sun    2018-08-31  605  			ret = hcall_get_cpu_state(cmd, virt_to_phys(&px_data));
c9e419acb2397a Victor Sun    2018-08-31  606  			if (ret < 0)
c9e419acb2397a Victor Sun    2018-08-31  607  				return -EFAULT;
c9e419acb2397a Victor Sun    2018-08-31  608  
c9e419acb2397a Victor Sun    2018-08-31  609  			if (copy_to_user((void *)ioctl_param,
c9e419acb2397a Victor Sun    2018-08-31  610  					&px_data, sizeof(px_data)))
c9e419acb2397a Victor Sun    2018-08-31  611  					ret = -EFAULT;
c9e419acb2397a Victor Sun    2018-08-31  612  			break;
c9e419acb2397a Victor Sun    2018-08-31  613  		}
d0d437d637d602 Victor Sun    2018-04-19  614  		case PMCMD_GET_CX_DATA: {
d0d437d637d602 Victor Sun    2018-04-19  615  			struct cpu_cx_data cx_data;
d0d437d637d602 Victor Sun    2018-04-19  616  
d0d437d637d602 Victor Sun    2018-04-19  617  			ret = hcall_get_cpu_state(cmd, virt_to_phys(&cx_data));
d0d437d637d602 Victor Sun    2018-04-19  618  			if (ret < 0)
d0d437d637d602 Victor Sun    2018-04-19  619  				return -EFAULT;
d0d437d637d602 Victor Sun    2018-04-19  620  
d0d437d637d602 Victor Sun    2018-04-19  621  			if (copy_to_user((void *)ioctl_param,
d0d437d637d602 Victor Sun    2018-04-19  622  					&cx_data, sizeof(cx_data)))
d0d437d637d602 Victor Sun    2018-04-19  623  					ret = -EFAULT;
d0d437d637d602 Victor Sun    2018-04-19  624  			break;
d0d437d637d602 Victor Sun    2018-04-19  625  		}
c9e419acb2397a Victor Sun    2018-08-31  626  		default:
c9e419acb2397a Victor Sun    2018-08-31  627  			ret = -EFAULT;
c9e419acb2397a Victor Sun    2018-08-31  628  			break;
c9e419acb2397a Victor Sun    2018-08-31  629  		}
c9e419acb2397a Victor Sun    2018-08-31  630  		break;
c9e419acb2397a Victor Sun    2018-08-31  631  	}
c9e419acb2397a Victor Sun    2018-08-31  632  
9b6d03feceaa21 Minggui Cao   2018-08-08  633  	case IC_VM_INTR_MONITOR: {
9b6d03feceaa21 Minggui Cao   2018-08-08  634  		struct page *page;
9b6d03feceaa21 Minggui Cao   2018-08-08  635  
9b6d03feceaa21 Minggui Cao   2018-08-08  636  		ret = get_user_pages_fast(ioctl_param, 1, 1, &page);
9b6d03feceaa21 Minggui Cao   2018-08-08  637  		if (unlikely(ret != 1) || (page == NULL)) {
9b6d03feceaa21 Minggui Cao   2018-08-08  638  			pr_err("vhm-dev: failed to pin intr hdr buffer!\n");
9b6d03feceaa21 Minggui Cao   2018-08-08  639  			return -ENOMEM;
9b6d03feceaa21 Minggui Cao   2018-08-08  640  		}
9b6d03feceaa21 Minggui Cao   2018-08-08  641  
9b6d03feceaa21 Minggui Cao   2018-08-08  642  		ret = hcall_vm_intr_monitor(vm->vmid, page_to_phys(page));
9b6d03feceaa21 Minggui Cao   2018-08-08  643  		if (ret < 0) {
9b6d03feceaa21 Minggui Cao   2018-08-08  644  			pr_err("vhm-dev: monitor intr data err=%ld\n", ret);
9b6d03feceaa21 Minggui Cao   2018-08-08  645  			return -EFAULT;
9b6d03feceaa21 Minggui Cao   2018-08-08  646  		}
9b6d03feceaa21 Minggui Cao   2018-08-08  647  		break;
9b6d03feceaa21 Minggui Cao   2018-08-08  648  	}
9b6d03feceaa21 Minggui Cao   2018-08-08  649  
620cc8723a316c liang ding    2018-08-31  650  	default:
620cc8723a316c liang ding    2018-08-31  651  		pr_warn("Unknown IOCTL 0x%x\n", ioctl_num);
620cc8723a316c liang ding    2018-08-31  652  		ret = 0;
620cc8723a316c liang ding    2018-08-31  653  		break;
620cc8723a316c liang ding    2018-08-31  654  	}
620cc8723a316c liang ding    2018-08-31  655  
620cc8723a316c liang ding    2018-08-31  656  	return ret;
620cc8723a316c liang ding    2018-08-31  657  }
620cc8723a316c liang ding    2018-08-31  658  

:::::: The code at line 213 was first introduced by commit
:::::: 6ad7b799a12c193c3f11b95d8ac3f832649d8880 sos: cleanup hypercall API

:::::: TO: Mingqiang Chi <mingqiang.chi@intel.com>
:::::: CC: Pan, Kris <kris.pan@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
