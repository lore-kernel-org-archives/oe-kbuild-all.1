Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572618828
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 00:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743553529; cv=none; b=SmNC7uXPq+0TTdv3Z7T7Qq3DbtfAQl0Img+5zV2l9ZGH+NtDERk4uooH8XCL3TGjvPC0llbY5DhBi9Q6ZIq6/2SfaGGyxxgrWAJPiW/vvoDldzasjt//4phcQSCFINK2vnFiV/LLdBtCaOgSofjOiLZ4L2l/g0c22vH08tWWDhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743553529; c=relaxed/simple;
	bh=nr+fm0snbG1DrPbWJuoFIiMwnJKjvM7re8MgU580vOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DuSUEyfERAWFuWBQM/juPJVQr0B7K7OIIgSoTzsDJ5eBlcSsXqo0uiops4fnqlwqq0AkW4MwZ+t8NrMNcH0FsC8pQ4OoGtO008xjHpTX4ee4MqNfmQgMcEi1KQe7lTOqKvgjuXIKS1EEUAWHMCkuti5QU0wQ8KsZOWrVD2RT88Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2UP2M7P; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2UP2M7P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743553527; x=1775089527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nr+fm0snbG1DrPbWJuoFIiMwnJKjvM7re8MgU580vOY=;
  b=m2UP2M7PnjdJweqmI9cY2hRYUzqEmfk9s6NfBTS/7FwQr6tOoIPcWgDH
   0Ay1jpZ0kF6IPHxCYHZtTXtkYEtE/wXwHQGertoi9N0PIlyRhrpoz+Unq
   QiHH+MNGV4LV+QuCPShqlAv0ZXSq0fpu+nY2vxwfVk+KmY8YBlHOWWiQU
   J+oiSwMp8VK46qVkehhwCN1n2TTD7SE8Dwsf06pjBTHwosV27XBevzL3F
   zyZmnLUB9G/lYrR6uzgnUSaFQBXVbGl6dhlrXtk7ddOsu/iQI9yUHHLgg
   kqUrhc86lWZJmgAm/5aOwRzCFZFOawcAvSJ7p7osaMzYpRotOBiKxR4Bt
   A==;
X-CSE-ConnectionGUID: jWhRUHxnRDC02LmLAo+HQg==
X-CSE-MsgGUID: DObF3pZ+TwemPI0zxK3syg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="48689517"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="48689517"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 17:25:27 -0700
X-CSE-ConnectionGUID: pZNwlMQhRv2BwWXG45KRnw==
X-CSE-MsgGUID: EkDZ5S6TQlaUZsR4YO4/3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="163753784"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Apr 2025 17:25:26 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzlv1-000AHe-1y;
	Wed, 02 Apr 2025 00:25:23 +0000
Date: Wed, 2 Apr 2025 08:25:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2836/2836] arch/x86/kernel/fpu/core.c:452:15:
 warning: no previous prototype for 'get_fpu_registers_pos'
Message-ID: <202504020854.WbZXJEHJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   411f2e6e24ad11083d85f2ab7324b1f77ad0d371
commit: 0cd6fd52741f659d2a57501ca933ab33040cb911 [2836/2836] mm: Enhanced copy capabilities for Hygon processor
config: x86_64-randconfig-101-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020854.WbZXJEHJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504020854.WbZXJEHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020854.WbZXJEHJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/fpu/core.c:444:14: warning: no previous prototype for 'get_fpustate_free_space' [-Wmissing-prototypes]
     444 | unsigned int get_fpustate_free_space(struct fpu *fpu)
         |              ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/fpu/core.c:452:15: warning: no previous prototype for 'get_fpu_registers_pos' [-Wmissing-prototypes]
     452 | unsigned long get_fpu_registers_pos(struct fpu *fpu, unsigned int off)
         |               ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/fpu/core.c:533:6: warning: no previous prototype for 'save_fpregs_to_fpkernelstate' [-Wmissing-prototypes]
     533 | void save_fpregs_to_fpkernelstate(struct fpu *kfpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/get_fpu_registers_pos +452 arch/x86/kernel/fpu/core.c

   451	
 > 452	unsigned long get_fpu_registers_pos(struct fpu *fpu, unsigned int off)
   453	{
   454		unsigned long addr = 0;
   455	
   456		if (fpu && (fpu_kernel_nonatomic_xstate_size > off)) {
   457			addr = (unsigned long)&fpu->__fpstate.regs.__padding[0];
   458			addr += fpu_kernel_cfg.default_size + off;
   459		}
   460		return addr;
   461	}
   462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
