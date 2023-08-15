Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B2C622
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 02:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692067005; x=1723603005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=73BhJCPJjUvH9+B2+NitjAjububX5SyKFLlRA9EA+E8=;
  b=XL7G4uVRk/OgqdSeLTzNdGgXrebfUUzC/Iy5cCrz9BXWOubjA007F8WR
   SXzT+LBy11lNR4EJ3klZ/tODB01I7eTWAIFCGC8dLq9fiRxSkZilM6tau
   wk3sPO1bOdO0lIJlB1lefduPSGzD2rbixY1wfpDxn7KRRVeEXMoDRkHbP
   T07533NTQMSf8XFyFpwyl9utRVAQDSrCSHQpLNikvUEEvV4W615iZ2Amf
   nExaWbAurMmTEUTJ44F2dNkQ8u1ppAYrN2Nmihuu87hcuLBvoBXvddqIH
   zEyAtnPXYbTpHDW0+kg5+nc23LjNeJ1VLADvqgb/BbW6LMreeQ2LTft3t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="352512835"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="352512835"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 19:36:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="980236994"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="980236994"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Aug 2023 19:36:41 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVjvE-0000bJ-1P;
	Tue, 15 Aug 2023 02:36:40 +0000
Date: Tue, 15 Aug 2023 10:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Song Shuai <songshuaishuai@tinylab.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [lwn:docs-next 37/49] htmldocs: Warning:
 Documentation/riscv/boot.rst references a file that doesn't exist:
 Documentation/arm/uefi.rst
Message-ID: <202308151010.JGqiPc9F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.lwn.net/linux.git docs-next
head:   90cd0c18573ad0583dec098a586f86d281947eb9
commit: e0bec22f06641e4a7ccd7fb1f8ed4588839b660b [37/49] Documentation: riscv: Add early boot document
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151010.JGqiPc9F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308151010.JGqiPc9F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/riscv/boot.rst references a file that doesn't exist: Documentation/arm/uefi.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
