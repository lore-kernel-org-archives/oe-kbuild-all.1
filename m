Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04D21381
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 00:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685753651; x=1717289651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EIjkafg3KOgvMjZpVA0UPLKCSoFYIhVUn1xB0DzoEss=;
  b=ZNPREaolDFC8um5GltDrygtUty6a71PEruFTpwWJWA82jZZA/7JQrZ8v
   /t8GBOHgxfZO3pqhtIjLdiWP6kfuFnEf7RsWvKJdWzFzu/KcA7KIciEEt
   ib+YaFfiP88xUVTarEWznhxYHKDkjTh/z2SX2nUHswy1OnbpQru4xZumL
   ltPf2B3IjQvEa5ghkIzpf2uL/L8zOFVOjAQ1KLNBZ9ovkajX/7hSZWNEc
   1guTTpN9CtrRGo5sQzLcybmjcBItlkqRl6uRNXi2IYIbGPjWuzpvEcG/i
   bbrvbQX9sqzptM7J+VcJJ/DZn2NAIT9Y5iS7BExwavt18ASbt13ShuDJO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="335628789"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="335628789"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 17:54:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="711153759"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="711153759"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 02 Jun 2023 17:54:08 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5FWy-00016X-0F;
	Sat, 03 Jun 2023 00:54:08 +0000
Date: Sat, 3 Jun 2023 08:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/fam01-next20230602 7/7]
 drivers/net/ethernet/microchip/sparx5/sparx5_psfp.c:167:31: warning: array
 subscript 4 is above array bounds of 'const struct sparx5_psfp_gce[4]'
Message-ID: <202306030848.Vd0VuRBq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/fam01-next20230602
head:   20aaaa40b39f5178aee00e3982b68ab8fd0c59a8
commit: 20aaaa40b39f5178aee00e3982b68ab8fd0c59a8 [7/7] Makefile: Enable -Warray-bounds
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230603/202306030848.Vd0VuRBq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/commit/?id=20aaaa40b39f5178aee00e3982b68ab8fd0c59a8
        git remote add gustavoars https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git
        git fetch --no-tags gustavoars testing/fam01-next20230602
        git checkout 20aaaa40b39f5178aee00e3982b68ab8fd0c59a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306030848.Vd0VuRBq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/microchip/sparx5/sparx5_psfp.c: In function 'sparx5_psfp_sg_set':
>> drivers/net/ethernet/microchip/sparx5/sparx5_psfp.c:167:31: warning: array subscript 4 is above array bounds of 'const struct sparx5_psfp_gce[4]' [-Warray-bounds]
     167 |                 gce = &sg->gce[i];
         |                        ~~~~~~~^~~
   In file included from drivers/net/ethernet/microchip/sparx5/sparx5_psfp.c:8:
   drivers/net/ethernet/microchip/sparx5/sparx5_main.h:507:32: note: while referencing 'gce'
     507 |         struct sparx5_psfp_gce gce[SPX5_PSFP_GCE_CNT];
         |                                ^~~


vim +167 drivers/net/ethernet/microchip/sparx5/sparx5_psfp.c

ae3e691f34422e Daniel Machon 2023-02-02  130  
c70a5e2c3d18f2 Daniel Machon 2023-02-02  131  static int sparx5_psfp_sg_set(struct sparx5 *sparx5, u32 id,
c70a5e2c3d18f2 Daniel Machon 2023-02-02  132  			      const struct sparx5_psfp_sg *sg)
c70a5e2c3d18f2 Daniel Machon 2023-02-02  133  {
c70a5e2c3d18f2 Daniel Machon 2023-02-02  134  	u32 ips, base_lsb, base_msb, accum_time_interval = 0;
c70a5e2c3d18f2 Daniel Machon 2023-02-02  135  	const struct sparx5_psfp_gce *gce;
c70a5e2c3d18f2 Daniel Machon 2023-02-02  136  	int i;
c70a5e2c3d18f2 Daniel Machon 2023-02-02  137  
c70a5e2c3d18f2 Daniel Machon 2023-02-02  138  	ips = sparx5_psfp_ipv_to_ips(sg->ipv);
c70a5e2c3d18f2 Daniel Machon 2023-02-02  139  	base_lsb = sg->basetime.tv_sec & 0xffffffff;
c70a5e2c3d18f2 Daniel Machon 2023-02-02  140  	base_msb = sg->basetime.tv_sec >> 32;
c70a5e2c3d18f2 Daniel Machon 2023-02-02  141  
c70a5e2c3d18f2 Daniel Machon 2023-02-02  142  	/* Set stream gate id */
c70a5e2c3d18f2 Daniel Machon 2023-02-02  143  	spx5_wr(ANA_AC_SG_ACCESS_CTRL_SGID_SET(id), sparx5,
c70a5e2c3d18f2 Daniel Machon 2023-02-02  144  		ANA_AC_SG_ACCESS_CTRL);
c70a5e2c3d18f2 Daniel Machon 2023-02-02  145  
c70a5e2c3d18f2 Daniel Machon 2023-02-02  146  	/* Write AdminPSFP values */
c70a5e2c3d18f2 Daniel Machon 2023-02-02  147  	spx5_wr(sg->basetime.tv_nsec, sparx5, ANA_AC_SG_CONFIG_REG_1);
c70a5e2c3d18f2 Daniel Machon 2023-02-02  148  	spx5_wr(base_lsb, sparx5, ANA_AC_SG_CONFIG_REG_2);
c70a5e2c3d18f2 Daniel Machon 2023-02-02  149  
c70a5e2c3d18f2 Daniel Machon 2023-02-02  150  	spx5_rmw(ANA_AC_SG_CONFIG_REG_3_BASE_TIME_SEC_MSB_SET(base_msb) |
c70a5e2c3d18f2 Daniel Machon 2023-02-02  151  		ANA_AC_SG_CONFIG_REG_3_INIT_IPS_SET(ips) |
c70a5e2c3d18f2 Daniel Machon 2023-02-02  152  		ANA_AC_SG_CONFIG_REG_3_LIST_LENGTH_SET(sg->num_entries) |
c70a5e2c3d18f2 Daniel Machon 2023-02-02  153  		ANA_AC_SG_CONFIG_REG_3_INIT_GATE_STATE_SET(sg->gate_state) |
c70a5e2c3d18f2 Daniel Machon 2023-02-02  154  		ANA_AC_SG_CONFIG_REG_3_GATE_ENABLE_SET(1),
c70a5e2c3d18f2 Daniel Machon 2023-02-02  155  		ANA_AC_SG_CONFIG_REG_3_BASE_TIME_SEC_MSB |
c70a5e2c3d18f2 Daniel Machon 2023-02-02  156  		ANA_AC_SG_CONFIG_REG_3_INIT_IPS |
c70a5e2c3d18f2 Daniel Machon 2023-02-02  157  		ANA_AC_SG_CONFIG_REG_3_LIST_LENGTH |
c70a5e2c3d18f2 Daniel Machon 2023-02-02  158  		ANA_AC_SG_CONFIG_REG_3_INIT_GATE_STATE |
c70a5e2c3d18f2 Daniel Machon 2023-02-02  159  		ANA_AC_SG_CONFIG_REG_3_GATE_ENABLE,
c70a5e2c3d18f2 Daniel Machon 2023-02-02  160  		sparx5, ANA_AC_SG_CONFIG_REG_3);
c70a5e2c3d18f2 Daniel Machon 2023-02-02  161  
c70a5e2c3d18f2 Daniel Machon 2023-02-02  162  	spx5_wr(sg->cycletime, sparx5, ANA_AC_SG_CONFIG_REG_4);
c70a5e2c3d18f2 Daniel Machon 2023-02-02  163  	spx5_wr(sg->cycletimeext, sparx5, ANA_AC_SG_CONFIG_REG_5);
c70a5e2c3d18f2 Daniel Machon 2023-02-02  164  
c70a5e2c3d18f2 Daniel Machon 2023-02-02  165  	/* For each scheduling entry */
c70a5e2c3d18f2 Daniel Machon 2023-02-02  166  	for (i = 0; i < sg->num_entries; i++) {
c70a5e2c3d18f2 Daniel Machon 2023-02-02 @167  		gce = &sg->gce[i];
c70a5e2c3d18f2 Daniel Machon 2023-02-02  168  		ips = sparx5_psfp_ipv_to_ips(gce->ipv);
c70a5e2c3d18f2 Daniel Machon 2023-02-02  169  		/* hardware needs TimeInterval to be cumulative */
c70a5e2c3d18f2 Daniel Machon 2023-02-02  170  		accum_time_interval += gce->interval;
c70a5e2c3d18f2 Daniel Machon 2023-02-02  171  		/* Set gate state */
c70a5e2c3d18f2 Daniel Machon 2023-02-02  172  		spx5_wr(ANA_AC_SG_GCL_GS_CONFIG_IPS_SET(ips) |
c70a5e2c3d18f2 Daniel Machon 2023-02-02  173  			ANA_AC_SG_GCL_GS_CONFIG_GATE_STATE_SET(gce->gate_state),
c70a5e2c3d18f2 Daniel Machon 2023-02-02  174  			sparx5, ANA_AC_SG_GCL_GS_CONFIG(i));
c70a5e2c3d18f2 Daniel Machon 2023-02-02  175  
c70a5e2c3d18f2 Daniel Machon 2023-02-02  176  		/* Set time interval */
c70a5e2c3d18f2 Daniel Machon 2023-02-02  177  		spx5_wr(accum_time_interval, sparx5,
c70a5e2c3d18f2 Daniel Machon 2023-02-02  178  			ANA_AC_SG_GCL_TI_CONFIG(i));
c70a5e2c3d18f2 Daniel Machon 2023-02-02  179  
c70a5e2c3d18f2 Daniel Machon 2023-02-02  180  		/* Set maximum octets */
c70a5e2c3d18f2 Daniel Machon 2023-02-02  181  		spx5_wr(gce->maxoctets, sparx5, ANA_AC_SG_GCL_OCT_CONFIG(i));
c70a5e2c3d18f2 Daniel Machon 2023-02-02  182  	}
c70a5e2c3d18f2 Daniel Machon 2023-02-02  183  
c70a5e2c3d18f2 Daniel Machon 2023-02-02  184  	return 0;
c70a5e2c3d18f2 Daniel Machon 2023-02-02  185  }
c70a5e2c3d18f2 Daniel Machon 2023-02-02  186  

:::::: The code at line 167 was first introduced by commit
:::::: c70a5e2c3d18f2ddad0a3d912afa60a1cc7c8e27 net: microchip: sparx5: add support for PSFP stream gates

:::::: TO: Daniel Machon <daniel.machon@microchip.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
