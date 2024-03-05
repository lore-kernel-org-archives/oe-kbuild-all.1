Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653D879DC2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 07:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709623484; cv=none; b=gJcYx0WZ9l+8v1ND/jBwphUt2HDQ04NnbKJj/5whd22aYmrF+0ltLQ6B4AEiWyIDOvgdbB2zHjqjQsPyi0ccvhHKP44jIXLu0ZRCoAcsQlj2zXlDgKe1NUNS/zHVCZaRf8h5fw3YXlvyZT+U3kImXa7YjpqXarS4m9smuivpN1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709623484; c=relaxed/simple;
	bh=elGRnmRa3R4aq37AmyaLKMNE5VFzEk4J0WXqWffk8D4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CtefeH/v6Sj9q6cgXh9CodY0PTnAs2WEVrlwP5bi1OyA70bohzXYlE14d/6b8JQkXx5a1xOOTw/R+XiBYnQH81WoO9naPVU9II20r03lYJSdWUjDAjM+5UzhlEr1lcDuPGJ/Tbxl5SDUQB9N4uUk0Mwd+E7aWGDFM/M5Kn6RDZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AX+TXvuC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AX+TXvuC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709623481; x=1741159481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=elGRnmRa3R4aq37AmyaLKMNE5VFzEk4J0WXqWffk8D4=;
  b=AX+TXvuCVgpXBp45nlmEpKemNYSSL4ekNETSECYgQ7w4yJ8sEtkYbC/E
   fEw+Q4dewyZ++fuGgkJU8OV0N7HPueaCx4fIPfiJ++uI+e2gubgcEVgcD
   cXTiWK36KkO6wwcN6yjDCITIJ/N54QFbI49L7cU+fes5jHUAJ0hM/H6lM
   thOs9l9l2v3KCQEE6s8h8R+jE3R50B0pAuOwI55AgiQdwWhgBJTyBcqzh
   sJfqJbxRHtE3kYs3G0G8RMM2DdFTgZGzHbd4kxF7tDn4P8AbHkGcqGmk8
   nxjd4X/3fLQ5Q+vChPMtyUoqx+rUGfFVFLKH1KQxcBUuzGxJvSEo4EmEa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21611819"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="21611819"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 23:24:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9685517"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Mar 2024 23:24:37 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhPAA-000379-39;
	Tue, 05 Mar 2024 07:24:34 +0000
Date: Tue, 5 Mar 2024 15:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 46/98] kernel/sysctl.c:878:5: sparse: sparse:
 symbol 'proc_dointvec_max_map_count' was not declared. Should it be static?
Message-ID: <202403051536.c9DAXfh5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   a4b2dc2ffad1810ebe7a86710aa1e5cc312aa2a1
commit: 89a8f0b629af6e892fe0541ed2d10fc5dc5daefc [46/98] vm: isolate max_map_count by pid namespace
config: x86_64-randconfig-122-20240303 (https://download.01.org/0day-ci/archive/20240305/202403051536.c9DAXfh5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051536.c9DAXfh5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051536.c9DAXfh5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sysctl.c:891:47: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:891:47: sparse:     expected void *buffer
   kernel/sysctl.c:891:47: sparse:     got void [noderef] __user *buffer
>> kernel/sysctl.c:878:5: sparse: sparse: symbol 'proc_dointvec_max_map_count' was not declared. Should it be static?
   kernel/sysctl.c:1051:45: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1051:45: sparse:     expected void *buffer
   kernel/sysctl.c:1051:45: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:1809:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:1809:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:1809:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2186:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2186:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2186:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:312:66: sparse: sparse: self-comparison always evaluates to false

vim +/proc_dointvec_max_map_count +878 kernel/sysctl.c

   877	
 > 878	int proc_dointvec_max_map_count(struct ctl_table *table, int write,
   879			     void __user *buffer, size_t *lenp, loff_t *ppos)
   880	{
   881	
   882		struct do_proc_dointvec_minmax_conv_param param = {
   883			.min = (int *) table->extra1,
   884			.max = (int *) table->extra2,
   885		};
   886	
   887	#ifdef CONFIG_PID_NS
   888		table->data = &task_active_pid_ns(current)->max_map_count;
   889	#endif
   890	
 > 891		return do_proc_dointvec(table, write, buffer, lenp, ppos,
   892				do_proc_dointvec_minmax_conv, &param);
   893	}
   894	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
