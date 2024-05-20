Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49B523759
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 22:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716245998; cv=none; b=d8GxUI8NE6ayQw/3UOUMlF/UBxcBUWqzGgz4jSaoW4wfX4o+BqUy++SlOqM38QsuWBPWnSueuMtwvxCsELVYMTJdVZmA69Jhzgu32HYSVcD5SgumZ0Ak7j+5ilWGdrRfuL+p+NLIiWfiU3z07mu9cSloDqvD+Pxr/+s159tS/b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716245998; c=relaxed/simple;
	bh=PYrRJF9NvQLgK0jwY1kfMR+O6Dli+P/rp0WUNz81WOs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BJDdVSoys2cbpIpxcOrGFQPVq3qdJ+nPOOWx5OxBqU21fznVFNjgR2/dpQhxjG/Zm/Dum/MdPEiyrYe1z+GqnGINtJWpaCGmIx2+EXOI133KeQaq3T/9jtegBeJ64QgCpBPvByTVtDWUt3jLcGkGr7XzEodYBD10HJKxc4UkiAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBhUO+d6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBhUO+d6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716245997; x=1747781997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PYrRJF9NvQLgK0jwY1kfMR+O6Dli+P/rp0WUNz81WOs=;
  b=QBhUO+d6HTXNPZlPGoO4D3yTx0DGHFGTGFeksPNSZDj9PVSb+ImzXk7S
   scVzkDkG4kJ2xJFZ3CCkiLSa9ilpbjjU3pt2Uq/+8sJofRB5jDcR9jLxB
   Y2viHwH+fLUF0hLe6MX+UcYnMYRE20bFRBedFL+vSEziQc8Za/zSCRL+0
   LgXNh5xWsnL0Wgf3nNqPSh3BDO0RFebb8DSody0RUl6PVghl6GW/NMCO3
   q+d9Anx0wjvgMpm8mkLJ0dKSu05hM24QXHQSoPUAl/+BtISr0l6povWbl
   L/U6cYTZgRKGL3zK7eMWmWbI/WHu/piyIoZsfDLu9onyrrOebpL7JIIe/
   g==;
X-CSE-ConnectionGUID: yDC2AzPGTTqo4OwQpsb4bA==
X-CSE-MsgGUID: y2L0uvc5T0CC4b6/pUx2Pg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="11614893"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="11614893"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 15:59:56 -0700
X-CSE-ConnectionGUID: DT36GnfvQnGRoKSQ6o2ZOw==
X-CSE-MsgGUID: zZyAO4cmRAWxFP4+jcNK1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="37079009"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 20 May 2024 15:59:55 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9Byz-0005Ey-19;
	Mon, 20 May 2024 22:59:53 +0000
Date: Tue, 21 May 2024 06:59:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 39/44] htmldocs: Warning:
 include/uapi/linux/gunyah.h references a file that doesn't exist:
 Documentation/virt/gunyah/vm-manager.rst
Message-ID: <202405210618.2u0D8U10-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   833aa73663421306198d4b3ea83ef44087c9fe19
commit: 296cceed084451decfd348415b1db9c833443713 [39/44] ANDROID: virt: gunyah: Add gup based demand paging support
reproduce: (https://download.01.org/0day-ci/archive/20240521/202405210618.2u0D8U10-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405210618.2u0D8U10-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
   Warning: include/uapi/linux/dm-user.h references a file that doesn't exist: Documentation/block/dm-user.rst
>> Warning: include/uapi/linux/gunyah.h references a file that doesn't exist: Documentation/virt/gunyah/vm-manager.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/cleancache.c references a file that doesn't exist: Documentation/vm/cleancache.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Warning: net/netfilter/Kconfig references a file that doesn't exist: file:Documentation/kbuild/modules.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
