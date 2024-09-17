Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726D615746B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726563243; cv=none; b=GD7BcI49Qz5FTi37TxhvOCrMSta3tptjbb/QwMNrhTJBAXMqyOeXl0o204BpQijVSmiTUJ58CRBEpF/KkgTdlFOHbWFgYcVYujma8zXTE6w2xNTOioubEbK5Klnn29HcPP2fK1UZMXv/Wkq0krmtP7Zubvqa3OOu3DnusX7brsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726563243; c=relaxed/simple;
	bh=HCKHqJVCdkOejKXvUTCiR2V9bqlWkr+6s9WWY5B0jmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HakO97Ad/1O1xVCVpVVo1+TJ22EN+X6QYaO9IH11nm/IOpa9/X8eBX7Cw5nt+t4MEDJr3F9aqbkkKfK2Hbm+mCXj+nDKYYZ0jgYN2fCMyh+zhMnaHineo9NRRm+VctzOIGoWaB31ugcvOwmEu1sNHRcIW+ArpNV6RNOQtN5kEcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGd+GEmK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGd+GEmK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726563242; x=1758099242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HCKHqJVCdkOejKXvUTCiR2V9bqlWkr+6s9WWY5B0jmQ=;
  b=cGd+GEmKCzQ4Isf9UauvreC+1kKl3iYMj6vI8tQrMPoUi2oH3T3FcrNO
   R8XvjdyC/68ufCA+OwrK1t2iONzySfMzgaH5JLwkAvu5Jx2BYejFHAFIy
   TnTLTVYEyOS8AJ8XWViKuS7WPaSWoxcsUprXbx/BlMXk7bReit/OmoMZ1
   Relm532fEEiufdxRtPw3l1JMRjqfkLl2DX+MpzNCisVswqh7M80N0pgz/
   vQ7CGmlUkLTfIkAQMRXWZjbZBWzuoUQ3Qc/edVDeMnSThQDCkTb9DhBTm
   oMaE2GO0psiUBm1UpIP1w1jOE2RQyy9qixtnaak/sy+KilmYuXjHpTMGf
   g==;
X-CSE-ConnectionGUID: xHM1nBtESQq47Gb8KfNP+g==
X-CSE-MsgGUID: KhJiyiPGSyOcM4dD2Q1SaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36546371"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="36546371"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 01:54:01 -0700
X-CSE-ConnectionGUID: i8nhRJXYSRWSOT2oTSGvCA==
X-CSE-MsgGUID: s6oyK1ISRZmxxPewY4V0hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="69086839"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Sep 2024 01:54:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqTy9-000B0M-1h;
	Tue, 17 Sep 2024 08:53:57 +0000
Date: Tue, 17 Sep 2024 16:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe-2.1 5/5] kernel/unwind/user.c:179:33: warning: left
 shift count >= width of type
Message-ID: <202409171648.u3zsDqii-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe-2.1
head:   5b35eb7c617539f21cbe3764b0ee0c77567b0f22
commit: 5b35eb7c617539f21cbe3764b0ee0c77567b0f22 [5/5] unwind: Add deferred interfaces
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20240917/202409171648.u3zsDqii-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409171648.u3zsDqii-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409171648.u3zsDqii-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/unwind/user.c: In function 'unwind_user_deferred':
>> kernel/unwind/user.c:179:33: warning: left shift count >= width of type [-Wshift-count-overflow]
     179 |                 cookie &= ((1UL << 48) - 1);
         |                                 ^~


vim +179 kernel/unwind/user.c

   165	
   166	{
   167		BUILD_BUG_ON(NR_CPUS > 65535);
   168	
   169		if (WARN_ON_ONCE(in_nmi()))
   170			return -EINVAL;
   171	
   172		local_irq_disable();
   173	
   174		if (!current->unwind_ctx_cookie) {
   175			u64 cpu = smp_processor_id();
   176			u64 cookie;
   177	
   178			cookie = __this_cpu_read(ctx_ctr);
 > 179			cookie &= ((1UL << 48) - 1);
   180			cookie |= ((cpu << 48) + 1);
   181			__this_cpu_write(ctx_ctr, cookie);
   182	
   183			current->unwind_ctx_cookie = cookie;
   184			task_work_add(current, &current->unwind_work, TWA_RESUME);
   185		}
   186	
   187		*ctx_cookie = current->unwind_ctx_cookie;
   188		current->unwind_pending |= (1 << callback->unwind_priv.idx);
   189	
   190		local_irq_enable();
   191	
   192		return 0;
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
