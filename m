Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0519E377EA4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 16:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772643217; cv=none; b=Pr6zqdYjvYxWqHEFa3RsMdh10ZRwAAgtVKIrpuQ6Wo+6O5GEOqrgTlIzOsx1YqaMVh7gSi0CzFBr/FdHD/Xp0aot0QsLTs9eBoyBxMuqckmJD4mDL/7zCf5vFTpzTnGTNxBPdFqOAAWxcZMG5SdG9dh1LpbMZnSgn8BzMuIgSYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772643217; c=relaxed/simple;
	bh=FahOFKzfsQ5W9sKFbxMIjC/77i9YCIyCYCiKrLSIwP4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C5kvf0TUZ8pgNk3D3q5AulG8dP4umFy6d4lajg2ECdssSFei/hhq1xqMTK5Oslm7dYdk5W6KQVTxmJaL3U7vuOGXRBRPtlETbV5h0je4sf4o8SEJ6buYDrUARv2zOQCYIbaQHmRURkQEMIlZJhuF1+C3Bz08FIy5dZT1otOZyME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UH6Etuy3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UH6Etuy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772643214; x=1804179214;
  h=date:from:to:cc:subject:message-id;
  bh=FahOFKzfsQ5W9sKFbxMIjC/77i9YCIyCYCiKrLSIwP4=;
  b=UH6Etuy3JPR5jBCIBUWAzENlouuWoiRupYXjZdK4iZHIL2EgeY1Hzhqa
   XmFNYMDguB25aJalCIB7ndsJ+ZpWDGKUtzAGtrFBmcCKoBIYha+Jb351N
   8jWjNXepFzMAK2KkkC9ezU1gQlhZKvuuwcSi2Zv+LHYGS5yGIWZ70t32k
   N5nmWMbYJv+2a46Joh21pM93AaoxE2AY6a4b6pUC7CWAy8+Sfaf5i4lFw
   YHl9wI4WqbD1jvzx180Fjw8rj7XU8fAuAJGH+06VMzIAbIQJJ1E5byw5p
   Fu2SmjQBU/IefbutJti2pbRcsYtWfwEA+geigdbsUAY3aAt7X247RgTLl
   g==;
X-CSE-ConnectionGUID: f52t7x8gQky3mrjw5CJpiQ==
X-CSE-MsgGUID: 0wRT1MLdRiqw7vAHBzgoSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73624708"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73624708"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 08:53:33 -0800
X-CSE-ConnectionGUID: Jwel0MmXRh6dZJ74TwDHlg==
X-CSE-MsgGUID: h9mPKfrNTPWFsunqgBfAxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="256277182"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 04 Mar 2026 08:53:31 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxpTV-000000001kL-0mGI;
	Wed, 04 Mar 2026 16:53:29 +0000
Date: Wed, 04 Mar 2026 17:53:25 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-6.6.y 683/683] htmldocs:
 Warning: include/net/netns/ipv4.h references a file that doesn't exist:
 Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
Message-ID: <202603041726.zEq77zTY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.6.y
head:   682d8e2f892b73c2f574684c8dd6b625361b4c03
commit: 8dacf34eb427d0fd30bd032b16a8781da3061173 [683/683] netns-ipv4: reorganize netns_ipv4 fast path variables
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603041726.zEq77zTY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603041726.zEq77zTY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: include/net/netns/ipv4.h references a file that doesn't exist: Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using alabaster theme
--
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: include/net/netns/ipv4.h references a file that doesn't exist: Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
