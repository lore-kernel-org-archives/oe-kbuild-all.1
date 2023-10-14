Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69C663AA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 12:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UqzRe/2q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697286327; x=1728822327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kq0d/+EoxPPFqpKGVv6eeRa05WC0bp06JP+aY38vzRo=;
  b=UqzRe/2qo3nNvCpKSc22OKHjr2YkLgI8vxX+FeqTFm5irP7+SnhO3RwN
   VuVIHcgryeIgOsilT0FwrN2+J69gx6jIM7irYMxc5dSoy8+7jd7XRoPIY
   mUtJrfF/f5Y1mpjLsoDPZ187KjRTs3eP4nz6cLnQ6GbqrbQ1Ko6H5oeVP
   8unlH5bf0XNC1iGouCs/pxMbydsuirWnYirGRLGHpc679X4umV4YezDqs
   fYBVIWVJemI/ZQ9f19xD0E5xoqKIRUVWsN4B20RI0MnzV+0l+SEkjh9jE
   kNVv5w8ssvz27lyuNieOm6ZY4L0T9kOBp0T2qHTU3mg3lQvcimvrpOMoD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364684030"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="364684030"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 05:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1086466461"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1086466461"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Oct 2023 05:25:26 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrdhr-00069n-2q;
	Sat, 14 Oct 2023 12:25:23 +0000
Date: Sat, 14 Oct 2023 20:25:14 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2336/30000] nios2-linux-gcc: error:
 unrecognized argument in option '-march=armv7-a'
Message-ID: <202310142025.07ZLGsgZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: b3d472cf0c23afeb4f383c8eb89345481d3a71b6 [2336/30000] Merge branch 'mxc/next' into next
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20231014/202310142025.07ZLGsgZ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142025.07ZLGsgZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142025.07ZLGsgZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> nios2-linux-gcc: error: unrecognized argument in option '-march=armv7-a'
   nios2-linux-gcc: note: valid arguments to '-march=' are: r1 r2
>> nios2-linux-gcc: error: unrecognized command-line option '-mtune=cortex-a9'
>> nios2-linux-gcc: error: unrecognized command-line option '-mfpu=neon'
>> nios2-linux-gcc: error: unrecognized command-line option '-mfloat-abi=softfp'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
