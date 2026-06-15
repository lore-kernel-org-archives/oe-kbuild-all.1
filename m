Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FACF1E5714
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jun 2026 02:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781490489; cv=none; b=VGb70pFtlLUzhl0yJJuzVH6J/RdXUDMGZKsdqHR4z60IwJNFFBrGQ5YiI78FW279WIWGuwhVH7Tzqk9XM7aQuxZ0dzrZn7ygHEcoGe73+2AUw2FdNyBTKK1+GqM1+hNDXN5CXTxk6XJ3IYMqBaCPXNo1auw+E29HvGR3KBiL8IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781490489; c=relaxed/simple;
	bh=fSUBcpNdV6YuZv1eapUBFPYeH25p5WqRoBulcUrSoNQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fwwaMhgzfV3eUrC9+/fBo6eqiULP3Zkd4SvE4Ce2r23dPXcGFaaFkBa73Wf0ue92bv4rX0mkmJLay2NKI033l2LxR6m55JwEWRK4htSdchwknZW/40PY1c3Ri6a2lulJjhr7b8RuwUkEd+cSAZxIsXfhXxtQE3FyEaPavoBmoeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TctNyFwj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TctNyFwj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781490486; x=1813026486;
  h=date:from:to:cc:subject:message-id;
  bh=fSUBcpNdV6YuZv1eapUBFPYeH25p5WqRoBulcUrSoNQ=;
  b=TctNyFwj++y9gESctpUUwsoxwZzY3FcMKmr8qRbhXJBvYqVgS4J9vjW+
   Gu0VvdNw3PM2xeCVRz4je0EnNYPUWtQZVkrOuVHHCzE0z81gnNV8pkEzW
   SnW/ZX9uwsGlJ5kj0eqmHJUkz4oiIhw8Jn9O4O1Y4TEmnVuTSctKVVotj
   X+oO9Z1hyi5HlQeTEBsqB2wmtOnpIg9HNkBcq4ZvyL5T+W9fEjeKzA0Pl
   mh4pOLUg2lFiltCu6OgCGxu3GVZuvz9QLXiMbL59RgvUEa6y7z5s3pePZ
   SJI+/nSqw5WChq1RptbWi+aDTjIv2PsDyqrr2UxwxEC8/Z3vKpKxn3SLx
   w==;
X-CSE-ConnectionGUID: 2DCLTm6RQsyOtvT8amS8jg==
X-CSE-MsgGUID: Rxx9DSuQQKGXf/ZOCK4XhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="99801414"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="99801414"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 19:28:06 -0700
X-CSE-ConnectionGUID: gpT6CYgiQWyHf72TWPH7qg==
X-CSE-MsgGUID: yeca5qjpTIKYI9rIZMtC3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="271020553"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jun 2026 19:28:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYx3R-00000000ROK-3Jcb;
	Mon, 15 Jun 2026 02:28:01 +0000
Date: Mon, 15 Jun 2026 10:27:06 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202606151041.zcDMXyDW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: f08e7a4e8d6ac4de677727af352ea33c6ce9f444 pmdomain: mediatek: Add support for MFlexGraphics
date:   7 months ago
config: powerpc64-randconfig-r113-20260615 (https://download.01.org/0day-ci/archive/20260615/202606151041.zcDMXyDW-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606151041.zcDMXyDW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f08e7a4e8d6a ("pmdomain: mediatek: Add support for MFlexGraphics")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606151041.zcDMXyDW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] magic @@     got unsigned long @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse:     expected restricted __le32 [usertype] magic
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse:     got unsigned long
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] magic @@     got unsigned int [usertype] ipi_magic @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse:     expected restricted __le32 [usertype] magic
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse:     got unsigned int [usertype] ipi_magic
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:472:19: sparse: sparse: restricted signed int degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [assigned] [usertype] base @@     got unsigned long long [usertype] shared_mem_phys @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse:     expected restricted __le64 [assigned] [usertype] base
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse:     got unsigned long long [usertype] shared_mem_phys
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [assigned] [usertype] size @@     got unsigned int shared_mem_size @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse:     expected restricted __le32 [assigned] [usertype] size
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse:     got unsigned int shared_mem_size
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse:     expected restricted __le32 [usertype] cmd
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse:     got int
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] power_state @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse:     expected restricted __le32 [usertype] power_state
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse:     got int
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse:     expected restricted __le32 [usertype] cmd
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse:     got int
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted signed int [usertype] gpu_oppidx @@     got unsigned int opp_idx @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse:     expected restricted signed int [usertype] gpu_oppidx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse:     got unsigned int opp_idx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted signed int [usertype] stack_oppidx @@     got unsigned int opp_idx @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse:     expected restricted signed int [usertype] stack_oppidx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse:     got unsigned int opp_idx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:578:42: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:579:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:593:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:594:46: sparse: sparse: restricted __le32 degrades to integer

vim +509 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c

   504	
   505	static int mtk_mfg_power_control(struct mtk_mfg *mfg, bool enabled)
   506	{
   507		struct mtk_mfg_ipi_msg msg = {};
   508	
 > 509		msg.cmd = CMD_POWER_CONTROL;
 > 510		msg.u.power_state = enabled ? 1 : 0;
   511	
   512		return mtk_mfg_send_ipi(mfg, &msg);
   513	}
   514	
   515	static int mtk_mfg_set_oppidx(struct mtk_mfg *mfg, unsigned int opp_idx)
   516	{
   517		struct mtk_mfg_ipi_msg msg = {};
   518		int ret;
   519	
   520		if (opp_idx >= mfg->num_gpu_opps)
   521			return -EINVAL;
   522	
   523		msg.cmd = CMD_FIX_DUAL_TARGET_OPPIDX;
 > 524		msg.u.dual_commit.gpu_oppidx = opp_idx;
   525		msg.u.dual_commit.stack_oppidx = opp_idx;
   526	
   527		ret = mtk_mfg_send_ipi(mfg, &msg);
   528		if (ret) {
   529			dev_err(&mfg->pdev->dev, "Failed to set OPP %u: %pe\n",
   530				opp_idx, ERR_PTR(ret));
   531			return ret;
   532		}
   533	
   534		return 0;
   535	}
   536	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
