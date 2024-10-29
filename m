Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89FF1F429A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 03:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730171384; cv=none; b=my2KvKdkMxCYeS1XKKzVhuzVGKrsr4xZl5YKfX0qJt3BreHMD13CB87roBkIyWS4tYMuTHEhiXXUZFR8h8fm/UnGzCa3RTDv2ycvUBPVJX0hHAkmT8aoxzJUqgq2hX2gK/AcS+ucC2d3rhmQvPq2BGwm3SOtTbOuvdUMoGp5QKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730171384; c=relaxed/simple;
	bh=WzbMO/LoEJ8hoU4ofiiq51CPs7oGL8EczzeyCBh7SnA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aAbmsaHyiqjwl+bZrL4GsjS3s2ezliyWL87t2RWphUe8vv1M7WRh11A3dankiAt877xQtulAuPW4QS1ugTDBcxCXlNy3MAdfunZQd2N+mIiTrZXuLqxVYYx7VfUBa3IoCVENhKDOyAJG75cFx3DGv1/Gx5kJatEQ9z+2dobK8+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwZRrprE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwZRrprE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730171383; x=1761707383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WzbMO/LoEJ8hoU4ofiiq51CPs7oGL8EczzeyCBh7SnA=;
  b=UwZRrprE4AIvY6Zgan9O0HJ8jbgM0r8ZtculKkqfzSSSlkmM6fRkS890
   ZzWwTZpONvFKO/N8JXY+NGkLzBLroVR7RW//OMsx7DNH2BmNz7H61qkir
   5JFIizqhi0QkaPN3ZzvOA6cyN5qnmfE580wQWpT0FdVksDTErPM3AjgVn
   X5twcHjVi55NKnQg5qG8uVMmivSJKHfHknuqKgkja4oc4GTwCg9sSiuQQ
   JJZTM8a21qhruAz9BXGgNMGA2Ll7KZWPz9bNR7dR8Ua0OsqdVyKKQxFBE
   cUQfQYld6zxOOHUBJAc5BiaHNVIAANVX72U3qebzPlzG3pdBtuak44BYA
   Q==;
X-CSE-ConnectionGUID: EQdwPNKZTu27dZKqw9aqfQ==
X-CSE-MsgGUID: kWER1qpsQpSAX/02KmhWLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="40409664"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="40409664"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 20:09:42 -0700
X-CSE-ConnectionGUID: LZW+AHefT6KElJ0WpuAddA==
X-CSE-MsgGUID: 4XfvbSWuQiOhk5WaWgtAeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="86373664"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Oct 2024 20:09:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5cbx-000dBe-0j;
	Tue, 29 Oct 2024 03:09:37 +0000
Date: Tue, 29 Oct 2024 11:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 13/98] kernel/sysctl.c:1033:45: sparse: sparse:
 incorrect type in argument 3 (different address spaces)
Message-ID: <202410291137.RSSvrKAi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 95c98461d1dce7fd1d25f055c88ad639b0e3b7d7 [13/98] sysrq: add ALT+LEFTCTRL to trigger crash dump
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291137.RSSvrKAi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291137.RSSvrKAi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291137.RSSvrKAi-lkp@intel.com/

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
