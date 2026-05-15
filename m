Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14FF3126C2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778851185; cv=none; b=idMyCjNccwW3uVSKXBs2UQRUiIpWdsmqjJYMwkkTCQ1esgItkTvwSyJqPoxqVOdplSf//Oc+FHMts+tU1OepjwW2fj5kwoOE9mvMLD97K2q3oVuiFAJNYfjMF8mvzCAymjaJUDLZBBZtj5IZZZSkJ3RQ9JDlfPJ37Y6YB2bLqjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778851185; c=relaxed/simple;
	bh=+TLqBRJ36Qu2updMYWjJvDoTi23YXKgVrx2jjqzCI8E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aF7O/ls320YTjcDCqHJwOssXhrJjg6pu19shkuUrE3N62PDLAeIgbHzEQ3Gtz1uaYKJMKfNQUOiNVQq4dkTx+0x+VJMmuZFOMfxeZS7ZssKaEdrUijcfHL9aGYunuOILYRZI8BcBsvIcLJepi3q/bZFG/brxHkq2HcM6+EMD2EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTwaPOiZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTwaPOiZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778851183; x=1810387183;
  h=date:from:to:cc:subject:message-id;
  bh=+TLqBRJ36Qu2updMYWjJvDoTi23YXKgVrx2jjqzCI8E=;
  b=CTwaPOiZzWp6swWg2aF+686uj9woKjFssMxz4veFJf64PqqX8eUgdUxw
   nL4vhizdZdv7U6bcB0ZyIju+5zfW8+v0cAt+xdKgW/WyrX4ZRIMzuaPof
   pV9BKiMnztBE7RnN8NdckAM9CqawJkYNQGl59G38Xd8HgwQASFQqfLfW8
   WA+jF19fN/9w5khRumUPMd2LhbpvzsR1gH3LYv845Ukb+Z2aTbcoL6j8d
   ECygUqF5/6MScHncqX5HaxlhGGaPciKF9bJxYbDa09zu7LYg2dXnkvqUA
   AS94zdvj+/gySpKzOpMdRPTKoO+bv8L7HdpY/HtoI0jpP2T79y2+y716I
   A==;
X-CSE-ConnectionGUID: AbyS1fnIQUufcXhCBIfX8Q==
X-CSE-MsgGUID: gwwKBBKZRRiKF94Js+iQbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90384507"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="90384507"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 06:19:40 -0700
X-CSE-ConnectionGUID: LBL3aojLQ6a2c5U5NPHJMg==
X-CSE-MsgGUID: hgYuKyadS0aml5j8E1LxQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="262447693"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 15 May 2026 06:19:39 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNsS0-000000001fn-1PR9;
	Fri, 15 May 2026 13:19:36 +0000
Date: Fri, 15 May 2026 21:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ravikanth Tuniki <ravikanth.tuniki@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>,
 Srinivas Neeli <srinivas.neeli@amd.com>,
 Harini Katakam <harini.katakam@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18_LTS 29/870] Warning: 710
Message-ID: <202605152130.0ECGmJ4G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18_LTS
head:   fb979987d554f0c8fd045b114a27a6359c9265cf
commit: e4a46b3732db2752cde2ba957c5d0f3e571add3f [29/870] net: axienet: added multichannel DMA support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260515/202605152130.0ECGmJ4G-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605152130.0ECGmJ4G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605152130.0ECGmJ4G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: 710

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
