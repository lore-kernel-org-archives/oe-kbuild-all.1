Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B84D28DD4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OhGXTOC8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697126428; x=1728662428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mzik3pEwIJ9BroSUJA8Eq3wxIifDXxeW5kOsc4mv0jc=;
  b=OhGXTOC8HS6G/NronE0bJLS1VYK7hCNb4+LWsy7MUt2sRNNYeJmkQ1nC
   2d5rTYSfGQWHbFfDkZoxpmbXDFm07lu7d5hxoREiXVD7x7WU2ZWmF2bKj
   GNnDTD0qKmadgHlB/GOf/XTktw1mEgfHmS2382A4//fXaCI5QXhJdSbtQ
   cJe9gabH754CKVsabWFAOZdfizUSdFT8mhq8PTtx+4S+/1hpIgpiZn9+b
   sKN2+JJewFFx0Wn9xpmKTP89R72xjq+DW+N7LlrGoDoYxOsqiKrfbXLT4
   M7Ps9/+kNxvc/7Rw6vGllaVjAyxnvRk4Fx4CZlmwHuSc1BQKl6+VM+BL9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="365225207"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="365225207"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 09:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="878157702"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="878157702"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Oct 2023 09:00:23 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqy6n-0003bC-2A;
	Thu, 12 Oct 2023 16:00:21 +0000
Date: Thu, 12 Oct 2023 23:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Rob Clark <robdclark@chromium.org>
Subject: [linux-next:master 10440/11653] a6xx_gmu.c:undefined reference to
 `qmp_send'
Message-ID: <202310122309.NRbVGD5o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9a6bea131849702d591d18d5c8b8a0eda6f62b3
commit: 88a0997f2f949f1f7076adeb5d4fa4d684cca5bf [10440/11653] drm/msm/a6xx: Send ACD state to QMP at GMU resume
config: xtensa-randconfig-r005-20221224 (https://download.01.org/0day-ci/archive/20231012/202310122309.NRbVGD5o-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310122309.NRbVGD5o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310122309.NRbVGD5o-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/gpu/drm/msm/adreno/a6xx_gmu.o: in function `a6xx_gmu_fw_start':
>> a6xx_gmu.c:(.text+0x22f8): undefined reference to `qmp_send'
>> xtensa-linux-ld: a6xx_gmu.c:(.text+0x23c3): undefined reference to `qmp_send'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
