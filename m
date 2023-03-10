Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04677B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 04:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678422594; x=1709958594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3rYB1nqzf9D68OHKN7XBw2W/FSVw/nzHU75BPRC1Swk=;
  b=U/Hr1JrZxkBHwrywChDCouzKa0N/LHua2NXfHTHaeNFsST67vjFEaxFL
   jhlm9KF8YWVxERuPjlujVXSXE1T5qJvxzE5a93/hoMVQ04YMPdVmyiwv+
   +m7m7VfSfPMIWFElGYJweDSUq16jQxwEQc9ydaGdnM+Xgw+hWQcbZOiR+
   +V4hztB0aQTB3PcyJUW/YL9PRAtwI4jLGLoL2EFz7gBRSK7jCd48jY4Ow
   ZCNtiiOE2hbI1IjDj25IW98IDq4h7/GfA5WZjW82Madu+AezQ4wFtsdG7
   c3H9Bqdt6F7CNGz3R5eDYY0JigSY0F/asRZa2XyDr8WYhQIx8O8QIc4Bq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="324994826"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="324994826"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 20:29:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="627660813"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="627660813"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Mar 2023 20:29:53 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paUO8-0003UZ-2E;
	Fri, 10 Mar 2023 04:29:52 +0000
Date: Fri, 10 Mar 2023 12:29:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 1980/7894]
 drivers/md/dm-user.c:525:6: sparse: sparse: symbol 'message_kill' was not
 declared. Should it be static?
Message-ID: <202303101246.R6uBHhyE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   de814afe14b14bf51d89ff8c1861b7a15ef2c3b2
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 [1980/7894] ANDROID: dm: dm-user: New target that proxies BIOs to userspace
config: x86_64-randconfig-s023 (https://download.01.org/0day-ci/archive/20230310/202303101246.R6uBHhyE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-trusty-5.10
        git checkout 83bf345abc0bc06b98e906bfbb120a52446e1c43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101246.R6uBHhyE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/dm-user.c:525:6: sparse: sparse: symbol 'message_kill' was not declared. Should it be static?
   drivers/md/dm-user.c:539:5: sparse: sparse: symbol 'target_poll' was not declared. Should it be static?
   drivers/md/dm-user.c:544:6: sparse: sparse: symbol 'target_release' was not declared. Should it be static?
   drivers/md/dm-user.c:565:6: sparse: sparse: symbol 'target_put' was not declared. Should it be static?

vim +/message_kill +525 drivers/md/dm-user.c

   524	
 > 525	void message_kill(struct message *m, mempool_t *pool)
   526	{
   527		m->bio->bi_status = BLK_STS_IOERR;
   528		bio_endio(m->bio);
   529		bio_put(m->bio);
   530		mempool_free(m, pool);
   531	}
   532	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
