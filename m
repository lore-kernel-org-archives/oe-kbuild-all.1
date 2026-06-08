Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1D13DD877
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jun 2026 19:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780948151; cv=none; b=h0GW3hNUx0GKNe5sT0Cka5zg/DfKtMtM7kaacZh54JP8jhXX8JlA/05JzQQWzWXqQV4fndg09x8Rv0/ngQaj7P/WNKG0I16XbT2KOtHZHsuhI3m9aNEwugCH/x7KXeCDGjFYegR/RxaFv6BBd7t3/Pjp4nC9Y0pJV+3XzuIeQ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780948151; c=relaxed/simple;
	bh=cLjXBQlG2tT1InHlIXc/N4kTn3WdSiHN99HVZXCFngs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qchE/E9GRihHLo+XgWWrgMSms9N1nQar56YCYrw0qCtiJMKJ1bvWJxrBopc+iVQkDq4Gqtr/WMyCHh6CxEwFkaFsCwEFY8zsHAoneBtFkR6R4KqdYP5ejCS8gDGRoEmaArHASjPa+sVBBC7jDAGVBGoH9wjW1d12BfmHxG4V224=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahY7gkw/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahY7gkw/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780948150; x=1812484150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cLjXBQlG2tT1InHlIXc/N4kTn3WdSiHN99HVZXCFngs=;
  b=ahY7gkw/jhK4WiYAV07v+FxjnJrxYP1l0zLArryHG1UkZoVah8oA/9C3
   zxpbS1zeCkn+/AReih8wZIzf+3AvxmXRD2eya1VGcOdgBipyhDlcUya9t
   paGOEkAiC95xzrr5cw0NwWU4kATxdT75+bdRsGIcGiDPfZtOjXVPF3Wmt
   di1tgez6pis4Fbe6OpBJ62CddmVxlxRZm8RlSE1Km72TWp1xTv4H5Mkev
   tHOKIIjXtTtEItGbyc+rgSCLBldnqxSqvTEpFAOoNaOyDC+Q+gZ+/RIwe
   kY8iwIlhUVDtDTstCVHDDvqX7LpNwsJ4vFmDsedLRYD5Lhy4wIeOf6CD/
   A==;
X-CSE-ConnectionGUID: wkYzL5tSRXC4LjrPG7Rm0g==
X-CSE-MsgGUID: jeAsgHLVTY+sOvs9s9cLbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81444114"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="81444114"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 12:49:09 -0700
X-CSE-ConnectionGUID: xlWtpJ9vQkqMk3y4uIrmSg==
X-CSE-MsgGUID: 1NK8XJS7QweFfMfxrDawPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="250745244"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jun 2026 12:49:05 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWfy3-000000003J7-1PfR;
	Mon, 08 Jun 2026 19:49:03 +0000
Date: Mon, 8 Jun 2026 21:48:44 +0200
From: kernel test robot <lkp@intel.com>
To: david.laight.linux@gmail.com, Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH next] drivers/scsi/mpt3sas: Replace strcpy() + strcat()
 with snprintf()
Message-ID: <202606082107.T3scOqQb-lkp@intel.com>
References: <20260608095523.2606-35-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608095523.2606-35-david.laight.linux@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260605]

url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/drivers-scsi-mpt3sas-Replace-strcpy-strcat-with-snprintf/20260608-182042
base:   next-20260605
patch link:    https://lore.kernel.org/r/20260608095523.2606-35-david.laight.linux%40gmail.com
patch subject: [PATCH next] drivers/scsi/mpt3sas: Replace strcpy() + strcat() with snprintf()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260608/202606082107.T3scOqQb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260608/202606082107.T3scOqQb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606082107.T3scOqQb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/mpt3sas/mpt3sas_ctl.c: In function '_ctl_getiocinfo':
>> drivers/scsi/mpt3sas/mpt3sas_ctl.c:1262:73: warning: '%s' directive output may be truncated writing up to 12 bytes into a region of size between 8 and 31 [-Wformat-truncation=]
    1262 |         snprintf(karg.driver_version, sizeof (karg.driver_version), "%s-%s",
         |                                                                         ^~
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:1262:9: note: 'snprintf' output between 2 and 37 bytes into a destination of size 32
    1262 |         snprintf(karg.driver_version, sizeof (karg.driver_version), "%s-%s",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1263 |                  ioc->driver_name, ver);
         |                  ~~~~~~~~~~~~~~~~~~~~~~


vim +1262 drivers/scsi/mpt3sas/mpt3sas_ctl.c

  1218	
  1219	/**
  1220	 * _ctl_getiocinfo - main handler for MPT3IOCINFO opcode
  1221	 * @ioc: per adapter object
  1222	 * @arg: user space buffer containing ioctl content
  1223	 */
  1224	static long
  1225	_ctl_getiocinfo(struct MPT3SAS_ADAPTER *ioc, void __user *arg)
  1226	{
  1227		struct mpt3_ioctl_iocinfo karg;
  1228		const char *ver = "";
  1229	
  1230		dctlprintk(ioc, ioc_info(ioc, "%s: enter\n",
  1231					 __func__));
  1232	
  1233		memset(&karg, 0 , sizeof(karg));
  1234		if (ioc->pfacts)
  1235			karg.port_number = ioc->pfacts[0].PortNumber;
  1236		karg.hw_rev = ioc->pdev->revision;
  1237		karg.pci_id = ioc->pdev->device;
  1238		karg.subsystem_device = ioc->pdev->subsystem_device;
  1239		karg.subsystem_vendor = ioc->pdev->subsystem_vendor;
  1240		karg.pci_information.u.bits.bus = ioc->pdev->bus->number;
  1241		karg.pci_information.u.bits.device = PCI_SLOT(ioc->pdev->devfn);
  1242		karg.pci_information.u.bits.function = PCI_FUNC(ioc->pdev->devfn);
  1243		karg.pci_information.segment_id = pci_domain_nr(ioc->pdev->bus);
  1244		karg.firmware_version = ioc->facts.FWVersion.Word;
  1245		switch  (ioc->hba_mpi_version_belonged) {
  1246		case MPI2_VERSION:
  1247			if (ioc->is_warpdrive)
  1248				karg.adapter_type = MPT2_IOCTL_INTERFACE_SAS2_SSS6200;
  1249			else
  1250				karg.adapter_type = MPT2_IOCTL_INTERFACE_SAS2;
  1251			ver = MPT2SAS_DRIVER_VERSION;
  1252			break;
  1253		case MPI25_VERSION:
  1254		case MPI26_VERSION:
  1255			if (ioc->is_gen35_ioc)
  1256				karg.adapter_type = MPT3_IOCTL_INTERFACE_SAS35;
  1257			else
  1258				karg.adapter_type = MPT3_IOCTL_INTERFACE_SAS3;
  1259			ver = MPT3SAS_DRIVER_VERSION;
  1260			break;
  1261		}
> 1262		snprintf(karg.driver_version, sizeof (karg.driver_version), "%s-%s",
  1263			 ioc->driver_name, ver);
  1264		karg.bios_version = le32_to_cpu(ioc->bios_pg3.BiosVersion);
  1265	
  1266		karg.driver_capability |= MPT3_IOCTL_IOCINFO_DRIVER_CAP_MCTP_PASSTHRU;
  1267	
  1268		if (copy_to_user(arg, &karg, sizeof(karg))) {
  1269			pr_err("failure at %s:%d/%s()!\n",
  1270			    __FILE__, __LINE__, __func__);
  1271			return -EFAULT;
  1272		}
  1273		return 0;
  1274	}
  1275	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
