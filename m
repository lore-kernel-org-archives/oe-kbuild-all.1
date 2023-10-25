Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B37553AE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 06:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldsF5KJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698214253; x=1729750253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q1g8aG1cn0v6RCAl+cNobKy+1JOcUwy9Jh1l0S6+jL8=;
  b=ldsF5KJqPB69m7HErf2iBfb1PMRou5KYaAzndFLZbPkEWSMfdMnM5Ypw
   TutJBn4t84UqK5gYvsn97rBuYo3vUxfFcnxqh/rbQ595FFRwEr7vqMid0
   F7Vul02QrygaZXlcvA08o/eA+u/HV/IpxyWznjcQrBZbNoq0+k9MtKgYh
   puCaTd8/2jE++ey0BMyzxysKG7hxkW/cikSD0LNFGWJAyRCVzvENNdBEg
   ObtiySEirq/oNYOgVZaE6LCF6bcxOplWMDdw18BiHrBR84K7XeP33gte6
   ZcnU6tx/uMQhSgtn97cH2sx0dpT18PdbpMTfNhgyAa1WdsXFiX1zl1cFi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="386131922"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="386131922"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 23:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="758763462"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="758763462"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Oct 2023 23:10:51 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvX6O-0008fh-2Z;
	Wed, 25 Oct 2023 06:10:48 +0000
Date: Wed, 25 Oct 2023 14:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and_clear_tmp 45/47]
 drivers/net/ethernet/mellanox/mlxsw/core_acl_flex_keys.c:170:13: warning:
 unused variable 'j'
Message-ID: <202310251417.qeEukVzo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and_clear_tmp
head:   8ff28bdbe8eb42074ec3920a5b1d49e18332aad1
commit: 17ab5a18f5479659fa82ebf9d6f63730a29ac986 [45/47] mellanox
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231025/202310251417.qeEukVzo-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310251417.qeEukVzo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310251417.qeEukVzo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlxsw/core_acl_flex_keys.c: In function 'mlxsw_afk_picker_subtract_hits':
>> drivers/net/ethernet/mellanox/mlxsw/core_acl_flex_keys.c:170:13: warning: unused variable 'j' [-Wunused-variable]
     170 |         int j;
         |             ^


vim +/j +170 drivers/net/ethernet/mellanox/mlxsw/core_acl_flex_keys.c

3f1a84e6962c7f Jiri Pirko   2017-02-03  163  
3f1a84e6962c7f Jiri Pirko   2017-02-03  164  static void mlxsw_afk_picker_subtract_hits(struct mlxsw_afk *mlxsw_afk,
3f1a84e6962c7f Jiri Pirko   2017-02-03  165  					   struct mlxsw_afk_picker *picker,
3f1a84e6962c7f Jiri Pirko   2017-02-03  166  					   int block_index)
3f1a84e6962c7f Jiri Pirko   2017-02-03  167  {
3f1a84e6962c7f Jiri Pirko   2017-02-03  168  	DECLARE_BITMAP(hits_element, MLXSW_AFK_ELEMENT_MAX);
3f1a84e6962c7f Jiri Pirko   2017-02-03  169  	int i;
3f1a84e6962c7f Jiri Pirko   2017-02-03 @170  	int j;
3f1a84e6962c7f Jiri Pirko   2017-02-03  171  
9add5f1954e979 Ido Schimmel 2020-12-06  172  	memcpy(&hits_element, &picker[block_index].element,
3f1a84e6962c7f Jiri Pirko   2017-02-03  173  	       sizeof(hits_element));
3f1a84e6962c7f Jiri Pirko   2017-02-03  174  
3f1a84e6962c7f Jiri Pirko   2017-02-03  175  	for (i = 0; i < mlxsw_afk->blocks_count; i++) {
17ab5a18f54796 Yury Norov   2023-10-20  176  		picker[i].total -= bitmap_weight_and(picker[i].element, hits_element,
17ab5a18f54796 Yury Norov   2023-10-20  177  							MLXSW_AFK_ELEMENT_MAX);
17ab5a18f54796 Yury Norov   2023-10-20  178  		bitmap_andnot(picker[i].element, picker[i].element, hits_element,
17ab5a18f54796 Yury Norov   2023-10-20  179  				MLXSW_AFK_ELEMENT_MAX);
3f1a84e6962c7f Jiri Pirko   2017-02-03  180  	}
3f1a84e6962c7f Jiri Pirko   2017-02-03  181  }
3f1a84e6962c7f Jiri Pirko   2017-02-03  182  

:::::: The code at line 170 was first introduced by commit
:::::: 3f1a84e6962c7fd0703b9bb5db0355d1c28b201a mlxsw: core: Introduce flexible keys support

:::::: TO: Jiri Pirko <jiri@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
