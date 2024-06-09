Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ECC15B3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 00:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717893937; cv=none; b=BpGXg7S/hHnwmk4HPE+nDxtgu2qwGQ4ln4xxZcsCOeVEO9i/H7W2QUAt0+2y8beCsNUxqbEkeUuf2HyCqnejbdtEz0Jk2NQXWCuO+i/k3t+NV9d0Xo//+GjkkhyuhkHiw/RSC/vW2lt/l6C+/X+FJjZE9deLy78s0SF6TLi/I3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717893937; c=relaxed/simple;
	bh=2rAIRdzvLDIV+2qQw5S8+we51CP9JHr75S1POFllQHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WaLlG5v1yUF6S2NnOyluV53wdOsuccgFA/BhdBn+QJN7gbBmEg0QSQ92jdUEShR7aOh54V0RkDhaaw2U5466IgTbNvNrga3Cdo7R5Kv++FqmSZdENVtwHzEPB/0pdQodTz3CBPmCF0K5r5PwHmu6p2IsK1/TFVc4375NLHUM3xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGKLc5ki; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGKLc5ki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717893936; x=1749429936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2rAIRdzvLDIV+2qQw5S8+we51CP9JHr75S1POFllQHQ=;
  b=AGKLc5kit0KP52+nr3K/wAaUaorHSHdW1oP+Xl9hebCNh/KOkKm3rtqq
   6SpTE3IX3kMbmyqp7Q0ZdC7FLGyHgxJdWJ71hlETKpzCok84qlO3MSMhq
   kfUJZOnmoGccQ4f8/rNp7VbrIbiq7LZUo73msJVZY/uHNEfXf7PpzPusR
   ZvgeCDrEX46v27WiY6e6hBSkGY8GDxEZktXYvzdb6bsiu8ajYSy1upJK1
   iRydxn2HBvK9ET+zaCWoZx6BIJUrFgXtzsq1j4BS8CyTdoathff33YS4X
   BnCFaKsO2o72Stq9Nx7eJ1Ob+N7lx9r39vURgIYiklXFeL2b1Lm+lYvij
   Q==;
X-CSE-ConnectionGUID: 5Z5d4G7QRr2TxI6qIXQRWg==
X-CSE-MsgGUID: u3EPm3eKTz+OSK1KcL7M5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14542342"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="14542342"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 17:45:35 -0700
X-CSE-ConnectionGUID: 1/Q0RO6kQPiZNx5fBnEYxQ==
X-CSE-MsgGUID: HKMsFdTMQ+iqPsRRU4iCug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="39252182"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Jun 2024 17:45:35 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG6ge-0000he-0p;
	Sun, 09 Jun 2024 00:45:32 +0000
Date: Sun, 9 Jun 2024 08:44:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC KERNEL PATCH v8 3/3] xen/privcmd: Add new syscall to get
 gsi from dev
Message-ID: <202406090826.whl6Cb7R-lkp@intel.com>
References: <20240607075109.126277-4-Jiqian.Chen@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607075109.126277-4-Jiqian.Chen@amd.com>

Hi Jiqian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on xen-tip/linux-next]
[also build test ERROR on pci/next pci/for-linus rafael-pm/linux-next rafael-pm/bleeding-edge tip/x86/core linus/master v6.10-rc2 next-20240607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiqian-Chen/xen-pvh-Setup-gsi-for-passthrough-device/20240607-165312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/20240607075109.126277-4-Jiqian.Chen%40amd.com
patch subject: [RFC KERNEL PATCH v8 3/3] xen/privcmd: Add new syscall to get gsi from dev
config: x86_64-randconfig-004-20240609 (https://download.01.org/0day-ci/archive/20240609/202406090826.whl6Cb7R-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406090826.whl6Cb7R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406090826.whl6Cb7R-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `privcmd_ioctl_gsi_from_dev':
>> drivers/xen/privcmd.c:856:(.text+0x115502f): undefined reference to `pcistub_get_gsi_from_sbdf'


vim +856 drivers/xen/privcmd.c

   847	
   848	static long privcmd_ioctl_gsi_from_dev(struct file *file, void __user *udata)
   849	{
   850	#ifdef CONFIG_XEN_ACPI
   851		struct privcmd_gsi_from_dev kdata;
   852	
   853		if (copy_from_user(&kdata, udata, sizeof(kdata)))
   854			return -EFAULT;
   855	
 > 856		kdata.gsi = pcistub_get_gsi_from_sbdf(kdata.sbdf);
   857		if (kdata.gsi == -1)
   858			return -EINVAL;
   859	
   860		if (copy_to_user(udata, &kdata, sizeof(kdata)))
   861			return -EFAULT;
   862	
   863		return 0;
   864	#else
   865		return -EINVAL;
   866	#endif
   867	}
   868	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
