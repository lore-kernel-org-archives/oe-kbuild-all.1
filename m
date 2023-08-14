Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EEA5687
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 20:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692045938; x=1723581938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jct/YR07vR0VDX6MSuR0tdOm/O3N+Ev7nBhJv3F3BQ8=;
  b=aMuRiCqdZyW+adok5yo5s1MU2WoS0iAjBmi8RX2/+iKYGQA/O+TZRijS
   m5EGNpN0fQOlVSTjOgJ7f1MdFYZ0Tz1Bb3ARcEHL5zceiSAX7wCFkYSAd
   AmlxlBC5jxZxqUGFuIBGEDl/ZkAe8iRdUNZ+mdHBkoBC7D50RPqgKpKP0
   4/ax4+LlenmbC7q4nllNgxMnQaHHd4uzjJsUCBiiEc3AdXiPTmtOw89kd
   P1BNJDzkWfu1FjRlv8TymNuSRJPCSuMAVmXu5oR0clfztSKprUlI+6np2
   pcFPJgZn9qO0fzu8R8/YXbLM8rnbD0RZ17Ol8dgcj5j5M2PgWXi3nbey+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372130629"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="372130629"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 13:45:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="803584013"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="803584013"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Aug 2023 13:45:34 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVeRR-0000PT-2v;
	Mon, 14 Aug 2023 20:45:33 +0000
Date: Tue, 15 Aug 2023 04:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Sagi Grimberg <sagi@grimberg.me>
Subject: [hare-nvme:tls.v13 10/19] drivers/nvme/common/keyring.c:117:3:
 sparse: sparse: symbol 'nvme_tls_psk_prio' was not declared. Should it be
 static?
Message-ID: <202308150426.jZdYWMas-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git tls.v13
head:   ce525e34ae9d3f5ed12f23caea57c0aa2e8359ee
commit: 43e406eef32e5d5a740111f1e6ac18cacb63be4b [10/19] nvme-tcp: enable TLS handshake upcall
config: x86_64-randconfig-x061-20230815 (https://download.01.org/0day-ci/archive/20230815/202308150426.jZdYWMas-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150426.jZdYWMas-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150426.jZdYWMas-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/common/keyring.c:117:3: sparse: sparse: symbol 'nvme_tls_psk_prio' was not declared. Should it be static?

vim +/nvme_tls_psk_prio +117 drivers/nvme/common/keyring.c

4c0593cd06c15d Hannes Reinecke 2023-03-21  106  
013c04a5d46a7b Hannes Reinecke 2023-03-29  107  /*
013c04a5d46a7b Hannes Reinecke 2023-03-29  108   * NVMe PSK priority list
013c04a5d46a7b Hannes Reinecke 2023-03-29  109   *
013c04a5d46a7b Hannes Reinecke 2023-03-29  110   * 'Retained' PSKs (ie 'generated == false')
013c04a5d46a7b Hannes Reinecke 2023-03-29  111   * should be preferred to 'generated' PSKs,
013c04a5d46a7b Hannes Reinecke 2023-03-29  112   * and SHA-384 should be preferred to SHA-256.
013c04a5d46a7b Hannes Reinecke 2023-03-29  113   */
013c04a5d46a7b Hannes Reinecke 2023-03-29  114  struct nvme_tls_psk_priority_list {
013c04a5d46a7b Hannes Reinecke 2023-03-29  115  	bool generated;
013c04a5d46a7b Hannes Reinecke 2023-03-29  116  	enum nvme_tcp_tls_cipher cipher;
013c04a5d46a7b Hannes Reinecke 2023-03-29 @117  } nvme_tls_psk_prio[] = {
013c04a5d46a7b Hannes Reinecke 2023-03-29  118  	{ .generated = false,
013c04a5d46a7b Hannes Reinecke 2023-03-29  119  	  .cipher = NVME_TCP_TLS_CIPHER_SHA384, },
013c04a5d46a7b Hannes Reinecke 2023-03-29  120  	{ .generated = false,
013c04a5d46a7b Hannes Reinecke 2023-03-29  121  	  .cipher = NVME_TCP_TLS_CIPHER_SHA256, },
013c04a5d46a7b Hannes Reinecke 2023-03-29  122  	{ .generated = true,
013c04a5d46a7b Hannes Reinecke 2023-03-29  123  	  .cipher = NVME_TCP_TLS_CIPHER_SHA384, },
013c04a5d46a7b Hannes Reinecke 2023-03-29  124  	{ .generated = true,
013c04a5d46a7b Hannes Reinecke 2023-03-29  125  	  .cipher = NVME_TCP_TLS_CIPHER_SHA256, },
013c04a5d46a7b Hannes Reinecke 2023-03-29  126  };
013c04a5d46a7b Hannes Reinecke 2023-03-29  127  

:::::: The code at line 117 was first introduced by commit
:::::: 013c04a5d46a7b549c6fa9cb1b024240751e3cbe nvme-keyring: implement nvme_tls_psk_default()

:::::: TO: Hannes Reinecke <hare@suse.de>
:::::: CC: Hannes Reinecke <hare@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
