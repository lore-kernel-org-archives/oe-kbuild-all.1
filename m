Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292353;
	b=p3rOL75DCiId8ZpPsHOtnMrW8oGthBbsIhxME97KFf20w8KTFEZtHrLI4aShiErSw4mM
	 QW+T+sDsZ+zR2UAejfQ91xU9G1oP4iLgoGPUwB41Ukce1hb9akJ7mL5ViNqpYJIyk/1KS
	 GU/cUdHHRq8OvaC4+QACIf4Mxd44yErLUKql3L3DnwqvXlMutwMiShiiZpyXxRXNk9Oom
	 1BrLrvSoPsMYd9cdIMRVHzK874tUttSr6LrPKOya/SDHQS0Ed+aKHhr4yDVGmY2tH4m+y
	 9UvWOMAqz0BXSPjqaPZlzehnHita/j18QiuNSCBppBdB9YLrzKcWDtvdezrkThsxd1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292353;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kRP6dkUXSlW2jr9W38SFb4sELqQLKEYBOKNJuymhsKQ=;
	b=1kFFrSXMY7We8rG66HJ2TvvYj0vw6KFDOQ5zQ8g6Rff2UktKmbIZtKf2CyO53nkc4Vlt
	 4sek8Tj001nhRDpvZ5tBHwWIrFXEdXTJ5adfToRMxntIRUifXcwM9AtgeGw5KZRp+dlwd
	 nBpdzoXbdl1ggYzqPAQxxNaY9qqf3hA+uyZ0hHwk6ZIlaJryj7IPgxRjcS+w31zpw+3cm
	 pc22TC+zitKWRXSi5SuqhsjXgmTZiJtkbSEbZzrm9Wa/t0MRmY3lyIPP2FaqGDXSjJrQX
	 Sj559e8b63DuXiFS+tzJzsnJzYNJULHbl6snjoZy7KdDF/itPbufhq9VmUhu7fiwJXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fQzUupMY;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3D4606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 16:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F3D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fQzUupMY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793292351; x=1824828351;
  h=date:from:to:cc:subject:message-id;
  bh=IXFO/f2jYRRmcbUrq9cmmIjyfiD1rXBDZq0q3oX9olg=;
  b=fQzUupMYmqr9SpPkM7T85/0U13ih8D4F8vzhhGDkkAeEBco2JPg5ygpA
   BDR3Pl/c7XkF0hfyOvJlsmBoIQGzy7Xl/AG+Fz82SqR4fSMsWD0U7j4ew
   rSUqZaKhxF0yZRRZhg+32bcK1CEz1uqnv36i85Bo5pBIWFIuXhnLLxMgq
   BwazWlDtz5iLvD1uIv6sFhA4IRP6qOeHuKaj/r2t82c0ybXyu9WQqH3EG
   IVySz9PPSslP5NoNmRfbmCP8qIv7GBKnmiUMoUTNGvyReoOOq6I/lyhej
   tXS/Frv1TPN78nqaeHomjWAnWESmtP2psxFb2yNr2sx6aMibmOgBSVrlF
   Q==;
X-CSE-ConnectionGUID: mxGqOHg7RmqiPcmQZkrNKQ==
X-CSE-MsgGUID: yr/KS7o5RTan4QsO+E96+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1941733"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1941733"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 09:45:51 -0700
X-CSE-ConnectionGUID: Jl0ATqFBToCDA8bBlWcgrQ==
X-CSE-MsgGUID: HWw37K7QSW+SWaeheiMzOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5733450"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2026 09:45:50 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMTG7-00000000aRe-1o1m;
	Thu, 29 Oct 2026 16:45:47 +0000
Date: Fri, 30 Oct 2026 00:45:37 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:cr/iommu-liveupdate/phase1-v6 56/56]
 v6-0000-cover-letter.patch: warning: ignored by one of the .gitignore files
Message-ID: <202610300058.EzMudU2y-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/LuBaolu/intel-iommu.git cr/iommu-liveupdate/phase1-v6
head:   0c951d2dd0e55d5d98c67799bc384ae8d335ef4e
commit: 0c951d2dd0e55d5d98c67799bc384ae8d335ef4e [56/56] cover letter
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20261030/202610300058.EzMudU2y-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610300058.EzMudU2y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610300058.EzMudU2y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> v6-0000-cover-letter.patch: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
