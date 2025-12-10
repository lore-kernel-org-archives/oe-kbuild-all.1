Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9C73246F1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 13:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765372287; cv=none; b=Uj5KrFiq0TdN4V+88GqJ1ZfIC1iLFyhaQ4YoG2OuzwKHGZO4M/jx0hNdPHmki3SSGbz0dOALxaUquHg1DkJaI6m1GebZC1hrQvLKvs0oXCkkxjy6JccChWksh7iXPOegLMxeopBR9OE0L7Ti/PixUNZVnWnPdFt1MHFV2R+60Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765372287; c=relaxed/simple;
	bh=89EpdBE1FE/berCCe72Bbrsp2Ji4zkZ/zSGkfoxMG0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDtAXP7D9gp9pVNIIEz84fH+B7L5XQ3Ef5W+GDuJu0x491lNwF5R2icEqAf1cxkWpEMG5zC16b28HGWPVbXX6K03w0yMQiOGMBMSvYOvLyLZSYeD4hSxJMTLnlZCi0AmDb1Cn30cpMakQRtDDienLbIu7kwm0YPlRoEtIZO+WG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCGXxySU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCGXxySU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765372285; x=1796908285;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=89EpdBE1FE/berCCe72Bbrsp2Ji4zkZ/zSGkfoxMG0A=;
  b=jCGXxySUcxBT2iGA4gnM+uM8n9yRGeonFzcQhVCh07EQ49w9byGTbLW+
   w9BfHdSsWVxE2EXo+hfccAFDUIfBKh64Zn0MslsSxZSkQe/fKHzzhf+gz
   CmuDoTWRE/ZCVFZxTpD0/q/xdKB0Ry375v7b7rpphE7I0cFTTGppgYPnv
   eBR3qaXW/I0W6kWP8VsOYBPxekaAg4R+ZWFNM1/y5O2zsf+cTGdG+QhGA
   3Fr6MEdpV919EJPbvt/qYqoG2GbIzOvZj03yyGGO9KS0madIpupfC9QtB
   oXH1iU0lvji7HnOMj0zv7JQHevGO/wmmroRT0QT+1yZpi9tfp0Q3Odlel
   g==;
X-CSE-ConnectionGUID: 3dhZgRZaQyGz4PPpGi7Tgw==
X-CSE-MsgGUID: 5ngVGbRSSbKW0S6ytFFhbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67071081"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="67071081"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 05:11:25 -0800
X-CSE-ConnectionGUID: Sn2BPvJeQKWwybbDbpt1+w==
X-CSE-MsgGUID: njYANnI3QTmxgF+OgpJepA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="233913951"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 10 Dec 2025 05:11:24 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTJyT-000000000bs-3TuG;
	Wed, 10 Dec 2025 13:11:21 +0000
Date: Wed, 10 Dec 2025 14:10:29 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, =?utf-8?B?6Zer5rW35rab?= <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] fs/nfs/dir.c:1498:6: warning: no
 previous prototype for 'nfs_check_have_lookup_cache_flag'
Message-ID: <202512101401.oMRwRHrx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi 闫海涛,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b7a3f4f16ebfb6b033fe4f7de8908062eb84a55b
commit: 18e360871c3f648ecb0d8cc9b23fd4268a64c17f [3508/3508] add enfs feature
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251210/202512101401.oMRwRHrx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101401.oMRwRHrx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101401.oMRwRHrx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/dir.c:1498:6: warning: no previous prototype for 'nfs_check_have_lookup_cache_flag' [-Wmissing-prototypes]
    1498 | bool nfs_check_have_lookup_cache_flag(struct nfs_server *server, int flag)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/nfs_check_have_lookup_cache_flag +1498 fs/nfs/dir.c

  1497	
> 1498	bool nfs_check_have_lookup_cache_flag(struct nfs_server *server, int flag)
  1499	{
  1500	#if IS_ENABLED(CONFIG_ENFS)
  1501		return enfs_check_have_lookup_cache_flag(server, flag);
  1502	#else
  1503		return (server->flags & NFS_MOUNT_LOOKUP_CACHE_NONE);
  1504	#endif
  1505	}
  1506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
