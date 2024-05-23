Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D519F13B59B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 10:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716460398; cv=none; b=r31MZo5wjLm+VKuR8eKtgrtlFrwYzmRnqcbEh8eCajo/RVuf51nl9LKkCRG70NOoikpT73QraBnztVlaJH9AAi9eAPZniSh9/ppXikLtszD7BGQZ8yJSM1f4AOK1iyBsIaUO29Qe313KhlAz0HCsPaGfqwWbONcE8+k7aBnnP3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716460398; c=relaxed/simple;
	bh=lardVrqtECu8sUOPNuNPhq6HvuRWZtRXHSYB8ab05sY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sWLW01kALDhMateYxrwd2CGcvZ477poGe/5Cx4rtMf1cntUDJ347UxQ95eV64NKpV84IHwWcDUr00bRwPnM6GKLKwC+f53T71b5lydmXO/t49J1fMbNmJvD12IXmJRaoUEz8R2yJYrV09pLxVRO1Ufj+t6OqPhZom5wNHGUci6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmX7H0Ba; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmX7H0Ba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716460397; x=1747996397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lardVrqtECu8sUOPNuNPhq6HvuRWZtRXHSYB8ab05sY=;
  b=KmX7H0Ba2UEW0b5c6pBAiNOSTIl1iDG+L4N+cC43+5R3uDDM/xq4KcX0
   VqnhbTEQ3YVklw/bQoyAJNv3+xTnDjxGuhHSBL1ioxZWjUvQrHc5gHgbF
   Cwi+I+iO7D+Eh4UQfpO6uj2j9+oZlAMEOdgEoTb24k/HA3C3OppqrZLm+
   cmn9qpFfaXNIBruFJgGytyf6VP6bLs9nTQ+38mdN684mmJMlonLYNAMhU
   YSifCqq08wmkb9U/oEgbFbwzhh0qMhxr8DsOmLOYf/0jgPRxMo3+8Imy6
   fTVATN+VdTz25BF/r0cV3D8rHWgvoYjUgWELPXoIdtQ6C3YiRMk8vS8Rh
   A==;
X-CSE-ConnectionGUID: FSTQ1/HsQZKz1jNJTpfNSQ==
X-CSE-MsgGUID: zjy/+nXfT9u9xRunvmI2Pw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="23902020"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="23902020"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 03:33:13 -0700
X-CSE-ConnectionGUID: N0rNPgXETrKuAkKRFH1QnA==
X-CSE-MsgGUID: Getmf0VrRPyQG0nSzBIasg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="38016474"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 May 2024 03:33:12 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA5kv-0002jq-2L;
	Thu, 23 May 2024 10:33:07 +0000
Date: Thu, 23 May 2024 18:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 44/68] devmem.c:undefined reference to
 `__tracepoint_page_pool_state_hold'
Message-ID: <202405231811.KVHOqQaA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   9b5718278c90658985f5d335dff91dd589b3d4c7
commit: 4c610b57b76d4755266b022b1cf0aa55e728ae0a [44/68] memory-provider: dmabuf devmem memory provider
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240523/202405231811.KVHOqQaA-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405231811.KVHOqQaA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405231811.KVHOqQaA-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `mp_dmabuf_devmem_alloc_pages':
>> devmem.c:(.text+0xc05aeb): undefined reference to `__tracepoint_page_pool_state_hold'
>> ld: devmem.c:(.text+0xc05aff): undefined reference to `__SCT__tp_func_page_pool_state_hold'
>> ld: vmlinux.o:(__jump_table+0x10908): undefined reference to `__tracepoint_page_pool_state_hold'
>> ld: vmlinux.o:(.static_call_sites+0xb74c): undefined reference to `__SCK__tp_func_page_pool_state_hold'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
