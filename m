Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219E83B8BAB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 22:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768428824; cv=none; b=KjcOwlORJ7qlbWaribOp5dyvo2wQpzkPuJOx543LGK1FhQWq2prWeCQbDDXC80LgwEnfpIGHQD3+yfI/r7wyCg/xTG/sVLUtWDgLoMbB8g7OXFovLGUAnKjFh7jxCwnBuqvoPr0NOWsjWR2R8iZ1CrPcmYk23f1FRChevDD2SXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768428824; c=relaxed/simple;
	bh=MKvS2MNV/DZUfOVetImsqMHicLZ+/RyxSn8P7S9SUDw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M+yee7lVtkFps1YgH3D/eBkhF8xVJdXcgZwAptT9OVNwA43i5hgc8uJIdYdCGa5Vu0Ks2J5EA/aCpwBBpHJ9xLMCFFr+0jWv0G6SaNdth5/mSBEdkIVI29hALABv7B0JQjrkoNSRmKS8wDaoOkJJNDe96nCQNCjvAbK2x0G72Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQUrWmok; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQUrWmok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768428813; x=1799964813;
  h=date:from:to:cc:subject:message-id;
  bh=MKvS2MNV/DZUfOVetImsqMHicLZ+/RyxSn8P7S9SUDw=;
  b=IQUrWmokUMfk1UycVHrKZKsy+0eGrFI8PVP+nLzhDvFWL2o80s1Pu7q7
   6QSZAZRbob3MdiX+mdeMY2DOiaSyInm3/MbqjU98nWVKJgHk3mQwRK2zl
   bnchvS1uBdjYYH/ywvMEVTk03m3utrjWt8SeagLulviXOGuoN6uqCSgKl
   xD6KzKtAr2u/KReBHdSpnk7A0ZJZhuOk9Gy2uw8cI26iKnEyURxkl3+Tm
   gw1akPrZe/p2O6TGJnAWUsQtekL4L0IPc2P0lKzW/wOVaJnq5ICY8iOV9
   X1+xW4k+kLgSrlvlEU9ZHkO6pCrvK7SQHSAuCATQq2gXZusoIJz9iJc/L
   Q==;
X-CSE-ConnectionGUID: Yqrb+GYpRyiV7qFBhUBDvA==
X-CSE-MsgGUID: D8OZjYNyRHe1M4GYlksnSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="95216279"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="95216279"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 14:13:27 -0800
X-CSE-ConnectionGUID: HyxzYmYASmaLxtInrthlwA==
X-CSE-MsgGUID: 4plUZWe/QrSNtf6XJbFbZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="236042832"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Jan 2026 14:13:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg97D-00000000H7G-2Ftn;
	Wed, 14 Jan 2026 22:13:23 +0000
Date: Thu, 15 Jan 2026 06:12:29 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-PMT-enhancement-ANBZ27534
 23/23] drivers/crypto/ccp/hygon/vpsp.c:294: warning: Cannot understand  *
 @brief Directly convert the gpa address into hpa and forward it to PSP,
Message-ID: <202601150655.LdB8a6hA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-PMT-enhancement-ANBZ27534
head:   5be39e8fdc241e57f9813026ad199ad5add77ce7
commit: 28b4e19791583d1b93313942b031326239349d45 [23/23] anolis: crypto: ccp: support TKM run on CSV
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20260115/202601150655.LdB8a6hA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150655.LdB8a6hA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150655.LdB8a6hA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/vpsp.c:91: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copy the guest data to the host kernel buffer
>> drivers/crypto/ccp/hygon/vpsp.c:294: warning: Cannot understand  * @brief Directly convert the gpa address into hpa and forward it to PSP,
    on line 294 - I thought it was a doc line
>> drivers/crypto/ccp/hygon/vpsp.c:381: warning: Cannot understand  * @brief copy data in gpa to host memory and send it to psp for processing.
    on line 381 - I thought it was a doc line


vim +294 drivers/crypto/ccp/hygon/vpsp.c

   292	
   293	/**
 > 294	 * @brief Directly convert the gpa address into hpa and forward it to PSP,
   295	 *	  It is another form of kvm_pv_psp_copy_op, mainly used for csv VMs.
   296	 *
   297	 * @param vpsp points to kvm related data
   298	 * @param cmd psp cmd id, bit 31 indicates queue priority
   299	 * @param data_gpa guest physical address of input data
   300	 * @param psp_ret indicates Asynchronous context information
   301	 *
   302	 * Since the csv guest memory cannot be read or written directly,
   303	 * the shared asynchronous context information is shared through psp_ret and return value.
   304	 */
   305	int kvm_pv_psp_forward_op(struct kvm_vpsp *vpsp, uint32_t cmd,
   306				gpa_t data_gpa, uint32_t psp_ret)
   307	{
   308		int ret;
   309		uint64_t data_hpa;
   310		uint32_t index = 0, vid = 0;
   311		struct vpsp_ret psp_async = {0};
   312		struct vpsp_context *vpsp_ctx = NULL;
   313		struct vpsp_cmd *vcmd = (struct vpsp_cmd *)&cmd;
   314		uint8_t prio = CSV_COMMAND_PRIORITY_LOW;
   315	
   316		vpsp_get_context(&vpsp_ctx, vpsp->kvm->userspace_pid);
   317	
   318		ret = check_cmd_forward_op_permission(vpsp, vpsp_ctx, data_gpa, cmd);
   319		if (unlikely(ret)) {
   320			pr_err("directly operation not allowed\n");
   321			goto end;
   322		}
   323	
   324		ret = vpsp_try_bind_vtkm(vpsp, vpsp_ctx, cmd, (uint32_t *)&psp_async);
   325		if (unlikely(ret || *(uint32_t *)&psp_async)) {
   326			pr_err("try to bind vtkm failed (ret %x, psp_async %x)\n",
   327				ret, *(uint32_t *)&psp_async);
   328			goto end;
   329		}
   330	
   331		if (vpsp_ctx)
   332			vid = vpsp_ctx->vid;
   333	
   334		*((uint32_t *)&psp_async) = psp_ret;
   335		data_hpa = PUT_PSP_VID(gpa_to_hpa(vpsp, data_gpa), vid);
   336	
   337		switch (psp_async.status) {
   338		case VPSP_INIT:
   339			/* try to send command to the device for execution*/
   340			ret = vpsp_try_do_cmd(cmd, data_hpa, &psp_async);
   341			if (unlikely(ret)) {
   342				pr_err("[%s]: vpsp_do_cmd failed\n", __func__);
   343				goto end;
   344			}
   345			break;
   346	
   347		case VPSP_RUNNING:
   348			prio = vcmd->is_high_rb ? CSV_COMMAND_PRIORITY_HIGH :
   349				CSV_COMMAND_PRIORITY_LOW;
   350			index = psp_async.index;
   351			/* try to get the execution result from ringbuffer*/
   352			ret = vpsp_try_get_result(prio, index, data_hpa, &psp_async);
   353			if (unlikely(ret)) {
   354				pr_err("[%s]: vpsp_try_get_result failed\n", __func__);
   355				goto end;
   356			}
   357			break;
   358	
   359		default:
   360			pr_err("[%s]: invalid command status\n", __func__);
   361			break;
   362		}
   363	
   364	end:
   365		/**
   366		 * In order to indicate both system errors and PSP errors,
   367		 * the psp_async.pret field needs to be reused.
   368		 */
   369		psp_async.format = VPSP_RET_PSP_FORMAT;
   370		if (ret) {
   371			psp_async.format = VPSP_RET_SYS_FORMAT;
   372			if (ret > 0)
   373				ret = -ret;
   374			psp_async.pret = (uint16_t)ret;
   375		}
   376		return *((int *)&psp_async);
   377	}
   378	EXPORT_SYMBOL_GPL(kvm_pv_psp_forward_op);
   379	
   380	/**
 > 381	 * @brief copy data in gpa to host memory and send it to psp for processing.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
