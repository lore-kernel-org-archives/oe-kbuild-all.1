Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5810613A41F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jun 2025 18:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749236247; cv=none; b=ac0W8yF4YE1WV4R3bCqb9rAS91JrMxEKg3zLqAjeyOl4oHkevzcw0roy6aeMsKxQijK+24RvlrAAECbvtBeuGCG33T2sDMmblaxZQBPqnA6JzTx9GF7NZE3teWrb0VOquTQ17XzaIbVY/Ev9spBHXvx6+Hsa8sAmvq6O5SvhkGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749236247; c=relaxed/simple;
	bh=b5AmpCo1kMui/WXfal3d4wLBANr1weUX6ZU1bk956tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMx9gnlQ66jsWBbHVVgusqRsfcbrHy9ZBrf1akkH11OpaYSvWsrnwclQEeqmP2pM2YMAFxFchlgNd76jv3ddFn81oLGILe3FOR+/O3dXnmsHvETUnD9OpFjF/qdYwsvTJu44NWGKbA3es+9oJxSXETF/0bzCL60UiEwb59OB5n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9hOu9F8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9hOu9F8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749236245; x=1780772245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b5AmpCo1kMui/WXfal3d4wLBANr1weUX6ZU1bk956tk=;
  b=H9hOu9F8vwoG9l6XLCzivVrFrZ7Q02oiuT595/1oVmPfHP/oQQsNIDHl
   wIdp/idpu+4tF9t/DnZZMLq6KWau9tPEvenVsxw/ZJ8R9TOBSziB1WEsj
   JL7KM7qvPrMasiibm+sgN60P/HVFwS40g+6xpJZxPEVLHiAI9aMOxKSKp
   bh4MJdzANANoSSyFC5DVjUdDAkwP65y/6tTKWorBVzrm2DRmsOUgEZRoG
   yZsFVuQg7AvNdxtUMShx6eKMjoFe3SFLAsKGrZyO+5mW7mnoqb9fpSLgU
   Hr/W2vcYoJTxmb5BmMhuXnHcTGuFDFv3VT5+ACxW18gkXTkla0Nh8w0h0
   g==;
X-CSE-ConnectionGUID: EqbNuJePRkGqQohR773YSw==
X-CSE-MsgGUID: 4WO8o9cXRH608WCn/ix62g==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="62053471"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="62053471"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 11:57:25 -0700
X-CSE-ConnectionGUID: /W+N2OtEQr2YuJrYP4Vf9g==
X-CSE-MsgGUID: 7zWk+uBlTPm38LVnfrr8Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="176850699"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 11:57:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uNcFh-00000004HrB-1PO2;
	Fri, 06 Jun 2025 21:57:17 +0300
Date: Fri, 6 Jun 2025 21:57:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, ikepanhc@gmail.com,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Armin Wolf <W_Armin@gmx.de>, linux-doc@vger.kernel.org,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: Move Lenovo files into lenovo subdir
Message-ID: <aEM6Da6CZ0DI3x8w@smile.fi.intel.com>
References: <20250604173702.3025074-1-mpearson-lenovo@squebb.ca>
 <202506062319.F0IpDxF6-lkp@intel.com>
 <6d17454f-faac-4616-ac2e-7da80feedf2c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d17454f-faac-4616-ac2e-7da80feedf2c@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jun 06, 2025 at 01:30:25PM -0400, Mark Pearson wrote:
> On Fri, Jun 6, 2025, at 11:58 AM, kernel test robot wrote:
> > Hi Mark,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on linus/master]
> > [also build test WARNING on next-20250606]
> > [cannot apply to v6.15]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    
> > https://github.com/intel-lab-lkp/linux/commits/Mark-Pearson/platform-x86-Move-Lenovo-files-into-lenovo-subdir/20250605-013934
> > base:   linus/master
> > patch link:    
> > https://lore.kernel.org/r/20250604173702.3025074-1-mpearson-lenovo%40squebb.ca
> > patch subject: [PATCH v2] platform/x86: Move Lenovo files into lenovo 
> > subdir
> > config: x86_64-randconfig-078-20250606 
> > (https://download.01.org/0day-ci/archive/20250606/202506062319.F0IpDxF6-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): 
> > (https://download.01.org/0day-ci/archive/20250606/202506062319.F0IpDxF6-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new 
> > version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: 
> > https://lore.kernel.org/oe-kbuild-all/202506062319.F0IpDxF6-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    drivers/platform/x86/lenovo/think-lmi.c: In function 'certificate_store':
> >>> drivers/platform/x86/lenovo/think-lmi.c:661:47: warning: '%s' directive argument is null [-Wformat-overflow=]
> >      661 |                 return kasprintf(GFP_KERNEL, "%s,%s", arg1, 
> > arg2);
> >          |                                               ^~
> >    drivers/platform/x86/lenovo/think-lmi.c:657:50: warning: '%s' 
> > directive argument is null [-Wformat-overflow=]
> >      657 |                 return kasprintf(GFP_KERNEL, "%s,%s,%s",
> >          |                                                  ^~
> >
> >
> > vim +661 drivers/platform/x86/lenovo/think-lmi.c
> >
> > 640a5fa50a42b9 drivers/platform/x86/think-lmi.c Mark Pearson 2021-11-17 
> >  652  
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  653  static char *cert_command(struct tlmi_pwd_setting *setting, const 
> > char *arg1, const char *arg2)
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  654  {
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  655  	/* Prepend with SVC or SMC if multicert supported */
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  656  	if (tlmi_priv.pwdcfg.core.password_mode >= 
> > TLMI_PWDCFG_MODE_MULTICERT)
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  657  		return kasprintf(GFP_KERNEL, "%s,%s,%s",
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  658  				 setting == tlmi_priv.pwd_admin ? "SVC" : "SMC",
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  659  				 arg1, arg2);
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  660  	else
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> > @661  		return kasprintf(GFP_KERNEL, "%s,%s", arg1, arg2);
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  662  }
> > 5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 
> >  663  
> >
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> I'm unable to reproduce this issue with a W=1 build

Do you have GCC-12?

> and I think it's a false positive.

I think the problematic line is in certificate_store().
You need to check the value of dmi_get_system_info().
Or make sure the DMI is always selected (depend on DMI
in Kconfig, perhaps).

> Am I safe to ignore this report?

Please, try to fix it.

-- 
With Best Regards,
Andy Shevchenko


