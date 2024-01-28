Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381343C481
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 22:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706480929; cv=none; b=IsYFJc4oQBBfoFcM9dmEPuXTP15BgnZ17zDRQWaDqjU4H/5KMcc+X3IjYc9zfa6RC6hupl2r4RSnikXhgCgE7gWqAv+8CSfI/Rgp5hUa2S1kqHQiAJGph9khjFv35sc5UvO8FXf0k9as+LiYMhK2g7k5v1HPjOXxQD5u/2bM5F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706480929; c=relaxed/simple;
	bh=o5IQ6LGrQMNNbcENFnqeAddvFgSwxyhwo6IOUQc4tjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iI7skzEJvDx9mQr5xL1zhVX8ypYCWzWG9FjBxlOKJfv8oT3xDZG2kTCAVW/gUiZQ2AY9I52YzK4skSkZOzsHkekFsBMsbEJZ+kmWFJAKIQ88CZb93xtziz1kQPcfA5rUq8a6B5fcsc1rKbkIcjzjHssVeW0bqve/4WpmouvVn9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBd9X/aG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBd9X/aG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706480927; x=1738016927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o5IQ6LGrQMNNbcENFnqeAddvFgSwxyhwo6IOUQc4tjs=;
  b=lBd9X/aGrXCkMS/VtIKjPTQQZwb1tGOaEYESQbqowE5cliAthNwII1E+
   r1WQj78lLJbRzQVeJ1t+9hIuQpbmZiVkMOEEV+vspuG72rIURNOE2nvhK
   FSF5geRRSyZQQch6SL+gOZobK/DBLrF1q/0OAnKL8vWRNCk9/3vGnE701
   IIOuT+K2oVGNLSw3HjSHoISCqutzaUO8kfgfQ545VhW3TB/wysBV33csW
   t/jLH3N3CERLk0m1xdLBIhGmtSk16aVXD7Ofx49zlwqABShoYDWg7rqFo
   bY5tVukPi07FlQ5IWQNSxC0V2Gn7yDf5xG7FEi/FzhpyuDl/11IR68+aU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="10195558"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="10195558"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 14:28:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="3171889"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Jan 2024 14:28:46 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUDdr-0003oc-0P;
	Sun, 28 Jan 2024 22:28:43 +0000
Date: Mon, 29 Jan 2024 06:28:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-for-sev-v2 9/15] arch/x86/kernel/head_64.o: warning:
 objtool: bad .discard.noendbr entry
Message-ID: <202401290652.D4Nm0AR3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v2
head:   b8b16573b6d0090db2f530fb9c5f049650806e61
commit: ccb7a988aadbe95d51e15fdefc2cab46dbff199b [9/15] x86/head64: Move early startup code into __pitext
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240129/202401290652.D4Nm0AR3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290652.D4Nm0AR3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290652.D4Nm0AR3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head_64.o: warning: objtool: bad .discard.noendbr entry

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
