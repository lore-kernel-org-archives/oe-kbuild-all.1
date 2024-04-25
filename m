Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A627214A603
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714054862; cv=none; b=CeNIPnULD9KRqLyKTHgQO19npOelVb3bKrKbOBjzclhvslLTEmsB+JTm46W6dRaOAniZJoiYum8EadAffyDO7mFF/99ir32DaVNaCRCEVs6AYLR0cfuiz8ybzLywP6PhaNTX30ohM9RxP9QThtmYT7m+XylKVYyNMwQNWujNpCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714054862; c=relaxed/simple;
	bh=zmGu/ZotlXhiyZdFMSr7e75pOglni1FzRyrXvjHKmdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a1EmOR0z71onLdiI2GvJSgcwWmaVj3Mwgp3NJ2tt3ut/DbAq2XKikzhibEmDn+yHV6UY1qR2FIeboN0chO6pNXDVfzKrgVkcK1AeatBhi/XpqJcJPqTfZDp3LMcFt0KpTTxj4Qzf7PdDEoQ3q9O+IaFIdXxSQAl8i1h2kG3poBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+FLWjVM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+FLWjVM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714054860; x=1745590860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zmGu/ZotlXhiyZdFMSr7e75pOglni1FzRyrXvjHKmdY=;
  b=I+FLWjVMW3nDejVqI6FByngbbxHk//n/Z4+dNg9ibkP6mEV73J1PGVBh
   kf4dpmspe90wXX1AOCIS14c3BTs2Y0AcmwE5QZgDp4LqWx2uFmvJX1ESG
   oinEQzpM0SRFNKUbJYiVA5u2IOZgfb19MjcGx+5GjTOT/PR0BUooCL6So
   X00lDj416HyKhNRm/iAZEMhW3fv0t1Qd2UDNK6PSIvesBo0Yh773dVM3N
   dCyjXk4S/Xa3ngFO45GPKCd8ADY1ucIkhXhzMJPIjj7uBSl6A+17oIIpO
   cdlH6fGXFkq0Y1L6cKgR+dGgnJXn+B6vto1zNPo1fn+iSaBXCceB2AtXU
   Q==;
X-CSE-ConnectionGUID: X7sa0kOFSVqHQDCqe26QAg==
X-CSE-MsgGUID: nTVqO8atSjWPA+Hdpovzcg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9611896"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9611896"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 07:21:00 -0700
X-CSE-ConnectionGUID: z/c7F1v6R8Ky7gcI4/1r+Q==
X-CSE-MsgGUID: JFolp+hhSvm/6WYF3jXX9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="48350365"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Apr 2024 07:20:58 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzzy4-0002Q8-1v;
	Thu, 25 Apr 2024 14:20:56 +0000
Date: Thu, 25 Apr 2024 22:20:27 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [linux-next:master 4692/8170] vmlinux.o: warning: objtool:
 x509_cert_parse() falls through to next function x509_key_preparse.cold()
Message-ID: <202404252210.KJE6Uw1h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5e4f84f18c4ee9b0ccdc19e39b7de41df21699dd
commit: 5c6ca9d936654a135b459c846885e08966e5e5bf [4692/8170] X.509: Introduce scope-based x509_certificate allocation
config: x86_64-buildonly-randconfig-r005-20220106 (https://download.01.org/0day-ci/archive/20240425/202404252210.KJE6Uw1h-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404252210.KJE6Uw1h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404252210.KJE6Uw1h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: x509_cert_parse() falls through to next function x509_key_preparse.cold()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
