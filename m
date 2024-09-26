Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EEF4A3E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 01:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727314312; cv=none; b=lfK2ad5SRUKOlK0Y8UDxNz1FeWHwEtMLlqYP+j9Jfqn2tYUOx6cJTsj4afCFJmbKzkIcAOaIr+bVj8E21BjREobWb7YDuWubZxYBfrJCEOiW21tYG9z8z0GxPpxxCqPvBTj0IjL3D3ZJ72q5+Sq7YQgJdS9dOx6+O10ouNZhxv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727314312; c=relaxed/simple;
	bh=sh9TpswutHlihSamrBzc1mIv6HRB/i/+4TzXXkSKOGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ayGvjVrZwtqI6jYWNdKk7BYDXVNEZPE6EoqNiP6qDARwk5fkKcQZDfENJtKWWzLhbeWL2BaPj4edmNlPXKIGbuUGy+WuLZm0NzgJa5iMLs45I1TEtQFHg48IfDsAHhvlwyys3rMGHuO0ik0sRpCy2OO4MLuYnvo54dxVJEAnARE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDL1xf45; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDL1xf45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727314310; x=1758850310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sh9TpswutHlihSamrBzc1mIv6HRB/i/+4TzXXkSKOGY=;
  b=mDL1xf45yhI/qrgTLSlck4pSd3ZQxsFiKGzBflMBotH0mmQiNCzGehSB
   06BZtpdd7aqk+6pYuBCC3SLwnQWwnxziF+zS50Qmxe+A3VaMGnFMYTSWk
   uiZthChaUyng/JlYUM76XTXwALE8wEqMvOiqCkUoTBuqALxx9p3UZhne4
   5MtQzlJYinqvJOyMcdBuQP19/dy1DITG/UVNnH6KKcJBNpsfMZALCQgFZ
   9GfWRvZrGmDkm78IEQRX6OfYv9FeMk5eOdoGlKXOfWfsg+hW3pvFgqVGY
   F9hUy4XGDDFQt08LqsLGiYectBNbVA7CkeKH5L7PB/T0sqsz4G2QY9gtk
   w==;
X-CSE-ConnectionGUID: c5Mt6O/iSsmzKSpolzwo9A==
X-CSE-MsgGUID: EFSuLEA7RQyuJk1HB8m3Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="25901970"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="25901970"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 18:31:49 -0700
X-CSE-ConnectionGUID: mAAMmdKMR3SFPHUUAtJEzw==
X-CSE-MsgGUID: TWZnC5QKTOiNDSf4Ft4oPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="76344351"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Sep 2024 18:31:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stdM8-000K6v-0t;
	Thu, 26 Sep 2024 01:31:44 +0000
Date: Thu, 26 Sep 2024 09:31:39 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2230/2443]
 arch/x86/mm/numa.c:925:5: warning: no previous prototype for
 'memory_add_physaddr_to_nid'
Message-ID: <202409260943.063Z5rya-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   9d665359e14c559b74a94a55057e9c0fbd31a81a
commit: 9dbd28a697a6333fa61e89292aa06fc7fc0ef441 [2230/2443] x86/sgx: Add a basic NUMA allocation scheme to sgx_alloc_epc_page()
config: x86_64-randconfig-005-20240926 (https://download.01.org/0day-ci/archive/20240926/202409260943.063Z5rya-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409260943.063Z5rya-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409260943.063Z5rya-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/numa.c:925:5: warning: no previous prototype for 'memory_add_physaddr_to_nid' [-Wmissing-prototypes]
     925 | int memory_add_physaddr_to_nid(u64 start)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/memory_add_physaddr_to_nid +925 arch/x86/mm/numa.c

93c573edf4d3ac3 Dan Williams 2020-02-16  924  
93c573edf4d3ac3 Dan Williams 2020-02-16 @925  int memory_add_physaddr_to_nid(u64 start)

:::::: The code at line 925 was first introduced by commit
:::::: 93c573edf4d3ac33f2e5fb4e515e724fafc75594 x86/NUMA: Provide a range-to-target_node lookup facility

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Jianping Liu <frankjpliu@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
