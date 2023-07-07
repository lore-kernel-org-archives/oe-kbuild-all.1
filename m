Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50E87F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 02:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688696991; x=1720232991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G8mKxqNhOOioY75s1mSGCXNBBQvfVPe/nSOvWnaoM5I=;
  b=VlqKhHKra95nr2ffQzNWOgh3E3cMfUkUb9ycIIRr86rOgxjyHJ3O3S9H
   +FiByAQjAsAd/+axFm68AKb678jC9EuN86a00ZUmKWvx2YRACfTablni+
   KelK2tfbqVpE9L7UDrvPmc9wPv8OWJqZTODuyZJESHfajQZKh5Bh7Q6d1
   0fYw52TQqfIGvVGO/R/NFGYnB6eUjp7T+swA8NQD85zEUipXF1ljJ3MkV
   2BjrHaqKwWGhhYXWHCvhwRmBtGWmVrUby9Zq7qTSp151xpIUiDjQXs8na
   ojq0x9FqjiaIbz2w3B78AdlOuF0bBniQm0AMWCnidWLk/Enim57pYFTit
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="363820172"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="363820172"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 19:29:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="754977861"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="754977861"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Jul 2023 19:29:49 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHbEC-0001hW-1Q;
	Fri, 07 Jul 2023 02:29:48 +0000
Date: Fri, 7 Jul 2023 10:28:50 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 5/11] lib/spdm.c:1046:13: warning: unused variable 'rc'
Message-ID: <202307071018.8J9QNprx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   21671618cf4911acf3b3739b6eb18a8dbb3339fe
commit: f58750814ccfe90af30399af15836363f683c09b [5/11] PCI/CMA: Authenticate devices on enumeration
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230707/202307071018.8J9QNprx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071018.8J9QNprx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071018.8J9QNprx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/spdm.c: In function 'spdm_verify_signature':
   lib/spdm.c:1041:33: error: expected '}' before ';' token
    1041 |                 .digest = digest;
         |                                 ^
   lib/spdm.c:1038:43: note: to match this '{'
    1038 |         struct public_key_signature sig = {
         |                                           ^
>> lib/spdm.c:1046:13: warning: unused variable 'rc' [-Wunused-variable]
    1046 |         int rc;
         |             ^~
   lib/spdm.c: In function 'spdm_parse_algs':
   lib/spdm.c:723:1: error: control reaches end of non-void function [-Werror=return-type]
     723 | }
         | ^
   cc1: some warnings being treated as errors


vim +/rc +1046 lib/spdm.c

a23b1538853a3b Jonathan Cameron 2022-09-06  1033  
a23b1538853a3b Jonathan Cameron 2022-09-06  1034  static int spdm_verify_signature(struct spdm_state *spdm_state, u8 *sig_ptr,
a23b1538853a3b Jonathan Cameron 2022-09-06  1035  				 u8 *digest, unsigned int digest_size)
a23b1538853a3b Jonathan Cameron 2022-09-06  1036  {
a23b1538853a3b Jonathan Cameron 2022-09-06  1037  	const struct asymmetric_key_ids *ids;
a23b1538853a3b Jonathan Cameron 2022-09-06  1038  	struct public_key_signature sig = {
a23b1538853a3b Jonathan Cameron 2022-09-06  1039  		.s = sig_ptr,
a23b1538853a3b Jonathan Cameron 2022-09-06  1040  		.s_size = spdm_state->s,
a23b1538853a3b Jonathan Cameron 2022-09-06 @1041  		.digest = digest;
a23b1538853a3b Jonathan Cameron 2022-09-06  1042  		.digest_size = digest_size;
a23b1538853a3b Jonathan Cameron 2022-09-06  1043  		.hash_algo = spdm_state->base_hash_alg_name;
a23b1538853a3b Jonathan Cameron 2022-09-06  1044  		.encoding = spdm_state->base_asym_enc;
a23b1538853a3b Jonathan Cameron 2022-09-06  1045  	};
a23b1538853a3b Jonathan Cameron 2022-09-06 @1046  	int rc;
a23b1538853a3b Jonathan Cameron 2022-09-06  1047  
a23b1538853a3b Jonathan Cameron 2022-09-06  1048  	ids = asymmetric_key_ids(spdm_state->leaf_key);
a23b1538853a3b Jonathan Cameron 2022-09-06  1049  	sig.auth_ids[0] = ids->id[0];
a23b1538853a3b Jonathan Cameron 2022-09-06  1050  	sig.auth_ids[1] = ids->id[1];
a23b1538853a3b Jonathan Cameron 2022-09-06  1051  
a23b1538853a3b Jonathan Cameron 2022-09-06  1052  	return verify_signature(spdm_state->leaf_key, &sig);
a23b1538853a3b Jonathan Cameron 2022-09-06  1053  }
a23b1538853a3b Jonathan Cameron 2022-09-06  1054  

:::::: The code at line 1046 was first introduced by commit
:::::: a23b1538853a3b7ccacd7504acb173f30efb9423 spdm: Introduce library to authenticate devices

:::::: TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
:::::: CC: Lukas Wunner <lukas@wunner.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
