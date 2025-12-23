Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ED4314D16
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 20:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766522180; cv=none; b=sBS3QZk1YS2s9egwfZdbA/a1JrHOgTNyu1+mPP23hZeV0W6RrhVtUa6HM5Ju756U8Cf1FN6QnyF+503AbSpi8RBDYcHepcNVMtCER/eO5/vm8MPyAEdQLUipPeqN5c7+52+13oR5S9R4Z/+EYYVK8v899oVOfNAp1CuW8ARQYJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766522180; c=relaxed/simple;
	bh=bdBihIhiS3nSo/7TjS6OgN7r9ca73ctS3AI5zKywJfU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tbW3ocN6t/zx6YdP6VjwYHf2LVn5p7vCciP5rGTTH/DAjdUP+L2tcy1uDHpEzPQn3yzfL5O9m3P/sIZuTFUhYeWlP8GBLdLtUe45DmOCMVT8nD7AdM7JBsOKkDrsSjIsooPHqKoB/w2FPRZYcg5wfmxDN/Av1tbn8ZVGHtpjdzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNFUj4sc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNFUj4sc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766522179; x=1798058179;
  h=date:from:to:cc:subject:message-id;
  bh=bdBihIhiS3nSo/7TjS6OgN7r9ca73ctS3AI5zKywJfU=;
  b=XNFUj4scrq/Y9m7vfaL+uf0HJyPBCMRdkfRuXeRD3cEy3ki2Xg/yWDGO
   wVXKSrP/Bo0wndm54zu4A251Ty6lpRFUnKpxHskOFBrtnsGWAsLAFczLl
   EFh3vI8S0MXxwiTJ7luSBrEK1+M09vozZY7HZP85S2znUZyE6XWddT1Yc
   CHl5O2QSjNwBnpucyDk5ox+XJGg7HYZ1rPGWGQxM0LbWBQiB1WK5etI9w
   21ne6IxoZtHLj2hitPo36A/93tJ+E1z1H6EAB7tmmIkc0J82vCZ0qEAak
   oHL/txriVfbs3WJX/AKacM5tPgzw5Olw9qwFLFiE/EosS1q+TiGStjjv6
   Q==;
X-CSE-ConnectionGUID: c1o4v4JlTU+B9jRE6TslEg==
X-CSE-MsgGUID: G0csYpOaRY6fSxFqQv2PHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="71999153"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="71999153"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 12:36:19 -0800
X-CSE-ConnectionGUID: N9XHXqbkTIu5NX0aY/rvRg==
X-CSE-MsgGUID: MCwtL+bTSsqJJDACogCUzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="199520269"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 23 Dec 2025 12:36:17 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY978-000000002Lt-2U8y;
	Tue, 23 Dec 2025 20:36:14 +0000
Date: Wed, 24 Dec 2025 04:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>
Subject: 
 drivers/media/platform/qcom/iris/iris_firmware.c:49:undefined reference to
 `qcom_mdt_get_size'
Message-ID: <202512240451.STA6LPmq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: 2df158047d532d0e2a6b39953656c738872151a3 ipa: fix compile-testing with qcom-mdt=m
date:   5 months ago
config: loongarch-randconfig-r071-20251223 (https://download.01.org/0day-ci/archive/20251224/202512240451.STA6LPmq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240451.STA6LPmq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240451.STA6LPmq-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/media/platform/qcom/iris/iris_firmware.o: in function `iris_load_fw_to_memory':
>> drivers/media/platform/qcom/iris/iris_firmware.c:49:(.text+0xf4): undefined reference to `qcom_mdt_get_size'
>> loongarch64-linux-ld: drivers/media/platform/qcom/iris/iris_firmware.c:61:(.text+0x13c): undefined reference to `qcom_mdt_load'


vim +49 drivers/media/platform/qcom/iris/iris_firmware.c

d19b163356b81b Dikshita Agarwal 2025-02-07  16  
d19b163356b81b Dikshita Agarwal 2025-02-07  17  static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
d19b163356b81b Dikshita Agarwal 2025-02-07  18  {
d19b163356b81b Dikshita Agarwal 2025-02-07  19  	u32 pas_id = core->iris_platform_data->pas_id;
d19b163356b81b Dikshita Agarwal 2025-02-07  20  	const struct firmware *firmware = NULL;
d19b163356b81b Dikshita Agarwal 2025-02-07  21  	struct device *dev = core->dev;
d19b163356b81b Dikshita Agarwal 2025-02-07  22  	struct reserved_mem *rmem;
d19b163356b81b Dikshita Agarwal 2025-02-07  23  	struct device_node *node;
d19b163356b81b Dikshita Agarwal 2025-02-07  24  	phys_addr_t mem_phys;
d19b163356b81b Dikshita Agarwal 2025-02-07  25  	size_t res_size;
d19b163356b81b Dikshita Agarwal 2025-02-07  26  	ssize_t fw_size;
d19b163356b81b Dikshita Agarwal 2025-02-07  27  	void *mem_virt;
d19b163356b81b Dikshita Agarwal 2025-02-07  28  	int ret;
d19b163356b81b Dikshita Agarwal 2025-02-07  29  
d19b163356b81b Dikshita Agarwal 2025-02-07  30  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
d19b163356b81b Dikshita Agarwal 2025-02-07  31  		return -EINVAL;
d19b163356b81b Dikshita Agarwal 2025-02-07  32  
d19b163356b81b Dikshita Agarwal 2025-02-07  33  	node = of_parse_phandle(dev->of_node, "memory-region", 0);
d19b163356b81b Dikshita Agarwal 2025-02-07  34  	if (!node)
d19b163356b81b Dikshita Agarwal 2025-02-07  35  		return -EINVAL;
d19b163356b81b Dikshita Agarwal 2025-02-07  36  
d19b163356b81b Dikshita Agarwal 2025-02-07  37  	rmem = of_reserved_mem_lookup(node);
d19b163356b81b Dikshita Agarwal 2025-02-07  38  	of_node_put(node);
d19b163356b81b Dikshita Agarwal 2025-02-07  39  	if (!rmem)
d19b163356b81b Dikshita Agarwal 2025-02-07  40  		return -EINVAL;
d19b163356b81b Dikshita Agarwal 2025-02-07  41  
d19b163356b81b Dikshita Agarwal 2025-02-07  42  	mem_phys = rmem->base;
d19b163356b81b Dikshita Agarwal 2025-02-07  43  	res_size = rmem->size;
d19b163356b81b Dikshita Agarwal 2025-02-07  44  
d19b163356b81b Dikshita Agarwal 2025-02-07  45  	ret = request_firmware(&firmware, fw_name, dev);
d19b163356b81b Dikshita Agarwal 2025-02-07  46  	if (ret)
d19b163356b81b Dikshita Agarwal 2025-02-07  47  		return ret;
d19b163356b81b Dikshita Agarwal 2025-02-07  48  
d19b163356b81b Dikshita Agarwal 2025-02-07 @49  	fw_size = qcom_mdt_get_size(firmware);
d19b163356b81b Dikshita Agarwal 2025-02-07  50  	if (fw_size < 0 || res_size < (size_t)fw_size) {
d19b163356b81b Dikshita Agarwal 2025-02-07  51  		ret = -EINVAL;
d19b163356b81b Dikshita Agarwal 2025-02-07  52  		goto err_release_fw;
d19b163356b81b Dikshita Agarwal 2025-02-07  53  	}
d19b163356b81b Dikshita Agarwal 2025-02-07  54  
d19b163356b81b Dikshita Agarwal 2025-02-07  55  	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
e68c3c50a73649 Dan Carpenter    2025-02-17  56  	if (!mem_virt) {
e68c3c50a73649 Dan Carpenter    2025-02-17  57  		ret = -ENOMEM;
d19b163356b81b Dikshita Agarwal 2025-02-07  58  		goto err_release_fw;
e68c3c50a73649 Dan Carpenter    2025-02-17  59  	}
d19b163356b81b Dikshita Agarwal 2025-02-07  60  
d19b163356b81b Dikshita Agarwal 2025-02-07 @61  	ret = qcom_mdt_load(dev, firmware, fw_name,
d19b163356b81b Dikshita Agarwal 2025-02-07  62  			    pas_id, mem_virt, mem_phys, res_size, NULL);
d19b163356b81b Dikshita Agarwal 2025-02-07  63  	if (ret)
d19b163356b81b Dikshita Agarwal 2025-02-07  64  		goto err_mem_unmap;
d19b163356b81b Dikshita Agarwal 2025-02-07  65  
d19b163356b81b Dikshita Agarwal 2025-02-07  66  	ret = qcom_scm_pas_auth_and_reset(pas_id);
d19b163356b81b Dikshita Agarwal 2025-02-07  67  	if (ret)
d19b163356b81b Dikshita Agarwal 2025-02-07  68  		goto err_mem_unmap;
d19b163356b81b Dikshita Agarwal 2025-02-07  69  
d19b163356b81b Dikshita Agarwal 2025-02-07  70  	return ret;
d19b163356b81b Dikshita Agarwal 2025-02-07  71  
d19b163356b81b Dikshita Agarwal 2025-02-07  72  err_mem_unmap:
d19b163356b81b Dikshita Agarwal 2025-02-07  73  	memunmap(mem_virt);
d19b163356b81b Dikshita Agarwal 2025-02-07  74  err_release_fw:
d19b163356b81b Dikshita Agarwal 2025-02-07  75  	release_firmware(firmware);
d19b163356b81b Dikshita Agarwal 2025-02-07  76  
d19b163356b81b Dikshita Agarwal 2025-02-07  77  	return ret;
d19b163356b81b Dikshita Agarwal 2025-02-07  78  }
d19b163356b81b Dikshita Agarwal 2025-02-07  79  

:::::: The code at line 49 was first introduced by commit
:::::: d19b163356b81b7da9bbc47d6c45c4dab8db32d9 media: iris: implement video firmware load/unload

:::::: TO: Dikshita Agarwal <quic_dikshita@quicinc.com>
:::::: CC: Hans Verkuil <hverkuil@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
