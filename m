Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E2F21A09
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 23:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eTNLeuWv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697065895; x=1728601895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XGgA9w06CMp0jRkt+cOqHXR1JLuf8vG1xthmdqUP2DQ=;
  b=eTNLeuWvJOTKLD6k44xGdWLJgkEu3s4UvfUq6k9zKtx9wulkFjPigv7W
   OK2s3A+IDAhKYLGTP0TBNs8syhUCoZithxeSotVuuEtO7ZmHVP9gUbgu9
   ZI81SBxawk7nGYvrLMGG7WuWMKB/zqJ9koMWRCEqb5viWTSldtWMCZuOu
   T1sf8+BUhxnL6C7ueMtcrvjz9mHnLmEsXwGqE7otOWQpGn2DlWExltJNr
   aL2RhCmy2VHgtl5f61OeZvq/LsokDAAMe4KlpenH9wAQvwcAV/lvP88J2
   +snN2DQkZ6kO3AR7Kk54o6x154XpNcQCTvMpEmg4ZeS2dOLAsSMdy0Glu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="365059552"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="365059552"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 16:11:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="783441140"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="783441140"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 11 Oct 2023 16:11:32 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqiMT-0002pt-1r;
	Wed, 11 Oct 2023 23:11:29 +0000
Date: Thu, 12 Oct 2023 07:11:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>
Subject: [linux-nvme:nvme-6.7 2/19] s390-linux-ld: configfs.c:undefined
 reference to `nvme_auth_dhgroup_kpp'
Message-ID: <202310120733.TlPOVeJm-lkp@intel.com>
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
config: s390-randconfig-002-20231012 (https://download.01.org/0day-ci/archive/20231012/202310120733.TlPOVeJm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120733.TlPOVeJm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120733.TlPOVeJm-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/nvme/target/configfs.o: in function `nvmet_host_dhchap_dhgroup_store':
   configfs.c:(.text+0x24): undefined reference to `nvme_auth_dhgroup_id'
>> s390-linux-ld: configfs.c:(.text+0x50): undefined reference to `nvme_auth_dhgroup_kpp'
   s390-linux-ld: drivers/nvme/target/configfs.o: in function `nvmet_host_dhchap_dhgroup_show':
   configfs.c:(.text+0xa2): undefined reference to `nvme_auth_dhgroup_name'
   s390-linux-ld: drivers/nvme/target/configfs.o: in function `nvmet_host_dhchap_hash_show':
   configfs.c:(.text+0x532): undefined reference to `nvme_auth_hmac_name'
   s390-linux-ld: drivers/nvme/target/configfs.o: in function `nvmet_host_dhchap_hash_store':
   configfs.c:(.text+0x58c): undefined reference to `nvme_auth_hmac_id'
>> s390-linux-ld: configfs.c:(.text+0x59e): undefined reference to `nvme_auth_hmac_name'
   s390-linux-ld: drivers/nvme/target/fabrics-cmd-auth.o: in function `nvmet_auth_negotiate':
   fabrics-cmd-auth.c:(.text+0x164): undefined reference to `nvme_auth_hmac_name'
>> s390-linux-ld: fabrics-cmd-auth.c:(.text+0x226): undefined reference to `nvme_auth_hmac_name'
>> s390-linux-ld: fabrics-cmd-auth.c:(.text+0x294): undefined reference to `nvme_auth_dhgroup_kpp'
>> s390-linux-ld: fabrics-cmd-auth.c:(.text+0x31e): undefined reference to `nvme_auth_dhgroup_name'
   s390-linux-ld: fabrics-cmd-auth.c:(.text+0x37a): undefined reference to `nvme_auth_dhgroup_name'
   s390-linux-ld: drivers/nvme/target/fabrics-cmd-auth.o: in function `nvmet_auth_challenge':
   fabrics-cmd-auth.c:(.text+0x706): undefined reference to `nvme_auth_hmac_hash_len'
>> s390-linux-ld: fabrics-cmd-auth.c:(.text+0x7e8): undefined reference to `nvme_auth_get_seqnum'
   s390-linux-ld: drivers/nvme/target/fabrics-cmd-auth.o: in function `nvmet_auth_success1.isra.0':
   fabrics-cmd-auth.c:(.text+0x9da): undefined reference to `nvme_auth_hmac_hash_len'
   s390-linux-ld: drivers/nvme/target/auth.o: in function `nvmet_auth_set_key':
   auth.c:(.text+0x76): undefined reference to `nvme_auth_hmac_name'
   s390-linux-ld: drivers/nvme/target/auth.o: in function `nvmet_setup_dhgroup':
   auth.c:(.text+0x1f6): undefined reference to `nvme_auth_dhgroup_kpp'
>> s390-linux-ld: auth.c:(.text+0x2de): undefined reference to `nvme_auth_gen_privkey'
>> s390-linux-ld: auth.c:(.text+0x396): undefined reference to `nvme_auth_gen_pubkey'
   s390-linux-ld: drivers/nvme/target/auth.o: in function `nvmet_setup_auth':
   auth.c:(.text+0x57a): undefined reference to `nvme_auth_hmac_name'
>> s390-linux-ld: auth.c:(.text+0x5b4): undefined reference to `nvme_auth_free_key'
>> s390-linux-ld: auth.c:(.text+0x5ca): undefined reference to `nvme_auth_extract_key'
>> s390-linux-ld: auth.c:(.text+0x60e): undefined reference to `nvme_auth_hmac_name'
   s390-linux-ld: auth.c:(.text+0x658): undefined reference to `nvme_auth_free_key'
   s390-linux-ld: auth.c:(.text+0x682): undefined reference to `nvme_auth_extract_key'
   s390-linux-ld: auth.c:(.text+0x6c2): undefined reference to `nvme_auth_hmac_name'
   s390-linux-ld: auth.c:(.text+0x716): undefined reference to `nvme_auth_free_key'
   s390-linux-ld: drivers/nvme/target/auth.o: in function `nvmet_destroy_auth':
   auth.c:(.text+0x82a): undefined reference to `nvme_auth_free_key'
   s390-linux-ld: auth.c:(.text+0x846): undefined reference to `nvme_auth_free_key'
   s390-linux-ld: drivers/nvme/target/auth.o: in function `nvmet_auth_host_hash':
   auth.c:(.text+0x8e8): undefined reference to `nvme_auth_hmac_name'
>> s390-linux-ld: auth.c:(.text+0x992): undefined reference to `nvme_auth_transform_key'
>> s390-linux-ld: auth.c:(.text+0xa14): undefined reference to `nvme_auth_augmented_challenge'
   s390-linux-ld: drivers/nvme/target/auth.o: in function `nvmet_auth_ctrl_hash':
   auth.c:(.text+0xca8): undefined reference to `nvme_auth_hmac_name'
   s390-linux-ld: auth.c:(.text+0xd54): undefined reference to `nvme_auth_transform_key'
   s390-linux-ld: auth.c:(.text+0xdd2): undefined reference to `nvme_auth_augmented_challenge'
   s390-linux-ld: drivers/nvme/target/auth.o: in function `nvmet_auth_ctrl_sesskey':
   auth.c:(.text+0x1152): undefined reference to `nvme_auth_gen_shared_secret'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
