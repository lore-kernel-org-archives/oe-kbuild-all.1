Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041927473
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 05:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZS5SBLoj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701237284; x=1732773284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DbfyNV7Lodd8LPW5awsvVINXZlDDAEM+ob/HWAfB8+E=;
  b=ZS5SBLojIGLSj+CCcEqSaetcHM3bu2ZU1hrgo1Fpd+4hNn2XnCnPwEDa
   hIvmNfQbjSbqrPzxZxTEXeHEQnxgh8Wc6tbTlrluqi0le9RKYnEYn/YZW
   dE3Mb+kkNgsWJ2qdIBlOhujk+yKS7yGgU4/Fvos8bzTdNkIIv8djJfzx/
   0kw+1Tr9x8rXa207mkgUm2wWGuS5IECmt3vdm/GgqFeVjmxPsMyXpXYPl
   VPb4oHY1TFAcvMTFi9drzGzn3oFcII/SaNOm1XVUtjF/1D2amIdv32aXJ
   NpIIL9QObTQYPoc9chcLLe1PpvqCAhsqW2+LPFtAZHjpG3w6IvsQ9Vx4D
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="391970111"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="391970111"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 21:54:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="859687442"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="859687442"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Nov 2023 21:54:37 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8DWt-0008dI-1d;
	Wed, 29 Nov 2023 05:54:35 +0000
Date: Wed, 29 Nov 2023 13:54:12 +0800
From: kernel test robot <lkp@intel.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tanjore Suresh <tansuresh@google.com>,
	Martin Belanger <Martin.Belanger@dell.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Daniel Wagner <dwagner@suse.de>, Keith Busch <kbusch@kernel.org>,
	Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev, Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: Re: [PATCH v5] driver core: shut down devices asynchronously
Message-ID: <202311291142.I8HCRjsP-lkp@intel.com>
References: <20231128210436.506510-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128210436.506510-1-stuart.w.hayes@gmail.com>

Hi Stuart,

kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.7-rc3 next-20231128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stuart-Hayes/driver-core-shut-down-devices-asynchronously/20231129-055044
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231128210436.506510-1-stuart.w.hayes%40gmail.com
patch subject: [PATCH v5] driver core: shut down devices asynchronously
config: i386-randconfig-061-20231129 (https://download.01.org/0day-ci/archive/20231129/202311291142.I8HCRjsP-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311291142.I8HCRjsP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311291142.I8HCRjsP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/core.c:4782:1: sparse: sparse: symbol 'sd_domain' was not declared. Should it be static?
>> drivers/base/core.c:4783:16: sparse: sparse: symbol 'big_shutdown_cookie' was not declared. Should it be static?
   drivers/base/core.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +/sd_domain +4782 drivers/base/core.c

  4781	
> 4782	ASYNC_DOMAIN(sd_domain);
> 4783	async_cookie_t big_shutdown_cookie;
  4784	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
