Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF4F4436
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 07:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719042941; cv=none; b=lFBuSY3QOhkhbbQsyW+ikkygAfVaFzWMXsse3s7oNNhIspxykdiel4KaMWyg8sKy4keddIJSknlNrKgk9p4wRCBJUlE5XqklipoQVCg1Dru8BIyqQ1bwRwLr0UEjW4qaW5XGr82AjQbByapQqg2tE4OPTqCz+LaCb+YrJcjuFQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719042941; c=relaxed/simple;
	bh=jN2MYdudZHszXTaZ+MoelIOu+8Z1jIREF9/cLQx4YSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCjNZUQsKGdcN/aSQ21Nb9JxrFBAI+buIiAkWCAZyhEAW+hjcnzRE5KvnZ0LgzOuYWh3sIAFqkw9eke7xZ3GX73euHE/YNZNBGVZ2wBeJNMj/s1LWj6RvimnFzV/k4zVqyk6xqHLwWPd6GbPUrLvZZAFTJFievwiGrnL7mgcxGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gpjpE2bB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpjpE2bB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719042940; x=1750578940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jN2MYdudZHszXTaZ+MoelIOu+8Z1jIREF9/cLQx4YSA=;
  b=gpjpE2bBlBoY4dbAw7mPBYFruEFrRB+euZykZ40kKG92E1blb4ZWOV8d
   H1oEK0MOcbedJwWhof1QxWXnGiY4vFxm+MTpdL2SjUcLd3upVgWiG1VtT
   zCcaVyDLMDQ90AxV0wgGILiA5wBLnD1ZoyDzourJ8MEjB0RnB683FUemB
   kqLnVf4r9XBzNIIuzhvMozECIa1LobBBgfrBSjJYni4/ykIRUa8Jvfu2l
   5FOrh7MZcqATfwpYdIFYz/pXngntrHvyqR0sBKHQVL6XRfbhrIkpmQyog
   RKzEImP6UwMLJGKVgMt+w6WslVKQlwOM6HwO4LNmvr8A8+D+2tckkL8Di
   w==;
X-CSE-ConnectionGUID: C/CZFtPZRqiIcqNq16QHbg==
X-CSE-MsgGUID: 8UVj39M7ThSYrQqJm4RPrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16211789"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="16211789"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 00:55:39 -0700
X-CSE-ConnectionGUID: Ja8hFGjiTVSxhmUGemKoKQ==
X-CSE-MsgGUID: q3N8oiApS5Wka3e1SCq6aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="47328799"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jun 2024 00:55:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKvax-0009QO-2N;
	Sat, 22 Jun 2024 07:55:35 +0000
Date: Sat, 22 Jun 2024 15:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:rosebush 2/5] make[4]: *** No rule to make target
 'lib/rosebush.o', needed by 'lib/lib.a'.
Message-ID: <202406221533.N9EIKiSB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache rosebush
head:   57eed781c2196dbe78dc12acbaba3620f518f65f
commit: 82133b301e90143a2e4d0c1406d8595da7690713 [2/5] rosebush: Add new data structure
config: i386-buildonly-randconfig-001-20240622 (https://download.01.org/0day-ci/archive/20240622/202406221533.N9EIKiSB-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406221533.N9EIKiSB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221533.N9EIKiSB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'lib/rosebush.o', needed by 'lib/lib.a'.
   make[4]: Target 'lib/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
