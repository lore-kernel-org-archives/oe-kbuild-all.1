Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D16EA4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 08:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689495261; x=1721031261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LE62KD0y4St/M8PY0h1NWwh1D87YSDi5golUzrRvq5o=;
  b=Q6dRZrc6N2p2g8TkNkiCKuJH/Dc8CTzhTGTCPjCsd+YNE/s60mGULKL0
   RtrT+TEYHW9LWTwF8lI8OvI5mRIp3bT6w8ciVOGkhBKyPiSZd5lTaA70v
   kuq6DIjcPatC5+Uix3xt4kbAh6xbuxAwHi9uVWmhyCXB0DjpV59tC6Grf
   830SHSONtowhSI+DLNOtVIEBnE3l/BcuOubpkpeBj1BsT0banyr+BjLUm
   IANixiLiheQ2qlC+gbYdYuhm7jiCwwqbZ4mn0W8Ualqq0zycVn5zAueqK
   k3oziFpKg420dK2HWgFtInXAltARLNjJxvAXLPWgs/V65AlVT5kxED4Ww
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="368381951"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="368381951"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 01:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="716823944"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="716823944"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Jul 2023 01:14:20 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKwtX-0008j7-1C;
	Sun, 16 Jul 2023 08:14:19 +0000
Date: Sun, 16 Jul 2023 16:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [broonie-ci:arm64-gcs 16/46] htmldocs:
 Documentation/arch/arm64/gcs.rst: WARNING: document isn't included in any
 toctree
Message-ID: <202307161643.Pq3zjcHW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   17fe9f3a6087c12d1b09fac9759521ab14fb663b
commit: 943ea20bbf51f49bde46c3f4182730b0de1f235e [16/46] arm64/gcs: Document the ABI for Guarded Control Stacks
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161643.Pq3zjcHW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161643.Pq3zjcHW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/arch/arm64/gcs.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
