Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307061DFD99
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 08:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736240271; cv=none; b=NB9WmSYhYigIdsqyFJGZf5zoZWagmdsPV4FHpwF/RJo3+4tCRqi9S718wU4SP7zUWNvR4nv4RXOOhAS9QZZnGUJO27xihZkUQYMIi/8ueodSOhGsrrt5wDfnARUiKKM5xyFG8qDp5aKlWTJ5NDSW9q16V2uXIYZkQpei192AsiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736240271; c=relaxed/simple;
	bh=ulJtOftpothYnndTI0t69V0IRaP+dmVJwxol+23ydr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uV2fQfGMdUTMYIy1RvoyBjsPu4402S0uttQdFpPWxLVcJHSGAxTVOCJSQoGhSCcKZDYe1lKKnLuJqzgSM0IkoQOzSzEcyYe184X/udgEWC3MWcxHIstMM9ZN7OXNA4eahLUOf+waK+ovIw4TbTY9yv40EmxoPcBUns65oD7MU3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5Ew3LYl; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5Ew3LYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736240269; x=1767776269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ulJtOftpothYnndTI0t69V0IRaP+dmVJwxol+23ydr4=;
  b=k5Ew3LYlfn2zh7yAVXZtsqa++2tP0YV+UPjQQjLeDXPtxuMV+z9TfBgH
   6UzxrYVwApkaCpo3hcunW8BcTPAURNq5L4p+MtTKI3+4+hd6j20vXMZ3D
   x0BV4s3q2K4XADCKWW1zm00thCbUSY2cC2L2dwqG6NiGZH3etAX6oQRzP
   RLIOvVinLTqboiC4ZcSus5zUW6cK3rg7j+7qScPizsX+FG3yt3CN3xXaG
   dNXjlx2kjBRG//mTX2tTH2Lj/xaLbCFvm47yS82zoSdFpthgeP90E2F4V
   GYGroE71V9yYE7D7tLfaR8rjXvBwE48nwJbUJ/KWcpABIwEqE/+YK1WjA
   w==;
X-CSE-ConnectionGUID: 5xudMLXWQ4WpYceHgN1TSg==
X-CSE-MsgGUID: Fm5P2vcbSJa9o388rZyTdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="40181873"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="40181873"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 00:57:48 -0800
X-CSE-ConnectionGUID: FISpj+RsQpWR2ECBMq8vcA==
X-CSE-MsgGUID: yeC/zrkqRseHb77kRtBQxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103196508"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Jan 2025 00:57:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV5PD-000ESR-1v;
	Tue, 07 Jan 2025 08:57:43 +0000
Date: Tue, 7 Jan 2025 16:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: Wathsala Vithanage <wathsala.vithanage@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] ACPI: Add support for invoking select _DSM
 methods from user space
Message-ID: <202501071623.F8uprxKI-lkp@intel.com>
References: <20250106163045.508959-2-wathsala.vithanage@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106163045.508959-2-wathsala.vithanage@arm.com>

Hi Wathsala,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge pci/next pci/for-linus linus/master v6.13-rc6 next-20250106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wathsala-Vithanage/ACPI-Add-support-for-invoking-select-_DSM-methods-from-user-space/20250107-003201
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250106163045.508959-2-wathsala.vithanage%40arm.com
patch subject: [RFC PATCH 1/2] ACPI: Add support for invoking select _DSM methods from user space
config: loongarch-randconfig-002-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071623.F8uprxKI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071623.F8uprxKI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071623.F8uprxKI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/acpi_genl_dsm.c:28: warning: Function parameter or struct member 'handle' not described in 'acpi_genl_dsm_add_handle'
>> drivers/acpi/acpi_genl_dsm.c:28: warning: Excess function parameter 'dsm_handle' description in 'acpi_genl_dsm_add_handle'


vim +28 drivers/acpi/acpi_genl_dsm.c

    19	
    20	/**
    21	 * acpi_genl_dsm_add_handle - add netlink handle to invoke _DSM via netlink.
    22	 * @dsm_handle: _DSM handle
    23	 *
    24	 * Add handle to a _DSM method that will be invoked when user space calls it
    25	 * via netlink.
    26	 */
    27	int acpi_genl_dsm_add_handle(struct acpi_genl_dsm_handle *handle)
  > 28	{
    29		if (!handle)
    30			return -EINVAL;
    31		u32 id_hash = acpi_genl_dsm_hash_key(handle->id);
    32	
    33		hash_add_rcu(acpi_dsm_tbl, &handle->entry, id_hash);
    34		return 0;
    35	}
    36	EXPORT_SYMBOL(acpi_genl_dsm_add_handle);
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
