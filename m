Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5415787B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715955226; cv=none; b=UL+lQIJOAr5UIuXJqYClkq203i6+E00uL/RPE7y8opXy+KdmIeTJ0cVLDoXw5edIVLf47PIWJxu8bWL7oxycbQoB3lR3vN4gSH186oYyTPKV4noPJx98pF908aV1aHmpBEnT4+PzOCan5RhUHlnT0AyUCqcksc5mMUHInZ9y8u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715955226; c=relaxed/simple;
	bh=DQpWC2IeMalxOvmc8DcBazCzMeN6u+Ea+Nf2FS3BaYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mopS4Q/8ZWJCY6D21Z2p6McvqKVGNWCqGoY3cP+NrJohMNxKqcgTrUbl4la9Au4mdSpBsXZXfabOF6sRs1o/TkN1JHlk1MFizwG4TTw+DSQzyQNaxsZfsk5Q3koD4v5Z6VOytdZp8j1xop1Jk9uUbgSgAJO3AAlBK0DowUvBNe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOCjD2Si; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOCjD2Si"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715955225; x=1747491225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DQpWC2IeMalxOvmc8DcBazCzMeN6u+Ea+Nf2FS3BaYQ=;
  b=GOCjD2SiAi0njO1PTqV+zt8ZEdEapAnvrN6du9ROZxQ7eUTwWlvemYlT
   sWCrVw2IcEugcxZtLgqa9GgIHWHlFf9H9ivZV3DCk6HeEM4SceYf0jzxM
   SwXZqmmjBVpEKb0Mckj6CEgJV15Mkwa7ac+L3BTLS/mGut0/d1NR2HnqG
   /KHQe0DYGOsduWRK87Xatk1ERlvYxu68XP1F74y9+6i07GwNNj+XTZPSR
   jCubHpUT30QFN/+ptAQdFFTNzx1kR6sXucLsXf/1nXamFxPPpyfI9N2ta
   UUbUcqgm1XOwSnQtR3HnrXbFc8trFUh+sdpJHeQ1b7ANns15zuM5jt6fS
   Q==;
X-CSE-ConnectionGUID: ZG+KeKZcSVi9KnhFjcB0aQ==
X-CSE-MsgGUID: IUYA/YdFSrKMkkgXD5m0LQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="22739800"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="22739800"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 07:13:44 -0700
X-CSE-ConnectionGUID: glm6UUbOQqe4Wv71E1xWUA==
X-CSE-MsgGUID: KZkt4ZVWQy+kpA6aFQz1fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="36222604"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 May 2024 07:13:43 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7yL6-0000mC-2n;
	Fri, 17 May 2024 14:13:40 +0000
Date: Fri, 17 May 2024 22:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC KERNEL PATCH v7 1/2] xen/pvh: Setup gsi for passthrough
 device
Message-ID: <202405172132.TazuVpPo-lkp@intel.com>
References: <20240515065011.13797-2-Jiqian.Chen@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515065011.13797-2-Jiqian.Chen@amd.com>

Hi Jiqian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on xen-tip/linux-next]
[also build test ERROR on pci/next pci/for-linus rafael-pm/linux-next rafael-pm/bleeding-edge tip/x86/core linus/master v6.9 next-20240516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiqian-Chen/xen-pvh-Setup-gsi-for-passthrough-device/20240515-145322
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/20240515065011.13797-2-Jiqian.Chen%40amd.com
patch subject: [RFC KERNEL PATCH v7 1/2] xen/pvh: Setup gsi for passthrough device
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240517/202405172132.TazuVpPo-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405172132.TazuVpPo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405172132.TazuVpPo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/xen/enlighten_pvh.c:31:5: error: redefinition of 'xen_pvh_setup_gsi'
      31 | int xen_pvh_setup_gsi(int gsi, int trigger, int polarity)
         |     ^~~~~~~~~~~~~~~~~
   In file included from arch/x86/xen/enlighten_pvh.c:7:
   include/xen/acpi.h:76:19: note: previous definition of 'xen_pvh_setup_gsi' with type 'int(int,  int,  int)'
      76 | static inline int xen_pvh_setup_gsi(int gsi, int trigger, int polarity)
         |                   ^~~~~~~~~~~~~~~~~


vim +/xen_pvh_setup_gsi +31 arch/x86/xen/enlighten_pvh.c

    30	
  > 31	int xen_pvh_setup_gsi(int gsi, int trigger, int polarity)
    32	{
    33		int ret;
    34		struct physdev_setup_gsi setup_gsi;
    35	
    36		setup_gsi.gsi = gsi;
    37		setup_gsi.triggering = (trigger == ACPI_EDGE_SENSITIVE ? 0 : 1);
    38		setup_gsi.polarity = (polarity == ACPI_ACTIVE_HIGH ? 0 : 1);
    39	
    40		ret = HYPERVISOR_physdev_op(PHYSDEVOP_setup_gsi, &setup_gsi);
    41		if (ret == -EEXIST) {
    42			xen_raw_printk("Already setup the GSI :%d\n", gsi);
    43			ret = 0;
    44		} else if (ret)
    45			xen_raw_printk("Fail to setup GSI (%d)!\n", gsi);
    46	
    47		return ret;
    48	}
    49	EXPORT_SYMBOL_GPL(xen_pvh_setup_gsi);
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
