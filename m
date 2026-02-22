Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6941F3B85
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 09:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771754021; cv=none; b=FzHO0vXiGSbJoqbqP8VyVPRcDlQ3yMP7AJHASLkhvcIqQMk93Ff6EBBw3v7huzFz+elLzxhtQlUonaWy1t81GP2B21orusxgtP8d0ZP8kCpt+VmuW0wA+k+zUez6fYSpHgUWHG0vAA19QCv02eGCtjKdF3KurrG/dXVfRQm/RBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771754021; c=relaxed/simple;
	bh=gI6PtcLwXNBmwlC0XhNC1E7Dvj/zUFtmO0VVYZ/hkpU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B3s+ZXRyF/eOlpfhW5mGwuAx/aPCwrKK71aszGqhauHSqDfonnPoT4dOzm3udCqj3OWmKyJHttfZlme0DW4QQWNIJwg0piWoOtGubnv6HdB1Z/38IyIxLQxu0F4NNZU1LLZdBDSFm4kA1WK/u0dRvCEW9fEj9beguPe34Z8Z4qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzJPzhHB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzJPzhHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771754019; x=1803290019;
  h=date:from:to:cc:subject:message-id;
  bh=gI6PtcLwXNBmwlC0XhNC1E7Dvj/zUFtmO0VVYZ/hkpU=;
  b=UzJPzhHB4INzF0DM8bV7pnLuZ1U88iaB1O0KfEA9gEci2Um34ZS3rWlH
   cZhXn5a2VQk+w4xky/+0Q55kUQMSk9lfS3J8pQtIiqTrtUi2u1+QabseQ
   57kp+VF/tzhGE2eAKWk4xuvL/B2sKvP7RGZyLhlseMuxM+rV43I/7WNDd
   98HsrEVLTn9DR65ehMFBo26FnGCEMfnJJVKt7zFAEeyR5kTpeZDgfP8+R
   srCmB0i1HDVmK2DrSVvW0xy4A2UkoOBnMJjpWKA8eNy2Xb5Xkp6/6/APl
   dkoK4L61nJxlhnLcboGqJArk6KkCQTqYiNZJAO+9+oKAEMaoT1J3eON0i
   A==;
X-CSE-ConnectionGUID: Xxn4kBxPS8qFDSchXVsFOQ==
X-CSE-MsgGUID: LrM9tFFMTLm/IWLA/627iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="76642159"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="76642159"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 01:53:38 -0800
X-CSE-ConnectionGUID: 5dPOKxNbQT+sI/gXtQsv9g==
X-CSE-MsgGUID: SbJ8Eic3S3CkxvahtUE/6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="219401646"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Feb 2026 01:53:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu69e-000000015QG-2R6Z;
	Sun, 22 Feb 2026 09:53:34 +0000
Date: Sun, 22 Feb 2026 17:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:private_compression 34/60]
 drivers/base/node.c:1205:9: error: 'node_private_initialized' undeclared; did
 you mean 'fwnode_dev_initialized'?
Message-ID: <202602221746.CAzx7eWw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux private_compression
head:   9fa5ffee4fd4726e31f05deebb938cccfa0b460f
commit: f03127df4a84bc148a92a8a8607acfa1ff47c6a2 [34/60] numa: introduce N_MEMORY_PRIVATE node state
config: sh-defconfig (https://download.01.org/0day-ci/archive/20260222/202602221746.CAzx7eWw-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602221746.CAzx7eWw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602221746.CAzx7eWw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/base/node.c: In function 'node_dev_init':
>> drivers/base/node.c:1205:9: error: 'node_private_initialized' undeclared (first use in this function); did you mean 'fwnode_dev_initialized'?
    1205 |         node_private_initialized = true;
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         fwnode_dev_initialized
   drivers/base/node.c:1205:9: note: each undeclared identifier is reported only once for each function it appears in


vim +1205 drivers/base/node.c

  1183	
  1184	void __init node_dev_init(void)
  1185	{
  1186		int ret, i;
  1187	
  1188	 	BUILD_BUG_ON(ARRAY_SIZE(node_state_attr) != NR_NODE_STATES);
  1189	 	BUILD_BUG_ON(ARRAY_SIZE(node_state_attrs)-1 != NR_NODE_STATES);
  1190	
  1191		ret = subsys_system_register(&node_subsys, cpu_root_attr_groups);
  1192		if (ret)
  1193			panic("%s() failed to register subsystem: %d\n", __func__, ret);
  1194	
  1195		/*
  1196		 * Create all node devices, which will properly link the node
  1197		 * to already created cpu devices.
  1198		 */
  1199		for_each_online_node(i) {
  1200			ret =  register_node(i);
  1201			if (ret)
  1202				panic("%s() failed to add node: %d\n", __func__, ret);
  1203		}
  1204	
> 1205		node_private_initialized = true;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
