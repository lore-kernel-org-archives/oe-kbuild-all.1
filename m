Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BE853A6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 09:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711185477; cv=none; b=GMlIxEjj/7BWha6opLH7c7iIGnajiZ7HDT+uEsNEk1Bqg5NqrHfCFAUShRPnv8FPCVV+agY5NOlXyn4jkKGvb2f2gcJq+cHHSDiPHd6BM3j7vGDZRPFFDnm2wnTJd+i20/5n2kau0ClpbtpR67pq17DJTf6/CPXBssJvhxkoXaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711185477; c=relaxed/simple;
	bh=sAQy3hQH4633fOteC9dkxFgkR3CcCdSL9X7NRCu/vjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LQzpK6I0vD5yCnC0cDX/4mNny4HyoJvlqdVEG+Z8VmJC/7tJfdLO4TWZZ31NgA8p3dCpPGu/R4CbVblS3NIrtXbCpAqWNOBwQoKKFjC+ZnKG1QHR4u2rR2z1z01816dwAOg/QRWfNrUADFet6pB3+e1mV4SxuBBlRwWoVtdx4ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ty73zD7o; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ty73zD7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711185475; x=1742721475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sAQy3hQH4633fOteC9dkxFgkR3CcCdSL9X7NRCu/vjE=;
  b=Ty73zD7oB7C95I3avOgrlPMFFt7JJ+uGV3bFYnWjbp/HlcFGbb/WkIYr
   rl2MfsIlI1h17+GQFl3E7BtdS/KJwfq9jh7ypXn3/j2H65g2nx0TyAdlp
   TnaCB0ZFcXIsFEDfbPk14OPkF6eTo1ZKkfeq6QBxzvhWJZ7ctdvxdlenR
   /rAl6yeFPDXy6K6Qb59HwCxu2cy/sjcgF+ureLlj9Uj9cBd9zefjS747f
   ZXuFBKubHned5NwTxxNdzR5hdKWBR5wm4QW2sIscP1aVtOmPJ+w3QxpQk
   1OVTYmsf+JxoTFYt5zv4codeQ6RMWrCM98evHPcTTIUt+v6PfPe6f7oIv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6354053"
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="6354053"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 02:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="15149245"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Mar 2024 02:17:53 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnxVf-000L1H-0w;
	Sat, 23 Mar 2024 09:17:51 +0000
Date: Sat, 23 Mar 2024 17:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Fengyan <mufengyan@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 25152/30000] drivers/net/ub/dev/ubl.c:92:1:
 warning: 'static' is not at beginning of declaration
Message-ID: <202403231743.sBKdJNRn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   459341c4b4845b283c7a884e6a0dc4bd8cdb89e6
commit: eb44201ee79cffdcf1b16759a54940dca047aae5 [25152/30000] ubl: add CONFIG_UBL definition and UBL interface
config: x86_64-randconfig-103-20240323 (https://download.01.org/0day-ci/archive/20240323/202403231743.sBKdJNRn-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403231743.sBKdJNRn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403231743.sBKdJNRn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ub/dev/ubl.c:92:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
      92 | const static struct header_ops ubl_header_ops ____cacheline_aligned = {
         | ^~~~~


vim +/static +92 drivers/net/ub/dev/ubl.c

    91	
  > 92	const static struct header_ops ubl_header_ops ____cacheline_aligned = {
    93		.create		= ubl_create_header,
    94		.parse_protocol	= ubl_header_parse_protocol,
    95	};
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
