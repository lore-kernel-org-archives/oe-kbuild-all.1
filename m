Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111EA10A0A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 05:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709356986; cv=none; b=UdklDpKeioF1rV5EwJIRMt559Sacvge8jHvOlmkovGjKqgRK7hHxjxClPeNxk0PIRVHgArcQsLX58XaRp+ybekBLoUwXo1+cKwnBxCPqL69f7CL972h3foc9YXb2KJiTcuy3vqWLSoXoKeL0/GaZUHjH4ldRm91bkLDyUfPDbKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709356986; c=relaxed/simple;
	bh=hkfSDhKYpEYAShioUkAx6/EYrz2O9MybcQ+gs34jo2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LLMfg+V6iXhX7T0uVwuUbObEIwPxwfyWChF4dsbqJ2tCBk0u47iEr2cyR/sfwOyJEwKkDbI/nt2e3pPH3OP6yGqJKcWzYV9Bocv+NRdHKL9H3T8TBvKUS5+80doDjdRNd5QlRVvTKoyb9J6SYbJELm5tgx6+dcicshQKQRhkh9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c9xIzvRL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9xIzvRL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709356984; x=1740892984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hkfSDhKYpEYAShioUkAx6/EYrz2O9MybcQ+gs34jo2s=;
  b=c9xIzvRLLZPFGzid8t+c2OzJXQj+HptKp5QEkVOQbX2oE3W+pRfjafZQ
   Uq+zxutJrSI8jwBVDDgHGRLGqy03Xrjq2QnhTRTD0hxbvMiQ11NNOwhkn
   OctdVxVB5yiMgfcKQAScq0lF1qX1qELciyoWL428cQArsMOYAzHg4xwPI
   1faQTT7txVr+FpHwNzvKwfH4+Fo+tH0MFB1wHNPav4OAGyho5zKcBvmtU
   g4P/GoNNHAI1inCy9VMrgWyZN+O0bYLyEM+cTFE/uda1xTPEpZ1jOxTQe
   80wstEBmVKLJdLvb84aufg9OxpEPBzCaJ+mfMCI9wXu/h8gGEhZIa/gXu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="21363634"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="21363634"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 21:23:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="8348721"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Mar 2024 21:23:02 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgHph-000ELF-1w;
	Sat, 02 Mar 2024 05:22:54 +0000
Date: Sat, 2 Mar 2024 13:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <ssengar@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Michael Kelley <mhklinux@outlook.com>
Subject: [hyperv:hyperv-fixes 11/12] hv_vtl.c:undefined reference to
 `idle_thread_get'
Message-ID: <202403021303.L6HEQldd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-fixes
head:   ea05b55de1e0af196caaa9ef70ebd0b29a0f7b45
commit: 9904eadec6dab60ab590fa800fccfc9715020e46 [11/12] x86/hyperv: Use per cpu initial stack for vtl context
config: x86_64-buildonly-randconfig-006-20240301 (https://download.01.org/0day-ci/archive/20240302/202403021303.L6HEQldd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021303.L6HEQldd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403021303.L6HEQldd-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `hv_vtl_bringup_vcpu.constprop.0':
>> hv_vtl.c:(.text+0x26ffc): undefined reference to `idle_thread_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
