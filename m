Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EEC3B42DD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 22:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790374547; cv=none; b=EJA3uahb+roh3E7D8ILzEr6tdPVNB+mRQllklEfkU+0IpT35rVzphSLDKRC5yEWBSknIuQAQbS69kQFQT8O+ivoeKt/sNZ/cGd6plgNafQ04xghhHj2bWE98yDCWdFWWUUSYDClO2zPLhT83ML9i4eo2mXSoBeUySrkonHMJ8yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790374547; c=relaxed/simple;
	bh=kchmbukWoCwNE7FnsgpznRdjXYzXWz+bQFBu+CAisRI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eU7Abi6tdCSssH2rFsKns1jpKnYvt/mmS7aWtkxNfEWTFR+9IcxHl8QWQ9iy2hNhQiec11Zid2SVguyeUZ24/GabYVInO/CSDR4E1/rdw3BEUWJVvFLQ+hEsqdhyi2d48VVj5QnUKJ9goX/eC/UgKPWmcBdBK12mHtPw/+9j0/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JuvsFmtA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JuvsFmtA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790374542; x=1821910542;
  h=date:from:to:cc:subject:message-id;
  bh=kchmbukWoCwNE7FnsgpznRdjXYzXWz+bQFBu+CAisRI=;
  b=JuvsFmtApTj7hkWKlB/7+0JRva/SPNG00OaDEvpsDaIAtjL+RRPL52gg
   2KdRXYty63s1ShT0wSIjCvW+6ydQ4bhEc58IaGz5kGTZhoMDFNQXKkasJ
   DKlW4LfcmIFxydwewBsdUmcOS10QuXof91K40RqsqlKX/EYdJu44XoDMX
   tUhfeCOy2BUz2k1r+3n30yJpdU3Io5TvXKG+O77DP1bg8zHm2BYaoHjWu
   ZlAc4yiBVBuUsLJr6fwyqvj6L/B3mq8+h7Nq8W3D70qNl73ojANEgQ+o/
   b9GTSqWv9EG4RlunAD1INUeDrCEY3/kr6L64cZAqsqmy69WhbGW5gVK+l
   Q==;
X-CSE-ConnectionGUID: E2eaIzavSYK+1H3s5e6Oig==
X-CSE-MsgGUID: vt8vFq58TlCHtI1yicfk+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="91268984"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="91268984"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 15:15:41 -0700
X-CSE-ConnectionGUID: 8US8gPp8S/ieUjVxxB6x6g==
X-CSE-MsgGUID: joIFNdTeR422fHPrg0coHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="282518039"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Sep 2026 15:15:39 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAECe-00000000LGT-3S1b;
	Fri, 25 Sep 2026 22:15:36 +0000
Date: Sat, 26 Sep 2026 06:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:dmabuf-size-ceiling-v7.3-rc3 28/29]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3439:48: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202609260637.2nNGJAyl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git dmabuf-size-ceiling-v7.3-rc3
head:   837ed875be1a747823a663f160a8122b60c0c88a
commit: c5e054ccaedf0778bd70baf19cc9200fe5a7acc1 [28/29] drm/amdkfd: port AMD Infinity Storage file I/O from the amdgpu driver
config: x86_64-randconfig-1300-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260637.2nNGJAyl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260637.2nNGJAyl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260637.2nNGJAyl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:1304:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *src @@     got void * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:1304:42: sparse:     expected void const [noderef] __user *src
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:1304:42: sparse:     got void *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:1413:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *src @@     got void * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:1413:42: sparse:     expected void const [noderef] __user *src
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:1413:42: sparse:     got void *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:2348:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *src @@     got void * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:2348:45: sparse:     expected void const [noderef] __user *src
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:2348:45: sparse:     got void *
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3439:48: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct kfd_ais_out_args [noderef] __user *out @@     got struct kfd_ais_out_args * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3439:48: sparse:     expected struct kfd_ais_out_args [noderef] __user *out
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3439:48: sparse:     got struct kfd_ais_out_args *
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3510:56: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected unsigned long long [usertype] *size_copied @@     got unsigned long long [noderef] __user * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3510:56: sparse:     expected unsigned long long [usertype] *size_copied
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3510:56: sparse:     got unsigned long long [noderef] __user *
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct kfd_ais_out_args [noderef] __user *out @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse:     expected void const *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse:     got struct kfd_ais_out_args [noderef] __user *out
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct kfd_ais_out_args [noderef] __user * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse:     expected void const *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse:     got struct kfd_ais_out_args [noderef] __user *
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct kfd_ais_out_args [noderef] __user *out @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse:     expected void const *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse:     got struct kfd_ais_out_args [noderef] __user *out
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct kfd_ais_out_args [noderef] __user * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse:     expected void const *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse:     got struct kfd_ais_out_args [noderef] __user *
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got struct kfd_ais_out_args [noderef] __user *out @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse:     expected void *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse:     got struct kfd_ais_out_args [noderef] __user *out
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got struct kfd_ais_out_args [noderef] __user * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse:     expected void const *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3519:9: sparse:     got struct kfd_ais_out_args [noderef] __user *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct kfd_ais_out_args [noderef] __user *out @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse:     expected void const *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse:     got struct kfd_ais_out_args [noderef] __user *out
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct kfd_ais_out_args [noderef] __user * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse:     expected void const *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse:     got struct kfd_ais_out_args [noderef] __user *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct kfd_ais_out_args [noderef] __user *out @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse:     expected void const *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse:     got struct kfd_ais_out_args [noderef] __user *out
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct kfd_ais_out_args [noderef] __user * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse:     expected void const *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse:     got struct kfd_ais_out_args [noderef] __user *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got struct kfd_ais_out_args [noderef] __user *out @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse:     expected void *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse:     got struct kfd_ais_out_args [noderef] __user *out
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got struct kfd_ais_out_args [noderef] __user * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse:     expected void const *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3526:9: sparse:     got struct kfd_ais_out_args [noderef] __user *
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3514:17: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3525:9: sparse: sparse: dereference of noderef expression

vim +3439 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c

  3434	
  3435	static int kfd_ioctl_ais(struct file *filep, struct kfd_process *p, void *data)
  3436	{
  3437		struct kfd_ioctl_ais_args *args = data;
  3438		struct kfd_ais_in_args *in = &args->in;
> 3439		struct kfd_ais_out_args __user *out = &args->out, out_args = {0};
  3440		struct kfd_process_device *pdd;
  3441		struct kfd_node *dev;
  3442		struct kgd_mem *mem;
  3443		struct amdgpu_bo *bo;
  3444		int err;
  3445	
  3446		if (in->op != KFD_IOC_AIS_READ && in->op != KFD_IOC_AIS_WRITE) {
  3447			pr_debug("AIS: Invalid operation: %d\n", in->op);
  3448			err = -EINVAL;
  3449			goto err_inval;
  3450		}
  3451	
  3452		if (in->fd < 0) {
  3453			pr_debug("AIS: fd: %d\n", in->fd);
  3454			err = -EINVAL;
  3455			goto err_inval;
  3456		}
  3457	
  3458		mutex_lock(&p->mutex);
  3459		pdd = kfd_process_device_data_by_id(p, GET_GPU_ID(in->handle));
  3460		if (!pdd) {
  3461			pr_debug("AIS: Could not find gpu id 0x%llx\n",
  3462				 GET_GPU_ID(in->handle));
  3463			err = -EINVAL;
  3464			goto err_unlock;
  3465		}
  3466		dev = pdd->dev;
  3467		if (!dev->kfd->ais_initialized) {
  3468			dev_dbg(dev->adev->dev, "AIS: is not initialized for device\n");
  3469			err = -ENODEV;
  3470			goto err_unlock;
  3471		}
  3472	
  3473		pdd = kfd_bind_process_to_device(dev, p);
  3474		if (IS_ERR(pdd)) {
  3475			err = -ESRCH;
  3476			goto err_unlock;
  3477		}
  3478	
  3479		mem = kfd_process_device_translate_handle(pdd,
  3480							  GET_IDR_HANDLE(in->handle));
  3481		if (!mem) {
  3482			err = -EINVAL;
  3483			goto err_unlock;
  3484		}
  3485	
  3486		/* Only VRAM BOs are supported */
  3487		if (mem->domain != AMDGPU_GEM_DOMAIN_VRAM) {
  3488			dev_dbg(dev->adev->dev, "AIS: BO not in VRAM, but in %d\n",
  3489				mem->domain);
  3490			err = -EINVAL;
  3491			goto err_unlock;
  3492		}
  3493	
  3494		/*
  3495		 * Hold a BO reference across the transfer. p->mutex is dropped for
  3496		 * the duration of the I/O, so without this a concurrent
  3497		 * FREE_MEMORY_OF_GPU could free the BO under us.
  3498		 */
  3499		bo = amdgpu_bo_ref(mem->bo);
  3500	
  3501		err = amdgpu_amdkfd_gpuvm_pin_bo(bo, AMDGPU_GEM_DOMAIN_VRAM);
  3502		if (err) {
  3503			pr_err("Pinning of buffer failed.\n");
  3504			amdgpu_bo_unref(&bo);
  3505			goto err_unlock;
  3506		}
  3507	
  3508		mutex_unlock(&p->mutex);
  3509	
> 3510		err = kfd_ais_rw_file(dev->adev, bo, in, pdd, &out_args.size_copied);
  3511		if (err) {
  3512			pr_err("Failed to %s AIS file: %d\n",
  3513			       in->op == KFD_IOC_AIS_READ ? "read" : "write", err);
> 3514			out_args.status = err;
  3515		}
  3516	
  3517		amdgpu_amdkfd_gpuvm_unpin_bo(bo);
  3518		amdgpu_bo_unref(&bo);
> 3519		memcpy(out, &out_args, sizeof(out_args));
  3520		return err;
  3521	
  3522	err_unlock:
  3523		mutex_unlock(&p->mutex);
  3524	err_inval:
  3525		out_args.status = err;
> 3526		memcpy(out, &out_args, sizeof(out_args));
  3527		return err;
  3528	}
  3529	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
