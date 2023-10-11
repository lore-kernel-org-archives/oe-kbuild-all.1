Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAD7D2E5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 22:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tc70TjEM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697064543; x=1728600543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ukVm/ws8RXmtFq5oPK91fPhgfNs/sH43crRUyCuk1bQ=;
  b=Tc70TjEMACbKMsn54HsZOpPmxgjLfMnBF21lBd7uyLOU1YzyVPoAig2y
   MGrlxb0ysJpSXh2m8sniBvT3ItYQS9pZNC+lm2NpCxgZEd56z/+uFgg8N
   d37RHM/6IIPDi2lz1lLEuIBFK8CKPZKwTqrMuZDk5T5WbCN1HxzHaJem/
   qkDdpaiIEqh1Jg8bQjL4imP6lhX0/9lCy/kZ7Om6mvLv/N61qCXNvV/+0
   CKMQEZtkRkxdciB8CLTYnJzRXtpBlFXAdCzhqN4o4OiyuY1fHP2f9ghyN
   M9lbVaY0XORfRJ3CJ4I58iAYIl64SesEbN23mC8GIbqKp2aXod+rtuz0t
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="383651708"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="383651708"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 15:48:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="824347133"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="824347133"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 11 Oct 2023 15:48:50 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqi0W-0002oB-1E;
	Wed, 11 Oct 2023 22:48:48 +0000
Date: Thu, 12 Oct 2023 06:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>
Subject: [linux-nvme:nvme-6.7 2/19] configfs.c:undefined reference to
 `nvme_auth_dhgroup_kpp'
Message-ID: <202310120636.tkAybE7Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.7
head:   70525e5d82f62407d8436aa2a6c3385829ab5a3e
commit: 9d77eb52778499a97cab662aa96de4e2e4fa72d3 [2/19] nvme-keyring: register '.nvme' keyring
config: riscv-randconfig-001-20231012 (https://download.01.org/0day-ci/archive/20231012/202310120636.tkAybE7Q-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120636.tkAybE7Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120636.tkAybE7Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/nvme/target/configfs.o: in function `nvmet_host_dhchap_dhgroup_store':
   configfs.c:(.text+0xe): undefined reference to `nvme_auth_dhgroup_id'
   riscv64-linux-ld: drivers/nvme/target/configfs.o: in function `.L4':
>> configfs.c:(.text+0x46): undefined reference to `nvme_auth_dhgroup_kpp'
   riscv64-linux-ld: drivers/nvme/target/configfs.o: in function `nvmet_host_dhchap_dhgroup_show':
   configfs.c:(.text+0x7e): undefined reference to `nvme_auth_dhgroup_name'
   riscv64-linux-ld: drivers/nvme/target/configfs.o: in function `nvmet_host_dhchap_hash_show':
   configfs.c:(.text+0x2e8): undefined reference to `nvme_auth_hmac_name'
   riscv64-linux-ld: drivers/nvme/target/configfs.o: in function `nvmet_host_dhchap_hash_store':
   configfs.c:(.text+0x326): undefined reference to `nvme_auth_hmac_id'
>> riscv64-linux-ld: configfs.c:(.text+0x33a): undefined reference to `nvme_auth_hmac_name'
   riscv64-linux-ld: drivers/nvme/target/fabrics-cmd-auth.o: in function `nvmet_auth_challenge':
   fabrics-cmd-auth.c:(.text+0x3fa): undefined reference to `nvme_auth_hmac_hash_len'
   riscv64-linux-ld: drivers/nvme/target/fabrics-cmd-auth.o: in function `.L40':
>> fabrics-cmd-auth.c:(.text+0x458): undefined reference to `nvme_auth_get_seqnum'
   riscv64-linux-ld: drivers/nvme/target/fabrics-cmd-auth.o: in function `.L79':
   fabrics-cmd-auth.c:(.text+0xad0): undefined reference to `nvme_auth_dhgroup_kpp'
   riscv64-linux-ld: drivers/nvme/target/fabrics-cmd-auth.o: in function `.L73':
>> fabrics-cmd-auth.c:(.text+0xc6c): undefined reference to `nvme_auth_hmac_name'
   riscv64-linux-ld: drivers/nvme/target/fabrics-cmd-auth.o: in function `.L150':
   fabrics-cmd-auth.c:(.text+0x1050): undefined reference to `nvme_auth_hmac_hash_len'
   riscv64-linux-ld: drivers/nvme/target/auth.o: in function `.L0 ':
   auth.c:(.text+0x96): undefined reference to `nvme_auth_hmac_name'
   riscv64-linux-ld: drivers/nvme/target/auth.o: in function `.L34':
   auth.c:(.text+0x242): undefined reference to `nvme_auth_dhgroup_kpp'
>> riscv64-linux-ld: auth.c:(.text+0x28c): undefined reference to `nvme_auth_gen_privkey'
>> riscv64-linux-ld: auth.c:(.text+0x35a): undefined reference to `nvme_auth_gen_pubkey'
   riscv64-linux-ld: drivers/nvme/target/auth.o: in function `.L45':
   auth.c:(.text+0x50c): undefined reference to `nvme_auth_hmac_name'
   riscv64-linux-ld: drivers/nvme/target/auth.o: in function `.L47':
   auth.c:(.text+0x550): undefined reference to `nvme_auth_free_key'
>> riscv64-linux-ld: auth.c:(.text+0x57a): undefined reference to `nvme_auth_extract_key'
>> riscv64-linux-ld: auth.c:(.text+0x5b2): undefined reference to `nvme_auth_free_key'
   riscv64-linux-ld: auth.c:(.text+0x5e2): undefined reference to `nvme_auth_extract_key'
   riscv64-linux-ld: drivers/nvme/target/auth.o: in function `.L53':
   auth.c:(.text+0x680): undefined reference to `nvme_auth_free_key'
   riscv64-linux-ld: drivers/nvme/target/auth.o: in function `.L83':
   auth.c:(.text+0x84e): undefined reference to `nvme_auth_free_key'
   riscv64-linux-ld: drivers/nvme/target/auth.o: in function `.L84':
   auth.c:(.text+0x882): undefined reference to `nvme_auth_free_key'
   riscv64-linux-ld: drivers/nvme/target/auth.o: in function `.L0 ':
   auth.c:(.text+0x9be): undefined reference to `nvme_auth_hmac_name'
   riscv64-linux-ld: drivers/nvme/target/auth.o: in function `.L131':
>> auth.c:(.text+0xa6e): undefined reference to `nvme_auth_transform_key'
>> riscv64-linux-ld: auth.c:(.text+0xb36): undefined reference to `nvme_auth_augmented_challenge'
   riscv64-linux-ld: drivers/nvme/target/auth.o: in function `.L0 ':
   auth.c:(.text+0xe4a): undefined reference to `nvme_auth_hmac_name'
   riscv64-linux-ld: drivers/nvme/target/auth.o: in function `.L164':
   auth.c:(.text+0xefa): undefined reference to `nvme_auth_transform_key'
   riscv64-linux-ld: auth.c:(.text+0xfc2): undefined reference to `nvme_auth_augmented_challenge'
   riscv64-linux-ld: drivers/nvme/target/auth.o: in function `nvmet_auth_ctrl_sesskey':
   auth.c:(.text+0x13d2): undefined reference to `nvme_auth_gen_shared_secret'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
