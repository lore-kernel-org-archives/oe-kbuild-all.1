Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD07E1842
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 03:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMjkvIQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705290154; x=1736826154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CW+Vf2LhvaonZZEG4r6Tpoa3jqZsZ6TCUFTG4m24tRw=;
  b=EMjkvIQop83Ms8MCLank1V+ljjndnFytBQX3Wu8Bq6yvXVV0z9D1FbdH
   dR/97gbvsKPTXA1C2kwuygqrHKf9r0WpguAYXLwgmp7bxWVSZwIHdpS46
   Qfn5wv/MsWyGxvBHG40pkCdSPgukXgX2ubDbKNi7MJ4DqGEfCboyxRSmE
   DqZEcvJKiF+LItX3eqLl8FljSa3UoSgOeJij8ztmYAmezeTQzJktYKyh2
   TUzNmzxZ0DsS4ILV/5UTg5Q5t5UWD/AcVBSQ4x7b336kWj6D6KHpbkEpG
   yM/hfV5p5p2yuUSioQk9Od8uMtn9hyXij9JuwnSkoUYwzEXrRIonu+kJr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="6896130"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="6896130"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 19:42:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="32013846"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Jan 2024 19:42:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPDrd-000C5H-0P;
	Mon, 15 Jan 2024 03:42:17 +0000
Date: Mon, 15 Jan 2024 11:35:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18747/21544] arch/x86/mm/maccess.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202401151100.dWAZqpHu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 22058d2bdaf6b0526395ceec2736c72c3b5f435a [18747/21544] uaccess: Add strict non-pagefault kernel-space read function
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240115/202401151100.dWAZqpHu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401151100.dWAZqpHu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401151100.dWAZqpHu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/maccess.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
