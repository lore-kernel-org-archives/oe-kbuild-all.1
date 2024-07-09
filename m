Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4007813C3C9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 12:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720527227; cv=none; b=sgbM5aRnwblN/Hk/fdK7A1v4kgC1MEBSN+pgCOofcGObOI35/RPkf25hl7ji+VKgPXihuU5WSvqTNlkQ8hNIiYRLJ6Ud/0TxY1aMu78jigxlVXqSTrJnUYYK9ItRw4hEEFYrQT2x9JLegr1uIwrBq6Gxd7MM6RGfPlo1RySZJ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720527227; c=relaxed/simple;
	bh=W0MDbF69knOeUSEExkB4W+3B5R24XIV+PmDNMfvdxos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YYr7dep+pjB/lf4lbPf6xDnB/wd6LeHVY9xPGRdDkimOzGAmaMqXT7Ysfw6HS3K1XsfrQhxxdmRhapU95pcnEK7GTWeMdELvjGmq90OcbEnkdwIYIoC0GOjyeSv3eMj19CZNANYDPDHz7LMFOkWnTy+Ed53QwSeBitvuugZMtNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDuEY4QT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDuEY4QT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720527225; x=1752063225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W0MDbF69knOeUSEExkB4W+3B5R24XIV+PmDNMfvdxos=;
  b=IDuEY4QTg5z7AiRD0hYO8PqD3woWGbPqFMP7rrbT/NCW9cJnIegxRhgg
   0fNMd3VkuTvqRLm/bIcIn6pP+CRIPdT28acp0ijN/r6VOUTtuWuckMo4X
   MB8mpELCryM2OKVJlxgsDjzJcj1Eb6vlpdijM67lkJY1IvZoEcIvhHu11
   C4qgRLJOFHDJOhQb6ZqencWFODvZan7kLNv7jsCSD4cjRX0hhT61DI+jd
   mMnMhGDA/WwYEqWsf6Sj611Qwwdv6sEUEdlq7u9Z0FGpjSJ6puqtxuwiA
   3gF7qqkYpo4YrQsUq9h1/EfHKWJxoM5Bj6YgUFXwyh5ru/OUCgwv1ci6q
   w==;
X-CSE-ConnectionGUID: Srl40+ytQYSj4AYWr0bCAw==
X-CSE-MsgGUID: 7ciOtyHARwCw1Eo+HBdOSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17482481"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="17482481"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 05:13:27 -0700
X-CSE-ConnectionGUID: aThWKNI9SXOvBwiA/rAMQA==
X-CSE-MsgGUID: L5HrLhKqT+qE6j08vacH7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="48497569"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jul 2024 05:13:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR9il-000WeE-24;
	Tue, 09 Jul 2024 12:13:23 +0000
Date: Tue, 9 Jul 2024 20:12:24 +0800
From: kernel test robot <lkp@intel.com>
To: Alexis Belmonte <alexbelm48@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [pdx86-platform-drivers-x86:for-next 54/54]
 drivers/platform/x86/hp/hp-wmi.c:271:1: sparse: sparse: symbol
 'active_platform_profile_lock' was not declared. Should it be static?
Message-ID: <202407092008.5HtUNn1c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git for-next
head:   2282159b33580076235384597df1d62a6a1037ee
commit: 2282159b33580076235384597df1d62a6a1037ee [54/54] platform/x86: hp-wmi: Fix platform profile option switch bug on Omen and Victus laptops
config: i386-randconfig-r122-20240709 (https://download.01.org/0day-ci/archive/20240709/202407092008.5HtUNn1c-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407092008.5HtUNn1c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407092008.5HtUNn1c-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/hp/hp-wmi.c:271:1: sparse: sparse: symbol 'active_platform_profile_lock' was not declared. Should it be static?

vim +/active_platform_profile_lock +271 drivers/platform/x86/hp/hp-wmi.c

   266	
   267	/*
   268	 * Mutex for the active_platform_profile variable,
   269	 * see omen_powersource_event.
   270	 */
 > 271	DEFINE_MUTEX(active_platform_profile_lock);
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
