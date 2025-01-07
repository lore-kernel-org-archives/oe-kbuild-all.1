Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F1B1EC014
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736259702; cv=none; b=r92SWDFXNtJRyOJdxufAymb0dR3XsAJitgzgGcH0/HzgEXSy9xfr3j7oxg/4ibFwE970dvE+JVP4jPFkVW9DDVmMyxxs1p7zqbXWY/jvoyqC7X2arEe35QzvE2pdeKwRyVMe00IG5cELgxEiA/W42HITrxmLg/b7V8GZ7pnNt30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736259702; c=relaxed/simple;
	bh=1yQ4f+MVcf07ti25MBmsO1NUVXFgtxug/XwVW6QF01I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Noan1AacQs1tTHYXP0NKqYStxQGcLmGxdvt2aXwbHSDNLusrtSTLE8xcqHhRBUDDPO7lYKTxfZKondCo/U8kWGKuLgsL/4zAsQaEpD1M624iGA3Hj6fxMguhdpCfdcycMsgPcXxpKPcEnCUFn06ALgjCdnvHp2kpQiaZPZp2dCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXT0ISt2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXT0ISt2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736259698; x=1767795698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1yQ4f+MVcf07ti25MBmsO1NUVXFgtxug/XwVW6QF01I=;
  b=HXT0ISt244QEYiySMFEQUQgX69AsfMG+zFMn+Bj0G6BLWiEXSoSTS2B1
   yf50/2deeHBY7C4nvS9XSYDrYprSYngIApVqdRkYB+wELxcEiKlBiQPAz
   j/nKHjYgKo5l1hVeJGf2Q1YPgXjURdSVz4Yxe7nJ7BS1tEsghjlbKCoPB
   C13kNpjAm0Qq8M8iCvamp0pIWosJjPJY/gSgUDnUgRMNJzSL7/9fc2uB9
   Jv2PTQOcPHMU8+gj8rAkqcj+ge6Y7lu1xhaUa8Z2IHemQzyK51APS+Wb5
   wMA5f/ZAUJMIWiUWEx9y3+zo50n5gEOj3Uw5RN2NFRorH8tBqruPzAROl
   w==;
X-CSE-ConnectionGUID: 3b8g00SrRsWt4O6NhnRlGA==
X-CSE-MsgGUID: vFfR9B6mTiKrv54EYtvyZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47801921"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="47801921"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 06:21:38 -0800
X-CSE-ConnectionGUID: Ocd3MDFaSkqtfxw+3oHGeA==
X-CSE-MsgGUID: X4O8aSg1Q7yFlXKZIjhd8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="102849244"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Jan 2025 06:21:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVASc-000Enf-1O;
	Tue, 07 Jan 2025 14:21:34 +0000
Date: Tue, 7 Jan 2025 22:21:00 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 1347/1347] io_uring/rsrc.c:331:6-25:
 WARNING: atomic_dec_and_test variation before object free at line 334.
Message-ID: <202501072208.DfzbLy9F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 1bb0e8728b1a31c1dc1437d45d65dbabc10cd7ec [1347/1347] io_uring: move rsrc related data, core, and commands
config: x86_64-randconfig-101-20250107 (https://download.01.org/0day-ci/archive/20250107/202501072208.DfzbLy9F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501072208.DfzbLy9F-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/rsrc.c:331:6-25: WARNING: atomic_dec_and_test variation before object free at line 334.

vim +331 io_uring/rsrc.c

   313	
   314	__cold static int io_rsrc_ref_quiesce(struct io_rsrc_data *data,
   315					      struct io_ring_ctx *ctx)
   316	{
   317		int ret;
   318	
   319		/* As we may drop ->uring_lock, other task may have started quiesce */
   320		if (data->quiesce)
   321			return -ENXIO;
   322	
   323		data->quiesce = true;
   324		do {
   325			ret = io_rsrc_node_switch_start(ctx);
   326			if (ret)
   327				break;
   328			io_rsrc_node_switch(ctx, data);
   329	
   330			/* kill initial ref, already quiesced if zero */
 > 331			if (atomic_dec_and_test(&data->refs))
   332				break;
   333			mutex_unlock(&ctx->uring_lock);
 > 334			flush_delayed_work(&ctx->rsrc_put_work);
   335			ret = wait_for_completion_interruptible(&data->done);
   336			if (!ret) {
   337				mutex_lock(&ctx->uring_lock);
   338				if (atomic_read(&data->refs) > 0) {
   339					/*
   340					 * it has been revived by another thread while
   341					 * we were unlocked
   342					 */
   343					mutex_unlock(&ctx->uring_lock);
   344				} else {
   345					break;
   346				}
   347			}
   348	
   349			atomic_inc(&data->refs);
   350			/* wait for all works potentially completing data->done */
   351			flush_delayed_work(&ctx->rsrc_put_work);
   352			reinit_completion(&data->done);
   353	
   354			ret = io_run_task_work_sig();
   355			mutex_lock(&ctx->uring_lock);
   356		} while (ret >= 0);
   357		data->quiesce = false;
   358	
   359		return ret;
   360	}
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
