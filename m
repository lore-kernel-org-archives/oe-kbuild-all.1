Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FF429AB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 19:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693250478; x=1724786478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OBdyRGusaQ4fyPaF3YBTs7k/s+LjoQ3qnTlbcdJwzEM=;
  b=SRG06UhHuy8Mg1MbBH2w1fwUh3Uy2UtxeVMfzHajYdndwdchtgY5YyoD
   YY8tb08pRN/2E8iXIT+AlQOxc6zvXv2adVkr61PSuGijHls7XuSgFnYUT
   KSHMDonMFebz6kPonSbgII6Dv6/anhOcXrONo/rJ5LM95jAPU/Oo6YVUy
   JioV4gPfzY7dWbOYBVPeFtUmKQ785CIMB6UVTOaD6bqU7/f3zs0Qhcnps
   stEzGgMQgXo8MNSgu/OYaR2KVAycxFWGSE7llwkEwYORM7Q4PsKMCecAU
   PTJ7Q42u55tWenWOExW2WJz0SdZNeTVh90DcMaIbCFniaOL0PfumIDfBo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="377914183"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="377914183"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 12:21:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="738377995"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="738377995"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 28 Aug 2023 12:21:16 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qahnX-000883-2p;
	Mon, 28 Aug 2023 19:21:15 +0000
Date: Tue, 29 Aug 2023 03:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>, linux-doc@vger.kernel.org
Subject: [pinchartl:rpi/v6.5/isp/v2 15/23] htmldocs: Warning:
 Documentation/userspace-api/media/v4l/pixfmt-meta-bcm2835-isp-stats.rst
 references a file that doesn't exist:
 Documentation/media/uapi/fdl-appendix.rst
Message-ID: <202308290313.VZN5q3gd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rpi/v6.5/isp/v2
head:   f21e9808068119a1ea8f1ddb5677c982b79ac10d
commit: 40cfcbab11e6b48381a533ab69ddf8aea7a7089b [15/23] media: uapi: v4l2-core: Add ISP statistics output V4L2 fourcc type
reproduce: (https://download.01.org/0day-ci/archive/20230829/202308290313.VZN5q3gd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308290313.VZN5q3gd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/userspace-api/media/v4l/pixfmt-meta-bcm2835-isp-stats.rst references a file that doesn't exist: Documentation/media/uapi/fdl-appendix.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
