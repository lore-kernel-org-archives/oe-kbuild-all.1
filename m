Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563522;
	b=Jw2ofER/IgxyKQ8WLKed491JmM7hKu+RQRL7MVZFXh/1XOoh+AQ/6tUHvuYAX53JwnhO
	 heFnBnMo4xR7TuJDaG5XJRYY+R82eUrX6rpITPCB1z4IPuU6+GwBwJU2yvfwvrJYEz1oA
	 wgajWAnh8mmQvPdjlsUY6kcqhJE9hiWzd5VDXJpERxA19AI+9U35FMTFlIT2JFMGHH+sj
	 WPHOvOZRRYKBvDCqW3twCLy5M1CfY9Fv6MDuZkb5hplxQV2MgYLCiQBEoafpZHtxaIINb
	 333VYILDNtcbbpwzeckDn6OUsC8ElkeQJCWNngMhe+GcEU1M1DZKfCxf6I3wqKxkUTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563522;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DaRMuAGVUnbMe3WHwNiyBpguB53hcsq3ohlzg567BvI=;
	b=BRhuJDjgQ3FcF6EnfIF1qZ+8Yp7AL46v7yiZ6gpnkp0vT91riuYaicY5WNhORcZMSs55
	 vpDt0sMg1RE+3dA+40nMrnrRnOUy9nSSOFdDVbbu0/MqoG/Mytw1pFYYr07PfEOguwdDh
	 aX2BPA6bhZCDLD7+1CDI7E2Sszkhn3b/i0rHDZAl8bb8YPdMGZ8EQzF2I2/YrhprWceIo
	 obQS/0WMbAQOgFiLG+erkj2l3CjsSAJAA5h0E4C45rQGtbnzDmPLNr5XA8PdL7YYEKMQB
	 8kqSor6CrVxV6bxihrsn2lRBONoRJgp5XHrQrGefgmL+na13A9/09seUbEDK2nPpEbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pi8jVNgU;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0D8606A324
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 20:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA0D8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pi8jVNgU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793563521; x=1825099521;
  h=date:from:to:cc:subject:message-id;
  bh=QfmHKT0zsdRXZphsScBBwD3AOsnznYPuqx08Wr5EfEI=;
  b=Pi8jVNgUPuLow562dnvzf4ReMCjDNZYROdncTF9F1pwIRaqapPneimU3
   9Zjv2Dx9ot8QNWXVha3zm0gKip88MzwScWUJD0Uak7X7AeoubgNF1fQAc
   nqwUxj/B0aU60vc7gUBbPXRe+METLgygZrDGygB9cTYpgCprYbgLiWrlj
   ssnsE5VWVxl85r5j11SWFEv8jiMR/IqVqcPdK05gVyCGTdqY/NMtRRpSX
   4cLx9S+VVRkB4exDTuGyEyHP3CxbQMigZEtJPiid0DTdQrwe0RF7H7B3Q
   Ik92z3QdzjfWw5dWGH1v+5I/ehLpHw6StMtwp2LMb8cOhRokbuyAAUwni
   g==;
X-CSE-ConnectionGUID: kukHBg6vTG2M4NF+a8Iqfw==
X-CSE-MsgGUID: xkZ31ll0T2WmG1l8YdzylQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2139987"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2139987"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 12:05:20 -0800
X-CSE-ConnectionGUID: pOtrwdStQ5qZpcG/jTC3Nw==
X-CSE-MsgGUID: ki+mA2WqRHKzAeoO7z4rHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="5784069"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Nov 2026 12:05:19 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNbnn-00000000fLg-489p;
	Sun, 01 Nov 2026 20:05:15 +0000
Date: Mon, 02 Nov 2026 04:04:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-04 5/5] Warning:
 drivers/gpu/drm/gma500/framebuffer.c:101 function parameter 'info' not
 described in 'psb_user_framebuffer_create'
Message-ID: <202611020302.trOo6rZZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-04
head:   ec466d24ad7b3c4a3d9875354a48e8cd2b4e1ed4
commit: 81112eaac559ccd451b3dce3bbb64d6b69083961 [5/5] drm: Pass the format info to .fb_create()
config: i386-buildonly-randconfig-1003-20261101 (https://download.01.org/0day-ci/archive/20261102/202611020302.trOo6rZZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611020302.trOo6rZZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 81112eaac559 ("drm: Pass the format info to .fb_create()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611020302.trOo6rZZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/gma500/framebuffer.c:101 function parameter 'info' not described in 'psb_user_framebuffer_create'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
