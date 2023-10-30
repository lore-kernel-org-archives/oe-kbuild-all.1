Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1763C469E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 17:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FE2iNxKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698685894; x=1730221894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KuoqDRt9k3MRNnPParNnlnURdk5oDz/rc4zklT7wAcM=;
  b=FE2iNxKn7NqgsTbyA8S/Vy6A7FBLvBD8wrm00d9atj/eik/WNzNjA9jS
   1CnHs3nLe3VQbKoDbZCA2a3O2nbTnhlYZ2GHNO9lMgBmciXMyAtTaRrNV
   Le/YiOijiIS5FiA96m1Xh2SlOtFNNNeHzo9oJvieReRUeCXd9WNrowneC
   OAkemD8eEquROfRzDVe4sEIi16InwQfiRRWBUWmUhp89NQhuexvp779wM
   QJrRRJZ2zRnm8Ili554dCSA/DdDxSSv0Rcr/UswW1Pcx7/ol3rqLCKcIw
   6i4MFYlROO73VaHvwBxgLtgYozGsudvEl7NgHdBB+PcPDA2756N9erLRw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="387006972"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="387006972"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 10:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="8410123"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Oct 2023 10:11:32 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxVnW-000DR1-0c;
	Mon, 30 Oct 2023 17:11:30 +0000
Date: Tue, 31 Oct 2023 01:10:57 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and_bit 42/49] net/smc/smc_wr.c:176:67: error: expected
 ';' before ')' token
Message-ID: <202310310018.kFaCpFTW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and_bit
head:   e670db071725933fbfbf6b9df2cc73e8f5ee0e45
commit: 6b078494a96350e43cafa589dede077d67dc3845 [42/49] net: smc: fix opencoded find_and_set_bit() in smc_wr_tx_get_free_slot_index()
config: x86_64-buildonly-randconfig-003-20231030 (https://download.01.org/0day-ci/archive/20231031/202310310018.kFaCpFTW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310310018.kFaCpFTW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310310018.kFaCpFTW-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/smc/smc_wr.c: In function 'smc_wr_tx_get_free_slot_index':
>> net/smc/smc_wr.c:176:67: error: expected ';' before ')' token
     176 |         *idx = find_and_set_bit(link->wr_tx_mask, link->wr_tx_cnt));
         |                                                                   ^
         |                                                                   ;
>> net/smc/smc_wr.c:176:67: error: expected statement before ')' token


vim +176 net/smc/smc_wr.c

   170	
   171	static inline int smc_wr_tx_get_free_slot_index(struct smc_link *link, u32 *idx)
   172	{
   173		if (!smc_link_sendable(link))
   174			return -ENOLINK;
   175	
 > 176		*idx = find_and_set_bit(link->wr_tx_mask, link->wr_tx_cnt));
   177		return *idx < link->wr_tx_cnt ? 0 : -EBUSY;
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
