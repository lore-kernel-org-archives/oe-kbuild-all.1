Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9103D1DF271
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 23:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762040961; cv=none; b=GjPTTZ+T0KouuXFWfevtq3AjYKn5/yYHvEUnVv2b7DXTQGTt82XImYc8DUl1rdOLYVfpaX8Yj1AYk5PDy3LxOv+vDIE9i0ZnFNR1xQovq7qFX6NrccAeCYqGqBI6p0E2OC3rgywKyVuRCFtkGEpr6yrYslrL8w/wQNAxomvVxxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762040961; c=relaxed/simple;
	bh=oQDDwJzkvvj+tCnSQXlw9ADiuFWcBVAGmPlgbN2pkbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dvqC6QqHJBIT9JKHPexV97Jt71gejt319LjFPtHXiDjsa/xIGrGWcOIwOTLhzSVddg0KZCy8iHqr2WU+iJD8EPH7FYgKebAXe68Y9nCL2ZZWBZV9wOIo01DjhsGLcbn5d5bj87ZhZT6RAnBP/niH03DqaXAda/IX+mU2gKvH758=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3cDl6XO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3cDl6XO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762040960; x=1793576960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oQDDwJzkvvj+tCnSQXlw9ADiuFWcBVAGmPlgbN2pkbc=;
  b=Y3cDl6XOUT0L0rO2bGCz+/CZpaPmO4Th2We1xWPVdjbmBNeasI+I709c
   rGDKzQJITkwifw5VbhvCocoJ2p/VT0oN2Uzzd67NxLk8f7oSZQos057Bk
   majX0e4ZUjqpbytfW2f8+buRDJAaxOplHQC4G6ve4fzOXAH6KWE9DSfdV
   Baov9KcueUz5wl2MK8r0D0b7MIWyM8mvMMkiwdjh7heH2FTpnKEePXgLC
   /FgLki5Zx3Y/xJTMqZ2DiAAEm0eGXCWGdh2ZCbOHfd79B7AQLxMWHCkOs
   HCjxbem3oxTbMr+HRiYDf97k5Zduos+dOcJ0i9I4/s1diS+xeRX+/tNsF
   g==;
X-CSE-ConnectionGUID: hVHQU6IJSxGXCmKWWWRP8w==
X-CSE-MsgGUID: /ZwsS3cVSM+ZykQmmxr28w==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="81793166"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="81793166"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 16:49:19 -0700
X-CSE-ConnectionGUID: KhBFdIvmTQSsf4vlwZs4XA==
X-CSE-MsgGUID: DjIpT4MlSmq1c5qWrNfUWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="186493325"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Nov 2025 16:49:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFLLP-000OnS-2G;
	Sat, 01 Nov 2025 23:49:15 +0000
Date: Sun, 2 Nov 2025 07:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/david-ifq-sharing 12/13] vmlinux.o: warning: objtool:
 io_ring_ctx_free+0x40: io_unregister_zcrx_ifqs() missing __noreturn in .c/.h
 or NORETURN() in noreturns.h
Message-ID: <202511020724.oJvwa9p7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/david-ifq-sharing
head:   58f74f3820d231b3e32922687bc9e0670a80e198
commit: 41ada073d96d3d3d8d45adc27deb8c6f86451ec7 [12/13] io_uring/zcrx: export zcrx via a file
config: x86_64-randconfig-r053-20251102 (https://download.01.org/0day-ci/archive/20251102/202511020724.oJvwa9p7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511020724.oJvwa9p7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511020724.oJvwa9p7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: io_ring_ctx_free+0x40: io_unregister_zcrx_ifqs() missing __noreturn in .c/.h or NORETURN() in noreturns.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
