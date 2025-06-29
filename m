Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C92D2DF68
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 17:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751217770; cv=none; b=T39BE2yfqASAq/ca75Oiv3xuuUTkWZpUhXrDb+3FSD9NiTKlJuXVg7EK++6MyuXER8p0SFrJK6VhK1PoDcMYPN4R+Rb/TGR0ke5VEYHE+a1M3v/8nlkfZlVwsruWlwIQV0D/uDpNx6gelX1SWjJkObueOHg6sC7q7qSI70o43yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751217770; c=relaxed/simple;
	bh=NnxkeU88rRrI1QUyQdJtW6pBHBHsy68GjuYKE4RqRHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ffyybb2cAmL3hc5ExV7GcaNl6KJdhg7KudRSUX4UIeifLYKaFUaslr+EVjL17kkL1WXRqkUPHpYdyGWuFBSPO85mDBqTWhE21hr06B5Abo83nhtmFlr2tGWp02Ry4rARXmg1sP+KNBCdYG3OsMgP62sQiRcY83AYyWuhJKvfZ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VcnUjrXU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VcnUjrXU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751217768; x=1782753768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NnxkeU88rRrI1QUyQdJtW6pBHBHsy68GjuYKE4RqRHs=;
  b=VcnUjrXUuSXh/cCftu3wBq0LXN+E6zu/hO3ARPjmGrh/y3fjlHAEgVkU
   Z1+hnRrROUyYWAseGRvloi8Wq6gjU5bDVF6LaPq6MFI82zUM5UPcqBTgu
   zeFiDmecDsMHIdEnGkl82agl+T6qsNIKV2+v6MVw2Cdc4EzZodYoUffNy
   lJ0BVn5T/sxs/l12h9YyHNdc8xPtFZjervYY5UVooRKnAmDLTSq9qp05C
   5oKMe/Snww9WprYtwDT+t2n+Q/uEK17oI3ka53zTA/giGNeIur1JIn2oI
   Gtee5C+3Pc3ist1BZ5IF4ssq099hA95jHyxxQx0iczi/+tR1QKxMdlN82
   w==;
X-CSE-ConnectionGUID: 7/mZKZw1TDOLLQf+WOfmvQ==
X-CSE-MsgGUID: VkQaH0fDRoGwwhWZUrb6uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="63702786"
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="63702786"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 10:22:48 -0700
X-CSE-ConnectionGUID: C6TPWl0xSU6sp4fu0AXG2A==
X-CSE-MsgGUID: 1CHSjo6wQLqg+kvctudg4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="157649102"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 29 Jun 2025 10:22:47 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVvjo-0000wp-36;
	Sun, 29 Jun 2025 17:22:44 +0000
Date: Sun, 29 Jun 2025 19:22:20 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, libai <libai12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2411/2411]
 arch/x86/kvm/../../../virt/kvm/eventfd.c:719: warning: cannot understand
 function prototype: 'struct eventfd_shadow '
Message-ID: <202506291906.a435dLWR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: 2dcf53278783921137dbb4eb4628f2c96cac65e2 [2411/2411] eventfd:Introduce the eventfd batch processing interface
config: x86_64-buildonly-randconfig-2001-20250626 (https://download.01.org/0day-ci/archive/20250629/202506291906.a435dLWR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506291906.a435dLWR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506291906.a435dLWR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/eventfd.c:719: warning: cannot understand function prototype: 'struct eventfd_shadow '
>> arch/x86/kvm/../../../virt/kvm/eventfd.c:1102: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * If an exception occurs,
   arch/x86/kvm/../../../virt/kvm/eventfd.c:1131: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * If the temporarily stored eventfd cannot be successfully updated
   arch/x86/kvm/../../../virt/kvm/eventfd.c:1176: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copy the current buses,

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
   Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]


vim +719 arch/x86/kvm/../../../virt/kvm/eventfd.c

   713	
   714	/**
   715	 * eventfd_shadow
   716	 * Save the eventfd pointer and operation.
   717	 * To protect Kabi, these members are placed here
   718	 */
 > 719	struct eventfd_shadow {
   720		struct list_head node;
   721		struct _ioeventfd *eventfd;
   722		/* Indicate the operations required for this eventfd */
   723		u8 flag;
   724	};
   725	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
