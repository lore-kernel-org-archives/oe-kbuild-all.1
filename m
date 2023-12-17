Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FDDA29
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 00:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvH0wykX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702773370; x=1734309370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sPRa6vdVIDAJ1/JjN1gkVqYUrglicfMoN5VWWI5vpDM=;
  b=hvH0wykXMD1U9g/DCudCzIj/SZuhNcKsTBOQEUEUQCuELHKvn3hUge3B
   NXBC+u4QTKvhRRMb4pV5LFOygmTiPTggjEJAx5n6N7iysFsJavDqFNNOf
   fw+LghoyPibsDpUqlHs5vxRobevaw+IsZdt++zzg/MU0PI+NVGhIg4eK3
   BdzpUakMZ30Kg5O++rCxtVNxqFUxrfPn0OjC0lqcLXmZmq1JNKnQYhOe/
   XWiWFHykCa1j1qbQYsDU5pLQ6L0MnTWgTyPMhbgTpCFl+778909wmJPUM
   7vTd4d/Ax/nsr9DP9J/vVbiFkLR7hpCP5eUMGqpS9+dRD3vc3c+SRDvCe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="426525728"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="426525728"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 16:36:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="23289680"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2023 16:36:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEf8W-0002OU-18;
	Sun, 17 Dec 2023 00:36:04 +0000
Date: Sun, 17 Dec 2023 08:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Subject: scripts/kernel-doc: net/ipv4/udp_tunnel_nic.c:51: warning: Excess
 struct member 'entries' description in 'udp_tunnel_nic'
Message-ID: <202312170808.AQ2gRuVU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b8a9b2e6809d281890dd0a1102dc14d2cd11caf
commit: ef35bed6fad6eda8de0277eda77803c748f306d1 udp_tunnel: Use flex array to simplify code
date:   3 months ago
config: m68k-sun3x_defconfig (https://download.01.org/0day-ci/archive/20231217/202312170808.AQ2gRuVU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170808.AQ2gRuVU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170808.AQ2gRuVU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kernel-doc: net/ipv4/udp_tunnel_nic.c:51: warning: Excess struct member 'entries' description in 'udp_tunnel_nic'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
