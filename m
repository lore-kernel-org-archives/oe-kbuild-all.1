Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1A4360
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 01:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731892957; cv=none; b=UOeKELCwC9adMt8iS1I4o/wbwfA1iiBr/R2rUIfU7J9cABieS9vh8a998KTMVqZPQbpCu6d3RAI9nNP5hYcQjuyldcBMD5rhYhKbbDLLd5UkI9RfWQrVWjKCrv7Cjh6rrOrPOU8gr9EnDCqpH0bjwQnNxzPedbMD3EMQYCS4NTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731892957; c=relaxed/simple;
	bh=i8RL5eTHhRFkJR+d5GpVOOvnLAluQOBYL9clTq0zXGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nLHYYWlUVpFiF7km4uUJ6XHsEzwRwsuGqIe6bL6J93SLRACVgOun992Pjl/hYP9ZYeBkIkRdlTwiKxhNr+ppxhQJORWwv3Dk0jT7aSZ+TL/NaiY15RUftrbs5jcWk0mNE65hWxH0bMszZE+0zcK+1lzSzcHzv18pmAZqKu30hoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VmyVZJpW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VmyVZJpW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731892955; x=1763428955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i8RL5eTHhRFkJR+d5GpVOOvnLAluQOBYL9clTq0zXGc=;
  b=VmyVZJpWLUTe+QYuQtscNiTBIwcXmWj/0VMnOyEZTXtTP2xz8kD+d1ah
   Ry675+ZRXmt72aryXkyT0+aJC0DKCojuDpM+hG/z/HdlUWLkh0nguJHkq
   RwlJcCanYTQat5pQkH1X+DRrq9LNLAzbEC7ClxMBM7CNhZagv1S7ynJHy
   6czdNSHWVL921oQsNpBJTk6/9W02bbkA67HG6DZZ9hjsvxIm+VXqvLQqu
   vQHCp/C3VN8+Cfu+5ESBDO1QeCir4GOeEI9gHGF2O07VmaQ0aRSp7SSaF
   0rEhhOfiZ/WzZgRmutbtjkKLmNg8qBF0YPOQe0GFyhL6PjrMg0jA2+bFO
   Q==;
X-CSE-ConnectionGUID: nyw9DxjjTEiR4ZwRPVzc0Q==
X-CSE-MsgGUID: tzmbmtuwTEejLRdjrNUjiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42354774"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="42354774"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 17:22:34 -0800
X-CSE-ConnectionGUID: wggGII//RVeNTHfMeuT2wg==
X-CSE-MsgGUID: vRFEsI3UR3aDVaNzsZ4XyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="112373004"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Nov 2024 17:22:33 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCqTG-0002BC-2L;
	Mon, 18 Nov 2024 01:22:30 +0000
Date: Mon, 18 Nov 2024 09:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 111/120]
 drivers/scsi/ipr.c:9688:32: error: 'bin_attr_dump' undeclared; did you mean
 'bin_attribute'?
Message-ID: <202411180959.e9Qj51BR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   7a315c5c3a11f198244918c63efbc9205fc501a1
commit: e8fed0bb67c88ef43f708e0bfb819f69f5c9a1c2 [111/120] scsi/ipr macro
config: arm64-randconfig-003-20241118 (https://download.01.org/0day-ci/archive/20241118/202411180959.e9Qj51BR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180959.e9Qj51BR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180959.e9Qj51BR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/ipr.c:72:
   drivers/scsi/ipr.c: In function 'ipr_remove':
>> drivers/scsi/ipr.c:9688:32: error: 'bin_attr_dump' undeclared (first use in this function); did you mean 'bin_attribute'?
    9688 |                               &bin_attr_dump);
         |                                ^~~~~~~~~~~~~
   drivers/scsi/ipr.h:1698:71: note: in definition of macro 'ipr_remove_trace_file'
    1698 | #define ipr_remove_trace_file(kobj, attr) sysfs_remove_bin_file(kobj, attr)
         |                                                                       ^~~~
   drivers/scsi/ipr.c:9688:32: note: each undeclared identifier is reported only once for each function it appears in
    9688 |                               &bin_attr_dump);
         |                                ^~~~~~~~~~~~~
   drivers/scsi/ipr.h:1698:71: note: in definition of macro 'ipr_remove_trace_file'
    1698 | #define ipr_remove_trace_file(kobj, attr) sysfs_remove_bin_file(kobj, attr)
         |                                                                       ^~~~
   drivers/scsi/ipr.c: In function 'ipr_probe':
   drivers/scsi/ipr.c:9730:37: error: 'bin_attr_dump' undeclared (first use in this function); did you mean 'bin_attribute'?
    9730 |                                    &bin_attr_dump);
         |                                     ^~~~~~~~~~~~~
   drivers/scsi/ipr.h:1697:71: note: in definition of macro 'ipr_create_trace_file'
    1697 | #define ipr_create_trace_file(kobj, attr) sysfs_create_bin_file(kobj, attr)
         |                                                                       ^~~~
   In file included from include/linux/kobject.h:20,
                    from include/linux/pci.h:35,
                    from drivers/scsi/ipr.c:52:
   drivers/scsi/ipr.c: At top level:
   include/linux/sysfs.h:376:22: warning: 'bin_attr_trace' defined but not used [-Wunused-variable]
     376 | struct bin_attribute bin_attr_##_name = __BIN_ATTR_RO(_name, _size)
         |                      ^~~~~~~~~
   drivers/scsi/ipr.c:3386:8: note: in expansion of macro 'BIN_ATTR_RO'
    3386 | static BIN_ATTR_RO(trace, 0);
         |        ^~~~~~~~~~~


vim +9688 drivers/scsi/ipr.c

  9671	
  9672	/**
  9673	 * ipr_remove - IOA hot plug remove entry point
  9674	 * @pdev:	pci device struct
  9675	 *
  9676	 * Adapter hot plug remove entry point.
  9677	 *
  9678	 * Return value:
  9679	 * 	none
  9680	 **/
  9681	static void ipr_remove(struct pci_dev *pdev)
  9682	{
  9683		struct ipr_ioa_cfg *ioa_cfg = pci_get_drvdata(pdev);
  9684	
  9685		ENTER;
  9686	
  9687		ipr_remove_trace_file(&ioa_cfg->host->shost_dev.kobj,
> 9688				      &bin_attr_dump);
  9689		ipr_remove_dump_file(&ioa_cfg->host->shost_dev.kobj,
  9690				     &bin_attr_dump);
  9691		sysfs_remove_bin_file(&ioa_cfg->host->shost_dev.kobj,
  9692				&bin_attr_async_err_log);
  9693		scsi_remove_host(ioa_cfg->host);
  9694	
  9695		__ipr_remove(pdev);
  9696	
  9697		LEAVE;
  9698	}
  9699	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
