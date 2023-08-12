Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17385EA0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 06:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691822827; x=1723358827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NVOS/AUlmMKC77FGstp6qJfUlx42qlQQTj6UgZeEn5g=;
  b=nxkbw7WINczecA2Ihq7OkwMxxYcW+JojH8OmPc3Rmi0+oJpc1FIOHy90
   LPsU7R/OFfp/sxxjfITXdJXzYOrfE/gpvU1SyQczrolc/VSVDk9XrvM7C
   X+Zkc8SkhQWb7k0S+Gz+wcAWA6XwVotEAflkZGQlxp5fUTWF+czDt33G7
   lgIf/iLh8OdaRFssH4DzB7S9ISEgREWsXj0WlZUbtSgZ/INib9S+gKxSR
   a0BpclOq2CDrhL7bhmQTZQZCXu/xUPiJypkY/6VDOo3mPds3WPlXMoPSV
   phoJDsv13ouJgEqooCRRNyWH4U+9aqT8uGSBIplqKJiy014LRjPamHS+s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="361952041"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="361952041"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 23:47:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="732883077"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="732883077"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Aug 2023 23:47:05 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUiOu-0008L6-1c;
	Sat, 12 Aug 2023 06:47:04 +0000
Date: Sat, 12 Aug 2023 14:46:49 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Sagi Grimberg <sagi@grimberg.me>
Subject: [hare-nvme:tls.v12 3/19] drivers/nvme/target/configfs.c:1932:
 undefined reference to `nvme_auth_dhgroup_id'
Message-ID: <202308121416.m7eeF7dO-lkp@intel.com>
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
config: loongarch-randconfig-r004-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121416.m7eeF7dO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121416.m7eeF7dO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121416.m7eeF7dO-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/nvme/target/configfs.o: in function `nvmet_host_dhchap_dhgroup_store':
>> drivers/nvme/target/configfs.c:1932: undefined reference to `nvme_auth_dhgroup_id'
>> loongarch64-linux-ld: drivers/nvme/target/configfs.c:1936: undefined reference to `nvme_auth_dhgroup_kpp'
   loongarch64-linux-ld: drivers/nvme/target/configfs.o: in function `nvmet_host_dhchap_dhgroup_show':
>> drivers/nvme/target/configfs.c:1921: undefined reference to `nvme_auth_dhgroup_name'
   loongarch64-linux-ld: drivers/nvme/target/configfs.o: in function `nvmet_host_dhchap_hash_show':
>> drivers/nvme/target/configfs.c:1895: undefined reference to `nvme_auth_hmac_name'
   loongarch64-linux-ld: drivers/nvme/target/configfs.o: in function `nvmet_host_dhchap_hash_store':
>> drivers/nvme/target/configfs.c:1906: undefined reference to `nvme_auth_hmac_id'
>> loongarch64-linux-ld: drivers/nvme/target/configfs.c:1909: undefined reference to `nvme_auth_hmac_name'
   loongarch64-linux-ld: drivers/nvme/target/fabrics-cmd-auth.o: in function `nvmet_auth_challenge':
>> drivers/nvme/target/fabrics-cmd-auth.c:356: undefined reference to `nvme_auth_hmac_hash_len'
>> loongarch64-linux-ld: drivers/nvme/target/fabrics-cmd-auth.c:367: undefined reference to `nvme_auth_get_seqnum'
   loongarch64-linux-ld: drivers/nvme/target/fabrics-cmd-auth.o: in function `nvmet_execute_auth_send':
>> drivers/nvme/target/fabrics-cmd-auth.c:60: undefined reference to `nvme_auth_hmac_name'
>> loongarch64-linux-ld: drivers/nvme/target/fabrics-cmd-auth.c:89: undefined reference to `nvme_auth_dhgroup_kpp'
   loongarch64-linux-ld: drivers/nvme/target/fabrics-cmd-auth.o: in function `nvmet_execute_auth_receive':
   drivers/nvme/target/fabrics-cmd-auth.c:395: undefined reference to `nvme_auth_hmac_hash_len'
   loongarch64-linux-ld: drivers/nvme/target/auth.o: in function `nvmet_auth_set_key':
>> drivers/nvme/target/auth.c:37: undefined reference to `nvme_auth_hmac_name'
   loongarch64-linux-ld: drivers/nvme/target/auth.o: in function `nvmet_setup_dhgroup':
>> drivers/nvme/target/auth.c:81: undefined reference to `nvme_auth_dhgroup_kpp'
>> loongarch64-linux-ld: drivers/nvme/target/auth.c:99: undefined reference to `nvme_auth_gen_privkey'
>> loongarch64-linux-ld: drivers/nvme/target/auth.c:114: undefined reference to `nvme_auth_gen_pubkey'
   loongarch64-linux-ld: drivers/nvme/target/auth.o: in function `nvmet_setup_auth':
   drivers/nvme/target/auth.c:167: undefined reference to `nvme_auth_hmac_name'
>> loongarch64-linux-ld: drivers/nvme/target/auth.c:177: undefined reference to `nvme_auth_free_key'
>> loongarch64-linux-ld: drivers/nvme/target/auth.c:178: undefined reference to `nvme_auth_extract_key'
   loongarch64-linux-ld: drivers/nvme/target/auth.c:211: undefined reference to `nvme_auth_free_key'
   loongarch64-linux-ld: drivers/nvme/target/auth.c:190: undefined reference to `nvme_auth_free_key'
   loongarch64-linux-ld: drivers/nvme/target/auth.c:196: undefined reference to `nvme_auth_extract_key'
   loongarch64-linux-ld: drivers/nvme/target/auth.o: in function `nvmet_destroy_auth':
>> drivers/nvme/target/auth.c:246: undefined reference to `nvme_auth_free_key'
   loongarch64-linux-ld: drivers/nvme/target/auth.c:250: undefined reference to `nvme_auth_free_key'
   loongarch64-linux-ld: drivers/nvme/target/auth.o: in function `nvmet_auth_host_hash':
   drivers/nvme/target/auth.c:274: undefined reference to `nvme_auth_hmac_name'
>> loongarch64-linux-ld: drivers/nvme/target/auth.c:294: undefined reference to `nvme_auth_transform_key'
>> loongarch64-linux-ld: drivers/nvme/target/auth.c:311: undefined reference to `nvme_auth_augmented_challenge'
   loongarch64-linux-ld: drivers/nvme/target/auth.o: in function `nvmet_auth_ctrl_hash':
   drivers/nvme/target/auth.c:385: undefined reference to `nvme_auth_hmac_name'
   loongarch64-linux-ld: drivers/nvme/target/auth.c:405: undefined reference to `nvme_auth_transform_key'
   loongarch64-linux-ld: drivers/nvme/target/auth.c:423: undefined reference to `nvme_auth_augmented_challenge'
   loongarch64-linux-ld: drivers/nvme/target/auth.o: in function `nvmet_auth_ctrl_sesskey':
>> drivers/nvme/target/auth.c:516: undefined reference to `nvme_auth_gen_shared_secret'


vim +1932 drivers/nvme/target/configfs.c

db1312dd95488b Hannes Reinecke   2022-06-27  1890  
db1312dd95488b Hannes Reinecke   2022-06-27  1891  static ssize_t nvmet_host_dhchap_hash_show(struct config_item *item,
db1312dd95488b Hannes Reinecke   2022-06-27  1892  		char *page)
a07b4970f464f1 Christoph Hellwig 2016-06-21  1893  {
a07b4970f464f1 Christoph Hellwig 2016-06-21  1894  	struct nvmet_host *host = to_host(item);
db1312dd95488b Hannes Reinecke   2022-06-27 @1895  	const char *hash_name = nvme_auth_hmac_name(host->dhchap_hash_id);
db1312dd95488b Hannes Reinecke   2022-06-27  1896  
db1312dd95488b Hannes Reinecke   2022-06-27  1897  	return sprintf(page, "%s\n", hash_name ? hash_name : "none");
db1312dd95488b Hannes Reinecke   2022-06-27  1898  }
db1312dd95488b Hannes Reinecke   2022-06-27  1899  
db1312dd95488b Hannes Reinecke   2022-06-27  1900  static ssize_t nvmet_host_dhchap_hash_store(struct config_item *item,
db1312dd95488b Hannes Reinecke   2022-06-27  1901  		const char *page, size_t count)
db1312dd95488b Hannes Reinecke   2022-06-27  1902  {
db1312dd95488b Hannes Reinecke   2022-06-27  1903  	struct nvmet_host *host = to_host(item);
db1312dd95488b Hannes Reinecke   2022-06-27  1904  	u8 hmac_id;
db1312dd95488b Hannes Reinecke   2022-06-27  1905  
db1312dd95488b Hannes Reinecke   2022-06-27 @1906  	hmac_id = nvme_auth_hmac_id(page);
db1312dd95488b Hannes Reinecke   2022-06-27  1907  	if (hmac_id == NVME_AUTH_HASH_INVALID)
db1312dd95488b Hannes Reinecke   2022-06-27  1908  		return -EINVAL;
db1312dd95488b Hannes Reinecke   2022-06-27 @1909  	if (!crypto_has_shash(nvme_auth_hmac_name(hmac_id), 0, 0))
db1312dd95488b Hannes Reinecke   2022-06-27  1910  		return -ENOTSUPP;
db1312dd95488b Hannes Reinecke   2022-06-27  1911  	host->dhchap_hash_id = hmac_id;
db1312dd95488b Hannes Reinecke   2022-06-27  1912  	return count;
db1312dd95488b Hannes Reinecke   2022-06-27  1913  }
db1312dd95488b Hannes Reinecke   2022-06-27  1914  
db1312dd95488b Hannes Reinecke   2022-06-27  1915  CONFIGFS_ATTR(nvmet_host_, dhchap_hash);
db1312dd95488b Hannes Reinecke   2022-06-27  1916  
7a277c37d3522e Hannes Reinecke   2022-06-27  1917  static ssize_t nvmet_host_dhchap_dhgroup_show(struct config_item *item,
7a277c37d3522e Hannes Reinecke   2022-06-27  1918  		char *page)
7a277c37d3522e Hannes Reinecke   2022-06-27  1919  {
7a277c37d3522e Hannes Reinecke   2022-06-27  1920  	struct nvmet_host *host = to_host(item);
7a277c37d3522e Hannes Reinecke   2022-06-27 @1921  	const char *dhgroup = nvme_auth_dhgroup_name(host->dhchap_dhgroup_id);
7a277c37d3522e Hannes Reinecke   2022-06-27  1922  
7a277c37d3522e Hannes Reinecke   2022-06-27  1923  	return sprintf(page, "%s\n", dhgroup ? dhgroup : "none");
7a277c37d3522e Hannes Reinecke   2022-06-27  1924  }
7a277c37d3522e Hannes Reinecke   2022-06-27  1925  
7a277c37d3522e Hannes Reinecke   2022-06-27  1926  static ssize_t nvmet_host_dhchap_dhgroup_store(struct config_item *item,
7a277c37d3522e Hannes Reinecke   2022-06-27  1927  		const char *page, size_t count)
7a277c37d3522e Hannes Reinecke   2022-06-27  1928  {
7a277c37d3522e Hannes Reinecke   2022-06-27  1929  	struct nvmet_host *host = to_host(item);
7a277c37d3522e Hannes Reinecke   2022-06-27  1930  	int dhgroup_id;
7a277c37d3522e Hannes Reinecke   2022-06-27  1931  
7a277c37d3522e Hannes Reinecke   2022-06-27 @1932  	dhgroup_id = nvme_auth_dhgroup_id(page);
7a277c37d3522e Hannes Reinecke   2022-06-27  1933  	if (dhgroup_id == NVME_AUTH_DHGROUP_INVALID)
7a277c37d3522e Hannes Reinecke   2022-06-27  1934  		return -EINVAL;
7a277c37d3522e Hannes Reinecke   2022-06-27  1935  	if (dhgroup_id != NVME_AUTH_DHGROUP_NULL) {
7a277c37d3522e Hannes Reinecke   2022-06-27 @1936  		const char *kpp = nvme_auth_dhgroup_kpp(dhgroup_id);
7a277c37d3522e Hannes Reinecke   2022-06-27  1937  
7a277c37d3522e Hannes Reinecke   2022-06-27  1938  		if (!crypto_has_kpp(kpp, 0, 0))
7a277c37d3522e Hannes Reinecke   2022-06-27  1939  			return -EINVAL;
7a277c37d3522e Hannes Reinecke   2022-06-27  1940  	}
7a277c37d3522e Hannes Reinecke   2022-06-27  1941  	host->dhchap_dhgroup_id = dhgroup_id;
7a277c37d3522e Hannes Reinecke   2022-06-27  1942  	return count;
7a277c37d3522e Hannes Reinecke   2022-06-27  1943  }
7a277c37d3522e Hannes Reinecke   2022-06-27  1944  

:::::: The code at line 1932 was first introduced by commit
:::::: 7a277c37d3522e9b2777d762bbbcecafae2b1f8d nvmet-auth: Diffie-Hellman key exchange support

:::::: TO: Hannes Reinecke <hare@suse.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
