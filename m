Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF7133F9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 01:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726535864; cv=none; b=D5vwOAj7zDiy26j5J7Y17rB/dIVi26+ga+Empm+yrILoCfTTe6LsVTEru4qUD5ZqCNHjjVm9lYgO3AfKrqwFxtxsz3y0HRU9rzZGP4E7fQUgjKTizGeMr5Y/8pxiVjZk1bq5XGCY+YaUjjrTCuQdcdzOzUXmMwXG9PVvtpbXS/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726535864; c=relaxed/simple;
	bh=qECJz4/GGAtlMec09uQhIJ/tLcf4rbynZLPOMuqVn9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rshf8emiRMTYCe8OExZ3BymYsZH6FjCPAExd35VG3MW8RiLa4FgoNKrF3mfad5tBRgshD9JYxmpA+YcpryRzwwUsuHJEPng/44AV1ANdTJlJ6FbxeNyQHHi+BoYCaVttoKfO4Alj1AUZf4yRA7MrbJz2mnZDubo0LhaPxJweN6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rk1Zg3JD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rk1Zg3JD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726535861; x=1758071861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qECJz4/GGAtlMec09uQhIJ/tLcf4rbynZLPOMuqVn9A=;
  b=Rk1Zg3JDIMC1rx/b915WDsI/8qRlVHfFsYHlzayE/S9SlYVGJj8TqgUm
   7i4tPjPZii4C6GQcP2MkkkKpBEZjP8OTAxyxdYA2SHQh66cnsNuHm6qqm
   VE8qF2PN+seGIKx+xCRxni2Q0DbLX11UqThi24mOuBR2PtzYmENjbgKKf
   MHjs89wGmfFeQmtzKN/NAXPDh5o07IvchffU5v/kA9SqxN+XHn7LeAtB2
   VqPKKww0kVl+tIDfbvUr60pQsMArWH2Zk2AK4fMwmjR3djkXiKZgVtRpp
   JSHuRMyXN8SzhnuvguQjRC2BxOvrvtQn9wRwBGoGr9vvhSK7Cts3Cw6Xm
   Q==;
X-CSE-ConnectionGUID: /osSUmEvTS+3l/2mi1/DPQ==
X-CSE-MsgGUID: UNAJDKnFRmGmf5n6RGbNEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25263170"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="25263170"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 18:17:41 -0700
X-CSE-ConnectionGUID: 2W4/uVpVQ+izo/8b+85psw==
X-CSE-MsgGUID: 4s6HyZwBSi+rRv+dwoQHYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="73790927"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Sep 2024 18:17:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqMqY-000Ag6-04;
	Tue, 17 Sep 2024 01:17:38 +0000
Date: Tue, 17 Sep 2024 09:17:31 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent FERT <laurent.fert@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 1357/30000]
 drivers/hwtracing/intel_th/gth.c:678 intel_th_gth_probe() warn: inconsistent
 indenting
Message-ID: <202409170955.akP5c3WX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: eb0a4b303e3ef7ad0d08bc96bce5168c80d27f2b [1357/30000] Do not reset trace hub on probe
config: x86_64-randconfig-161-20240914 (https://download.01.org/0day-ci/archive/20240917/202409170955.akP5c3WX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409170955.akP5c3WX-lkp@intel.com/

New smatch warnings:
drivers/hwtracing/intel_th/gth.c:678 intel_th_gth_probe() warn: inconsistent indenting

Old smatch warnings:
drivers/hwtracing/intel_th/gth.c:215 master_attr_store() warn: potential spectre issue 'gth->output' [w] (local cap)

vim +678 drivers/hwtracing/intel_th/gth.c

   640	
   641	static int intel_th_gth_probe(struct intel_th_device *thdev)
   642	{
   643		struct device *dev = &thdev->dev;
   644		struct intel_th *th = dev_get_drvdata(dev->parent);
   645		struct gth_device *gth;
   646		struct resource *res;
   647		void __iomem *base;
   648		int i, ret;
   649		u32 scratchpad;
   650	
   651		res = intel_th_device_get_resource(thdev, IORESOURCE_MEM, 0);
   652		if (!res)
   653			return -ENODEV;
   654	
   655		base = devm_ioremap(dev, res->start, resource_size(res));
   656		if (!base)
   657			return -ENOMEM;
   658	
   659		gth = devm_kzalloc(dev, sizeof(*gth), GFP_KERNEL);
   660		if (!gth)
   661			return -ENOMEM;
   662	
   663		gth->dev = dev;
   664		gth->base = base;
   665		spin_lock_init(&gth->gth_lock);
   666	
   667	       dev_set_drvdata(dev, gth);
   668	
   669	       /*
   670	        * Host mode can be signalled via SW means or via SCRPD_DEBUGGER_IN_USE
   671	        * bit. Either way, don't reset HW in this case, and don't export any
   672	        * capture configuration attributes. Also, refuse to assign output
   673	        * drivers to ports, see intel_th_gth_assign().
   674	        */
   675	       if (thdev->host_mode)
   676	               return 0;
   677	
 > 678		scratchpad = ioread32(gth->base + REG_GTH_SCRPD0);
   679		if (scratchpad & SCRPD_DEBUGGER_IN_USE)
   680			return -EBUSY;
   681	
   682		for (i = 0; i < TH_CONFIGURABLE_MASTERS + 1; i++)
   683			gth->master[i] = gth_master_get(gth, i);
   684	
   685		for (i = 0; i < TH_POSSIBLE_OUTPUTS; i++) {
   686			gth->output[i].gth = gth;
   687			gth->output[i].index = i;
   688			gth->output[i].port_type =
   689				gth_output_parm_get(gth, i, TH_OUTPUT_PARM(port));
   690			if (gth->output[i].port_type == GTH_NONE)
   691				continue;
   692	
   693			ret = intel_th_output_enable(th, gth->output[i].port_type);
   694			/* -ENODEV is ok, we just won't have that device enumerated */
   695			if (ret && ret != -ENODEV)
   696				return ret;
   697		}
   698	
   699		if (intel_th_output_attributes(gth) ||
   700		    intel_th_master_attributes(gth)) {
   701			pr_warn("Can't initialize sysfs attributes\n");
   702	
   703			if (gth->output_group.attrs)
   704				sysfs_remove_group(&gth->dev->kobj, &gth->output_group);
   705			return -ENOMEM;
   706		}
   707	
   708		return 0;
   709	}
   710	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
