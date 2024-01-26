Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D094917582
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 11:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706269582; cv=none; b=p3NFdDOsueQqgw1KiuNJBr5YAw0cLZiDkgd5bUiW+fZq1dGlf3MaDok/eYDQOQQMH/CHkNx+2QLCj8TdUzBQF5iTSEfbjVQ4ia9OlYo3MYlPY1p4ui5ilZ7zt3nde+5A4/ZoEoPsfDeWKFU8QmrV4GyoMJiDvHR44zplzUsEhE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706269582; c=relaxed/simple;
	bh=en9JVOKHR6iMCx7KWhQ3jXUrT+r7RRyjl7oNxREIXmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cPrtOpLXwz1YgAzctnH3BxT9mw6BYuA0Jfx4rm+/zaBdB+NVGXt292ZTU7DyJIS/qQZLnVEpIms5bFKMcAunu9iKA639dloZNRmodq2gc7wpnyG73L6z5kXpgkyC6YHDPw4IOpaKZ/a+TGp58xfPDHLq8R1hSWELDlwYSbNXjyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lTsSGTbY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTsSGTbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706269582; x=1737805582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=en9JVOKHR6iMCx7KWhQ3jXUrT+r7RRyjl7oNxREIXmE=;
  b=lTsSGTbYuyB/aODeH1sJczANW8NjKsWpfPP4tZMxRS6ZHwbSq6e9U1/h
   wsbRIGaa3KmVKfaneBumNDG6msGThNk8DYJ2Vl2v1BXb5AhXCLLXcGbII
   OTJUFW89cfU0mzcQKJAy32YU8LVQW9hJBPonPUZrvYlsTixU7pfitBB4p
   owu9LtNt9wZdgA5HSHmI0U96A/ItKxCe88sVutdhlqxnTuPNsztviiNk7
   GOB7E9vraNfxjwpcYRAyb0LjS8/CKr0J9KB9szkrWA7kH+HIlVrEi9ml6
   9gFYfNwSRqmoh/1v4UuiKzBiHYOjepuNUPD3IFWrempRnDIimK66NPNws
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9106383"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9106383"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 03:46:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2569110"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Jan 2024 03:46:17 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTKf0-0000zg-0J;
	Fri, 26 Jan 2024 11:46:14 +0000
Date: Fri, 26 Jan 2024 19:45:19 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 1576/1892] s390-linux-ld: kexec.c:undefined
 reference to `crashk_low_res'
Message-ID: <202401261933.gyy8YHnT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   01af33cc9894b4489fb68fa35c40e9fe85df63dc
commit: ad82e944d12ca472df041acb4c732bd630a81b90 [1576/1892] s390, crash: wrap crash dumping code into crash related ifdefs
config: s390-randconfig-r131-20230823 (https://download.01.org/0day-ci/archive/20240126/202401261933.gyy8YHnT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401261933.gyy8YHnT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401261933.gyy8YHnT-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: arch/s390/kernel/machine_kexec.o: in function `arch_crash_save_vmcoreinfo':
   machine_kexec.c:(.text+0x274): undefined reference to `vmcoreinfo_append_str'
   s390-linux-ld: machine_kexec.c:(.text+0x28c): undefined reference to `vmcoreinfo_append_str'
   s390-linux-ld: machine_kexec.c:(.text+0x2a2): undefined reference to `vmcoreinfo_append_str'
   s390-linux-ld: machine_kexec.c:(.text+0x2c4): undefined reference to `vmcoreinfo_append_str'
   s390-linux-ld: machine_kexec.c:(.text+0x2e6): undefined reference to `vmcoreinfo_append_str'
   s390-linux-ld: arch/s390/kernel/machine_kexec.o:machine_kexec.c:(.text+0x308): more undefined references to `vmcoreinfo_append_str' follow
   s390-linux-ld: arch/s390/kernel/machine_kexec.o: in function `arch_crash_save_vmcoreinfo':
   machine_kexec.c:(.text+0x340): undefined reference to `paddr_vmcoreinfo_note'
   s390-linux-ld: drivers/of/kexec.o: in function `of_kexec_alloc_and_setup_fdt':
   kexec.c:(.text+0x60c): undefined reference to `crashk_res'
>> s390-linux-ld: kexec.c:(.text+0x660): undefined reference to `crashk_low_res'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
