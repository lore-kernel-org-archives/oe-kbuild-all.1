Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83829881F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 21:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680125004; x=1711661004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l+G6Q1bFUQ/LY4Dse2FlYxO0YnxJ194XgEc/JxCxV4s=;
  b=b6mo2ZkW4KnBYts0wCiowu2+IG94rlfIRNCHcbbdOS33gfiKiUMSs6ol
   Gsi6ntdgIJ/e00cnVKmNIP+nCO1L55PBKg88AOjoBeuKv8cUSlnqNOFQa
   1ILZDXHStwsVwlt5hupJNGFSJvnStCYcvcCNTxd0cx9wYq9azsEdVPj3e
   fj/XYdbVw4h2Sn3qTeyGinDfkzonSiluJy/55x3XdNbLLCRrP6OhCu4XZ
   zwKhfB1FSX1ckmEadTzXw7dic4A13sBaGWOFDy1F+363Y03kjfG/YDbYX
   goJnJouoZPkwkclzgvuS+Y32olV8HpAqKKhY9C484n/RM0BT4P6m6/pHL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="341021054"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="341021054"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 14:23:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="808383723"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="808383723"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Mar 2023 14:23:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phdGD-000Jxy-0j;
	Wed, 29 Mar 2023 21:23:13 +0000
Date: Thu, 30 Mar 2023 05:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:tls-netlink.v8 9/20]
 drivers/nvme/common/keyring.c:130:14: warning: no previous prototype for
 'nvme_tls_psk_default'
Message-ID: <202303300502.yUh5U88M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git tls-netlink.v8
head:   b160cccb84362674ac09fb349ab21bd2339eb28e
commit: 2f9c4b60407ad50fd9b7bddebfef752fa331372b [9/20] nvme-keyring: implement nvme_tls_psk_default()
config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20230330/202303300502.yUh5U88M-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commit/?id=2f9c4b60407ad50fd9b7bddebfef752fa331372b
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-netlink.v8
        git checkout 2f9c4b60407ad50fd9b7bddebfef752fa331372b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/ata/ drivers/nvme/common/ drivers/staging/iio/resolver/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300502.yUh5U88M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/common/keyring.c:15:14: warning: no previous prototype for 'nvme_keyring_id' [-Wmissing-prototypes]
      15 | key_serial_t nvme_keyring_id(void)
         |              ^~~~~~~~~~~~~~~
   drivers/nvme/common/keyring.c:70:13: warning: no previous prototype for 'nvme_tls_psk_lookup' [-Wmissing-prototypes]
      70 | struct key *nvme_tls_psk_lookup(struct key *keyring,
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/nvme/common/keyring.c:130:14: warning: no previous prototype for 'nvme_tls_psk_default' [-Wmissing-prototypes]
     130 | key_serial_t nvme_tls_psk_default(struct key *keyring,
         |              ^~~~~~~~~~~~~~~~~~~~
   drivers/nvme/common/keyring.c:153:5: warning: no previous prototype for 'nvme_keyring_init' [-Wmissing-prototypes]
     153 | int nvme_keyring_init(void)
         |     ^~~~~~~~~~~~~~~~~
   drivers/nvme/common/keyring.c:175:6: warning: no previous prototype for 'nvme_keyring_exit' [-Wmissing-prototypes]
     175 | void nvme_keyring_exit(void)
         |      ^~~~~~~~~~~~~~~~~


vim +/nvme_tls_psk_default +130 drivers/nvme/common/keyring.c

   126	
   127	/*
   128	 * nvme_tls_psk_default - Return 'best' PSK to use for TLS ClientHello
   129	 */
 > 130	key_serial_t nvme_tls_psk_default(struct key *keyring,
   131			      const char *hostnqn, const char *subnqn)
   132	{
   133		struct key *tls_key;
   134		key_serial_t tls_key_id;
   135		int prio;
   136	
   137		for (prio = 0; prio < ARRAY_SIZE(nvme_psk_prio); prio++) {
   138			bool generated = nvme_psk_prio[prio].generated;
   139			enum nvme_tcp_tls_cipher cipher = nvme_psk_prio[prio].cipher;
   140	
   141			tls_key = nvme_tls_psk_lookup(keyring, hostnqn, subnqn,
   142						      cipher, generated);
   143			if (!IS_ERR(tls_key)) {
   144				tls_key_id = tls_key->serial;
   145				key_put(tls_key);
   146				return tls_key_id;
   147			}
   148		}
   149		return 0;
   150	}
   151	EXPORT_SYMBOL_GPL(nvme_tls_psk_default);
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
