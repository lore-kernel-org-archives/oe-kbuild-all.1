Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D2B3D971
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 20:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qy9o+Ca2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697142729; x=1728678729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+r98bVVhHlBANw0plXuZxHdZZFnh/4ZDpk9JtOI5BW0=;
  b=Qy9o+Ca27m2HlYu99rCpBxaZOfZ0x7wq0bug4bhvhX2mII6z9JvKM9dc
   sAFhlrpPtUZos105HVsyvibpdFvk8i3FTH3STieryA6yLcRxIMV3QgLFc
   PzcvOXs1/1cl6GNJMTMPbxXFtJdc0Oc3v9lIL93TgXW8EqYAaVkwrxtIp
   2mWuBzVloO+nKWY93K2sqFi2qr/K+xw6bztza4OAK7hfddyEhtaFC+sX0
   j/Bbnmmwdilc7lb4YcSPyJOYHgiujp/XisQrXhQI4qareVYCsXsLbkW5n
   TOdJr7cUBnK7lq/E9keh5wBuTKFDKMZ4t82vbaYi8Gx3W8cpHAYF2gQBn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="370103790"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="370103790"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 13:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="878231717"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="878231717"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Oct 2023 13:32:05 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr2Lj-0003rD-1d;
	Thu, 12 Oct 2023 20:32:03 +0000
Date: Fri, 13 Oct 2023 04:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
	Pratyush Yadav <p.yadav@ti.com>,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-doc@vger.kernel.org
Subject: [hverkuil-media-tree:pr 135/144] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml
Message-ID: <202310130411.c66pTXjG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git pr
head:   ab87cbf35518d16b5ae456336000ad3bf6ce8d06
commit: c0f6b7e76f997fbca6047eb1607ec1a32cf31a66 [135/144] media: ti: Add CSI2RX support for J721E
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130411.c66pTXjG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130411.c66pTXjG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
