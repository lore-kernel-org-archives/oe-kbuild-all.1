Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BA018C93A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 03:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727753221; cv=none; b=ElDWYDz+k/4Rw6KdAnwpImqKtmSlcArhLCfkndv8Y25xe9fF1AOVFnZFUbQ4cHNBOi48cMaH+JWIDm2NYYnCdgqFVse5dEVNg2N5OBp1G+PROjFtjeCCWsh0JVu2Igcrj8ePHWECCyLLxjTWYfwzIkbdm0GJ3nc2bZCcCYufTEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727753221; c=relaxed/simple;
	bh=2ALUVcyjofgO1LVAQJ768nFvEnYX+oSYFv8b7wXWeFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZF+ohdz5QvbmwYns/khngNljd4AiUkNkZ6QVW+nw/Ih61+cPpXJEX6LtMyiRar+akvbE5mZFSbDi+Cx+9F8qKKK5jJvgNldq+qHoIV+WqAy5gGMJwBEiUJZtuD7xWYJ6uW0J5bgHCs5F9frCASERHNX0pxHetIu3iWa5oTvXTpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hl7I5BoG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hl7I5BoG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727753220; x=1759289220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ALUVcyjofgO1LVAQJ768nFvEnYX+oSYFv8b7wXWeFk=;
  b=hl7I5BoGMrNpmJV6XLjsGfF1GCvpKTD69CyFE3z+ijz8KRN3TUxtSQCL
   GLk9J6doeaFyJBPowpdYbBdTe6DNTCPrJzAVyC4Lv2VhnJhkwbVV2WyIg
   vadVSYqRsvGAzYkJ5qa6/k3aoyeggitsEaBUMFlpjf591NiQOKpOd+cDZ
   /7+MDtnSiQ/PZgT3l0Wvc6d/TsEdSA4seUOlQzeFwyGpSwnDeuZj2UKmz
   tGrMrHZ8FglplAIoQ89vyU9lRJboWbRXD6uJAbHimU1fB9lzaMRTZL7rt
   xfK0rErd3Gw8TMOs+scEj92QoOhgNOkuyuEBnF/VNWoh66DxOMeAQWEXg
   Q==;
X-CSE-ConnectionGUID: BMGADrR1SviUwMtefO8fFg==
X-CSE-MsgGUID: nRm4JomdTrmDy4NRt7t9RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38258017"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="38258017"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 20:26:53 -0700
X-CSE-ConnectionGUID: Pn5i+k33Tk61ERD749W6qw==
X-CSE-MsgGUID: J/hzkhmISU6XVujqU8/a1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="96850122"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Sep 2024 20:26:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svTXF-000QCX-0r;
	Tue, 01 Oct 2024 03:26:49 +0000
Date: Tue, 1 Oct 2024 11:26:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/v4 7/8] mm/execmem.c:48:36: error: 'struct
 vm_struct' has no member named 'page_order'
Message-ID: <202410011113.yWYa99B1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/v4
head:   c90f89d40fd21ce040b5cf1485ec6913d1b4ea5d
commit: 21ce3be90ca4d26a895b08de0d68fab4143f97d7 [7/8] execmem: add support for cache of large ROX pages
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20241001/202410011113.yWYa99B1-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011113.yWYa99B1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011113.yWYa99B1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/execmem.c:14:
   include/linux/set_memory.h:38:1: error: expected identifier or '(' before '{' token
      38 | {
         | ^
   mm/execmem.c: In function 'execmem_set_direct_map_valid':
>> mm/execmem.c:48:36: error: 'struct vm_struct' has no member named 'page_order'
      48 |         unsigned int nr = (1U << vm->page_order);
         |                                    ^~
   mm/execmem.c: In function 'execmem_cache_add':
   mm/execmem.c:145:30: warning: variable 'upper_size' set but not used [-Wunused-but-set-variable]
     145 |         unsigned long upper, upper_size = 0;
         |                              ^~~~~~~~~~
   mm/execmem.c:144:30: warning: variable 'lower_size' set but not used [-Wunused-but-set-variable]
     144 |         unsigned long lower, lower_size = 0;
         |                              ^~~~~~~~~~


vim +48 mm/execmem.c

    44	
    45	static int execmem_set_direct_map_valid(struct vm_struct *vm, bool valid)
    46	{
    47		/* FIXME: build for !CONFIG_HAVE_ARCH_HUGE_VMALLOC */
  > 48		unsigned int nr = (1U << vm->page_order);
    49		unsigned int updated = 0;
    50		int err = 0;
    51	
    52		for (int i = 0; i < vm->nr_pages; i += nr) {
    53			err = set_direct_map_valid_noflush(vm->pages[i], nr, valid);
    54			if (err)
    55				goto err_restore;
    56			updated += nr;
    57		}
    58	
    59		return 0;
    60	
    61	err_restore:
    62		for (int i = 0; i < updated; i += nr)
    63			set_direct_map_valid_noflush(vm->pages[i], nr, !valid);
    64	
    65		return err;
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
