Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38803ABDA4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 07:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778743592; cv=none; b=VFtz8Sa3zG6//2xpHRATdje2vt0x44GzNy7LEKI7vAbY0U7twH+hm01Kq2K/2OVG1rUZtFlWnc7vUkzAyqaIuQUzFDz57N+Wh2lLp966cfwXMfc3SlJmkGI/oIdmIGL1Nas2C+uo/9rLWKvpRBivcolJSW4wD3F81OrdJ7L1PKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778743592; c=relaxed/simple;
	bh=4ryslff3M7sEG6C/nTOICEM81m4Sqfxcyh7IfMc9gnQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tmD0qFy4DxIvFpIXnb7t9yYZaiKzP/4+8K0Qd00oUU15v1xT2izPO2R02dekyljI4+q9sxZ5KOcGSYm3AvqGfoJp7RqV2nPGZXOqg+Jaraf2jm7LMT1y18I+PPo2HTNeZ9XGfKRSRAjapGVWeP/aDT7vHlnROKRImh58VoqkK7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1pphvjv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1pphvjv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778743591; x=1810279591;
  h=date:from:to:cc:subject:message-id;
  bh=4ryslff3M7sEG6C/nTOICEM81m4Sqfxcyh7IfMc9gnQ=;
  b=R1pphvjvuLevc+8wetvHzGp0WNLKbDporDVJf3DD5GVMU0qsNOp6izzK
   wOlQ4NBqJ47Y2qFrr56N4BYanqLlVzvYwa1cOnH2IYykFMeLksEP8uZQt
   lwBQ1p5xnIIgiyfJAEYV//qmB1PGd2Ei+vtDp1uW2whaVOBT4DjquKo5r
   TdXOH8+OT0AcWpxmiSPOSk7bSoNXxQUVkT0hFkOpuTj+3s5h5fn0Il7yl
   eAR3rq0b4KhRa7SexpWrJKk2gvQJ8InEmKaE8cjNOba1s9WHcz5Z6AJm3
   5bYKpL7tTusw/y3dmHHs5niVJlfR1wAEBhLEpqbAGNfHI47TRaKJVyC2M
   Q==;
X-CSE-ConnectionGUID: GBOORvEUSxKLoHBtp6NgxQ==
X-CSE-MsgGUID: 8b9aq9ttTsWNiBwQRjv6bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79798538"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79798538"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 00:25:56 -0700
X-CSE-ConnectionGUID: ief3MeVGTIWjVqU6aZmIyA==
X-CSE-MsgGUID: 40Jy0vRwQOm3OvxNpXOMLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="242307671"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 14 May 2026 00:25:55 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNQS8-000000008m5-3PpA;
	Thu, 14 May 2026 07:25:52 +0000
Date: Thu, 14 May 2026 09:24:55 +0200
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/driver-api/media/v4l2-subdev:644:
 ./include/media/v4l2-subdev.h:1815: WARNING: Inline emphasis start-string
 without end-string. [docutils]
Message-ID: <202605140920.76HXOESS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l2-common-Add-mipi_csi2_dt_for_mbus/20260514-071037
head:   34918de37a97a5dc1db4f52558076912af6adcea
commit: a3067ab49d683ccd82af48d0fad7349b7724537d media: v4l2-subdev: Provide a cleanup-friendly get_frame_desc
date:   8 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260514/202605140920.76HXOESS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140920.76HXOESS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   --------------------------------------------------------------------------------------------^
   Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
>> Documentation/driver-api/media/v4l2-subdev:644: ./include/media/v4l2-subdev.h:1815: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: ERROR: Unexpected section title.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
