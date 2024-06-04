Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221D5137924
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jun 2024 01:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717464572; cv=none; b=HLACOY1w8CWxaw1xqH0XhRhaZ4+rT2ExpXx1SzCKkUGLmYSnvS1hQPlsC0rxez2nTR0T8XEhfp6JBgdCekCcB8OR71drOODtjxOSUwoE1Jvq7qCFlLXCmtVboE79TI8/rJ9aqpVMtrSjbyb+p76H6jbZGx8cfJrESu1J/Dqu8qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717464572; c=relaxed/simple;
	bh=pZN+nLC4x5STBrz24H97UR0/FRkHaBvhml4q/YNb3f0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IGS6DfFiCNTn8+p8tjUCH3w3Fo8bxdpiF2J0SsyO/Fn7Pl3A7JcZwluZ0ozsuXbeWeayM7G9txHlD5PdlI1uNYMTmWaWscDHlHP3xfoC2a8sNZ7xDa38ckHh/3iGG2o5O4W8lqXvFjVLCNpq/a8ydRAwN9/hPh+fuXasrRTpftc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2poMGqQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2poMGqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717464570; x=1749000570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pZN+nLC4x5STBrz24H97UR0/FRkHaBvhml4q/YNb3f0=;
  b=b2poMGqQVZTHLfiZcLaMFXARKtYOaXtTeN+1kj1YcEqxr3K8EPRWrwN3
   tPKY9wUi9jHVlTlG9q8Jg9gGCoba07UComwmIlmc3PqfutqlQknXGOYW0
   0q9Qcs3/LN8+DJfJKW25/bkHY8TY3fzuV6ihrtboVSyLqR43DvML35wS7
   l0gwyjuUBpTKnuXd95QSzjnxwtPf7lPmmXmlcz4zs2Qy4NA4dQ8nCQiJB
   YLOQ7yeJ4KqwgLnn6gCpPE55ANp01ONYv9gesoia8iL2L9nC3ciVTGbZG
   K7uU13HRhUGhMPJ8AOz1s48qqddKsh/FfRK1VUBAAagyvhYVZiolvPRsB
   g==;
X-CSE-ConnectionGUID: LrwsvTN5RHm4Ox5fi6McRA==
X-CSE-MsgGUID: ibB5OdhERgym2vox6pfvOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24609268"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="24609268"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 18:29:28 -0700
X-CSE-ConnectionGUID: MyaSH/SAToq1KeQ1L7rtxg==
X-CSE-MsgGUID: bvBVQWUvSJmnplmqjfpM9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="37692908"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Jun 2024 18:29:26 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEIzL-000MP1-38;
	Tue, 04 Jun 2024 01:29:23 +0000
Date: Tue, 4 Jun 2024 09:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2957/3461] drivers/hwmon/hwmon.c:398:undefined
 reference to `i2c_verify_client'
Message-ID: <202406040901.7u7OsEtF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   861a3cb5a2a8480d361fa6708da24747d6fa72fe
commit: 029e008808aa1af87f59e056bcc9ad26bcd30483 [2957/3461] hwmon: Add PEC attribute support to hardware monitoring core
config: powerpc-buildonly-randconfig-r006-20220717 (https://download.01.org/0day-ci/archive/20240604/202406040901.7u7OsEtF-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406040901.7u7OsEtF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406040901.7u7OsEtF-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/hwmon/hwmon.o: in function `hwmon_pec_register':
>> drivers/hwmon/hwmon.c:398:(.text+0x2404): undefined reference to `i2c_verify_client'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HWMON
   Depends on [m]: HAS_IOMEM [=y] && (I2C [=m] || I2C [=m]=n)
   Selected by [y]:
   - NTB_IDT [=y] && NTB [=y] && PCI [=y]


vim +398 drivers/hwmon/hwmon.c

   395	
   396	static int hwmon_pec_register(struct device *hdev)
   397	{
 > 398		struct i2c_client *client = i2c_verify_client(hdev->parent);
   399		int err;
   400	
   401		if (!client)
   402			return -EINVAL;
   403	
   404		if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_PEC))
   405			return 0;
   406	
   407		err = device_create_file(&client->dev, &dev_attr_pec);
   408		if (err)
   409			return err;
   410	
   411		return devm_add_action_or_reset(hdev, hwmon_remove_pec, &client->dev);
   412	}
   413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
