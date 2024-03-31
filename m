Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5803C38
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 00:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711846151; cv=none; b=jLTVMGFZGSch86SYukQ0AjUH8fbhUim78mel36y6baIsMDtJvexoi/johhfQ38Iwh66PpKoop/irIuQyJPstZjXZuMVXxt+qYAJXupTn6kUAFiJjGFcYGLXqNDW1uHopUPaYMGXyBNRyBnlmUv59yMeQevoULYSVL7CC2tktVrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711846151; c=relaxed/simple;
	bh=DBGd1zMAUIrnU0Cbk0UDf1N7MygIZGO1v2O59ipqCi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ju8TMccvDqCg+Lf2ErV5en5Z9RB7oUPzxiuyz3bhrPNZTquLESw/d4fXSaPzHxu+DMvHMcxnyu40Xj4tqj11fzi/EXrZQKhAgJPzTk538PVWkoGI4iL5uOKUSyiVMDww+8cMTC2V6j8VCKKu/TuzCihdKZRKKo7yCtOyfgETG84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bNTW4jSG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNTW4jSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711846149; x=1743382149;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DBGd1zMAUIrnU0Cbk0UDf1N7MygIZGO1v2O59ipqCi0=;
  b=bNTW4jSGJhEW1DtPYpf1I0ppjQoEN2bXOt7zyhnNwfqffvhPANa4NxM4
   NkqUnbJYU8r6gx9IX4WXKPpBg65VDyaGnxmTTgAydt84rGrIJRVcI90IP
   TCowbs9zO4/8i+VJbfBjedHZEvMh79zEy9mmBO9ALW4gLuISKRheM1JZH
   H8DdqAyhi+1RM9ixlvWuJPxeDWh+aapncb09QkmuFFHgKVbdw8JnI4v/e
   tNJlMGB+YPo52tpx3Ne+X7JWj4fTZO+KOHzKivK9aMG6QtRq8LFvllUlq
   NZlyGvqZHCNI59lpX5YzgSTg9kwVmOVv10xA1owYphCgQnidBuSWfaG63
   A==;
X-CSE-ConnectionGUID: UlzaSfwQTWmOAYiGxGpMWA==
X-CSE-MsgGUID: zLq/TKdsTZaQ5trcm9UnVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="7131578"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="7131578"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 17:49:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="48516978"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Mar 2024 17:49:07 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqjNh-0000a6-0O;
	Sun, 31 Mar 2024 00:49:05 +0000
Date: Sun, 31 Mar 2024 08:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC KERNEL PATCH v5 2/3] xen/pvh: Setup gsi for passthrough
 device
Message-ID: <202403310809.zuyZiCEM-lkp@intel.com>
References: <20240328065646.354782-3-Jiqian.Chen@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328065646.354782-3-Jiqian.Chen@amd.com>

Hi Jiqian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on xen-tip/linux-next]
[also build test ERROR on pci/next pci/for-linus rafael-pm/linux-next linus/master v6.9-rc1 next-20240328]
[cannot apply to tip/x86/core rafael-pm/acpi-bus rafael-pm/devprop]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiqian-Chen/xen-pci-Add-xen_reset_device_state-function/20240328-145956
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/20240328065646.354782-3-Jiqian.Chen%40amd.com
patch subject: [RFC KERNEL PATCH v5 2/3] xen/pvh: Setup gsi for passthrough device
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240331/202403310809.zuyZiCEM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403310809.zuyZiCEM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403310809.zuyZiCEM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/xen/xen-pciback/pci_stub.c:23:
   include/xen/acpi.h: In function 'xen_acpi_sleep_register':
>> include/xen/acpi.h:67:17: error: 'acpi_suspend_lowlevel' undeclared (first use in this function); did you mean 'xen_acpi_suspend_lowlevel'?
      67 |                 acpi_suspend_lowlevel = xen_acpi_suspend_lowlevel;
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 xen_acpi_suspend_lowlevel
   include/xen/acpi.h:67:17: note: each undeclared identifier is reported only once for each function it appears in


vim +67 include/xen/acpi.h

068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  58  
268a207563f933 Liu Jinsong           2013-02-14  59  static inline void xen_acpi_sleep_register(void)
268a207563f933 Liu Jinsong           2013-02-14  60  {
068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  61  	if (xen_initial_domain()) {
268a207563f933 Liu Jinsong           2013-02-14  62  		acpi_os_set_prepare_sleep(
be6b25d15f5e67 Ben Guthro            2013-07-30  63  			&xen_acpi_notify_hypervisor_sleep);
be6b25d15f5e67 Ben Guthro            2013-07-30  64  		acpi_os_set_prepare_extended_sleep(
be6b25d15f5e67 Ben Guthro            2013-07-30  65  			&xen_acpi_notify_hypervisor_extended_sleep);
068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  66  
068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14 @67  		acpi_suspend_lowlevel = xen_acpi_suspend_lowlevel;
068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  68  	}
268a207563f933 Liu Jinsong           2013-02-14  69  }
818bdd39dbd468 Jiqian Chen           2024-03-28  70  int xen_pvh_passthrough_gsi(struct pci_dev *dev);
268a207563f933 Liu Jinsong           2013-02-14  71  #else
268a207563f933 Liu Jinsong           2013-02-14  72  static inline void xen_acpi_sleep_register(void)
268a207563f933 Liu Jinsong           2013-02-14  73  {
268a207563f933 Liu Jinsong           2013-02-14  74  }
818bdd39dbd468 Jiqian Chen           2024-03-28  75  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
