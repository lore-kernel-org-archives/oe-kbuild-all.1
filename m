Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B490E2E403
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 09:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQ9dtSZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701338313; x=1732874313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yvE7rKHQKbYDq940sx9gamIB64BMwI6Ega4ft165O20=;
  b=LQ9dtSZBwk7UrIhnZafo2lVNaMEKhMQbPrm1i/w2aAZnahqIJzunpUjt
   Ulr3aUnop6alxt7Y2bGIZMhH4jw4r8A8dMrQlGe9BnqimZVjHYfMee5p9
   jhmiyKZbSHdOSdVw5AKzpQhPiyzz/opiqNguiUv8RYV4pEEaufNgv16/I
   mhYBlC7J96XLV/hp71/ojj3gr4/gdZEs+d2w2EENPAVA2kgPkWIiXnCeM
   UWXrgjaECCnDxRM2jns3hB0IMjrdvM+aC+ND6WtzDcTAfBaC1mH9gdQp3
   3VtNg4qg4UanBgx3ReGZCLnO5PysSHDgQJYiQUWdInPrFILoiW+mlf9W0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="378328998"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="378328998"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 01:58:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="769239357"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="769239357"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Nov 2023 01:58:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8doS-0001fe-2y;
	Thu, 30 Nov 2023 09:58:28 +0000
Date: Thu, 30 Nov 2023 17:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Huan Feng <huan.feng@starfivetech.com>
Subject: drivers/crypto/starfive/jh7110-rsa.c:66:2-17: WARNING: NULL check
 before some freeing functions is not needed.
Message-ID: <202311301702.LxswfETY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: 445a4aaf5842073e4130b1d6dbe3785284d9615f crypto: starfive - Add RSA algo support
date:   5 months ago
config: arm64-randconfig-r061-20231130 (https://download.01.org/0day-ci/archive/20231130/202311301702.LxswfETY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311301702.LxswfETY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301702.LxswfETY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/starfive/jh7110-rsa.c:66:2-17: WARNING: NULL check before some freeing functions is not needed.
   drivers/crypto/starfive/jh7110-rsa.c:68:2-17: WARNING: NULL check before some freeing functions is not needed.
   drivers/crypto/starfive/jh7110-rsa.c:70:2-17: WARNING: NULL check before some freeing functions is not needed.

vim +66 drivers/crypto/starfive/jh7110-rsa.c

    62	
    63	static void starfive_rsa_free_key(struct starfive_rsa_key *key)
    64	{
    65		if (key->d)
  > 66			kfree_sensitive(key->d);
    67		if (key->e)
    68			kfree_sensitive(key->e);
    69		if (key->n)
    70			kfree_sensitive(key->n);
    71		memset(key, 0, sizeof(*key));
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
