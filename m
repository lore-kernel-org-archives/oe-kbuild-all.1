Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86159A34
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g1Xy7/px"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585107; x=1733121107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wxPv1FzfUc78p+DxTVnXVfbUOZe8y8gb17BDh5m+bHI=;
  b=g1Xy7/pxw7h5HSDo8zcEXZum40XrhbF+Q4E+QV2Li4xE2UEUHduSPOv0
   Vfy1WqaqpxY6bt8/NuI8hI8AruHSGxTGTH3AqnXHOHkb1YLg5aLnRbPKq
   uqWev5MJhje4whYhpRmB8T2p7VelPF7c7C4xy5fG9U2EOaVuHrOZhLu/1
   GihpM5emi995JEwG9dZ+0cnadwEwn+7WdKRZbs+u/fNXdinwnsotwJPTN
   LKr/ci9YeUrDB7c5BOUHemuK0rv0CLGbGpAuwhWR7E/N+6NvcfKrilicf
   ZpeKYSu/cITcnoTjvrfidTCxBUsyvYy2Oqj3SQUHgNIJnz9NSDG+K22OT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="15180350"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="15180350"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:31:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="943556072"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="943556072"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Dec 2023 22:31:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g10-0006Je-0N;
	Sun, 03 Dec 2023 06:31:42 +0000
Date: Sun, 3 Dec 2023 14:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 3/5] platform/chrome: Introduce device tree
 hardware prober
Message-ID: <202312022146.sMSnegCC-lkp@intel.com>
References: <20231128084236.157152-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128084236.157152-4-wenst@chromium.org>

Hi Chen-Yu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on chrome-platform/for-next chrome-platform/for-firmware-next wsa/i2c/for-next linus/master v6.7-rc3 next-20231201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/i2c-of-Introduce-component-probe-function/20231128-174325
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231128084236.157152-4-wenst%40chromium.org
patch subject: [RFC PATCH v3 3/5] platform/chrome: Introduce device tree hardware prober
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20231202/202312022146.sMSnegCC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231202/202312022146.sMSnegCC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312022146.sMSnegCC-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/platform/chrome/chromeos_of_hw_prober.o: in function `chromeos_i2c_component_prober':
>> chromeos_of_hw_prober.c:(.text+0x13e): undefined reference to `i2c_of_probe_component'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
