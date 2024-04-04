Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D903129E7B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 14:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712240455; cv=none; b=paFhOMgHmNxVR7XCRNu85r3oHnhmf/bZZpvf7TRI1SySHUzFegOVQ9HvqayCwdyNd2HpKQl+ZtFRmQNGe1uSgYfNQz60EQEfS/4Cv+vAe11HPGD6Q+Kdv6YU25UdS4KfF3bAo8JCC9sQWaIsjdyR2hjGDMUSJfHVhV3HjPSOgNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712240455; c=relaxed/simple;
	bh=42q+ArPwCLjNh5zcqtV6pEGdR8TalWOMqOcg+JCASOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W1ZAG0CdavWPl9+4txBYDPJZoqcSuO7be7hUlrJJnf79x9+2e13Oouz+feVeFUDu6eSmVoRmEIkyM6WDF8rgzxUYQunwFnYwu5iWpIwwONuUDkDpFe2iSzWR+roOzo0YrQP1Q78zttAmgS7cK1pR7AAp4VMfvZ2iA5KTRmm2Mu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dkQz0GzX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkQz0GzX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712240453; x=1743776453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=42q+ArPwCLjNh5zcqtV6pEGdR8TalWOMqOcg+JCASOE=;
  b=dkQz0GzXaFAf9n0J81SxohCnPFFu1l6p2TSwUcH6OE9FBqgL459AmcnX
   WnPMGaZTkEi+dB1SqYi6eR7oJ+GF3ULCGzFoREb8jQI9KrIcTotpAUoTQ
   pifbYjlE1H3w0NFXcJMCsYKEx+xGYZIV8Vh6KNrm/y2jdS013KzIxSsZx
   6YRP9RKSpWHvJYI25nGNabErUIb0/vtKSnntkqGkqOAsAPUIhs7ynnp4A
   DUcur2paybnEngarMT2u6miak/DzaGToIUVkeiEavvJnXTcnWaB1F5HIs
   suwCcOGFTtc/1wDWDavece92eqAelDy3aQy2ZBCs/QtUwStI2Ug7UFYpo
   A==;
X-CSE-ConnectionGUID: r9s/WpNwSTKfj71HX136zQ==
X-CSE-MsgGUID: h62GAPi7TlOOvDhcikxZvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7761363"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7761363"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 07:20:53 -0700
X-CSE-ConnectionGUID: HqjB21ZlSPC9kmTu77ZF4Q==
X-CSE-MsgGUID: xhSbBTNdR5ChJV0+7W7w/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="18821783"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Apr 2024 07:20:52 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsNxS-00019k-0Q;
	Thu, 04 Apr 2024 14:20:50 +0000
Date: Thu, 4 Apr 2024 22:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 4/20] include/linux/nsc_gpio.h:34:36: warning:
 'struct kiocb' declared inside parameter list will not be visible outside of
 this definition or declaration
Message-ID: <202404042212.XUGkpbhf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   434bfd4fff7ae30ffe26a2e330ed50ff5bb34ee4
commit: fe9c21429562ac632f44a86feb722e07aaa1c91e [4/20] char: convert drivers to use ->read_iter() and ->write_iter()
config: i386-buildonly-randconfig-001-20240404 (https://download.01.org/0day-ci/archive/20240404/202404042212.XUGkpbhf-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404042212.XUGkpbhf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404042212.XUGkpbhf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/leds/leds-net48xx.c:16:
>> include/linux/nsc_gpio.h:34:36: warning: 'struct kiocb' declared inside parameter list will not be visible outside of this definition or declaration
      34 | ssize_t nsc_gpio_write_iter(struct kiocb *iocb, struct iov_iter *from);
         |                                    ^~~~~
   include/linux/nsc_gpio.h:35:35: warning: 'struct kiocb' declared inside parameter list will not be visible outside of this definition or declaration
      35 | ssize_t nsc_gpio_read_iter(struct kiocb *iocb, struct iov_iter *to);
         |                                   ^~~~~


vim +34 include/linux/nsc_gpio.h

    33	
  > 34	ssize_t nsc_gpio_write_iter(struct kiocb *iocb, struct iov_iter *from);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
