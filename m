Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB15F510
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 21:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726609555; cv=none; b=Ftb66pejtyaZMiIlgJN997FKs5vbXOf1T3eJguA9yuj30DIkBjhEyuinh3+aI4+5UQfPJzy9y20W7/LeiyA1HuzDgiiBPD/Bsf0y8iDjdbl3A5G+8t8gVuF8OBkSVceQC3GuEChcElnlQyjMjRyWSH4qC6J6ytqoxB49jwpQcdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726609555; c=relaxed/simple;
	bh=h2jgFdseHk7aFTqGihWfGELWE5znx1xt9Qib14dHjN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q/sPr8RI7lSqQ4WQrXLpzNdxBQq4QdtcLliMQe18Bpmmq0CIeM3DKemDh6K+F2SicRWm4p5bsrZsKmP2XIqVg1ioG/iLfgVCazSzdSVVRxShuzOYzBQmEdDG9j81k9CP4E/f+sSz4kNQv9mDSVfS43N7lGnPsHF930lLLnCPCQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2Uc1XlY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2Uc1XlY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726609553; x=1758145553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h2jgFdseHk7aFTqGihWfGELWE5znx1xt9Qib14dHjN8=;
  b=T2Uc1XlYBwYRidtkVLgMQvWUFMY4eM+AUT/OEBRppo5YzGvD8jPexeYM
   zDNenTH9fKyrtchtIeb+QiEOpPZh5LB3kNyBxnMwAJWrMiz1+xAy3eZ3b
   JXKgirETAyHwzChhvQAa2fC9yR8+zgXIDnIrC4NZjL9cgCbEA3nvSbWhN
   3aof4fvakbx+hZZE+hVOSUByKC6xugT/lnXaik4VjnSnnRNP1L+wrAtvl
   w+lhxCPyI4GWDwUpGRIxx9RKrwANeds0M42q8BmjC/GEHKTBZaIQps5tf
   GI8ZRFVuqNwrU4gwzT0MaQrqdCveyzLxg8U8nYMnBaImriFLHHa8pvOsw
   g==;
X-CSE-ConnectionGUID: LOYyLP2vSzK4uPBqjLnYKg==
X-CSE-MsgGUID: ySxGZeDXT+qycyrZNl0mDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36852853"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="36852853"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 14:45:47 -0700
X-CSE-ConnectionGUID: jIssziE4RLu2Nr6rTGQy6A==
X-CSE-MsgGUID: V9GyluG3QmCJ5vft+jj/uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="92639786"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Sep 2024 14:45:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqg0x-000Bda-2h;
	Tue, 17 Sep 2024 21:45:39 +0000
Date: Wed, 18 Sep 2024 05:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3066/14977] htmldocs: Warning:
 Documentation/dma-buf-test-exporter.txt references a file that doesn't
 exist: Documentation/dma-buf-sharing.txt
Message-ID: <202409180549.s0MIDk7T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shuming,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   3516b574d9cb19c39dc921a07a37c8a2fcaf0009
commit: 2526990f17d5ceac745910b95b83973586a6a455 [3066/14977] MGS-7263 VX504X08X-SW-99002-r31p0-01eac0
reproduce: (https://download.01.org/0day-ci/archive/20240918/202409180549.s0MIDk7T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409180549.s0MIDk7T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
>> Warning: Documentation/dma-buf-test-exporter.txt references a file that doesn't exist: Documentation/dma-buf-sharing.txt
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: drivers/gpu/arm/midgard/debug/mali_kbase_debug_ktrace.c references a file that doesn't exist: Documentation/filesystems/seq_file.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Warning: tools/power/cpupower/man/cpupower-powercap-info.1 references a file that doesn't exist: Documentation/power/powercap/powercap.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
