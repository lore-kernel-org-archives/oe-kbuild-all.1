Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3DA2F2619
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 07:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827709; cv=none; b=GiyCdQDhPGCh/HSDbXfdh/RLHWaCsIDlu0HuMa345/CkRklqWjjGZm8MPgpDXFTHsaix1eyfZLUnQbWSY3/ZiocgvDtBReyvBXgblTL95LxW3Pser/Ev/G0zHFiboFzCq7qGqvjSK7/KOhZGsi4TyLAasEMvYgGYB7R8D9KLF40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827709; c=relaxed/simple;
	bh=Pzr/QLSmpDmOP6GpJbNhDOuftI8NKlNpSw739GLK3ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrT5LNZGNGvzecT54gUDDNNuUcIfdr5qrAXmRvfEvuujiROiHvUYmcAfQ4Mj+1djSLme34w+FnVBwChLMQkLKgTZ4myhRsWDQs7N6EM5EUwWNdIj+gmUSBy2FHDYjhraYVKzoelCb0o0zCBT89w1+L6UrLhfi5BkOL8kZBx5jjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyu8LgSw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyu8LgSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785827707; x=1817363707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pzr/QLSmpDmOP6GpJbNhDOuftI8NKlNpSw739GLK3ns=;
  b=iyu8LgSwYB7Aecgv12Xsr/gqGPqAp6nO+1OfTsrGf+4ckFDdWORxl3YE
   U8qlVtLb5nFSxgqB27bxgXOsYraJvQGSYSEtAytSGidNp7rSKhZxpApUD
   DqwH4b+TMyIS7j3pJ2diJ3MzXk+euC4AvyMzGHBTZA/xDMgk6xGLRghoB
   0l79vn9dSReSiPgXj0Whg2ILFkr/AHISpytGLL19g91x/SyWWmbmphT9r
   G3qvhv+3kLxcNzZK4h3qtRWmdy+N7vx+DZkyaUj/v0SiAoBih0Se7RFOr
   cossLT31I0nHLQHKRx3+fPqxT+PgVMKF0LzbiyoABlOvevNlkUEuBPpFy
   Q==;
X-CSE-ConnectionGUID: 8FuuXy2SSImkeLvyGzSbBQ==
X-CSE-MsgGUID: Ysp0qxKOStCCWyy5bTxSrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="96962702"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="96962702"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 00:15:06 -0700
X-CSE-ConnectionGUID: WJI81t6kT5+AmWnZa+QLCw==
X-CSE-MsgGUID: /n1Bdo5UTzCKfvXw9OtIQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="266549532"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 04 Aug 2026 00:15:05 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr9Mc-0000000048s-44sK;
	Tue, 04 Aug 2026 07:15:02 +0000
Date: Tue, 4 Aug 2026 09:14:50 +0200
From: kernel test robot <lkp@intel.com>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v4 4/4] platform/x86/amd: dptc: Add device entries for
 handheld PCs
Message-ID: <202608040900.roib4Z0m-lkp@intel.com>
References: <20260309205125.293148-5-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309205125.293148-5-lkml@antheas.dev>

Hi Antheas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 4ae12d8bd9a830799db335ee661d6cbc6597f838]

url:    https://github.com/intel-lab-lkp/linux/commits/Antheas-Kapenekakis/Documentation-firmware-attributes-generalize-save_settings-entry/20260804-074606
base:   4ae12d8bd9a830799db335ee661d6cbc6597f838
patch link:    https://lore.kernel.org/r/20260309205125.293148-5-lkml%40antheas.dev
patch subject: [RFC v4 4/4] platform/x86/amd: dptc: Add device entries for handheld PCs
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260804/202608040900.roib4Z0m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608040900.roib4Z0m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,(Documentation/translations/[
   Using alabaster theme
>> Documentation/ABI/testing/sysfs-class-firmware-attributes:387: WARNING: Inline emphasis start-string without end-string. [docutils]
>> Documentation/ABI/testing/sysfs-class-firmware-attributes:387: WARNING: Inline emphasis start-string without end-string. [docutils]
>> Documentation/ABI/testing/sysfs-class-firmware-attributes:387: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/core-api/kref:328: ./include/linux/kref.h:72: WARNING: Invalid C declaration: Expected end of definition. [error at 96]
   int kref_put_mutex (struct kref *kref, void (*release)(struct kref *kref), struct mutex *mutex) __cond_acquires(true# mutex)
   ------------------------------------------------------------------------------------------------^
   Documentation/core-api/kref:328: ./include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
   int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)


vim +387 Documentation/ABI/testing/sysfs-class-firmware-attributes

318d97849fc2cb Mark Pearson        2023-09-19 @387  What:		/sys/class/firmware-attributes/*/attributes/save_settings
318d97849fc2cb Mark Pearson        2023-09-19  388  Date:		August 2023
318d97849fc2cb Mark Pearson        2023-09-19  389  KernelVersion:	6.6
318d97849fc2cb Mark Pearson        2023-09-19  390  Contact:	Mark Pearson <mpearson-lenovo@squebb.ca>
396504b5f0790b Antheas Kapenekakis 2026-03-09  391  		Antheas Kapenekakis <lkml@antheas.dev>
318d97849fc2cb Mark Pearson        2023-09-19  392  Description:
396504b5f0790b Antheas Kapenekakis 2026-03-09  393  		Controls how writes to current_value are applied to the hardware.
318d97849fc2cb Mark Pearson        2023-09-19  394  
318d97849fc2cb Mark Pearson        2023-09-19  395  		Read the attribute to check what save mode is enabled (single or bulk).
318d97849fc2cb Mark Pearson        2023-09-19  396  		E.g:
396504b5f0790b Antheas Kapenekakis 2026-03-09  397  		# cat /sys/class/firmware-attributes/*/attributes/save_settings
318d97849fc2cb Mark Pearson        2023-09-19  398  		single
318d97849fc2cb Mark Pearson        2023-09-19  399  
318d97849fc2cb Mark Pearson        2023-09-19  400  		Write the attribute with 'bulk' to enable bulk save mode.
396504b5f0790b Antheas Kapenekakis 2026-03-09  401  		Write the attribute with 'single' to enable saving, after every
396504b5f0790b Antheas Kapenekakis 2026-03-09  402  		attribute set. The default setting is single mode.
318d97849fc2cb Mark Pearson        2023-09-19  403  		E.g:
396504b5f0790b Antheas Kapenekakis 2026-03-09  404  		# echo bulk > /sys/class/firmware-attributes/*/attributes/save_settings
318d97849fc2cb Mark Pearson        2023-09-19  405  
396504b5f0790b Antheas Kapenekakis 2026-03-09  406  		When in bulk mode write 'save' to trigger an apply of all
396504b5f0790b Antheas Kapenekakis 2026-03-09  407  		currently staged attributes.
318d97849fc2cb Mark Pearson        2023-09-19  408  		E.g:
396504b5f0790b Antheas Kapenekakis 2026-03-09  409  		# echo save > /sys/class/firmware-attributes/*/attributes/save_settings
396504b5f0790b Antheas Kapenekakis 2026-03-09  410  
396504b5f0790b Antheas Kapenekakis 2026-03-09  411  		Driver-specific notes:
396504b5f0790b Antheas Kapenekakis 2026-03-09  412  
396504b5f0790b Antheas Kapenekakis 2026-03-09  413  		thinklmi (Lenovo): On Lenovo platforms there is a limitation in
396504b5f0790b Antheas Kapenekakis 2026-03-09  414  		the number of times an attribute can be saved. This is an
396504b5f0790b Antheas Kapenekakis 2026-03-09  415  		architectural limitation and it limits the number of attributes
396504b5f0790b Antheas Kapenekakis 2026-03-09  416  		that can be modified to 48.
396504b5f0790b Antheas Kapenekakis 2026-03-09  417  
396504b5f0790b Antheas Kapenekakis 2026-03-09  418  		Once a save has been triggered in bulk mode, attributes can no
396504b5f0790b Antheas Kapenekakis 2026-03-09  419  		longer be set and will return a permissions error. This is to
396504b5f0790b Antheas Kapenekakis 2026-03-09  420  		prevent users hitting the 48+ save limitation (which requires
396504b5f0790b Antheas Kapenekakis 2026-03-09  421  		entering the BIOS to clear the error condition).
396504b5f0790b Antheas Kapenekakis 2026-03-09  422  
396504b5f0790b Antheas Kapenekakis 2026-03-09  423  		amd-dptc (AMD DPTC): No save-count limitation. 'save' can be
396504b5f0790b Antheas Kapenekakis 2026-03-09  424  		called any number of times. Returns -ENOENT if no values have
396504b5f0790b Antheas Kapenekakis 2026-03-09  425  		been staged. In addition, when in 'single' mode, the driver
396504b5f0790b Antheas Kapenekakis 2026-03-09  426  		uses pm ops to trigger a save of staged attributes on resume.
318d97849fc2cb Mark Pearson        2023-09-19  427  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
