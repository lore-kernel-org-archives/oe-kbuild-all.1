Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED6A10F4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 01:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yp7D81aT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699405905; x=1730941905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yt5Lz1qZJCsnETRFFuaoTPBBUeDRXLQb0wowEMz6SWY=;
  b=Yp7D81aTpVDZdo4sYXInR5sYgWUva6kUUPKITIMjyTe4YfbsMTQ8ReY/
   VLMvsSAl20jdzpl4J574OyuTsPpZzm0Avw+PzDFrHOw75xIF96HRuSFfw
   HMVq+g3LcINAz6av5yDBeoYzNvKEhiCraqd/7BN8kvJXdzkkn3dSiMSZK
   z1elgl7gaOxW85nkVSMyqBFg09hvupJAalLtjlhcPOTxVfMT+QDDQfJKa
   8ScTvf/vhRy6rq5ZPgnOE5XfjWR0TjMS+G1+9Ng/t7HyzeCyHg9flBCBO
   E8/PMEkDDZ+uGgy3Qf7Oz7GgPTGCDRcwGHIE8Q8I8/faX4iJ0quKW5kex
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="456159491"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="456159491"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 17:11:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="739337363"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="739337363"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Nov 2023 17:11:43 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0X6a-0007Xg-1C;
	Wed, 08 Nov 2023 01:11:40 +0000
Date: Wed, 8 Nov 2023 09:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>
Subject: drivers/nvme/common/keyring.c:117:3: sparse: sparse: symbol
 'nvme_tls_psk_prio' was not declared. Should it be static?
Message-ID: <202311080803.T1Rc5Q3B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hannes,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   13d88ac54ddd1011b6e94443958e798aa06eb835
commit: be8e82caa685997b524dc7e4932853fd2fbe6199 nvme-tcp: enable TLS handshake upcall
date:   4 weeks ago
config: i386-randconfig-061-20231108 (https://download.01.org/0day-ci/archive/20231108/202311080803.T1Rc5Q3B-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311080803.T1Rc5Q3B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311080803.T1Rc5Q3B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/common/keyring.c:117:3: sparse: sparse: symbol 'nvme_tls_psk_prio' was not declared. Should it be static?

vim +/nvme_tls_psk_prio +117 drivers/nvme/common/keyring.c

3bac969b16b7bc Hannes Reinecke 2023-08-24  106  
501cc6f4aca8dc Hannes Reinecke 2023-08-24  107  /*
501cc6f4aca8dc Hannes Reinecke 2023-08-24  108   * NVMe PSK priority list
501cc6f4aca8dc Hannes Reinecke 2023-08-24  109   *
501cc6f4aca8dc Hannes Reinecke 2023-08-24  110   * 'Retained' PSKs (ie 'generated == false')
501cc6f4aca8dc Hannes Reinecke 2023-08-24  111   * should be preferred to 'generated' PSKs,
501cc6f4aca8dc Hannes Reinecke 2023-08-24  112   * and SHA-384 should be preferred to SHA-256.
501cc6f4aca8dc Hannes Reinecke 2023-08-24  113   */
501cc6f4aca8dc Hannes Reinecke 2023-08-24  114  struct nvme_tls_psk_priority_list {
501cc6f4aca8dc Hannes Reinecke 2023-08-24  115  	bool generated;
501cc6f4aca8dc Hannes Reinecke 2023-08-24  116  	enum nvme_tcp_tls_cipher cipher;
501cc6f4aca8dc Hannes Reinecke 2023-08-24 @117  } nvme_tls_psk_prio[] = {
501cc6f4aca8dc Hannes Reinecke 2023-08-24  118  	{ .generated = false,
501cc6f4aca8dc Hannes Reinecke 2023-08-24  119  	  .cipher = NVME_TCP_TLS_CIPHER_SHA384, },
501cc6f4aca8dc Hannes Reinecke 2023-08-24  120  	{ .generated = false,
501cc6f4aca8dc Hannes Reinecke 2023-08-24  121  	  .cipher = NVME_TCP_TLS_CIPHER_SHA256, },
501cc6f4aca8dc Hannes Reinecke 2023-08-24  122  	{ .generated = true,
501cc6f4aca8dc Hannes Reinecke 2023-08-24  123  	  .cipher = NVME_TCP_TLS_CIPHER_SHA384, },
501cc6f4aca8dc Hannes Reinecke 2023-08-24  124  	{ .generated = true,
501cc6f4aca8dc Hannes Reinecke 2023-08-24  125  	  .cipher = NVME_TCP_TLS_CIPHER_SHA256, },
501cc6f4aca8dc Hannes Reinecke 2023-08-24  126  };
501cc6f4aca8dc Hannes Reinecke 2023-08-24  127  

:::::: The code at line 117 was first introduced by commit
:::::: 501cc6f4aca8dc0958c4d9716f0233ba7cff4830 nvme-keyring: implement nvme_tls_psk_default()

:::::: TO: Hannes Reinecke <hare@suse.de>
:::::: CC: Keith Busch <kbusch@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
