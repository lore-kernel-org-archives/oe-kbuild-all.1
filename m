Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9972391
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 00:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727828058; cv=none; b=UqhigpZfMVpd40QX7UGfzDEq4MZwhBYt7J9F3MeKq6tI0gB8GiHJ/7vb3dCM9qnszF6yN62N43eLZlrmW7x0/4jE9V9OFckCS1Eoi5tLgAS3d0jx+4CAmkDU9X5LpLSqOZ5AD73R01HGSC9TMB9BPcproJsYjoUmBBvY+4qowJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727828058; c=relaxed/simple;
	bh=wn6qHf6D3aCCLA7ehx39ia/OIPmiT/MwazJ1BCW5Ubg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NMboGDnAgOu0L7PS0q+h3ZeZDiLR7wu5etaxgyFkGLpDhMQ+fX6QkT8/NvrSR9OxMIzGCZupMQY+jWc+R5FzddP7xkeMtDfbUfeoXQMsOeqdch/rjLDssEymJzkdhnmeDgvjdAxqOWahLl6oytETvvoRg2Z1eCpy4W1hrMU7ydI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yv8GdX8z; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yv8GdX8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727828057; x=1759364057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wn6qHf6D3aCCLA7ehx39ia/OIPmiT/MwazJ1BCW5Ubg=;
  b=Yv8GdX8zdWbrYp0oZaZgfMmHdE0SyeP7+BqSaFv/mqk+2TdQqPagygSS
   +6zsjZNhM1F6o4L4DeDEVa6Fv9jbA3UoA5lGQa5dXF/CSnK6mD5qvR5v0
   sZsy/iQOuxTd2IV/S6FaSsdH91KFD/knSkr2A96fUulAzoc6+UbqoVEqI
   aZE5GhysUXiJt9tot8QmYc809WL3JdwHhtxl37BDsxViYwVpTNjPvGf26
   aDbeU7pgt2UPYDI1efda7/ithgcP+dXCRr/q4QIVD+xHySV2WeZ+RR0F3
   NQmsliFc/NtK/xiu/wYkqXty3CQvUvVCmiCxLbwFtoDBpKE0zKE3maZhl
   w==;
X-CSE-ConnectionGUID: hXDgyIguRB2i4t5w8CZjtg==
X-CSE-MsgGUID: eK6XBAADQPyNvZfwGwcK7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="44514043"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="44514043"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 17:14:16 -0700
X-CSE-ConnectionGUID: cRGrsxzLTg+6ckYr1PAclw==
X-CSE-MsgGUID: kYVofcKFQHCte5+vzxJebA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="73952804"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Oct 2024 17:14:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svn0P-000RLY-1V;
	Wed, 02 Oct 2024 00:14:13 +0000
Date: Wed, 2 Oct 2024 08:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 73/1491] make[7]: *** No
 rule to make target 'drivers/gpu/drm/panel/panel-himax-hx83112a.o', needed
 by 'drivers/gpu/drm/panel/'.
Message-ID: <202410020824.rCpwVFtI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cong,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 5231012766cc9828fd7af0e87d481f5e95599e26 [73/1491] BACKPORT: FROMGIT: drm/panel: himax-hx83102: Break out as separate driver
config: i386-randconfig-002-20241002 (https://download.01.org/0day-ci/archive/20241002/202410020824.rCpwVFtI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020824.rCpwVFtI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020824.rCpwVFtI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[7]: *** No rule to make target 'drivers/gpu/drm/panel/panel-himax-hx83112a.o', needed by 'drivers/gpu/drm/panel/'.
   make[7]: Target 'drivers/gpu/drm/panel/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
