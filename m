Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B523110FE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 01:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBGnVyC4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699405842; x=1730941842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+QWSX0/yFT3WPIM4PbI2OVzirZOzX+WQdotwm6EP1io=;
  b=GBGnVyC4T2GK23Pb/84b78/Ii6twDldoxVouw6Plfl6UP7eFV9tHWEed
   evmFnoO845RNOGf+SwYJOz7JEw4fITrK/+dICpuaXqtuSHiqo3gmlnNQ0
   TzkoOfaW6gz6nK/YBFioaHsQ2lkqD9w8jcpxDxnPj7sPqrUrX9yH54Llv
   glNapVNR3+LwKL9aLpOfQoRvomVhbcKzIZAjewwd4JnRVclnI/fPObKnL
   x0NskDqVPARnle7JvVj/qmxBCMfbagfj2q485+olMqSCU+te8hUQu/qS/
   aVglSsAPO1xh5Wd8EO1LH2DorbpR+hUDXOjrW4gKxh5sG8q4la5ZggXfL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="389470791"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="389470791"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 17:10:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="762895219"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="762895219"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Nov 2023 17:10:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0X5b-0007Xa-0d;
	Wed, 08 Nov 2023 01:10:39 +0000
Date: Wed, 8 Nov 2023 09:09:54 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl_remove_empty_elem_fs 3/5] init.c:undefined
 reference to `fsverity_require_signatures'
Message-ID: <202311080854.ZOoao23P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl_remove_empty_elem_fs
head:   cc57fa42508dc4948c2d55181c1b93969f080b2a
commit: ef08bfd5d44a75aa63c121e1d57ffa19572babd3 [3/5] aio: Remove the now superfluous sentinel elements from ctl_table array
config: riscv-randconfig-002-20231108 (https://download.01.org/0day-ci/archive/20231108/202311080854.ZOoao23P-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311080854.ZOoao23P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311080854.ZOoao23P-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: fs/verity/init.o: in function `.LANCHOR0':
>> init.c:(.data+0x8): undefined reference to `fsverity_require_signatures'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
