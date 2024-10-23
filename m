Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD95912DD88
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 17:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729703936; cv=none; b=IFnapCOYnSReKPxW9AwUHRanKMyIK1rMRv+PnJgfRYkR8MQxLEhspjI/kvODPgYqYUJTF1BO2eYs7xVqN0k1W0voUBEG7Nnrgy7nWirZla/YUE6iuP1tSW2T9chF8meiYQxRcGbqlKgu+gx6xCb/C+ZxD/EObRTuOq8IfcCUQdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729703936; c=relaxed/simple;
	bh=50hoio4vln8zt22ArNp8+r45zJBiyqzc1aw4MKMcWkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KE0vx6v6GL1QEiHxRIZnGXpJMY/5g1FCKubwsVNyAGWPDtg3KPrOgQxSj8Z7ATBn2Qt0TKdKAmHYxTVx0K1kvfPV9aEv/WpmvGQZ08LImZwb3w3XwSW3vdaperAN8tgKZ4QuUb3tDsL47HeKIkxYTBIkRo8odIWJ0Hl6C8bVq5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzM2qwHc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzM2qwHc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729703935; x=1761239935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=50hoio4vln8zt22ArNp8+r45zJBiyqzc1aw4MKMcWkY=;
  b=nzM2qwHc+Ii3zxRMwj/2MaBAzAFxC1xETPBpIAbdEcskc99NavJdYASu
   YmeT7k6F5rP82C5H7JYvq6TAHNcy/xNm9XsKRdtD1Hjg5ePBvBjWpvpW8
   TvmYuvZzeUiye/r6E2yn3amayQ9d72M+IYPnpvxUniKZbi5n/IX3P9Rxd
   yY9tAJTFJW0iYlfbdgYIkZ7/CY3XPfR7GyyMjihu3Wi3aDzgnr0rBZZ72
   M6vr3P2+UKRTiRO9RfhP98FKAPqFy/k1GotXv87OyySqdegKKYZtgMGRA
   KbV7aINw3zOxuh7FFIlPBy04vCDk+53hTdOq6gX+SuF3yS0KESk9CjhUF
   Q==;
X-CSE-ConnectionGUID: hOWNetNgShSFrU1Faxy6Jw==
X-CSE-MsgGUID: YawkIj32S0WFDi0zO8p0gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29086945"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29086945"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 10:18:53 -0700
X-CSE-ConnectionGUID: WocLkVbNTKOAfpc4lT0EhQ==
X-CSE-MsgGUID: syU2caqdQbqjfId2wRg7iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85104238"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Oct 2024 10:18:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3f0S-000VCu-26;
	Wed, 23 Oct 2024 17:18:48 +0000
Date: Thu, 24 Oct 2024 01:17:58 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:crc32-lib-v1 27/30] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_SHA256 when selected by BCACHEFS_FS
Message-ID: <202410240149.s9WZdg31-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc32-lib-v1
head:   df44c9de0d037caccc2bce95125af64a941c4419
commit: 7290ac04d052de4256b4089db93f26194018aa81 [27/30] lib/crc32: make crc32c() go directly to lib
config: nios2-kismet-CONFIG_CRYPTO_SHA256-CONFIG_BCACHEFS_FS-0-0 (https://download.01.org/0day-ci/archive/20241024/202410240149.s9WZdg31-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241024/202410240149.s9WZdg31-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240149.s9WZdg31-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_SHA256 when selected by BCACHEFS_FS
   WARNING: unmet direct dependencies detected for CRYPTO_CHACHA20
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - BCACHEFS_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - BCACHEFS_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_POLY1305
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - BCACHEFS_FS [=y] && BLOCK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
