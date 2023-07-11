Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A7317FE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 18:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689099529; x=1720635529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NpqPOVn7WvtNRQXyZBK4Ctq22ILnxBTPZtBxwTkrkUE=;
  b=EuUGa/bFrObJcAzDP9yGCa9wpkNacG2T2/mtvylVRmlQZ+x7i1e9R7PC
   KCq4WPbUaud6eGItcGdlHHsGj5Hxbq7LV0jHuGewqVfp29ZpjkrSHUBTA
   z9kMgxBFw7AobSPXm05AEicCH8Nqu0k5MK6CPVr0p1QRcRkRMiRPkwJrJ
   ZFwv6R+JUXqkIXOQgd0qC2mpMYShVFU3P19GS3Qg1Oak1mV1tZEfwL3vQ
   zw5q2ImCz9KIDhYUVWJx7DMlzOR+iVkILMW43iXfSZs4iF2aZoFyc5N79
   mEil5uvzllc3ZTURln4qAjK+hVTy9e5g6aIHvhdU3wrs5P1iHKTfkNxTI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="349530186"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="349530186"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 11:09:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="724545298"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="724545298"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Jul 2023 11:09:13 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJHnU-000501-36;
	Tue, 11 Jul 2023 18:09:12 +0000
Date: Wed, 12 Jul 2023 02:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Eugene Loh <eugene.loh@oracle.com>,
	David Mc Lean <david.mclean@oracle.com>,
	Vincent Lim <vincent.lim@oracle.com>
Subject: [oracle-dtrace:v2/6.4 10/13] <stdin>:1567:2: warning: #warning
 syscall waitfd not implemented
Message-ID: <202307120251.zebCz6oT-lkp@intel.com>
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
commit: 19ce4a9705869b25a970a68669e8837cf78b1ead [10/13] waitfd: new syscall implementing waitpid() over fds
config: s390-randconfig-r044-20230711 (https://download.01.org/0day-ci/archive/20230712/202307120251.zebCz6oT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120251.zebCz6oT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120251.zebCz6oT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1567:2: warning: #warning syscall waitfd not implemented [-Wcpp]
--
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> <stdin>:1567:2: warning: #warning syscall waitfd not implemented [-Wcpp]
--
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> <stdin>:1567:2: warning: #warning syscall waitfd not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
