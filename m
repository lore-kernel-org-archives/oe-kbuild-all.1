Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2750920B27
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 10:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709549294; cv=none; b=rfTF8qJ5uNsGlMGTlsQUV9ZCsm0OKdOgAWoJpD6fHM+6rgsWgFgs1XPEzzasjIvshORTu1Xh0fV/MeJMBGtjx5HTpsNmxad9xHqvaNkZ3rsj8o1x6vlWTaHBHtB92MyS4HP6PGKuSj+c4oBcgF8kn+mGbrwyZLGbUgfvjfVUOtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709549294; c=relaxed/simple;
	bh=WfBvgohrjQHQkzyfsZHW/9ksXC6S+ucDe8WR84x6ztE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=frKul3G9Sf2X71kVEEAunUpEh8SlBeBS0vDGLXKTHFCKSFsABRhqWoS+GktJ4dQhSZCg3/zrGylZZpnzuDCx9kDFEi3s72nxPbELAZERvSDpAYAcrIsBodSV/TBqaNeMvRi5rJPukxPqAmvUqKmlKxD9oLAaBdjkyExjlXXXkZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfQ8OpjJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfQ8OpjJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709549292; x=1741085292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WfBvgohrjQHQkzyfsZHW/9ksXC6S+ucDe8WR84x6ztE=;
  b=XfQ8OpjJ8eehjK2e/X8wabHj0KKVY9ESyKG34+gOjr6tVYDeIsuePe7Z
   H5oUUheK8bOXypqEwND/anTLpmsQw0b4ngijhpb30mWsQciFclx5/9/p7
   Vip8sePwOuEMLxVJrJz1TgPSHkASAL/S7nmOaHu3ukIMWLrHuOH7GOHHt
   T1NdaSc3HJ2ysXhW+qtFBp1QfKrKaaiTnBaP08nD+dxektivsvXmqNAbM
   g/94FsVL8PthGiqVnc9kEV62wygUU+0RY+nWyIe3IJtcNSn+xoIM24ofp
   e9NXVqSZmAjZXfmP4aIqOoxRw7Zper3hhXVnCDYAcZiIMieA0+QC1OtS8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7849813"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="7849813"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 02:48:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9531910"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Mar 2024 02:48:08 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rh5rZ-0002SX-1C;
	Mon, 04 Mar 2024 10:48:05 +0000
Date: Mon, 4 Mar 2024 18:48:03 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 13/98] kernel/sysctl.c:1033:45: sparse: sparse:
 incorrect type in argument 3 (different address spaces)
Message-ID: <202403041847.TYnqZbBP-lkp@intel.com>
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
commit: 95c98461d1dce7fd1d25f055c88ad639b0e3b7d7 [13/98] sysrq: add ALT+LEFTCTRL to trigger crash dump
config: x86_64-randconfig-122-20240303 (https://download.01.org/0day-ci/archive/20240304/202403041847.TYnqZbBP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403041847.TYnqZbBP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403041847.TYnqZbBP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sysctl.c:1033:45: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1033:45: sparse:     expected void *buffer
   kernel/sysctl.c:1033:45: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:1791:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:1791:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:1791:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:312:66: sparse: sparse: self-comparison always evaluates to false

vim +1033 kernel/sysctl.c

  1026	
  1027	static int sysrq_use_leftctrl_sysctl_handler(struct ctl_table *table, int write,
  1028			void __user *buffer, size_t *lenp,
  1029			loff_t *ppos)
  1030	{
  1031		int error;
  1032	
> 1033		error = proc_dointvec(table, write, buffer, lenp, ppos);
  1034		if (error)
  1035			return error;
  1036	
  1037		if (write)
  1038			sysrq_toggle_sysrq_key(__sysrq_use_leftctrl);
  1039	
  1040		return 0;
  1041	}
  1042	#endif
  1043	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
