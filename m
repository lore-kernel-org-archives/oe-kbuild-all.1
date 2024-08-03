Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F97C23BE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 03:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722654361; cv=none; b=GrCluqEhWcnAKCQ5zeqbCLb3PkpBoUXlplXVhDLppp6tYklr9TrAzWJ9bNS/NUMjQVPORxTL+MB+ttQlX8D4T5bVh36SWYyAajmJFZFGGcxWMbexzQUqUCmnwBzHGPQhwRBStonD0GnWMAW5OJKunWGAdk6rHKFR/48dSZ7XKkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722654361; c=relaxed/simple;
	bh=MJchAirEDIaiLT883CwM+mae4hURzfP2kHq5SEFBhtY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BW3dvItwtkTfU+XRwLwwhfrKpiwTDgRn9T7EqCZYM6+GrRwz3mP53DLZgkNaO4PAkFcVxIRzW2gYDgbocqz1/EijaqsfJCO8+6rq+V1eq/PYoqh9d9uCER9LWqcC94uFhNjJUVdAg1kf1TIIWx1wdeePIf0olrox1GU0TFBEQWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EwOSiVVx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EwOSiVVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722654359; x=1754190359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MJchAirEDIaiLT883CwM+mae4hURzfP2kHq5SEFBhtY=;
  b=EwOSiVVxzsLbzmGnHGB280JLf/CSTg5pvDUQsYF+uw7Y0EYNhDo9o/H9
   Li8x7SppeUJ3O8nOstSWOW9AyB6xSGoHMaI25kyY626hq8PHisF1zBfIu
   Qewsb9x/adPdl/6pBvJEqIf4nh19vh+KfmcgYY+oCCUNBhPEPIjfBew4Q
   cZq0SuARlo2wPYDgxxBsSEZDhR0jWae1HC0f3OXcGoEHcnRlCp/88pmhs
   Ft4YtdwuMfmt5N4QAAoXuXPellaQZ3ZfhYmEXpeHOcmarcVoLhxcK/h3a
   JXEO7ssNmT81g8WYeCXlmhoCZ/hAvZyoHe+zfFRJy5JzVC5aGDCw9LbQn
   A==;
X-CSE-ConnectionGUID: 4aavR38bTHaOGbxZk4p39A==
X-CSE-MsgGUID: 7VNdReG8Qea2uOp56Y2wyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31311765"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="31311765"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 20:05:59 -0700
X-CSE-ConnectionGUID: MzSWdaIWSYOPiGcmR1BQUQ==
X-CSE-MsgGUID: r3UGfAGEQTeZFZaaqP5XOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="55541012"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Aug 2024 20:05:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa55f-000xuS-1x;
	Sat, 03 Aug 2024 03:05:55 +0000
Date: Sat, 3 Aug 2024 11:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.11-rc 18/40]
 drivers/net/pcs/pcs-standalone.c:14:29: warning: 'phylink_pcs_phy_ops'
 defined but not used
Message-ID: <202408031055.PDZzmJog-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.11-rc
head:   d8e30074e1ec80f1c21851b2afe96a14cd4fd151
commit: 8c2d1e597605fee9686607b3b5ebfbb150fc7378 [18/40] net: pcs: add helper module for standalone drivers
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240803/202408031055.PDZzmJog-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031055.PDZzmJog-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031055.PDZzmJog-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/pcs/pcs-standalone.c:14:29: warning: 'phylink_pcs_phy_ops' defined but not used [-Wunused-const-variable=]
      14 | static const struct phy_ops phylink_pcs_phy_ops = {
         |                             ^~~~~~~~~~~~~~~~~~~


vim +/phylink_pcs_phy_ops +14 drivers/net/pcs/pcs-standalone.c

    13	
  > 14	static const struct phy_ops phylink_pcs_phy_ops = {
    15		.owner = THIS_MODULE,
    16	};
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
