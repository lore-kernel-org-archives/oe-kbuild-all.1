Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F631E518
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 17:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689098380; x=1720634380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4pW8O8L3DWo78RKfUhPrhVIeIwvrhHqcEuT6N6iQ768=;
  b=i3uhp0hW6pFrw7H6vuj3FuEtWT/4u09gBANG4rbPQT1P51NcOiwUlAQX
   Kng0zJTv6dICDUydpeYfxT3ZZe2QsKIoUmd5NVkovTDik75wzOkfhI2B8
   Ow4ge4+HSqkWIdn82p9Q1nVDdKjDj7hPWmFWHH1KajoQ29Ztnk0I7ICcs
   TfDPxueJ/Kj1w867/MdkiWEXmK28uyossT60nq70EBLKBSz4RiIUqRt+D
   sj0/e05QdkH0Ne0vBOtBWMt8rI8AULc8cAd8EbtpEAr2L61N1W1VHhr14
   evjpzFYTHa0TVNxuNsJ+5ztqxECdgh0Yv7aaA1RYELF/0KoA5n5jKjqU3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="363557433"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="363557433"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 10:59:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="786694456"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="786694456"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Jul 2023 10:59:13 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJHdo-0004zX-2I;
	Tue, 11 Jul 2023 17:59:12 +0000
Date: Wed, 12 Jul 2023 01:58:31 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Victor Erminpour <victor.erminpour@oracle.com>
Subject: [oracle-dtrace:v2/6.4 12/13] ld: warning: CTF linking failed; output
 will have no CTF section: Type name must not be empty.
Message-ID: <202307120129.XpVk3meQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.4
head:   9b6d57638acaddc5e1016dbcfea27771df400611
commit: 2c782a4cc99b3be018204839775f690968a4124a [12/13] ctf: generate CTF information for the kernel
config: i386-randconfig-i013-20230711 (https://download.01.org/0day-ci/archive/20230712/202307120129.XpVk3meQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120129.XpVk3meQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120129.XpVk3meQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   CTF error: fs/netfs/iterator.c (2): while emitting deduplicated forward, error emitting target type from input type 1e
   CTF error: deduplicating link type emission failed for (unnamed)
>> ld: warning: CTF linking failed; output will have no CTF section: Type name must not be empty.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
