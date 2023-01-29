Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9097A17C3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 03:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674962469; x=1706498469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QFuodtrry3mZer45IEJCJsV2lM8flb6JFEvB1HrUf68=;
  b=QK7NeH0ei+MDDLAvM6t6yVm3tzoZ1+QdBEvqEZ5hbyXF2oSVf2cmACdw
   JtZfmPrHXBUUL4BBzmG8fm59wKbKwIJhLen+fEP79O9erFc2X6oSeA2yO
   VCgjvi4lccW5wroN6sU1Wa1eSwvhfOeyaeeMV3FRoS4dla0akElM/BIwt
   zXLtqEtdrRGSNUz4pxqNuxR63V7GQRVhmdshgVq9WzXsuSi8VGhOQba/r
   S29JruGrAVAmRO+r9BfTwa/RhVXqM+u9ucIEjO1Y9AkhlE2aJ9DUYJS0V
   c7Sx29q4MoqyiyTGLmbA5vpRE8ejw5UciRdgLlIVMFe0aP9PLky79mOqL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="327376061"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="327376061"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 19:21:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="694148063"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="694148063"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 28 Jan 2023 19:21:07 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLyFe-0001Og-0v;
	Sun, 29 Jan 2023 03:21:06 +0000
Date: Sun, 29 Jan 2023 11:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	David Girault <david.girault@qorvo.com>
Subject: [sschmidt-wpan-next:master 8/9] net/mac802154/scan.c:422:43: sparse:
 sparse: incorrect type in argument 1 (different base types)
Message-ID: <202301291108.uQEw8WLv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sschmidt/wpan-next.git master
head:   622bd6ea90086beb98ac439edd7d57de73d1d6f9
commit: 3accf4762734a69ebd03cba989249c78ac7dfc7e [8/9] mac802154: Handle basic beaconing
config: openrisc-randconfig-s041-20230129 (https://download.01.org/0day-ci/archive/20230129/202301291108.uQEw8WLv-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/sschmidt/wpan-next.git/commit/?id=3accf4762734a69ebd03cba989249c78ac7dfc7e
        git remote add sschmidt-wpan-next https://git.kernel.org/pub/scm/linux/kernel/git/sschmidt/wpan-next.git
        git fetch --no-tags sschmidt-wpan-next master
        git checkout 3accf4762734a69ebd03cba989249c78ac7dfc7e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash net/mac802154/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> net/mac802154/scan.c:422:43: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] pan_id @@
   net/mac802154/scan.c:422:43: sparse:     expected unsigned short [usertype] val
   net/mac802154/scan.c:422:43: sparse:     got restricted __le16 [usertype] pan_id
>> net/mac802154/scan.c:422:43: sparse: sparse: cast from restricted __le16
>> net/mac802154/scan.c:422:43: sparse: sparse: cast from restricted __le16
>> net/mac802154/scan.c:423:50: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] extended_addr @@
   net/mac802154/scan.c:423:50: sparse:     expected unsigned long long [usertype] val
   net/mac802154/scan.c:423:50: sparse:     got restricted __le64 [usertype] extended_addr
>> net/mac802154/scan.c:423:50: sparse: sparse: cast from restricted __le64
>> net/mac802154/scan.c:423:50: sparse: sparse: cast from restricted __le64
>> net/mac802154/scan.c:423:50: sparse: sparse: cast from restricted __le64
>> net/mac802154/scan.c:423:50: sparse: sparse: cast from restricted __le64
>> net/mac802154/scan.c:423:50: sparse: sparse: cast from restricted __le64
>> net/mac802154/scan.c:423:50: sparse: sparse: cast from restricted __le64
>> net/mac802154/scan.c:423:50: sparse: sparse: cast from restricted __le64
>> net/mac802154/scan.c:423:50: sparse: sparse: cast from restricted __le64

vim +422 net/mac802154/scan.c

   395	
   396	int mac802154_send_beacons_locked(struct ieee802154_sub_if_data *sdata,
   397					  struct cfg802154_beacon_request *request)
   398	{
   399		struct ieee802154_local *local = sdata->local;
   400	
   401		ASSERT_RTNL();
   402	
   403		if (mac802154_is_beaconing(local))
   404			mac802154_stop_beacons_locked(local, sdata);
   405	
   406		/* Store beaconing parameters */
   407		rcu_assign_pointer(local->beacon_req, request);
   408	
   409		set_bit(IEEE802154_IS_BEACONING, &local->ongoing);
   410	
   411		memset(&local->beacon, 0, sizeof(local->beacon));
   412		local->beacon.mhr.fc.type = IEEE802154_FC_TYPE_BEACON;
   413		local->beacon.mhr.fc.security_enabled = 0;
   414		local->beacon.mhr.fc.frame_pending = 0;
   415		local->beacon.mhr.fc.ack_request = 0;
   416		local->beacon.mhr.fc.intra_pan = 0;
   417		local->beacon.mhr.fc.dest_addr_mode = IEEE802154_NO_ADDRESSING;
   418		local->beacon.mhr.fc.version = IEEE802154_2003_STD;
   419		local->beacon.mhr.fc.source_addr_mode = IEEE802154_EXTENDED_ADDRESSING;
   420		atomic_set(&request->wpan_dev->bsn, -1);
   421		local->beacon.mhr.source.mode = IEEE802154_ADDR_LONG;
 > 422		local->beacon.mhr.source.pan_id = cpu_to_le16(request->wpan_dev->pan_id);
 > 423		local->beacon.mhr.source.extended_addr = cpu_to_le64(request->wpan_dev->extended_addr);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
