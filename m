Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE2019C56A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 12:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732104406; cv=none; b=BobQIAndPTfzlEGlnqYHg64JVhNYEnZIde/BJ9dr9LHjTzbY6ojAk5W+YuhUq/C6m41OiDl7jms8fjxryi29gWadB3Cc55+oNmkfET1UgGGZfc05Q2tuln53mMCRiCBxkpSqBMf8Q8EjwpE99BNhdL0GsIic06hkRNiOUoZhGu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732104406; c=relaxed/simple;
	bh=xYop3rRItwkmrrL4XyrET0gpBFWQvWv6pWEZeiglgH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h9PZGxV/KchBvKwXLs6Zt0SSS+mXak4YyT2jqcg1pumbanL6xqVyLl0VduF33VC2ZSpIgKwCy8q3m6L76GCzs1qYfMUZN6EacTzdiH/FQJH0qKxrPo7TdY0VoPr077FK66Aq6DBO5f95Fv4vby1BPdhLPH3p7u1GWQ6K2y4Tyi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iveQ7Els; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iveQ7Els"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732104405; x=1763640405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xYop3rRItwkmrrL4XyrET0gpBFWQvWv6pWEZeiglgH4=;
  b=iveQ7ElsVDHPZmNTBTX+UFiBSGMtnobLcW1Zp894wrs85g7uGiL5DVI1
   Z8sDHUdTGR19Jo1xgCxcpGAuO5SFcm2XqZy3NpXC4rVr0WoJ7etX24s8d
   XKON4SS+ab0Mo7xNMHJfZyGS8s4gX2Rvuw6TQaKN+Rd7vKck5EloSdeOS
   Og+fl+HYuLtfnG8mfG6+exZWzuGlapSQWy956VKuFVvO8SDnutuZyBD/Q
   bbNozB05Rl800IWxtIkkQTBEux53o4S9sS36IYRpwlqWZ1al+UlHTHogh
   b8GxXVnKXLAxD0SMubDSNDIyhOoPW6LgjYXJD2VjEhTuh0DQnm7Y0jEbW
   Q==;
X-CSE-ConnectionGUID: WI6gigjKTEmiQdaNIsftFA==
X-CSE-MsgGUID: 46Xqy741SbmjyLTbybIoQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="43540531"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="43540531"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 04:06:44 -0800
X-CSE-ConnectionGUID: lTh8ZUNeSva2Ye8gw1kZKw==
X-CSE-MsgGUID: n3DzJcM8TTaWLMhqKB+y2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="90278147"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Nov 2024 04:06:43 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDjTk-0000pw-1i;
	Wed, 20 Nov 2024 12:06:40 +0000
Date: Wed, 20 Nov 2024 20:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 14/150]
 arch/powerpc/kernel/secvar-sysfs.c:142:17: error: cannot assign to variable
 'data_attr' with const-qualified type 'const struct bin_attribute'
Message-ID: <202411202001.UDGNjDhg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   7a315c5c3a11f198244918c63efbc9205fc501a1
commit: b9c98b9876d636cc1a76b8c41c4d5436809468f9 [14/150] powerpc
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20241120/202411202001.UDGNjDhg-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411202001.UDGNjDhg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411202001.UDGNjDhg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/secvar-sysfs.c:142:17: error: cannot assign to variable 'data_attr' with const-qualified type 'const struct bin_attribute'
     142 |         data_attr.size = varsize;
         |         ~~~~~~~~~~~~~~ ^
   arch/powerpc/kernel/secvar-sysfs.c:107:35: note: variable 'data_attr' declared const here
     107 | static const struct bin_attribute data_attr = __BIN_ATTR_RO(data, 0);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/kernel/secvar-sysfs.c:143:19: error: cannot assign to variable 'update_attr' with const-qualified type 'const struct bin_attribute'
     143 |         update_attr.size = varsize;
         |         ~~~~~~~~~~~~~~~~ ^
   arch/powerpc/kernel/secvar-sysfs.c:109:35: note: variable 'update_attr' declared const here
     109 | static const struct bin_attribute update_attr = __BIN_ATTR_WO(update, 0);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +142 arch/powerpc/kernel/secvar-sysfs.c

bd5d9c743d38f67 Nayna Jain     2019-11-10  135  
bd5d9c743d38f67 Nayna Jain     2019-11-10  136  	u64 varsize;
e02407944052554 Russell Currey 2023-02-10  137  	int rc = secvar_ops->max_size(&varsize);
bd5d9c743d38f67 Nayna Jain     2019-11-10  138  
bd5d9c743d38f67 Nayna Jain     2019-11-10  139  	if (rc)
e02407944052554 Russell Currey 2023-02-10  140  		return rc;
bd5d9c743d38f67 Nayna Jain     2019-11-10  141  
bd5d9c743d38f67 Nayna Jain     2019-11-10 @142  	data_attr.size = varsize;
bd5d9c743d38f67 Nayna Jain     2019-11-10 @143  	update_attr.size = varsize;
bd5d9c743d38f67 Nayna Jain     2019-11-10  144  
e02407944052554 Russell Currey 2023-02-10  145  	return 0;
bd5d9c743d38f67 Nayna Jain     2019-11-10  146  }
bd5d9c743d38f67 Nayna Jain     2019-11-10  147  

:::::: The code at line 142 was first introduced by commit
:::::: bd5d9c743d38f67d64ea1b512a461f6b5a5f6bec powerpc: expose secure variables to userspace via sysfs

:::::: TO: Nayna Jain <nayna@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
