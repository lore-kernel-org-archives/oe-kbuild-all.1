Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFF918B494
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Mar 2025 15:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742138069; cv=none; b=Qz+CQRaVxKi3DmIBX+ujIRLoXrNafAqkvzeJyaUa/39sHr/Jd95xUiI9F2nghzYD8fUloc47W6+ZXNfjwJeaXDtpeiNjCIzC8fUI/cyr8XXK+Z/UJ2ZEmozKjGl701l3U4uM50dAlsZ+nnWv/ZsdNRlZVJePu5+vqy2Kpdx8dNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742138069; c=relaxed/simple;
	bh=nLQN+DKaGDNogM1pVGztnVdOLuWbyEy0/uL6UuLEmGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I36M2r51q6WNV2Y+v+3SBL6POZdtpxz/cxqWDSwPHGx+ppsSG7mRjeEl/JBI9ljvwvubv6pjClZ9PjUP1IqWMTjWRcHnpnAmWVUU7jeap8zu3M5oExxGAG+SY2AFFADkQlejY8v7W6t1XVYXdZqaTktP0dJqjBwIiOBzRhMMG3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2S0uZPE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2S0uZPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742138066; x=1773674066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nLQN+DKaGDNogM1pVGztnVdOLuWbyEy0/uL6UuLEmGA=;
  b=J2S0uZPEsyvy8KoIy+efrFs3mLyJzPe1nIhM2SKoe+YzI0aaLAddXuJP
   PXMP0iD08dg+aQ9or5pyBO5BXyJnSE+7fmAWDSpeAq3gZ80Zkf891yDaQ
   IL8thUO7I42A4lJunSyR9h90XB91GKltCJrrYWjrAHL+YjWUOGukmImux
   1E7/8AIkyl4Lxk94zVkZ9Iexnyoc8j7QTjGz0W1/a9rzu6nkvM0Bt+RMk
   vQG1m5OdCLfxObDbuXmx1WDzO9iOWbDnp+s1tioy11093NggNIMUR4ZEz
   bFWvDd+34VKM3z2mJi/XACBOkoNmgbI+KGATsfdsKruRzgIEjxCi/4/0o
   w==;
X-CSE-ConnectionGUID: bXFHOGuBQ2ivwRiDJFej2w==
X-CSE-MsgGUID: H4Z4T+CmTiS1Mr75XCYaOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="65701170"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="65701170"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 08:14:22 -0700
X-CSE-ConnectionGUID: WDXepsApTEKa45gKAe/cMQ==
X-CSE-MsgGUID: rroNiWvETCqw9v7nZLePdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="144911475"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 16 Mar 2025 08:14:19 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttpgv-000C3H-1J;
	Sun, 16 Mar 2025 15:14:17 +0000
Date: Sun, 16 Mar 2025 23:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1495/1495]
 drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c:119:6: sparse: sparse:
 symbol 'mlx5i_grp_sw_update_stats' was not declared. Should it be static?
Message-ID: <202503162347.VAauKjgX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d734d6bbda17b68dd3979a9f707564a18cf04761
commit: 78ebe0ea5251a234cfc5ed00b0d196c74ee7b2e4 [1495/1495] net/mlx5e: IPoIB, Add ndo stats support for IPoIB netdevices
config: x86_64-randconfig-123-20250316 (https://download.01.org/0day-ci/archive/20250316/202503162347.VAauKjgX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503162347.VAauKjgX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503162347.VAauKjgX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c:119:6: sparse: sparse: symbol 'mlx5i_grp_sw_update_stats' was not declared. Should it be static?
   drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c:119:6: warning: no previous prototype for 'mlx5i_grp_sw_update_stats' [-Wmissing-prototypes]
     119 | void mlx5i_grp_sw_update_stats(struct mlx5e_priv *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c:35:
   drivers/net/ethernet/mellanox/mlx5/core/en.h:208:19: warning: 'mlx5e_priv_flags' defined but not used [-Wunused-const-variable=]
     208 | static const char mlx5e_priv_flags[][ETH_GSTRING_LEN] = {
         |                   ^~~~~~~~~~~~~~~~

vim +/mlx5i_grp_sw_update_stats +119 drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c

   118	
 > 119	void mlx5i_grp_sw_update_stats(struct mlx5e_priv *priv)
   120	{
   121		struct mlx5e_sw_stats s = { 0 };
   122		int i, j;
   123	
   124		for (i = 0; i < priv->profile->max_nch(priv->mdev); i++) {
   125			struct mlx5e_channel_stats *channel_stats;
   126			struct mlx5e_rq_stats *rq_stats;
   127	
   128			channel_stats = &priv->channel_stats[i];
   129			rq_stats = &channel_stats->rq;
   130	
   131			s.rx_packets += rq_stats->packets;
   132			s.rx_bytes   += rq_stats->bytes;
   133	
   134			for (j = 0; j < priv->max_opened_tc; j++) {
   135				struct mlx5e_sq_stats *sq_stats = &channel_stats->sq[j];
   136	
   137				s.tx_packets           += sq_stats->packets;
   138				s.tx_bytes             += sq_stats->bytes;
   139				s.tx_queue_dropped     += sq_stats->dropped;
   140			}
   141		}
   142	
   143		memcpy(&priv->stats.sw, &s, sizeof(s));
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
