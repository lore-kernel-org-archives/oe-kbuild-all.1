Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA44D2C1A5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 03:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725939566; cv=none; b=HBQbwbfZeVBGZ7w4XdL3IEvK2O7vEQirtV/TGXDxSit8zrIwsQvqKwiQ3SeIZRQWHC2mI/I2h1nrpmfrhj1Cab87XEtAw6q6FKgC4Q9vlKTedbVxjXR2MynZe+XFraw6NPrgArUc+Wi3ZNoZK7uPHR/xLhGahwjdVap+qHoVIio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725939566; c=relaxed/simple;
	bh=VRwhHwaLj8rSUmo1E+yEZiU5T7F9UiPGIzZ96gK2IC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hfm+N1nH30m6aXnVSSVYM29yaUN3fJknSOoH5UCEZ5cf8UZzlsQlPDClgRDCYBLnHD5aQyDTThxLYkoHZkU4Fly9bxwii5UFuEyEaiv+UUsYIkmb/CP6uiPTccFa3/jEGQqd+tG2a9UuAYjQjS/IZLm1m66C6SnXg6IIwk2UQnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YrSTQxpO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YrSTQxpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725939565; x=1757475565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VRwhHwaLj8rSUmo1E+yEZiU5T7F9UiPGIzZ96gK2IC8=;
  b=YrSTQxpOF8zbkoeetNhu2ipFPZxh97/SbzrI4w3PFERQaad6iZOe3mRj
   KMMbMxgK0oWo7UnAKm+BcjhBCqoeLnFiLizn0oKz3yAx1qr0MNXj80NMH
   daT5x3eiKBcI+m7gCYqoBiyqixRzfmIMfjiASad2isE9jatC7wiFTlY7Q
   Pi8N15JwGLRsKbITYXoz1nYxLO+GwqQ/ecA72SkoVgxLS3eQu+wLvmrs6
   qqSyHRgvCUiRpgcjJTWpSyIgqC6i2p7a2oMpE2AfFMN2HKpX/uDrP8wbR
   B0Ld6ZnwPJCSWImnaS2Vjk/m/cQ41kzLPdFR+lW6mX64xvCLN0J6IAZ0k
   w==;
X-CSE-ConnectionGUID: MnAUB77OR4auOiVVU66Oig==
X-CSE-MsgGUID: kirlphqKTj68eD5XbR6Y1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28446412"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="28446412"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 20:39:24 -0700
X-CSE-ConnectionGUID: RTQIpypJS/ymB5oLNq964Q==
X-CSE-MsgGUID: 3VW4zCqZQ1SqHKu2N/f4Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="67179382"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Sep 2024 20:39:22 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snrio-00001u-34;
	Tue, 10 Sep 2024 03:39:18 +0000
Date: Tue, 10 Sep 2024 11:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	Christoph Hellwig <hch@lst.de>
Subject: [linux-next:master 5013/10516] fabrics.c:undefined reference to
 `nvme_tls_key_lookup'
Message-ID: <202409101122.QR4bfCmX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   100cc857359b5d731407d1038f7e76cd0e871d94
commit: 5bc46b49c828a6dfaab80b71ecb63fe76a1096d2 [5013/10516] nvme-tcp: check for invalidated or revoked key
config: powerpc-randconfig-r053-20240909 (https://download.01.org/0day-ci/archive/20240910/202409101122.QR4bfCmX-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409101122.QR4bfCmX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101122.QR4bfCmX-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/nvme/host/fabrics.o: in function `nvmf_parse_key':
>> fabrics.c:(.text+0x12b8): undefined reference to `nvme_tls_key_lookup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
