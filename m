Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43EA23C5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 14:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692629397; x=1724165397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=he5WUNWAvMFbvRrPl4G2I8Ht7mtcPWrO6DjK29CeuAk=;
  b=DN7lR5P5oln3w7hkYvDlrG4TanNWbmeogOudTOb/UnWazyGHvLpi5nYV
   eUnGglCOeBH1JkdB7I8VpVXbq75C4/6WN187W8XA4G5unF4zMDxwdDhfA
   cvvkVnpUVz97BkF9NbH4MI4ltP2fKVPvsjTqEFLBYD+HsVM+iPIHqlYwj
   BeLw18+3AX/IfBepx/W4gcLnNzE8mx4aOMz7lgmjQosAtwtakLjzFlEj3
   xSEAHXigs9r5iA6obKxXJ5J/5uuKhyb4kn0g7rbI/m/3zGounwZeIpd3c
   mLajQyBWJM7Ba+EMxKFhWMFhb3NCp5fX31K48Xf52vBcMJ7AfAee9DAU3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="439984806"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="439984806"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 07:49:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="879530122"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2023 07:50:00 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY6DR-0000bK-2j;
	Mon, 21 Aug 2023 14:49:28 +0000
Date: Mon, 21 Aug 2023 22:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11244/11453]
 drivers/net/ethernet/mellanox/mlx5/core/en/reporter_rx.c:718:46: warning:
 '%s' directive output may be truncated writing up to 255 bytes into a region
 of size between 220 and 230
Message-ID: <202308212225.rDBrZgwf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
commit: 99b9bb7b36a7293603d8410d9228a38c32178d53 [11244/11453] Merge branch 'loongarch-next' of git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git
config: loongarch-randconfig-r032-20230821 (https://download.01.org/0day-ci/archive/20230821/202308212225.rDBrZgwf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308212225.rDBrZgwf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308212225.rDBrZgwf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/en/reporter_rx.c: In function 'mlx5e_reporter_rx_timeout':
>> drivers/net/ethernet/mellanox/mlx5/core/en/reporter_rx.c:718:46: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 220 and 230 [-Wformat-truncation=]
     718 |                  "RX timeout on channel: %d, %sRQ: 0x%x, CQ: 0x%x",
         |                                              ^~
     719 |                  rq->ix, icosq_str, rq->rqn, rq->cq.mcq.cqn);
         |                          ~~~~~~~~~            
   drivers/net/ethernet/mellanox/mlx5/core/en/reporter_rx.c:717:9: note: 'snprintf' output between 43 and 322 bytes into a destination of size 256
     717 |         snprintf(err_str, sizeof(err_str),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     718 |                  "RX timeout on channel: %d, %sRQ: 0x%x, CQ: 0x%x",
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     719 |                  rq->ix, icosq_str, rq->rqn, rq->cq.mcq.cqn);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/mellanox/mlxsw/core_thermal.c: In function 'mlxsw_thermal_gearboxes_init.constprop':
>> drivers/net/ethernet/mellanox/mlxsw/core_thermal.c:542:73: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     542 |                 snprintf(tz_name, sizeof(tz_name), "mlxsw-lc%d-gearbox%d",
         |                                                                         ^
   In function 'mlxsw_thermal_gearbox_tz_init',
       inlined from 'mlxsw_thermal_gearboxes_init.constprop' at drivers/net/ethernet/mellanox/mlxsw/core_thermal.c:610:9:
   drivers/net/ethernet/mellanox/mlxsw/core_thermal.c:542:17: note: 'snprintf' output between 19 and 31 bytes into a destination of size 20
     542 |                 snprintf(tz_name, sizeof(tz_name), "mlxsw-lc%d-gearbox%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     543 |                          gearbox_tz->slot_index, gearbox_tz->module + 1);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c: In function 'mlxsw_linecard_types_init.constprop':
>> drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:1421:9: warning: '.bin' directive output may be truncated writing 4 bytes into a region of size between 3 and 11 [-Wformat-truncation=]
    1421 |         "mellanox/lc_ini_bundle_%u_%u.bin"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:1421:9: note: in definition of macro 'MLXSW_LINECARDS_INI_BUNDLE_FILENAME_FMT'
    1421 |         "mellanox/lc_ini_bundle_%u_%u.bin"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:1421:38: note: format string is defined here
    1421 |         "mellanox/lc_ini_bundle_%u_%u.bin"
         |                                      ^~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:1434:15: note: 'snprintf' output between 31 and 39 bytes into a destination of size 37
    1434 |         err = snprintf(filename, sizeof(filename),
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1435 |                        MLXSW_LINECARDS_INI_BUNDLE_FILENAME_FMT,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1436 |                        rev->minor, rev->subminor);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +718 drivers/net/ethernet/mellanox/mlx5/core/en/reporter_rx.c

0f56d3c5d8ea7a Aya Levin   2020-02-11  702  
0a56be3c8805b5 Aya Levin   2020-02-11  703  void mlx5e_reporter_rx_timeout(struct mlx5e_rq *rq)
0a56be3c8805b5 Aya Levin   2020-02-11  704  {
521f31af004ade Aya Levin   2020-12-01  705  	char icosq_str[MLX5E_REPORTER_PER_Q_MAX_LEN] = {};
0a56be3c8805b5 Aya Levin   2020-02-11  706  	char err_str[MLX5E_REPORTER_PER_Q_MAX_LEN];
521f31af004ade Aya Levin   2020-12-01  707  	struct mlx5e_icosq *icosq = rq->icosq;
521f31af004ade Aya Levin   2020-12-01  708  	struct mlx5e_priv *priv = rq->priv;
0a56be3c8805b5 Aya Levin   2020-02-11  709  	struct mlx5e_err_ctx err_ctx = {};
0a56be3c8805b5 Aya Levin   2020-02-11  710  
0a56be3c8805b5 Aya Levin   2020-02-11  711  	err_ctx.ctx = rq;
0a56be3c8805b5 Aya Levin   2020-02-11  712  	err_ctx.recover = mlx5e_rx_reporter_timeout_recover;
0f56d3c5d8ea7a Aya Levin   2020-02-11  713  	err_ctx.dump = mlx5e_rx_reporter_dump_rq;
521f31af004ade Aya Levin   2020-12-01  714  
521f31af004ade Aya Levin   2020-12-01  715  	if (icosq)
521f31af004ade Aya Levin   2020-12-01  716  		snprintf(icosq_str, sizeof(icosq_str), "ICOSQ: 0x%x, ", icosq->sqn);
b21aef7e71de8f Joe Perches 2020-02-11  717  	snprintf(err_str, sizeof(err_str),
521f31af004ade Aya Levin   2020-12-01 @718  		 "RX timeout on channel: %d, %sRQ: 0x%x, CQ: 0x%x",
521f31af004ade Aya Levin   2020-12-01  719  		 rq->ix, icosq_str, rq->rqn, rq->cq.mcq.cqn);
0a56be3c8805b5 Aya Levin   2020-02-11  720  
0a56be3c8805b5 Aya Levin   2020-02-11  721  	mlx5e_health_report(priv, priv->rx_reporter, err_str, &err_ctx);
0a56be3c8805b5 Aya Levin   2020-02-11  722  }
0a56be3c8805b5 Aya Levin   2020-02-11  723  

:::::: The code at line 718 was first introduced by commit
:::::: 521f31af004ade74963d551a719a36ca7df0ba70 net/mlx5e: Allow RQ outside of channel context

:::::: TO: Aya Levin <ayal@nvidia.com>
:::::: CC: Saeed Mahameed <saeedm@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
