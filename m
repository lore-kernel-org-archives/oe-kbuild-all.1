Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BF62CCB4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 22:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714168875; cv=none; b=H2afAYv5UACSijCpWUkiVErBJG2NTJy03HnQED68/ISaEpiVAwyD0r+tBGjqdMHmgL68jguYpT/S+eBYObXPJUeacwjLot82inRsRnNhcAqsuFehARvlEAO7RN02m7Yb35kMRPDJXE2evybLOmtxf8Up02gC/0UsoeCmlUSiIEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714168875; c=relaxed/simple;
	bh=A4591wEu6jk6N2T5ZDjEf9KbdxAAKrHZN4Mp+K1VECE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CIaOGZj0gUKAqsTUypuMKPtoCVowdamqWQRBivPeIgJ6ASnQ89g/H2YpYGhG+IRPuCLHlONvuXT00UOmICOtyQ6zPn0l96DnjvbdGCJC90eKEHOi5nhwPhMSHDGBLFCx6z16qqS1wHUuO5zHR+MY8/LNs8AUY7qqwhwdyckh1jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RofVi9fA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RofVi9fA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714168874; x=1745704874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A4591wEu6jk6N2T5ZDjEf9KbdxAAKrHZN4Mp+K1VECE=;
  b=RofVi9fAaaVz5MxM53b0afKcUXraVaVELuwVbWi7W8gGLkamz708fO4Z
   R7rG67qdmckyig97rrKmG67YJsUFDJe7oEiv+HGaue9xbbGOTIhh2ikRJ
   DwT0cdY1oDSW0Wo8SOVKAZBeUSJiTERGoT/ZZiA50HaQMNCq8WVE0GJDd
   EXK7RLUD5T5f7aYm1aKMFyhD0RwuJSgGZNvw06UbbpPBx8foK9P2lbxNu
   Fh3lGEaIBDZq/xf956tPYXJcOiHtTsdaW0/LxHkbi3WRbakPe32573S9M
   cx39hqRjEYvTTycTJyblxpFOaAuRzt9YbUA4eXSsxjYD7bZ1KaYqhMUqJ
   g==;
X-CSE-ConnectionGUID: 5Mw5t4QkTc6QcuZNrltWZA==
X-CSE-MsgGUID: EbT89ywNR8CyOu+hwJ44ew==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9793109"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="9793109"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 15:01:13 -0700
X-CSE-ConnectionGUID: XDiqfYFrSUqzFkeABCx/vQ==
X-CSE-MsgGUID: EpiaiOWzRr21unaDOaWCNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="25515276"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Apr 2024 15:01:13 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0Tcz-0004Ku-2F;
	Fri, 26 Apr 2024 22:01:09 +0000
Date: Sat, 27 Apr 2024 06:00:16 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 3093/11728] htmldocs: Warning:
 /sys/bus/coresight/devices/mali-source-ela/regs/SIGMASKn_0-7 is defined 2
 times:  ./Documentation/ABI/testing/sysfs-device-mali-coresight-source:184
  ./Documentation/ABI/testing/sysfs-device-mali-coresight-source:199
Message-ID: <202404270534.vvXsJhTY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 17c7a8b9f566aa74780249dbd6ad28020edcb5c7 [3093/11728] MGS-7377 [#mali] VX504X08X-SW-99002-r45p0-01eac0
reproduce: (https://download.01.org/0day-ci/archive/20240427/202404270534.vvXsJhTY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404270534.vvXsJhTY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: drivers/gpu/arm/midgard/debug/mali_kbase_debug_ktrace.c references a file that doesn't exist: Documentation/filesystems/seq_file.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Warning: tools/power/cpupower/man/cpupower-powercap-info.1 references a file that doesn't exist: Documentation/power/powercap/powercap.txt
>> Warning: /sys/bus/coresight/devices/mali-source-ela/regs/SIGMASKn_0-7 is defined 2 times:  ./Documentation/ABI/testing/sysfs-device-mali-coresight-source:184  ./Documentation/ABI/testing/sysfs-device-mali-coresight-source:199
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
