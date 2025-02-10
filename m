Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1336F2580D8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 16:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204227; cv=none; b=PjrFCFbfe0xigQpwoUHc4+mmipvCiaUGQBaV+3ahVwmw7p54sZI8LvBTl8spq7quMfMim2u6zGmvrI7Rnxf5lTRv0UEs06c9xPJWeP0sbN1iH5izVavqMnUXqY9Xg3pUNJt3nxaxuoOOaoBP4nJvnO2uI9S2zUqgfFQEsYklROI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204227; c=relaxed/simple;
	bh=AlAhsxf5MaLJ0PC8Ohop7QpIO8f1jVY6EWJXrjGcf3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vD6H1OZ8/XJUCrpvzEmpvmkke6tqe2nYOP9TzeeYSW221n7hiO9FKJzsjfjpHc/bzg9q63oKETekzjM4F+CsBQzEl2iTARZkbX5CB9voEccfyU968EnQHVEu+r/r8rf3CxuWxb3oXOHRuEW2YKa2YX/V/usq0S5yFDsUeyTwL3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddDRzUSZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddDRzUSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739204226; x=1770740226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AlAhsxf5MaLJ0PC8Ohop7QpIO8f1jVY6EWJXrjGcf3A=;
  b=ddDRzUSZczDPOz6T8ztCZI+Be77fquzz2jimMKXqjdU4zPfO9Do/UlJQ
   /9MWjTNtOp2a3Zm1v0QBEQ7OHN3+MIIF0FrwdnwaFXGdMQwWti0KbqU0E
   464aBwpfn+x6WaBA9kij6oug7cPHWTp+agjnO3JiHkh8F7GP5H6cePyqP
   JbOyc7s/ExqBUnGZUveyGRx4dq9i+ResGSC6ZA9lygr4UiBUo3FYwY09k
   9eBBvZQmPekSHZXVSHaBFLIHixeZs25bxuQoqd9skmGtJHCVey1ujBMN0
   3XN5F6EanLi8BDPGNWgBivqfZwOfr5NtktKPO6qt6wnyiaoFnP4uk73ko
   A==;
X-CSE-ConnectionGUID: M5GuZaF/RnK8uoxlOMt8SA==
X-CSE-MsgGUID: pXT/onRLT1+5gvqNzO1iVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57206077"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="57206077"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 08:16:43 -0800
X-CSE-ConnectionGUID: ypGqEL/4RK6Jtl6lLlh3UA==
X-CSE-MsgGUID: lQtigyvcSkyiKS46m7OqsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="112069412"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Feb 2025 08:16:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thWSd-00131j-1a;
	Mon, 10 Feb 2025 16:16:39 +0000
Date: Tue, 11 Feb 2025 00:16:13 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [broonie-ci:20250205_ckeepax_add_sdca_disco_parsing_support 30/37]
 sound/soc/sdca/sdca_functions.c:233:36: sparse: sparse: cast to restricted
 __le32
Message-ID: <202502110032.OUxeAwlV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20250205_ckeepax_add_sdca_disco_parsing_support
head:   9da195880f167ab7c2d595388decf783c9920121
commit: 19f6748abbab8523a7b32a5e371e39d4d8d4aba5 [30/37] ASoC: SDCA: Parse initialization write table
config: i386-randconfig-061-20250210 (https://download.01.org/0day-ci/archive/20250211/202502110032.OUxeAwlV-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110032.OUxeAwlV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110032.OUxeAwlV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/sdca/sdca_functions.c:233:36: sparse: sparse: cast to restricted __le32

vim +233 sound/soc/sdca/sdca_functions.c

   188	
   189	static int find_sdca_init_table(struct device *dev,
   190					struct fwnode_handle *function_node,
   191					struct sdca_function_data *function)
   192	{
   193		struct sdca_init_write *init_write;
   194		int write_size = sizeof(init_write->addr) + sizeof(init_write->val);
   195		u8 *init_list, *init_iter;
   196		int num_init_writes;
   197	
   198		num_init_writes = fwnode_property_count_u8(function_node,
   199							   "mipi-sdca-function-initialization-table");
   200		if (!num_init_writes || num_init_writes == -EINVAL) {
   201			return 0;
   202		} else if (num_init_writes < 0) {
   203			dev_err(dev, "%pfwP: failed to read initialization table: %d\n",
   204				function_node, num_init_writes);
   205			return num_init_writes;
   206		} else if (num_init_writes % write_size != 0) {
   207			dev_err(dev, "%pfwP: init table size invalid\n", function_node);
   208			return -EINVAL;
   209		} else if (num_init_writes > SDCA_MAX_INIT_COUNT) {
   210			dev_err(dev, "%pfwP: maximum init table size exceeded\n", function_node);
   211			return -EINVAL;
   212		}
   213	
   214		init_write = devm_kcalloc(dev, num_init_writes / write_size,
   215					  sizeof(*init_write), GFP_KERNEL);
   216		if (!init_write)
   217			return -ENOMEM;
   218	
   219		init_list = kcalloc(num_init_writes, sizeof(*init_list), GFP_KERNEL);
   220		if (!init_list)
   221			return -ENOMEM;
   222	
   223		fwnode_property_read_u8_array(function_node,
   224					      "mipi-sdca-function-initialization-table",
   225					      init_list, num_init_writes);
   226	
   227		function->num_init_table = num_init_writes;
   228		function->init_table = init_write;
   229	
   230		for (init_iter = init_list; init_iter < init_list + num_init_writes;) {
   231			u32 *addr = (u32 *)init_iter;
   232	
 > 233			init_write->addr = le32_to_cpu(*addr);
   234			init_iter += sizeof(init_write->addr);
   235	
   236			init_write->val = *init_iter;
   237			init_iter += sizeof(init_write->val);
   238		}
   239	
   240		kfree(init_list);
   241	
   242		return 0;
   243	}
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
