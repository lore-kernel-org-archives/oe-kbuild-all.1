Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BEF1CCEFA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 20:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730752120; cv=none; b=DnL8zGdbsML6aENDVw91Slwl2KcsO6eZygTxrSVTvvfPVm0HyA6pqBBhbEpSgyXIBqnut0B+ebR30JnGJK5sGWnEXKJnO1u9gRUg4DdU5za4AtmbB1RvvMu+miXkcmxDFKORIBOODKjEFmJ1D49v2QUVShS+i+j5rrq0YGuwrxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730752120; c=relaxed/simple;
	bh=kR0CYYV179ZdUKFnUO6cAwejFBot8eYOAFttRUSCS9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CRc8MUOom59O8oVnWPVY+V9Wx6CDR9RTlxze1qnwTBTZzhcmdOEekbz23fy99jx2R/+0XTxqB14Sj2JAteEkWFjL8sEPXhr/nHf0IgVy4+uAklABO8DHuCAe+vKW4zLJvUWLc19nCERWcxN8ynMvNRiMUFPrDP71ZO6bV6djt9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4qCguy0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4qCguy0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730752118; x=1762288118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kR0CYYV179ZdUKFnUO6cAwejFBot8eYOAFttRUSCS9E=;
  b=D4qCguy0FLas81pT9p3gPDk2mS0g/+eG1su/Vp02hRUF2FDhZlzBYaNR
   EXFaSuxQcQjcapFfkA5HcnG3cxKBz6Qay4Z9Mmo4iJ7G2mKq2FDMAoTUz
   n4tU71UYUPOaulaFf6olq/x6HESlCngNgLaBmdWNmXeKcoPQQ8wexE5vt
   VdLKQpw1RtQuXdEjK/ONcNaICFH6Y23h/ErThAX8VnjZ/lgRg0gNePj5p
   uKI1qrNH3zwj2vT/NRpbgbxP23zdmQG3dqR2CdQ3rJzekUM+UMjV2IHRs
   H6ArkVQrhfKQpXmkMv+X++LEIkscyL+9gEZESjq3b2eHcEeTYFloeBNWx
   g==;
X-CSE-ConnectionGUID: XwivbC2HQxGyAYUdPDNKhQ==
X-CSE-MsgGUID: OW+9j3jpS/istCRewNOYtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30321228"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30321228"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 12:28:37 -0800
X-CSE-ConnectionGUID: 1BkpwAVLSpy3qhuZI7OvGw==
X-CSE-MsgGUID: mCuIxZz9RF2P8ojz9153FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="84583997"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Nov 2024 12:28:37 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t83gf-000lG5-33;
	Mon, 04 Nov 2024 20:28:33 +0000
Date: Tue, 5 Nov 2024 04:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1231/1231]
 arch/arm64/kernel/mpam/mpam_resctrl.c:520:5: warning: no previous prototype
 for 'closid_bitmap_init'
Message-ID: <202411050407.BuL0Qgyb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0d426553bb97ebfcb4ea34e8fd63477a44316644
commit: 857e8d34273e190118d5cb5002e1ed45d1b5185d [1231/1231] arm64/mpam: Using software-defined id for rdtgroup instead of 32-bit integer
config: arm64-randconfig-001-20241029 (https://download.01.org/0day-ci/archive/20241105/202411050407.BuL0Qgyb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050407.BuL0Qgyb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050407.BuL0Qgyb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/mpam/mpam_resctrl.c:163:1: warning: conflicting types for 'mpam_get_raw_resctrl_resource' due to enum/integer mismatch; have 'struct raw_resctrl_resource *(enum resctrl_resource_level)' [-Wenum-int-mismatch]
     163 | mpam_get_raw_resctrl_resource(enum resctrl_resource_level level)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/mpam/mpam_resctrl.c:47:
   arch/arm64/kernel/mpam/mpam_internal.h:184:1: note: previous declaration of 'mpam_get_raw_resctrl_resource' with type 'struct raw_resctrl_resource *(u32)' {aka 'struct raw_resctrl_resource *(unsigned int)'}
     184 | mpam_get_raw_resctrl_resource(u32 level);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/mpam/mpam_resctrl.c:520:5: warning: no previous prototype for 'closid_bitmap_init' [-Wmissing-prototypes]
     520 | int closid_bitmap_init(void)
         |     ^~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c:875:5: warning: no previous prototype for 'cpus_ctrl_write' [-Wmissing-prototypes]
     875 | int cpus_ctrl_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
         |     ^~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c:972:5: warning: no previous prototype for 'cpus_mon_write' [-Wmissing-prototypes]
     972 | int cpus_mon_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
         |     ^~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c: In function 'rdt_last_cmd_printf':
   arch/arm64/kernel/mpam/mpam_resctrl.c:1116:9: warning: function 'rdt_last_cmd_printf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1116 |         seq_buf_vprintf(&last_cmd_status, fmt, ap);
         |         ^~~~~~~~~~~~~~~
--
   arch/arm64/kernel/mpam/mpam_ctrlmon.c: In function 'resctrl_mkdir_mondata_all_subdir':
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:561:54: warning: variable 'rr' set but not used [-Wunused-but-set-variable]
     561 |                         struct raw_resctrl_resource *rr;
         |                                                      ^~
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:320: warning: Function parameter or member 's' not described in 'show_doms'
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:320: warning: Function parameter or member 'r' not described in 'show_doms'
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:320: warning: Function parameter or member 'schema_name' not described in 'show_doms'
>> arch/arm64/kernel/mpam/mpam_ctrlmon.c:320: warning: Function parameter or member 'closid' not described in 'show_doms'


vim +/closid_bitmap_init +520 arch/arm64/kernel/mpam/mpam_resctrl.c

   519	
 > 520	int closid_bitmap_init(void)
   521	{
   522		int ret;
   523	
   524		mpam_resctrl_closid_collect();
   525		if (!num_intpartid || !num_reqpartid)
   526			return -EINVAL;
   527	
   528		if (intpartid_free_map)
   529			kfree(intpartid_free_map);
   530		if (reqpartid_free_map)
   531			kfree(reqpartid_free_map);
   532	
   533		ret = local_closid_bitmap_init(num_intpartid, &intpartid_free_map);
   534		if (ret)
   535			goto out;
   536	
   537		ret = local_closid_bitmap_init(num_reqpartid, &reqpartid_free_map);
   538		if (ret)
   539			goto out;
   540	
   541		return 0;
   542	out:
   543		return ret;
   544	}
   545	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
