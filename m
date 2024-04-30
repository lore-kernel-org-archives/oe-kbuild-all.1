Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9150A63B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 00:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714436026; cv=none; b=XTseGVeNn9hXQvu0bi1Y5ScvGmeFbK0RLfdTUzdFyZEEL13DplWpZeByN6Wxt9l7m6L1jYxutrugrncxyB0eH16QPpI8VZ7yAVrxdgG3Px4g5ckv9ZBXcWuYvmwJHasMRd+8iy2xtnQXBdIlD1cig9DUVFtTrDYIVZzSg6VvU3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714436026; c=relaxed/simple;
	bh=+jZ5RkuDJvgEX00D+kcZ0bREV+2MB3967bErI5zdKdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RSJO2g7YpnRNZZfETyKqErRHIhHHqHRY7u/KsVA/8iRwWeV8MM+2zcD9mnfyD0EO6IQZ1z7/goGBjwmgccOetYr8jJMU7VfRz/dCuRi+zw3GvAWT9hHIr77scF1VeUli4OGHOmKFmB7CfM7B5EqXU5Zpjl+5ypMIEFeCCFqkGYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z39F1UcP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z39F1UcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714436024; x=1745972024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+jZ5RkuDJvgEX00D+kcZ0bREV+2MB3967bErI5zdKdY=;
  b=Z39F1UcP3I6kZYaVeGIGNhYL/Yt48mVB4BTzEoY/1R68Y82jYHN+9xUt
   TllMf6p+gY2umNMQHm0QP1HVgiUvS5PBZ8ewIencB08aw4YFE1LppGsT9
   VJkwFG0rW1DOZSQMockmbrwvGYoK4O/jwau2uiwfel340SOomNxqGYLeL
   ku2Vto1HdLd2fxdvv3Q8cfMH0m2wt5LdKYTKsqD+igxZzXycnioiUJxeN
   rDvjap24rX9MFDW4j1eHQUxGi/ufZ09eKAUXv2Uwkb9yNyAspukD4+bNm
   7g6TKDIUrKAoCqkbqo5ZySPlT463ljps5gy2W7yNDMQbw1q+CKo0yof/j
   w==;
X-CSE-ConnectionGUID: IuF+9ecAR4eujbXxAGgHgA==
X-CSE-MsgGUID: su7z4eHqSmCV/sXXEhLRvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13911448"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="13911448"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 17:13:43 -0700
X-CSE-ConnectionGUID: AUPW7x8fQgiBE7cyWORGeQ==
X-CSE-MsgGUID: lOrT2mW5QCuREQzY8/dp4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="30729105"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2024 17:13:41 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1b7q-0007Xv-2r;
	Tue, 30 Apr 2024 00:13:38 +0000
Date: Tue, 30 Apr 2024 08:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Ware <ryan.ware@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, zhenyu.z.wang@intel.com,
	terrence.xu@intel.com, intel-gvt-dev@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Subject: [intel-gvt:pr/236 1/1] htmldocs: Warning:
 Documentation/doc-guide/sphinx.rst references a file that doesn't exist:
 Documentation/sphinx/requirements.txt
Message-ID: <202404300814.T7UmgzBA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/gvt-linux.git pr/236
head:   610b2bb74d663c7cc375650ffe6f8b285e18bff4
commit: 610b2bb74d663c7cc375650ffe6f8b285e18bff4 [1/1] Removed unneeded requirements.txt pointing to insecure version of Jinja2.
reproduce: (https://download.01.org/0day-ci/archive/20240430/202404300814.T7UmgzBA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300814.T7UmgzBA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/admin-guide/kernel-parameters.txt references a file that doesn't exist: Documentation/admin-guide/media/meye.rst
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
>> Warning: Documentation/doc-guide/sphinx.rst references a file that doesn't exist: Documentation/sphinx/requirements.txt
>> Warning: Documentation/doc-guide/sphinx.rst references a file that doesn't exist: Documentation/sphinx/requirements.txt
   Warning: Documentation/mm/hugetlbfs_reserv.rst references a file that doesn't exist: Documentation/mm/hugetlbpage.rst
   Warning: Documentation/mm/physical_memory.rst references a file that doesn't exist: Documentation/admin-guide/mm/memory_hotplug.rst
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
>> Warning: Documentation/translations/it_IT/doc-guide/sphinx.rst references a file that doesn't exist: Documentation/sphinx/requirements.txt
>> Warning: Documentation/translations/it_IT/doc-guide/sphinx.rst references a file that doesn't exist: Documentation/sphinx/requirements.txt
>> Warning: Documentation/translations/zh_CN/doc-guide/sphinx.rst references a file that doesn't exist: Documentation/sphinx/requirements.txt
>> Warning: Documentation/translations/zh_CN/doc-guide/sphinx.rst references a file that doesn't exist: Documentation/sphinx/requirements.txt
   Warning: Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst references a file that doesn't exist: Documentation/mm/hugetlbpage.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mfd/da90*.yaml
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
>> Warning: scripts/sphinx-pre-install references a file that doesn't exist: Documentation/sphinx/requirements.txt
   Warning: tools/power/cpupower/man/cpupower-powercap-info.1 references a file that doesn't exist: Documentation/power/powercap/powercap.txt
   Can't open ./Documentation/sphinx/requirements.txt at ./scripts/sphinx-pre-install line 297.
   make[1]: *** [Documentation/Makefile:95: htmldocs] Error 2
   make: *** [Makefile:1821: htmldocs] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
