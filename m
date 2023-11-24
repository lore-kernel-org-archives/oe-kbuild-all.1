Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875533DB80
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 23:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZAxe41H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700869206; x=1732405206;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Wlh9x0CUjdoFiwJ/K/fm8+KLbFwEzE1Y/azu4wY2S7c=;
  b=YZAxe41HOfOWVLpXWZ2F+yte4fa5XpvtyONW784AyKg5kNb1J/KXWeSP
   9KoNdhJoM7V/i11bVjb1u8o/IgIBL/0uLq9UflDEZWHfymZ7ilPCpIdBE
   pafsyjEGUhgwBquRor7+KXG4fUCABg4rFRVpeg3CMh3bE7SVo2EaockH9
   OSPYSduzpRow2SPcJxoWNO/saxnb7X5J4A4hmtFBbhOXhvCxL2/go2pzr
   w1BquE6BTigyWTZJsCTT01KmatuJFdEAh/88xIZyLFet2Zz3yxKxJesuE
   ev1fsHOdyo2mHwWgGD+Zb/CxSSXp8FDwoCsOEd8bD6TV3AKSaXCXsNNNq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="377526709"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="377526709"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 15:40:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="761063094"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="761063094"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Nov 2023 15:40:05 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6fmE-0003OP-2s;
	Fri, 24 Nov 2023 23:40:02 +0000
Date: Sat, 25 Nov 2023 07:39:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:6.1/linux 837/2351] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
Message-ID: <202311250559.85gNz2vS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   b375c3f82247ffd48e5c37e98dafa086bc0eb81b
commit: f875ad9d3a2bbe16434ae213c35e92da42a0e107 [837/2351] drm/panel: Add driver for Novatek NT36523
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311250559.85gNz2vS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250559.85gNz2vS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
