Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA04328FC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 17:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728925978; cv=none; b=dhcAesltz+8SuFIzxj5E8sDbdW6HaZwilgwQI0wKXo54XK7Cz2sd+YPwUZzCI3yBmMd1uqQOqrgnuTKOZtS661Wrgk3MdCsv0MHRDzeiw+YulRfA6tNQytIJ24EJOlJtYVikbhZjeujzHHjROntdZRhnoXeYjGBcFP+Kamds/Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728925978; c=relaxed/simple;
	bh=XpyL8miAvIaCVJ4kEzEYz6AANgdKa/4vy3/I3PjVA1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lO2KwDKA1e/MKX8p9QWuKLuGhv7YwoKa3ruQF2Mk/JUWMOszAEmw03dDyFU9uhllk4nGFp8yLhu1g/N3vvym6CfLWsRl3VNMYR6djKzjaXOWMoegEkmGnKUxMaMkRqyCzfOiBE53OnllCSJul/82zm5rz9aCd/JmlGKmnIv2vDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjQyx50N; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjQyx50N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728925977; x=1760461977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XpyL8miAvIaCVJ4kEzEYz6AANgdKa/4vy3/I3PjVA1g=;
  b=cjQyx50NIsOsGHj9+3iD/Mvx0zFCoqmC54rhQeBBOcxlgVFQZI9s2E4d
   uwtaVWkm9FdzifoCw3MlsacFUpESfc1fZzXFrdKOy2MtAp/J4ExIOqeHB
   OfMtpXTMUG9bWPAPZXpnwDdcQUlUGUH2UFcsXK0Lpqh3DqimLWnYGxJ1N
   MQdO4a4ArrtxqmuDxFxNjJdU4ryDeRTnZseol3WaQBDLg7AMkO/zRtg5L
   HGpUbuKUG4YtxQ84JKErQY3bTDuJMiZ434ug2rjAsu3KpYSiz/jHeA7fq
   SCjRDI/4KPvTNgNULF8t6UJeWDaYha06ou8I0D0GzYvGOjK84E5VJH2Xz
   g==;
X-CSE-ConnectionGUID: wPZl5kLeQ8u63ZYOwvCXsg==
X-CSE-MsgGUID: orNmm9ojRAq/xg/COS/8NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28429441"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28429441"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 10:12:57 -0700
X-CSE-ConnectionGUID: zinIF4ifT0qXEe+fdGDzhg==
X-CSE-MsgGUID: Fwh0aXXMQcOmZ7wOh5F5Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="77507782"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Oct 2024 10:12:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Ocn-000GvE-0E;
	Mon, 14 Oct 2024 17:12:53 +0000
Date: Tue, 15 Oct 2024 01:12:14 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip-rebase 1007/1105]
 drivers/gpu/drm/drm_encoder.o: warning: objtool: __drm_encoder_init()+0x1ba:
 unreachable instruction
Message-ID: <202410150324.tJbsKztq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rebase
head:   3cdd0cc9c0e53917e2c4e56b1e7256ae8923845e
commit: e962cc4082a8b039f664c174b18c5d1eb26cef48 [1007/1105] drm: add drmm_encoder_alloc()
config: x86_64-buildonly-randconfig-002-20241014 (https://download.01.org/0day-ci/archive/20241015/202410150324.tJbsKztq-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410150324.tJbsKztq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410150324.tJbsKztq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_encoder.o: warning: objtool: __drm_encoder_init()+0x1ba: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
