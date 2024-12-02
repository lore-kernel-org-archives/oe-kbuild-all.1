Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6639487A7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 13:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733146348; cv=none; b=DltSAqJTGoT86jbH4pxHOfVZ6bB7eN25yQEpAdX9YAuLwdPH1GBc6pEqeMgwbE+ucJ60NLk7PtzyXlxkmwNlwouhPkpdHmns1B1HtxjSa/m1iD++UiGNYGS25PMQftHQ4Ka36xiT4Xc4DAtKG80OnaeygSLHi3zxzQIgOhmCQKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733146348; c=relaxed/simple;
	bh=9jvaB+normc+1Pktd6hfzj/vaLBdhoYfL1Sy0aP+Jr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zy0UUNiOcV3pyt2f/SZBfv1t0bTLcEfHyi6ECHHTDGXZIIPWaQWJlHdpFXBJWkhajD4tit77KipDFHwNTI0A/ZSKOrzeJKfpK0SC7b5Oihyn73vV7/auOpi4oICqWHjNZUtyj/aSOuVhKUZpAoz9jw7BoAikXoMLlUfd0+Vecvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QI6qs5VR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QI6qs5VR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733146345; x=1764682345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9jvaB+normc+1Pktd6hfzj/vaLBdhoYfL1Sy0aP+Jr8=;
  b=QI6qs5VRatUWqIDCjEGTiJppDQ/kJ7b16J9senDWuO+m/l3qFyaTHHD2
   KkC/FPxiFOEa/tv+PpJP34dq/PToGj7g8fhUnBDWKjQ5BGaOK4zLZ6Q/Y
   sKidIPQgVqvyQSYFAc/Pr4y44olEAdhqNWp7SM8DmlofVCxZMkbwpQp3j
   I79J93N1YVje1L7ToLDM9boX4wskbSIwoZhHSqngqdDmpIlXEkZI92H4z
   FZM3I4b1GtcqU702hVSCeHfw9yGbj3NerVjTcNCrYD8rqC8/Fzv6snKVt
   ln9Ae5tC4MN7wFftGpnwRrdZP3DGsZzBWUlOCav2enGD0p95fhcBpI+9f
   w==;
X-CSE-ConnectionGUID: z2cgAPdgQum1zQxv6AoR+Q==
X-CSE-MsgGUID: ZSqxn3thQMaUt2VHWVYJ2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33463821"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="33463821"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 05:32:24 -0800
X-CSE-ConnectionGUID: jKIIeCCkTyyibqg8/zJSrg==
X-CSE-MsgGUID: reoCFoKnQx6OLKR4sgKzdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="93006247"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Dec 2024 05:32:23 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI6XE-0002S6-1w;
	Mon, 02 Dec 2024 13:32:20 +0000
Date: Mon, 2 Dec 2024 21:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: Vikas Gupta <vikas.gupta@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Edwin Peer <edwin.peer@broadcom.com>,
	Michael Chan <michael.chan@broadcom.com>
Subject: drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:2883:32: error:
 '%s' directive output may be truncated writing up to 31 bytes into a region
 of size 26
Message-ID: <202412022114.TqaFj4RR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e70140ba0d2b1a30467d4af6bcfe761327b9ec95
commit: 63185eb3aa267f2844580bbd8c9c1c97516f5dbb bnxt_en: Provide stored devlink "fw" version on older firmware
date:   3 years, 1 month ago
config: x86_64-rhel-9.4-nofixup (https://download.01.org/0day-ci/archive/20241202/202412022114.TqaFj4RR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412022114.TqaFj4RR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412022114.TqaFj4RR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c: In function 'bnxt_ethtool_init':
>> drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:2883:32: error: '%s' directive output may be truncated writing up to 31 bytes into a region of size 26 [-Werror=format-truncation=]
    2883 |                          "/pkg %s", buf);
         |                                ^~   ~~~
   In function 'bnxt_get_pkgver',
       inlined from 'bnxt_ethtool_init' at drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:3723:3:
   drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:2882:17: note: 'snprintf' output between 6 and 37 bytes into a destination of size 31
    2882 |                 snprintf(bp->fw_ver_str + len, FW_VER_STR_LEN - len - 1,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2883 |                          "/pkg %s", buf);
         |                          ~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +2883 drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c

  2873	
  2874	static void bnxt_get_pkgver(struct net_device *dev)
  2875	{
  2876		struct bnxt *bp = netdev_priv(dev);
  2877		char buf[FW_VER_STR_LEN];
  2878		int len;
  2879	
  2880		if (!bnxt_get_pkginfo(dev, buf, sizeof(buf))) {
  2881			len = strlen(bp->fw_ver_str);
  2882			snprintf(bp->fw_ver_str + len, FW_VER_STR_LEN - len - 1,
> 2883				 "/pkg %s", buf);
  2884		}
  2885	}
  2886	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
