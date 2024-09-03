Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4029018BBB5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 17:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725384025; cv=none; b=TDNgc6hy+L4DAQ3NFea+EinFGFYcY3jcujEjXEiwjDlbQ1OdmEyf0+QVBg3JPUMnv/dxoa7XMkUCQZgghK88end1BN0iAxOSMJCQZHn0an8wAk3vUPcVusxOaFpJx/d3Z0aV5NVt0mfgLsFLYObq6EmW1YX40fkhkb//ec5wfp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725384025; c=relaxed/simple;
	bh=NKbxx9BZLoXCm2TU9lvSiDshne3qaF+HOzlCdJQCe90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qIcqCVTPu0K1dJ8VZMKZqRvuSaGq+gMoU4l+o5HIrB+kOSh5SoTzeaS5S7Cqoloc0cUpdyW1BdeTIYwTT0JBhYMKWZgGLWZeOD9YBNs19pmcEEHIGIRB8IcmgvauFxwDQ6aMpDVbSAz9v4pYQf6IjmCVWFf8sZtOxvmLkr/WTiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMmM6tRg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMmM6tRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725384023; x=1756920023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NKbxx9BZLoXCm2TU9lvSiDshne3qaF+HOzlCdJQCe90=;
  b=jMmM6tRgHWzGOHxDhhWxTBpdZRhQ69YR1dIBUb4EIP9CNRLqtPlK2XXO
   En7evc897RgLLXdL+btJ0I7gtWjbHSI4EPEvhmZHSTaO7pc5kJiR4fSU5
   7fmmbuMEcojPmogx5a4S2iwdiMS4daiW2yrwy76FjMb7iCNUlgk0e99jX
   Adhr0QuZpvI+pdT43pbDl/TwzxdE2O8hO1C7vfd/3GUiCvxfaMBhBbYhK
   SrJYEUuZGjVsK0ak/3XcPjP0yJuQmYPh3pcDOC301/Nsl/pm8fT/vqQnq
   tfY0MFvM9vmLi1e1eieDk6Pb/aAwgXNk85nWtxQyzsgwwq7likZlstw8q
   Q==;
X-CSE-ConnectionGUID: zg5XgHjKRoKh6aFz21fCMw==
X-CSE-MsgGUID: R+h654NPT9aZXkj7Qa7AyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34664140"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="34664140"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 10:20:23 -0700
X-CSE-ConnectionGUID: GI2WzsPST5GV6KLhAYOipQ==
X-CSE-MsgGUID: NmnIm2S4RyCWX0ywEeyEkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69840876"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2024 10:20:22 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slXCV-0006xK-1R;
	Tue, 03 Sep 2024 17:20:19 +0000
Date: Wed, 4 Sep 2024 01:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Jian <liujian56@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29379/30000]
 drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:2327:6: warning: no previous
 prototype for function 'mcp251xfd_tx_obj_write_sync'
Message-ID: <202409040151.sxh3qZ5K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b7bed6628b750ffd687d1da0a170dece4b0c08bd
commit: b4eaf3e808dc2abcab55bc72df3b0d15961f33f0 [29379/30000] can: mcp251xfd: fix infinite loop when xmit fails
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240904/202409040151.sxh3qZ5K-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040151.sxh3qZ5K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040151.sxh3qZ5K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:2327:6: warning: no previous prototype for function 'mcp251xfd_tx_obj_write_sync' [-Wmissing-prototypes]
    2327 | void mcp251xfd_tx_obj_write_sync(struct work_struct *work)
         |      ^
   drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:2327:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2327 | void mcp251xfd_tx_obj_write_sync(struct work_struct *work)
         | ^
         | static 
   drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:511:1: warning: unused function 'mcp251xfd_chip_set_mode_nowait' [-Wunused-function]
     511 | mcp251xfd_chip_set_mode_nowait(const struct mcp251xfd_priv *priv,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/mcp251xfd_tx_obj_write_sync +2327 drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c

  2326	
> 2327	void mcp251xfd_tx_obj_write_sync(struct work_struct *work)
  2328	{
  2329		struct mcp251xfd_priv *priv = container_of(work, struct mcp251xfd_priv,
  2330				tx_work);
  2331		struct mcp251xfd_tx_obj *tx_obj = priv->tx_work_obj;
  2332		struct mcp251xfd_tx_ring *tx_ring = priv->tx;
  2333		int err;
  2334	
  2335		err = spi_sync(priv->spi, &tx_obj->msg);
  2336		if (err)
  2337			mcp251xfd_tx_failure_drop(priv, tx_ring, err);
  2338	}
  2339	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
