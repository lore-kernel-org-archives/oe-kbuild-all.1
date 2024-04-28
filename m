Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8E61FA5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 04:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714280352; cv=none; b=P7gDLFLm5nSQ6k+rdq92MmVfJ+YH8ZwkRuoqb43s0cK65glMMxcidB09p07j67/pweA3pgFogzcpCKUEYby4kRIMQMrWzAl7seomeWO+TnD8t4fYWD2VzdIVEJ1APr+481iK28Ajhf1zoYQ1RZOxEr36ksLxZ9uRUBKyWzEOihU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714280352; c=relaxed/simple;
	bh=Ozmp66ekHU8LLVxQRNzmKBy6kjGSFaoFowvYBo6ijvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J7TK2ckFNO7jeLuK7KQhNuuiXKD2kxmB0pPAhndWZ/1u5LARUcqXsMao0+vG56LqrjuRqi1jIirLUSBwQUlTXkz5OjVpHH57Tay0aNKRY7dEvvvmKXeJNLR4wiitxd9f7+iQpg0u6h9zW8FU0uHBZUKZ2aQZ4lsbXjdMzsQLPtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6NYpWaj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6NYpWaj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714280350; x=1745816350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ozmp66ekHU8LLVxQRNzmKBy6kjGSFaoFowvYBo6ijvs=;
  b=L6NYpWaji6n0jbXM7FP4h4O81kwJsJYkxtKwudk45Znchh0dpRm7wObj
   Jt2gozj4JeP0Na5hlzFwaPMZo7Bbokmd/ybfm39HoXty4BHZp5BzsQ1rj
   ZQUCT+aQn82YuBBcqohIr73h3AqOEnpifmo2ywY9eZ8CQlN/46iuZwASG
   AFBCAJv69FAaP9v9/s2/DjJrBvAOaKG9W8lbO8gPWlmEBQpuJmiIeSkyM
   yEXRAJEDi4imh1zCHNCIAXpayNzX4q1/B3yxLwVR5XXRsuz6TB1pMQiya
   6plcyBT+EYaV0A7wwvrPkGm1LX+dgTsJXL05LxakhDtmO280U/Z4JnXhR
   w==;
X-CSE-ConnectionGUID: w9AqU/JuSSizIKQ/jjz/FA==
X-CSE-MsgGUID: Ink1aJnqQNWND9sHBL80MQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9833044"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="9833044"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 21:59:09 -0700
X-CSE-ConnectionGUID: B14xKqDPSZOgUGuEEK9FJQ==
X-CSE-MsgGUID: pv5WqbC8RwGn0otvtwuCxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="26301112"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Apr 2024 21:59:09 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0wd0-0005qe-0G;
	Sun, 28 Apr 2024 04:59:06 +0000
Date: Sun, 28 Apr 2024 12:58:41 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 3957/11728]
 drivers/crypto/caam/tag_object.c:14: warning: Cannot understand  *
Message-ID: <202404281239.XtU86EBW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 2ca08657189e8d9a1a24e1844c0d4e341518bc7c [3957/11728] MLK-24420-1 crypto: caam - update tagged keys functionality and tk transformations for skcipher
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240428/202404281239.XtU86EBW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281239.XtU86EBW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281239.XtU86EBW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/caam/tag_object.c:14: warning: Cannot understand  *
    on line 14 - I thought it was a doc line


vim +14 drivers/crypto/caam/tag_object.c

ecbfbf984c64e4 Franck LENORMAND 2018-10-05  12  
ecbfbf984c64e4 Franck LENORMAND 2018-10-05  13  /**
ecbfbf984c64e4 Franck LENORMAND 2018-10-05 @14   *
2ca08657189e8d Iuliana Prodan   2020-07-30  15   * is_key_type -	Check if the object is a key
2ca08657189e8d Iuliana Prodan   2020-07-30  16   * @type:		The object type
ecbfbf984c64e4 Franck LENORMAND 2018-10-05  17   *
2ca08657189e8d Iuliana Prodan   2020-07-30  18   * Return:		True if the object is a key (of black or red color),
2ca08657189e8d Iuliana Prodan   2020-07-30  19   *			false otherwise
ecbfbf984c64e4 Franck LENORMAND 2018-10-05  20   */
2ca08657189e8d Iuliana Prodan   2020-07-30  21  bool is_key_type(u32 type)
ecbfbf984c64e4 Franck LENORMAND 2018-10-05  22  {
2ca08657189e8d Iuliana Prodan   2020-07-30  23  	/* Check type bitfield from object type */
2ca08657189e8d Iuliana Prodan   2020-07-30  24  	return ((type >> TAG_OBJ_TYPE_OFFSET) & TAG_OBJ_TYPE_MASK) == 0;
ecbfbf984c64e4 Franck LENORMAND 2018-10-05  25  }
2ca08657189e8d Iuliana Prodan   2020-07-30  26  EXPORT_SYMBOL(is_key_type);
ecbfbf984c64e4 Franck LENORMAND 2018-10-05  27  

:::::: The code at line 14 was first introduced by commit
:::::: ecbfbf984c64e49006b6323ddb86b1692d0e8fbe MLK-19801-1 crypto: caam - add tag functionality

:::::: TO: Franck LENORMAND <franck.lenormand@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
