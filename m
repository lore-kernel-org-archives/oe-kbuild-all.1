Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D058139D0A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 19:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765913578; cv=none; b=N4yJ9zUy8qRwCLZ3QAXb3uHl2PmBHgDTnzgixO9wNQBvNJO+K3GRrdkw1DWJu16P6cEMUiCAsuudyAR4v/2HEC+JOq/AYxqKYuLK2jIytlRz2/LbOjH5/bQjIF98X+sOdrTx8udiUztFFidFdQs3QtH91DYOI30ECFPiWBCtiPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765913578; c=relaxed/simple;
	bh=uuMcXhe71bXdCw7Lqot85cls8wemVqYEx9CsEfaiPDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WrW399GhVbFb/vsy0InpgtGK5HdsrdYtV+WY+oK+zUAMK+GvcE0WJP85ite+JoulhxrwByRN4oSqmHQf94LalIeYmIlZTHSzqJxvw99XGH+NySPqT8YU3bCKmbm9o3cvoCAFaqHayWeBYGpqm09IXR8EoHsdBEWbDYhnla0HwF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBabPdvk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBabPdvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765913576; x=1797449576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uuMcXhe71bXdCw7Lqot85cls8wemVqYEx9CsEfaiPDE=;
  b=DBabPdvk1EiCtYNUWv+iCywLWPbQUYvJ/88RtoiNHHDAgNU7EHj4q3YR
   ymQYZ4jtIBwGCxXYm1xAtGZAvdKVRf3WCj32WmlYBfMoCT1bTenXkDK2Z
   JsJDUr7RHXjy9ZOFPxEemOFy3M206kFdepjIFN40tPoTTyWGYDWIAHu+z
   wqvZCormIqLj6djBRgQiGucxbM+d810QCW/lMncvmO1Y+77LINprsccPD
   8OVoH/jzejBG1eXTH+VelKLWGElmfqaUZtZRgcraIUMtjLwBWR+atLo7f
   Vapi0NcgJZpn50zOlksURTBPjcwrKdD1+FKPRr0K0mPF3kOg9o518kQ/0
   w==;
X-CSE-ConnectionGUID: 1VCXP0NgTcuudtMFxefc1A==
X-CSE-MsgGUID: lZgrcMa9RsybuLuMWNIC2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67881347"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67881347"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 11:32:55 -0800
X-CSE-ConnectionGUID: adkHya/FQQ61wJD1JlfOdA==
X-CSE-MsgGUID: MZqyoZFFSWmJP0SJpKKkbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197722542"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 16 Dec 2025 11:32:54 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVamk-000000003lg-05dl;
	Tue, 16 Dec 2025 19:32:41 +0000
Date: Wed, 17 Dec 2025 03:31:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1943/1943] arch/x86/mm/maccess.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202512170330.xeDXc5AM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   49bc452fdcb1e9ec3f9bb20cd3e15b865a2933fd
commit: 22058d2bdaf6b0526395ceec2736c72c3b5f435a [1943/1943] uaccess: Add strict non-pagefault kernel-space read function
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251217/202512170330.xeDXc5AM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170330.xeDXc5AM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170330.xeDXc5AM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/maccess.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
