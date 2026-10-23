Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792791365;
	b=1wt1dn5hk1/zLsYMJsO0QY6JHS+itunZX9n8Ndr3mGGgH1AfM2iKlUAjtDduYzHi77bE
	 1SMZF6R4S6lfnJ/JafsBAOByToY8eq1jtaXrqlEPZSIoMneGxeMG4kAouEkPS6UqigtIT
	 mFx53Y1KyzrWoHkIKPuhmi7OG3yolPQEN4KIpUa64CaTBdYv7tyaULD88PSM47PPyoPnu
	 +QI0NqI5FF+C+dei3rmLIVyzSa7o7RYRKTSDdOfnPcX7Lh+va/wclT4I1Wle250XbS4LN
	 jN8MkQF+tmRGPIC+7uKjE9g8+K+bfKWsehHp0Hmtl+8fPgeGdVnkoTOHLgg10ym9vjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792791365;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:Cc:
	 Subject:Message-ID:User-Agent;
	bh=XpYFXx7Mj8oWh2Fx/Y+DXgCAEA5ZEjo6VtxjO/aWSNs=;
	b=aXAILuq3lhtV5O/CSSvGwPYGw58PEvzqeo3WBJjtCxVVVIX9eoSFHGQ/CBdwul0AzQqR
	 RFk3hJiywkN+TVlVMYRm5Sn7bOGnLrlI/rzah608seX5PV4Oncm2d4wFGAIMntpoR4O8A
	 NaHGFJgPvjz3OspwmHJG5FuU9jHVi1k8JrmcxuFPzmRrsbZpH2erlAqRcZudcOI6LyEVE
	 8C94QyZvgQYD8SpxeTyFeZHwwyy7OhuSrDDR8OclTWlZP33lelBvYVlR526JXS5uQuYtx
	 dpqFtktfMKBit6Fc2Mjk/sbgThuMgOHcPOITI1Q+6Z6CrinjhW53Ttcs3/r6/m9kuAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f2DHc79z;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606B8606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 21:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 606B8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f2DHc79z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792791363; x=1824327363;
  h=date:from:cc:subject:message-id;
  bh=aYMt/E/UNvOE8w8xgx+ZUGNej3JZP7mxwMofzy6N+cA=;
  b=f2DHc79zk2/vjXLhGu9YYAmBpt9kPHgeP30oR2BNSEB8/fgJB2qiagpy
   3VBjmrUzXNENXzn6Elw8+MUPO08jmYrMYF1wg06KtDN1x3nPjgOk6hfzA
   Ht8vdJEaB/RGF0rXfNJ4x68qNCIeYYN2nUx38E/tomTWI9xwTnqbyxj7H
   ro8IjPGe+xvgv18BD+IG/8c3gt+fuw6srTzXTSL4kSUCcdzpebIcPRWJh
   qRtuWk8cpjUNOro7W0uyBbbIczk0Q2W8viJO4D6plhAjCo/1+4puGEFX8
   9UGIWNPC9fTYyHLTmuN1iO0H2dwhXj1hgFaPDL4qnza84yvd9j2Kt04yD
   g==;
X-CSE-ConnectionGUID: UceWzra9S0G9FF0WxTMDRg==
X-CSE-MsgGUID: OfCh6dWFT0GjaTfSNGmskQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1566597"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1566597"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 14:36:03 -0700
X-CSE-ConnectionGUID: 3zSiyr3fSUSYGQiDDfPY8w==
X-CSE-MsgGUID: cNwqVVL3QmK/vQgeEBkyKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3807976"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Oct 2026 14:36:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKMvf-00000000THS-1vfw;
	Fri, 23 Oct 2026 21:35:59 +0000
Date: Sat, 24 Oct 2026 05:35:39 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "sys_oak" <sys_oak@intel.com>
Subject: [intel-lts:6.18/linux 52/52] Warning:
 drivers/net/pcs/pcs-xpcs.c:1523 function parameter 'skip_reset' not described
 in 'xpcs_create_mdiodev'
Message-ID: <202610240557.4RWswYSP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Michael,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   6f60c9f6344f04a699abb69dd35bc294f6c306d8
commit: 8bc3d99d56e4782d8249523be7ea84dc6c27b4c2 [52/52] net: pcs: xpcs: enable xpcs reset skipping
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20261024/202610240557.4RWswYSP-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610240557.4RWswYSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610240557.4RWswYSP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/pcs/pcs-xpcs.c:1523 function parameter 'skip_reset' not described in 'xpcs_create_mdiodev'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
