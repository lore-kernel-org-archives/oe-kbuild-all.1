Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9182827B34F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 14:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768399492; cv=none; b=dDOMPV1g3HuDzEY92OmPCL5bOsM27Fv8WalP5DG2HGzGpnvBFGlbkmyoBrVwNZbWxQNNHS8+WeTCKya5IjtFZlSOqfEKhIoNnTHvUbAPtf4w4WUfeTFO1TPDuaTaWf9YSGvakHpOtsRaAwMV8I3FLCbUCtisM5VtoyrujxQOeA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768399492; c=relaxed/simple;
	bh=WPw2dzRSRNNFfN5V7H4j8lmSa5JfmJfj4yODlH/nm8c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uWNyB4Fq+Vttg0JMPlWN0WRX5URk0Tqp80MrtmxQf0xqNqysRSu012N8rhxBMPhX6KbfG1SO4WPa5ogpXC4+BaK5wCpNruEarXpGS06AhB6pggB+cwz5ogHKlDYZ4pQkbfjV+0WV2bSe8AKThqSizXGzxogYH5QTee2piPTUeLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fP97WDhs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fP97WDhs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768399490; x=1799935490;
  h=date:from:to:cc:subject:message-id;
  bh=WPw2dzRSRNNFfN5V7H4j8lmSa5JfmJfj4yODlH/nm8c=;
  b=fP97WDhsTFeTdl8GgkXjXLg1k1wvMlL2t67G1d6NJ6WElmljz7GBw90U
   0FvWckkp4OsIgNGsNeDpXfuigGGFAjgQyN4CgvrEGGgovN+dbZhsZPFjJ
   8qG4rM0URoeFNHg0exjuiafgeWjr6hsjn1yav7c/DoWOm8mdhW4kj1z73
   9JcUbTlQ1yFMHnxBWn8nSCCx1u0Zc3it1jeL5e4pQ8NVwLXOa79S2bYvG
   X5SRO7pTyiEvAvITV8RVXIYNXfR3plOGzJm3BfYxqlPgyU64JSCv6sGZW
   yJHEpfvfEEXeaSj4/EtUSBCCIMfF3lrrmrjev0BJ/oAX/QZH5ym/WtutP
   w==;
X-CSE-ConnectionGUID: CC4dE7OJTbSJdX+ZQmMn7w==
X-CSE-MsgGUID: XPCmcOvTTz6NnXkWX48hEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="72280608"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="72280608"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 06:04:50 -0800
X-CSE-ConnectionGUID: zZ/ubYETR0S7VNPvIHPtzw==
X-CSE-MsgGUID: ps63srXYTW2Kn9pD6MAVpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204575297"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jan 2026 06:04:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg1UL-00000000GSy-3Ilv;
	Wed, 14 Jan 2026 14:04:45 +0000
Date: Wed, 14 Jan 2026 22:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>
Subject: 
 [qcom:20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com 11/13]
 drivers/firmware/qcom/qcom_scm.c:916:11-18: WARNING opportunity for kmemdup
Message-ID: <202601142144.HvSlBSI9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux 20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com
head:   5c720260e840b508053dd5338577e0175ef31739
commit: 8b9d2050cfa0c22c05622df103e366933fc045ed [11/13] firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table
config: powerpc-randconfig-r061-20260114 (https://download.01.org/0day-ci/archive/20260114/202601142144.HvSlBSI9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601142144.HvSlBSI9-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/qcom/qcom_scm.c:916:11-18: WARNING opportunity for kmemdup

vim +916 drivers/firmware/qcom/qcom_scm.c

   823	
   824	/**
   825	 * qcom_scm_pas_get_rsc_table() - Retrieve the resource table in passed output buffer
   826	 *				  for a given peripheral.
   827	 *
   828	 * Qualcomm remote processor may rely on both static and dynamic resources for
   829	 * its functionality. Static resources typically refer to memory-mapped addresses
   830	 * required by the subsystem and are often embedded within the firmware binary
   831	 * and dynamic resources, such as shared memory in DDR etc., are determined at
   832	 * runtime during the boot process.
   833	 *
   834	 * On Qualcomm Technologies devices, it's possible that static resources are not
   835	 * embedded in the firmware binary and instead are provided by TrustZone However,
   836	 * dynamic resources are always expected to come from TrustZone. This indicates
   837	 * that for Qualcomm devices, all resources (static and dynamic) will be provided
   838	 * by TrustZone via the SMC call.
   839	 *
   840	 * If the remote processor firmware binary does contain static resources, they
   841	 * should be passed in input_rt. These will be forwarded to TrustZone for
   842	 * authentication. TrustZone will then append the dynamic resources and return
   843	 * the complete resource table in output_rt_tzm.
   844	 *
   845	 * If the remote processor firmware binary does not include a resource table,
   846	 * the caller of this function should set input_rt as NULL and input_rt_size
   847	 * as zero respectively.
   848	 *
   849	 * More about documentation on resource table data structures can be found in
   850	 * include/linux/remoteproc.h
   851	 *
   852	 * @ctx:	    PAS context
   853	 * @pas_id:	    peripheral authentication service id
   854	 * @input_rt:       resource table buffer which is present in firmware binary
   855	 * @input_rt_size:  size of the resource table present in firmware binary
   856	 * @output_rt_size: TrustZone expects caller should pass worst case size for
   857	 *		    the output_rt_tzm.
   858	 *
   859	 * Return:
   860	 *  On success, returns a pointer to the allocated buffer containing the final
   861	 *  resource table and output_rt_size will have actual resource table size from
   862	 *  TrustZone. The caller is responsible for freeing the buffer. On failure,
   863	 *  returns ERR_PTR(-errno).
   864	 */
   865	struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx,
   866							  void *input_rt,
   867							  size_t input_rt_size,
   868							  size_t *output_rt_size)
   869	{
   870		struct resource_table empty_rsc = {};
   871		size_t size = SZ_16K;
   872		void *output_rt_tzm;
   873		void *input_rt_tzm;
   874		void *tbl_ptr;
   875		int ret;
   876	
   877		ret = qcom_scm_clk_enable();
   878		if (ret)
   879			return ERR_PTR(ret);
   880	
   881		ret = qcom_scm_bw_enable();
   882		if (ret)
   883			goto disable_clk;
   884	
   885		/*
   886		 * TrustZone can not accept buffer as NULL value as argument hence,
   887		 * we need to pass a input buffer indicating that subsystem firmware
   888		 * does not have resource table by filling resource table structure.
   889		 */
   890		if (!input_rt) {
   891			input_rt = &empty_rsc;
   892			input_rt_size = sizeof(empty_rsc);
   893		}
   894	
   895		input_rt_tzm = qcom_tzmem_alloc(__scm->mempool, input_rt_size, GFP_KERNEL);
   896		if (!input_rt_tzm) {
   897			ret = -ENOMEM;
   898			goto disable_scm_bw;
   899		}
   900	
   901		memcpy(input_rt_tzm, input_rt, input_rt_size);
   902	
   903		output_rt_tzm = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt_tzm,
   904							     input_rt_size, &size);
   905		if (PTR_ERR(output_rt_tzm) == -EOVERFLOW)
   906			/* Try again with the size requested by the TZ */
   907			output_rt_tzm = __qcom_scm_pas_get_rsc_table(ctx->pas_id,
   908								     input_rt_tzm,
   909								     input_rt_size,
   910								     &size);
   911		if (IS_ERR(output_rt_tzm)) {
   912			ret = PTR_ERR(output_rt_tzm);
   913			goto free_input_rt;
   914		}
   915	
 > 916		tbl_ptr = kzalloc(size, GFP_KERNEL);
   917		if (!tbl_ptr) {
   918			qcom_tzmem_free(output_rt_tzm);
   919			ret = -ENOMEM;
   920			goto free_input_rt;
   921		}
   922	
   923		memcpy(tbl_ptr, output_rt_tzm, size);
   924		*output_rt_size = size;
   925		qcom_tzmem_free(output_rt_tzm);
   926	
   927	free_input_rt:
   928		qcom_tzmem_free(input_rt_tzm);
   929	
   930	disable_scm_bw:
   931		qcom_scm_bw_disable();
   932	
   933	disable_clk:
   934		qcom_scm_clk_disable();
   935	
   936		return ret ? ERR_PTR(ret) : tbl_ptr;
   937	}
   938	EXPORT_SYMBOL_GPL(qcom_scm_pas_get_rsc_table);
   939	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
