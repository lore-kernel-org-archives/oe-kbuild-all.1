Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6C71FF607
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 14:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732717636; cv=none; b=aczKCVaIQK1QfxEli6H//2xbqNkvc1H3FSajquetk9zdjqbAq6DysnUB+dkRcolaWmWJC+JoyLef1BkMsj7aeO3YBIEReyAALDh3Zlp4Rdo15wL0QgLj11XpZvXJ59Qivdo7ujtHOis73Q9AmP2w1gb1gbu+jEg7zNhhMDTLmgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732717636; c=relaxed/simple;
	bh=ZGmu8x+8Ql3KMIK4IwfGQCgrp8mXl09lriNySZ4+N18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oLyh31C1Uqp2gcFI2CdrEc5m0U3iIfk2Oz5xXX6TxKLpQtRBh/Hg/krchkwlIsJu2D8FzdQ6/VHr/zKv7OVrN2nHLzikNaFz+VcovA/5rD3otXclkN9if+blLEJ4+JPFrWPSJIND0AC2Q2rt6q2zk3p7KEIozwdayj62DE9fnAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbkFHmFf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbkFHmFf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732717634; x=1764253634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZGmu8x+8Ql3KMIK4IwfGQCgrp8mXl09lriNySZ4+N18=;
  b=hbkFHmFfIFTomo8jp9TU1CTGzoTOJBvzdbFJEC+SabFWbxs6EudToPZ3
   ZfmA5OYdCC66eoldGxKS/YBDJGpvEHBdEAczumVpAlukYkfrYssmzglOX
   vdQgtlPFoolFLnb4LiInSwkDFvI6RsvEJ6WLQI7/QNScqhOqtiLv5u0C/
   pe2jCkQh3Jcrgj9DKOfB6s1gqnTCCIDZCNZhMEtKdUC35XJ6IXcyiYCVL
   XmHtLSqq7f+CxdGi6EJ9RpShnCu5QueXl4cigo7nV10kq8pZ6Ae7rhzyO
   EAihJwBPrwbrfDIRgRMGOveXlqH579BUo/SjrPvcxd1Myvso9S2PF+SZL
   w==;
X-CSE-ConnectionGUID: nul6HOFRQ321xRTGxoGuZw==
X-CSE-MsgGUID: dZY15gj5RfyGtc9qbW6+tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="50450184"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="50450184"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 06:27:13 -0800
X-CSE-ConnectionGUID: SbCfpGMyRSSpDuUxgCO2Cg==
X-CSE-MsgGUID: TiPdxgRhTjeBKPZiUQV13w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="91895539"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Nov 2024 06:27:12 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGJ0X-00083a-1C;
	Wed, 27 Nov 2024 14:27:09 +0000
Date: Wed, 27 Nov 2024 22:26:35 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:i2c/for-next 2/8] drivers/of/base.c:661: warning: Function
 parameter or struct member 'prefix' not described in
 'of_get_next_child_with_prefix'
Message-ID: <202411280010.KGSDBOUE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
head:   44b682694a0ca366bf15c26c3c3c16d26c9e9f6d
commit: 1fcc67e3a354865775355eafec1fb061a755c971 [2/8] of: base: Add for_each_child_of_node_with_prefix()
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241128/202411280010.KGSDBOUE-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280010.KGSDBOUE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280010.KGSDBOUE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/base.c:661: warning: Function parameter or struct member 'prefix' not described in 'of_get_next_child_with_prefix'


vim +661 drivers/of/base.c

   646	
   647	/**
   648	 * of_get_next_child_with_prefix - Find the next child node with prefix
   649	 * @node:	parent node
   650	 * @prev:	previous child of the parent node, or NULL to get first
   651	 *
   652	 * This function is like of_get_next_child(), except that it automatically
   653	 * skips any nodes whose name doesn't have the given prefix.
   654	 *
   655	 * Return: A node pointer with refcount incremented, use
   656	 * of_node_put() on it when done.
   657	 */
   658	struct device_node *of_get_next_child_with_prefix(const struct device_node *node,
   659							  struct device_node *prev,
   660							  const char *prefix)
 > 661	{
   662		struct device_node *next;
   663		unsigned long flags;
   664	
   665		if (!node)
   666			return NULL;
   667	
   668		raw_spin_lock_irqsave(&devtree_lock, flags);
   669		next = prev ? prev->sibling : node->child;
   670		for (; next; next = next->sibling) {
   671			if (!of_node_name_prefix(next, prefix))
   672				continue;
   673			if (of_node_get(next))
   674				break;
   675		}
   676		of_node_put(prev);
   677		raw_spin_unlock_irqrestore(&devtree_lock, flags);
   678		return next;
   679	}
   680	EXPORT_SYMBOL(of_get_next_child_with_prefix);
   681	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
