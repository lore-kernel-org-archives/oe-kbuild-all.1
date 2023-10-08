Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C134A210D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Oct 2023 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbWlqaPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696758957; x=1728294957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=knVQPlpf2/JcZ8zIzGQQTCzf+4MCjtgnEFoGxbLOLBk=;
  b=UbWlqaPwM7CiOckpwewIlCi776z9SOTlT75U86ITSjSdgxqDYbNoRZzL
   8A5/YKRd+BiyOvWPx5bvsNbtF8yw62v+8Xli5wIRemG6OoJf04+WR5+k1
   1i86mntIQSK2SxRLzaStv4bOnBjNvbaCvDunf5XREApLT5H3rN365YD8z
   ppAnq3wCKluvWFSG9n7vHWShMocNtfn0fker5yTLz7ERcSszsSx/iR9IW
   pz4aCjY1uZpt3gz/Q5Oz6pEaK7SOO7LhebY7dyHff1E6pHdtw9QBi2b8C
   GEfKVZUeBRKPnWk8Muj13HJlXFhIz20/YNWtlA+mbY9lWi2/LYd8cQgXY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="381250776"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="381250776"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 02:55:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="782191288"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="782191288"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Oct 2023 02:55:55 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpQVs-0005J1-3D;
	Sun, 08 Oct 2023 09:55:53 +0000
Date: Sun, 8 Oct 2023 17:55:49 +0800
From: kernel test robot <lkp@intel.com>
To: Steen Hegelund <steen.hegelund@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.c:1435:5-8:
 Unneeded variable: "err". Return "  - ENOENT" on line 1450
Message-ID: <202310081715.1G7y9I5m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b9ddbb0cde2adcedda26045cc58f31316a492215
commit: e1d597ecbe5c5d7128630d4c9ec27c42018613ed net: microchip: sparx5: Add TC template support
date:   7 months ago
config: csky-randconfig-r051-20230812 (https://download.01.org/0day-ci/archive/20231008/202310081715.1G7y9I5m-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231008/202310081715.1G7y9I5m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310081715.1G7y9I5m-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.c:1435:5-8: Unneeded variable: "err". Return "  - ENOENT" on line 1450

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
