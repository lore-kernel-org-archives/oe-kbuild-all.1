Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239EF156CD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYMmbwaM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698135531; x=1729671531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2w4z62WHfnyMIbpQGp6Ov2OpAIMq0KgwW/M4tpSn268=;
  b=WYMmbwaMSK63dRgs9KNuG6C9sVFxgqcHNObse3ouSGvF1/Xyky5/k1/O
   /leBpb1z8KIOHSOZMU98pNoLSHdGbkaVvfKRrpgfMuwssAO9jdqKwyD4f
   IrkH/SiINjQLfu8FlKb8yEcXjmY/Md+kua2M+hWlW+2puAvHQF/xg3zHl
   JeaV5BNBtelT+m8f9C+XI9aFugIdmAy8MZP6FpwbthnY4A5nmjLABtyW6
   BtH+O38nFq6H5MLxk/6pzj+Z8nmAsk533vJyDK+zvLMeO+BnDDx1khowZ
   JTf5xE6AkINC1O/7ikIq3/lgt7p7bxTZqPLfoqr26sdjanZibdKh233+8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="366354451"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="366354451"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 01:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="734957760"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="734957760"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Oct 2023 01:18:45 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvCcd-0007hP-2A;
	Tue, 24 Oct 2023 08:18:43 +0000
Date: Tue, 24 Oct 2023 16:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [mediatek:v6.7-tmp/dts64 5/6] Error:
 arch/arm64/boot/dts/mediatek/mt8192.dtsi:1939.33-34 syntax error
Message-ID: <202310241605.K0DBxIoK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.7-tmp/dts64
head:   54ca4e2e3324018d6235eba0d83953a957dbd489
commit: a471c48abce023f2808e8c5fd3993ec7712f276d [5/6] arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231024/202310241605.K0DBxIoK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310241605.K0DBxIoK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310241605.K0DBxIoK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/mediatek/mt8192.dtsi:1939.33-34 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
