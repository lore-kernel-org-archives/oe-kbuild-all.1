Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD6B64C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 00:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709338814; cv=none; b=jnXXoRHGfNxD06SZU7e1bmYBlIa0ISUXjxdYMD7iUzfb+1GOifZewIQo72kXM5QTK3kevzjcJ/4umXZ6Gz6iXlUBrg/MZa/DXhGclSKKxF3uN63VOLFuNF4xmYpNvVOYdnSowQY4C0CyqMBBg0IQLvQk1fmQ7PKtIglOz3DIuEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709338814; c=relaxed/simple;
	bh=qc8z5oYvFDRSTkp1Lz6ONwTK5YgBDvX0lfMKAoqtVBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DApGSi9n6gPi9AVq9xNgVNkZQ6g9Qn0pcjLzyPETGwEvtmrViwx5cpwhFfDds9IZpcLhUticVbcDc57wWr1svu/FjXMbJVuQTv21KoobJZlG8iU9dTVy7VK76SL7I3mRbBKkO2Yyb7nWymW7lihPDiOdS7v6ErXTfzS/qM32324=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IvzL1yUy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IvzL1yUy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709338812; x=1740874812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qc8z5oYvFDRSTkp1Lz6ONwTK5YgBDvX0lfMKAoqtVBk=;
  b=IvzL1yUykCqWcVn2tjur82FR46VwPvdpdq9BZD6U4cMaGfafJa/E8Hd2
   B5vA7Z97ASRpeqKhXgSqQffB/WiC+R/7uFQqCTgQ/ufKeE12LfKryRsxl
   cwIeNX2NqpTohiHplNbAmAdDP9mxIe/KNEzp3Mjt7Xa0agtK/qx54t2aS
   iwrbXDIXow2jQyCr+1sv0gp+oCnGgxdfQabN4FAvnSIQapC6Z3P35kNIC
   22NTmCmjrgSMGZ3tO5V9QgZ8zxKvBQwq0QwTNcyUOCXBqB/7njggMHIk4
   +VUspI/Cq64YAcjoVrKJdDYjtYpX0ukm0Og9Koh+L0LtqCPNqpM93e5Ce
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="7669439"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="7669439"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 16:20:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="8587424"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Mar 2024 16:20:09 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgD6k-000EBt-1o;
	Sat, 02 Mar 2024 00:20:06 +0000
Date: Sat, 2 Mar 2024 08:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 46/98] kernel/sysctl.c:878:5: warning: no previous
 prototype for function 'proc_dointvec_max_map_count'
Message-ID: <202403020855.5PhnshPb-lkp@intel.com>
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
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240302/202403020855.5PhnshPb-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403020855.5PhnshPb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020855.5PhnshPb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sysctl.c:878:5: warning: no previous prototype for function 'proc_dointvec_max_map_count' [-Wmissing-prototypes]
     878 | int proc_dointvec_max_map_count(struct ctl_table *table, int write,
         |     ^
   kernel/sysctl.c:878:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     878 | int proc_dointvec_max_map_count(struct ctl_table *table, int write,
         | ^
         | static 
   1 warning generated.


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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
