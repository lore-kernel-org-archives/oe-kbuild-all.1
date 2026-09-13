Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EC438C415
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 21:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334589; cv=none; b=fn3bshCpotc8VfxNJ2aHrVKGRN3b6guJ2ljX/al3xFMcyshlgmoAzhJLYFtwr7nl1dawE7NHdrnqHFMzQAwXBOb8bUxdOM63fpJTnoqd3PzG8IbZK+Yxzl0umFqGU6iPffbJEb0A3XgWjIxha/VtBaEFxRquZ67Vdo80xpTiq1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334589; c=relaxed/simple;
	bh=pJHJWxWhyRCHjxWWK7l62TVT3TyMqXO8IF3Hu32SunY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KruMbo3JUd3EFR7V2z5ngKIsjwSAwGbxkCY6KKQJp5ETUZO7iG3lRjzOkKZB6ZWWXLvI8mWDDQmVLE7VWhlgilu7Y60oztXYP3UywVkbMKamGMH6/El9B9wmJKrhjFlBIbqvHB/Q1gCjRwpHE0FAnVWU769g5euTU25JXzqRFlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axHbuE30; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axHbuE30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789334588; x=1820870588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pJHJWxWhyRCHjxWWK7l62TVT3TyMqXO8IF3Hu32SunY=;
  b=axHbuE3089Re6iuNHA6R7ABtRiPbsY1XuG7Y1PtdXtz1GGcxDNGk7gm8
   xkWVf4K8zYhFMjpcj2vb1JCRvueN8raoHoHi29+mVASmcOgR8PAD5BWtZ
   49XWfc1vneBG9IX2n1c6ThXxbCcBuICHogxou2YlzjHtXfHhU3e26GD44
   KE5/i+zgiIi7n4YPTjFr1pitY4H6PTlNt4q8TWejxm+lZPqJjbBxSwQJS
   8A128YJzppXdB7V/vSE8q+1asTPGN5JvL9dOj5W6bp06XDSYxAGuH6sYS
   AST334LMXRpN8etOL2l5sEUpfvMLJyel6j3dNgKQbAys6T1iSf4b6aE1c
   A==;
X-CSE-ConnectionGUID: FaGiK/YJR1aVZaps9aLwIQ==
X-CSE-MsgGUID: zhniEjMfS/ua9v+VqaXFIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="88841326"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="88841326"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 14:23:04 -0700
X-CSE-ConnectionGUID: N1DRb8OjQD+QxciUxop3GA==
X-CSE-MsgGUID: xnFezWgdRweMcDmnpZSaVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="272441198"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Sep 2026 14:23:03 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5rf9-000000001KN-1wqJ;
	Sun, 13 Sep 2026 21:22:59 +0000
Date: Mon, 14 Sep 2026 05:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] gpib: tnt4882: fix memory leak on probe failure
Message-ID: <202609140501.8A2YYS6n-lkp@intel.com>
References: <20260913063603.1443403-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913063603.1443403-1-lgs201920130244@gmail.com>

Hi Guangshuo,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/kspp]
[also build test ERROR on linus/master kees/for-next/pstore v7.3-rc2 next-20260911]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/gpib-tnt4882-fix-memory-leak-on-probe-failure/20260913-143603
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
patch link:    https://lore.kernel.org/r/20260913063603.1443403-1-lgs201920130244%40gmail.com
patch subject: [PATCH] gpib: tnt4882: fix memory leak on probe failure
config: mips-randconfig-r132-20260914 (https://download.01.org/0day-ci/archive/20260914/202609140501.8A2YYS6n-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 148ee2b266b73a49f1f31d0bd17d4818b91bee9f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609140501.8A2YYS6n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609140501.8A2YYS6n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpib/tnt4882/tnt4882_gpib.c:1588:2: error: use of undeclared identifier 'ret'
    1588 |         ret = ni_gpib_config(link);
         |         ^~~
   drivers/gpib/tnt4882/tnt4882_gpib.c:1589:6: error: use of undeclared identifier 'ret'
    1589 |         if (ret) {
         |             ^~~
   drivers/gpib/tnt4882/tnt4882_gpib.c:1594:9: error: use of undeclared identifier 'ret'
    1594 |         return ret;
         |                ^~~
   3 errors generated.


vim +/ret +1588 drivers/gpib/tnt4882/tnt4882_gpib.c

  1557	
  1558	/*
  1559	 * ni_gpib_probe() creates an "instance" of the driver, allocating
  1560	 * local data structures for one device.  The device is registered
  1561	 * with Card Services.
  1562	 */
  1563	
  1564	static int ni_gpib_probe(struct pcmcia_device *link)
  1565	{
  1566		struct local_info_t *info;
  1567		//struct struct gpib_board *dev;
  1568	
  1569		/* Allocate space for private device-specific data */
  1570		info = kzalloc_obj(*info);
  1571		if (!info)
  1572			return -ENOMEM;
  1573	
  1574		info->p_dev = link;
  1575		link->priv = info;
  1576	
  1577		/*
  1578		 * General socket configuration defaults can go here.  In this
  1579		 * client, we assume very little, and rely on the CIS for almost
  1580		 * everything.  In most clients, many details (i.e., number, sizes,
  1581		 * and attributes of IO windows) are fixed by the nature of the
  1582		 * device, and can be hard-wired here.
  1583		 */
  1584		link->config_flags = CONF_ENABLE_IRQ | CONF_AUTO_SET_IO;
  1585	
  1586		/* Register with Card Services */
  1587		curr_dev = link;
> 1588		ret = ni_gpib_config(link);
  1589		if (ret) {
  1590			kfree(info);
  1591			link->priv = NULL;
  1592		}
  1593	
  1594		return ret;
  1595	}
  1596	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
