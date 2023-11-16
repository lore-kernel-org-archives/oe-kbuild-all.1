Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138765395
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 06:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WcyNx29Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700116557; x=1731652557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y4wxHAli0DbWWQUf2K4btK7K5JUyl9lpulyoeMDp8Ko=;
  b=WcyNx29Qf5ObP+ElVeycMCjSewBPrl67bdh+qi+CHqRpPziaik2wBJJ6
   O+SWigY0ruCszT0AfmAQBqcbEzVJI3EYUXLxf0jJqT0WnwMrIyKp3ChoP
   o12o0XarxoqI9e+D1O/ddr9w7Sps747T9EyeobOdzMrAbyiIkGNMFFRnI
   3C/ANnRSYYwA9HcthygDX66s5HBvKPCw8iNw44Lbkdm2/GrV1IG4Hh2+3
   vY8J3FM/m1rqSLXFnzMw/PYw7oUbz2+Bmr0M4262S8+4SzfQ/LKbYqcnU
   RFCh6bADaNuepSxSRaWjFJ3eprUzlqevWNH3qNdCO9+QOBwOnnlU1kySK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="376073208"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="376073208"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 22:35:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="882646459"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="882646459"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 15 Nov 2023 22:35:55 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3Vyj-0001P3-0Y;
	Thu, 16 Nov 2023 06:35:53 +0000
Date: Thu, 16 Nov 2023 14:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1594/1745] vfs.c:undefined reference to
 `svcauth_gss_flavor'
Message-ID: <202311161458.W0Ln92Vl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f31817cbcf48d191faee7cebfb59197d2048cd64
commit: cd894e030c9eab82fda55422041500d4ec8b1885 [1594/1745] NFSD: Replace RQ_SPLICE_OK in nfsd_read()
config: arm-integrator_defconfig (https://download.01.org/0day-ci/archive/20231116/202311161458.W0Ln92Vl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311161458.W0Ln92Vl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311161458.W0Ln92Vl-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/nfsd/vfs.o: in function `nfsd_read_splice_ok':
>> vfs.c:(.text+0x1960): undefined reference to `svcauth_gss_flavor'
   arm-linux-gnueabi-ld: fs/nfsd/vfs.o: in function `nfsd_read':
   vfs.c:(.text+0x19fc): undefined reference to `svcauth_gss_flavor'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
