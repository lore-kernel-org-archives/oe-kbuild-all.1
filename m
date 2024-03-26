Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8243713D246
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 19:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711482003; cv=none; b=ut1i2Q02hTQRafXLHrc++f+k+58TMLM1A8IouJS/F1R2b8jWn1bP37e8zvJOKSx17ODd7D+LxY1QxCYIW2fQgCf+3XmKvKpBv2JALu810T2dI6O+2Frv554JOXTvHz0+GTyJlgQpDnll7bG/g9MMaS2LrjhHLgsMh2wTfF+4o4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711482003; c=relaxed/simple;
	bh=v4rTpT3HHLdMRS2/nzYTBau2SMtDsN/x9Jp+658VOoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tVG9Lw/Wu88K5PhjFGJWILUvQHAO0pacqefSmqenCUYfHlrH5+iqMFbOoy85CEqy2YUlP0yilUUSSdXIF6fUensNEn3AadGUGYhsgQ9nrjfR7MB3rYSQTjxMzkrTficP+LHmYh8QtuWgcg8GKJR2k42UKV5PPtiJQzBrFKUHCjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cH1cHJoQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cH1cHJoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711482001; x=1743018001;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=v4rTpT3HHLdMRS2/nzYTBau2SMtDsN/x9Jp+658VOoE=;
  b=cH1cHJoQ90F1D4p4qai8OUwv8Be2MnwTA0hOExSZm5M5h2LhUPGetgWW
   biaQF2unxlEfAMhpErF8JHwpFCki1+Tea8rgTBV77eBDDNCKHhSumjQDA
   OVuA7Kf/UiLztlWFeauC5QBf+CfgPW9vyD4VLlycj1ghBy4hv5Ok8Vute
   WYIXT1yEbOs+HLWVnydHQqPtT8PbjNAwacIoRDzcuEk+a4qqc+66zx6wE
   aaabKUE9fcXpQklxYiyDnksfuk5v3BFPhOCUlN8/nXIq7gfkVAWV1OKSI
   M2EKiJxZNdcDjZthq/IvsXP10i4Sa4CyJi3Mr6Uu/vm4rzuDxHSFuabUZ
   g==;
X-CSE-ConnectionGUID: QmipCeJBRSSDhoiH0sKPeA==
X-CSE-MsgGUID: QDTVobnETjCuNM4qDleIhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="10355790"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="10355790"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 12:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="16155657"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Mar 2024 12:39:58 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpCeK-0000ME-1D;
	Tue, 26 Mar 2024 19:39:56 +0000
Date: Wed, 27 Mar 2024 03:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:debugfs_cleanup 6/7]
 drivers/platform/x86/amd/hsmp.c:697:1: warning: control reaches end of
 non-void function
Message-ID: <202403270318.BXcbiibe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git debugfs_cleanup
head:   766db77dfd694e14cfdc4728e9c2f6d747dfdf84
commit: 3baa931df8381661c94796a782d473e44391c0dc [6/7] platform/x86/amd/hsmp: switch to use device_add_groups()
config: x86_64-randconfig-005-20240326 (https://download.01.org/0day-ci/archive/20240327/202403270318.BXcbiibe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403270318.BXcbiibe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403270318.BXcbiibe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/amd/hsmp.c: In function 'hsmp_create_non_acpi_sysfs_if':
   drivers/platform/x86/amd/hsmp.c:696:42: error: 'struct hsmp_plat_device' has no member named 'dev'
     696 |         return device_add_groups(plat_dev.dev, hsmp_attr_grps);
         |                                          ^
>> drivers/platform/x86/amd/hsmp.c:697:1: warning: control reaches end of non-void function [-Wreturn-type]
     697 | }
         | ^


vim +697 drivers/platform/x86/amd/hsmp.c

ca511e7631e76e0 Suma Hegde         2024-01-06  668  
ba8dcff0e9c4f8f Suma Hegde         2024-01-06  669  static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
ca511e7631e76e0 Suma Hegde         2024-01-06  670  {
ca511e7631e76e0 Suma Hegde         2024-01-06  671  	const struct attribute_group **hsmp_attr_grps;
5150542b8ec5fb5 Suma Hegde         2023-10-10  672  	struct attribute_group *attr_grp;
5150542b8ec5fb5 Suma Hegde         2023-10-10  673  	u16 i;
5150542b8ec5fb5 Suma Hegde         2023-10-10  674  
2b703fbe4e3d435 Suma Hegde         2024-01-25  675  	hsmp_attr_grps = devm_kcalloc(dev, plat_dev.num_sockets + 1,
2b703fbe4e3d435 Suma Hegde         2024-01-25  676  				      sizeof(*hsmp_attr_grps),
2b703fbe4e3d435 Suma Hegde         2024-01-25  677  				      GFP_KERNEL);
5150542b8ec5fb5 Suma Hegde         2023-10-10  678  	if (!hsmp_attr_grps)
5150542b8ec5fb5 Suma Hegde         2023-10-10  679  		return -ENOMEM;
5150542b8ec5fb5 Suma Hegde         2023-10-10  680  
5150542b8ec5fb5 Suma Hegde         2023-10-10  681  	/* Create a sysfs directory for each socket */
5150542b8ec5fb5 Suma Hegde         2023-10-10  682  	for (i = 0; i < plat_dev.num_sockets; i++) {
ca511e7631e76e0 Suma Hegde         2024-01-06  683  		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
ce08d3570ae0ef3 Suma Hegde         2024-01-06  684  					GFP_KERNEL);
5150542b8ec5fb5 Suma Hegde         2023-10-10  685  		if (!attr_grp)
5150542b8ec5fb5 Suma Hegde         2023-10-10  686  			return -ENOMEM;
5150542b8ec5fb5 Suma Hegde         2023-10-10  687  
5150542b8ec5fb5 Suma Hegde         2023-10-10  688  		snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
5150542b8ec5fb5 Suma Hegde         2023-10-10  689  		attr_grp->name			= plat_dev.sock[i].name;
5150542b8ec5fb5 Suma Hegde         2023-10-10  690  		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
5150542b8ec5fb5 Suma Hegde         2023-10-10  691  		hsmp_attr_grps[i]		= attr_grp;
5150542b8ec5fb5 Suma Hegde         2023-10-10  692  
ca511e7631e76e0 Suma Hegde         2024-01-06  693  		hsmp_create_attr_list(attr_grp, dev, i);
5150542b8ec5fb5 Suma Hegde         2023-10-10  694  	}
ca511e7631e76e0 Suma Hegde         2024-01-06  695  
3baa931df838166 Greg Kroah-Hartman 2024-01-28  696  	return device_add_groups(plat_dev.dev, hsmp_attr_grps);
5150542b8ec5fb5 Suma Hegde         2023-10-10 @697  }
5150542b8ec5fb5 Suma Hegde         2023-10-10  698  

:::::: The code at line 697 was first introduced by commit
:::::: 5150542b8ec5fb561be080ed0ef3bab8598154c3 platform/x86/amd/hsmp: add support for metrics tbl

:::::: TO: Suma Hegde <suma.hegde@amd.com>
:::::: CC: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
