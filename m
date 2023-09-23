Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D5A37A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 01:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695433928; x=1726969928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YvakwsDdlkFI/xrkSTh8DtY3nN+UfOq4kjNAtaPFx/g=;
  b=mICLpmymqislMpLH5w7leK+sv25vNdi2bYNbTNVi1jJvnWYdUYjrAfFE
   /liYrNcIPxsHkriEspfuBuqLrMGwpNkKLTN1aaxG0RIB+MDf4Oz5kuMpN
   EWvd91wl49qjEEGJzBSvZJWdutJp1hY10d3+A2xKV8p07TrB1qAAGq1sj
   t5gZ4FprQ8lYYNMr1LSpk74Hg1v6xbxDFiYVlAiuStYh7B36a79dFkCLi
   3yBpiDQp/40h8kY/J4dHSHcan9GxHkV1yJEbml1vGC1dPYe+hwQVxXIpl
   YicAO/A3dDDoIRsk3ejIgl7wENxTHBXlqIug6ND+NRxCEI6+pC6BGmWvw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="445085904"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="445085904"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 18:52:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="871454500"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="871454500"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 22 Sep 2023 18:52:06 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjroQ-0001aE-0e;
	Sat, 23 Sep 2023 01:52:02 +0000
Date: Sat, 23 Sep 2023 09:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Subject: [ardb:riscv-scalar-aes 2/11] net/xfrm/xfrm_algo.c:695:undefined
 reference to `crypto_has_aead'
Message-ID: <202309230908.OjSZfBit-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git riscv-scalar-aes
head:   06b3ab80336657b218e3d1b5c808e1f45f35d2f1
commit: 0fdcd9d0d058f5f76f3d3c69049966fcf9ab9512 [2/11] ipsec: Stop using crypto_has_alg
config: arm-socfpga_defconfig (https://download.01.org/0day-ci/archive/20230923/202309230908.OjSZfBit-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309230908.OjSZfBit-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309230908.OjSZfBit-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: net/xfrm/xfrm_algo.o: in function `xfrm_find_algo':
>> net/xfrm/xfrm_algo.c:695:(.text+0x664): undefined reference to `crypto_has_aead'


vim +695 net/xfrm/xfrm_algo.c

   676	
   677	static struct xfrm_algo_desc *xfrm_find_algo(
   678		const struct xfrm_algo_list *algo_list,
   679		int match(const struct xfrm_algo_desc *entry, const void *data),
   680		const void *data, int probe)
   681	{
   682		struct xfrm_algo_desc *list = algo_list->algs;
   683		int i, status;
   684	
   685		for (i = 0; i < algo_list->entries; i++) {
   686			if (!match(list + i, data))
   687				continue;
   688	
   689			if (list[i].available)
   690				return &list[i];
   691	
   692			if (!probe)
   693				break;
   694	
 > 695			status = algo_list->find(list[i].name, 0, 0);
   696			if (!status)
   697				break;
   698	
   699			list[i].available = status;
   700			return &list[i];
   701		}
   702		return NULL;
   703	}
   704	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
