Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBAB1849
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 06:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691820369; x=1723356369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iH0PlK72TM6q2jtgOU2TRSsBrvbB8aAvg2/xzHBKDXY=;
  b=cXv2t8EsZmfMEGVpmZCuD3mu/kczplp0IKQ7UeIV3lj8/r0+xB9u6FkS
   hyxOMdFivAp3X+/nTLaa0wqccpiP9mGks+5Zn1V6hZwm+HuHydlXgeZ/I
   iQwZ6n2Jci6lsq79QAtm5ePJP+WG5b+/+b+eJkVjSePDgrD799SgxlNkJ
   Dxl6wU3pyS/KXkALiXtb0rGyiQpbc4KIAaaCKBc9zAHc+TgqeTbqRJ3nh
   B128NyBGaOZfljlkY3dT/RusWPJH0bykcHv7xjnBw0cBHVqR/OBFuTc38
   YMje60Cmc/jacpP7mO04qvVg+MsCEaxi20WYiy4Gsovtte4h+7CAdyFVp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="402787726"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="402787726"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 23:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="906650446"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="906650446"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Aug 2023 23:06:04 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUhlD-0008Jc-23;
	Sat, 12 Aug 2023 06:06:03 +0000
Date: Sat, 12 Aug 2023 14:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Sagi Grimberg <sagi@grimberg.me>
Subject: [hare-nvme:tls.v12 3/19] configfs.c:undefined reference to
 `nvme_auth_dhgroup_id'
Message-ID: <202308121334.O6P3IGER-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git tls.v12
head:   c623bc8e57d23dde503188eacbf2d11e7dfe0564
commit: 9a67201c9263fd0b439e04b5b0368b999663391b [3/19] nvme-keyring: register '.nvme' keyring
config: arm-randconfig-r046-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121334.O6P3IGER-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121334.O6P3IGER-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121334.O6P3IGER-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/nvme/target/configfs.o: in function `nvmet_host_dhchap_dhgroup_store':
>> configfs.c:(.text+0x8): undefined reference to `nvme_auth_dhgroup_id'
>> arm-linux-gnueabi-ld: configfs.c:(.text+0x22): undefined reference to `nvme_auth_dhgroup_kpp'
   arm-linux-gnueabi-ld: drivers/nvme/target/configfs.o: in function `nvmet_host_dhchap_dhgroup_show':
>> configfs.c:(.text+0x3c): undefined reference to `nvme_auth_dhgroup_name'
   arm-linux-gnueabi-ld: drivers/nvme/target/configfs.o: in function `nvmet_host_dhchap_hash_show':
>> configfs.c:(.text+0x1a4): undefined reference to `nvme_auth_hmac_name'
   arm-linux-gnueabi-ld: drivers/nvme/target/configfs.o: in function `nvmet_host_dhchap_hash_store':
>> configfs.c:(.text+0x1d0): undefined reference to `nvme_auth_hmac_id'
>> arm-linux-gnueabi-ld: configfs.c:(.text+0x1da): undefined reference to `nvme_auth_hmac_name'
   arm-linux-gnueabi-ld: drivers/nvme/target/fabrics-cmd-auth.o: in function `nvmet_auth_challenge':
>> fabrics-cmd-auth.c:(.text+0xd2): undefined reference to `nvme_auth_hmac_hash_len'
>> arm-linux-gnueabi-ld: fabrics-cmd-auth.c:(.text+0xf6): undefined reference to `nvme_auth_get_seqnum'
   arm-linux-gnueabi-ld: drivers/nvme/target/fabrics-cmd-auth.o: in function `nvmet_execute_auth_send':
>> fabrics-cmd-auth.c:(.text+0x33a): undefined reference to `nvme_auth_hmac_name'
>> arm-linux-gnueabi-ld: fabrics-cmd-auth.c:(.text+0x39c): undefined reference to `nvme_auth_dhgroup_kpp'
   arm-linux-gnueabi-ld: drivers/nvme/target/fabrics-cmd-auth.o: in function `nvmet_execute_auth_receive':
   fabrics-cmd-auth.c:(.text+0x522): undefined reference to `nvme_auth_hmac_hash_len'
   arm-linux-gnueabi-ld: drivers/nvme/target/auth.o: in function `nvmet_auth_set_key':
>> auth.c:(.text+0x62): undefined reference to `nvme_auth_hmac_name'
   arm-linux-gnueabi-ld: drivers/nvme/target/auth.o: in function `nvmet_setup_dhgroup':
>> auth.c:(.text+0xec): undefined reference to `nvme_auth_dhgroup_kpp'
>> arm-linux-gnueabi-ld: auth.c:(.text+0x11a): undefined reference to `nvme_auth_gen_privkey'
>> arm-linux-gnueabi-ld: auth.c:(.text+0x160): undefined reference to `nvme_auth_gen_pubkey'
   arm-linux-gnueabi-ld: drivers/nvme/target/auth.o: in function `nvmet_setup_auth':
   auth.c:(.text+0x1f6): undefined reference to `nvme_auth_hmac_name'
>> arm-linux-gnueabi-ld: auth.c:(.text+0x20a): undefined reference to `nvme_auth_free_key'
>> arm-linux-gnueabi-ld: auth.c:(.text+0x216): undefined reference to `nvme_auth_extract_key'
   arm-linux-gnueabi-ld: auth.c:(.text+0x232): undefined reference to `nvme_auth_free_key'
   arm-linux-gnueabi-ld: auth.c:(.text+0x248): undefined reference to `nvme_auth_free_key'
   arm-linux-gnueabi-ld: auth.c:(.text+0x25c): undefined reference to `nvme_auth_extract_key'
   arm-linux-gnueabi-ld: drivers/nvme/target/auth.o: in function `nvmet_destroy_auth':
>> auth.c:(.text+0x2e0): undefined reference to `nvme_auth_free_key'
   arm-linux-gnueabi-ld: auth.c:(.text+0x2ee): undefined reference to `nvme_auth_free_key'
   arm-linux-gnueabi-ld: drivers/nvme/target/auth.o: in function `nvmet_auth_host_hash':
   auth.c:(.text+0x332): undefined reference to `nvme_auth_hmac_name'
>> arm-linux-gnueabi-ld: auth.c:(.text+0x368): undefined reference to `nvme_auth_transform_key'
>> arm-linux-gnueabi-ld: auth.c:(.text+0x3ae): undefined reference to `nvme_auth_augmented_challenge'
   arm-linux-gnueabi-ld: drivers/nvme/target/auth.o: in function `nvmet_auth_ctrl_hash':
   auth.c:(.text+0x4ae): undefined reference to `nvme_auth_hmac_name'
   arm-linux-gnueabi-ld: auth.c:(.text+0x4e4): undefined reference to `nvme_auth_transform_key'
   arm-linux-gnueabi-ld: auth.c:(.text+0x52a): undefined reference to `nvme_auth_augmented_challenge'
   arm-linux-gnueabi-ld: drivers/nvme/target/auth.o: in function `nvmet_auth_ctrl_sesskey':
>> auth.c:(.text+0x680): undefined reference to `nvme_auth_gen_shared_secret'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
