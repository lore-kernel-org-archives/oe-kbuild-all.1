Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFE428EC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 03:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728183940; cv=none; b=bfp7wwht/ehmv7Qa5ZHorPLYA+4gXM3N3kxld7TDrFklDPDSwdTgbOMWyGmQAnkwxr4EBpTUk/igo+riBf8zclG5yNEVgGfLGxcrvCnPyH4H2aOQHZA5Im6jop6Z+MEIESM84ZQJXtd7w282rIGHbXy+tM4QVszyAHJ6tMTb9Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728183940; c=relaxed/simple;
	bh=swAZdtbzq3GRtnrRQRRloQdopx9GNtmq2UyT1KRvqNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UfCuLgx8odvP3t+9z0wUcqCKJ4u2lrKM4hwkJ8uEcql1o7SkETzrwYwi09iNAFdGaggxR0T67i83SDYrD93dm5HH0tsHTiq+R0nVHrXyH/cwKD55Hk6qrRCGWPzn8RbJ6UeRhWv9dNXUP2jbi/9mZ9I1tfTDsXOBYy3cla1eyD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PaMqP8B4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PaMqP8B4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728183938; x=1759719938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=swAZdtbzq3GRtnrRQRRloQdopx9GNtmq2UyT1KRvqNM=;
  b=PaMqP8B4fFs+gpOvg56DyS98aqv/9hH6cTwv9JqSelRY/zEZHTbV4gYQ
   vrXgUNWzUlmTnc+TomtCScu+vWuiP15wpsdIYEMaW5v/v35YzKk7RN0Sq
   q4l1Lh620zHfRlI+v9LxzEQhxTSsTGjGUnYW2aHRxYISNvl6amN/cr6g9
   R74sc+UNbwQ6ALj1jif6bZaWEW6QJjCmf4X6c3Tap2V6ajYmd2jWpvt5a
   v4ncwMAjTrwHgxoS7XI8qam0oSMvuT00NNPNEwpCjRaGj+8TU7+1IaQLa
   YHgi3yJs25Y+FILnuDwyBExWZLXMu5vGzA9tMrvVSv8ZbgE0wyBVNzKHQ
   A==;
X-CSE-ConnectionGUID: YMaGm7s8R6K8g10cMWSzsg==
X-CSE-MsgGUID: /GInA8OETGqweSnMQHvd0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="37966393"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="37966393"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 20:05:37 -0700
X-CSE-ConnectionGUID: ieGjmaq8S0ikk9HJHvg8QQ==
X-CSE-MsgGUID: 6PhbU6JZTy+QdiGXs8aWwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="74781953"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Oct 2024 20:05:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxHaQ-0003Yy-1y;
	Sun, 06 Oct 2024 03:05:34 +0000
Date: Sun, 6 Oct 2024 11:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: [cel:nfsd-5.10.y 104/169] drivers/i2c/i2c-core-base.c:101:38:
 warning: passing argument 1 of 'device_get_match_data' discards 'const'
 qualifier from pointer target type
Message-ID: <202410061057.ooVgnzWW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-5.10.y
head:   515eb04a8b0667cd6d18d68b08ef33afbd02845b
commit: 485dd5c359970c7a431596bcd8c4469362915eba [104/169] i2c: Add i2c_get_match_data()
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241006/202410061057.ooVgnzWW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061057.ooVgnzWW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061057.ooVgnzWW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/i2c-core-base.c: In function 'i2c_get_match_data':
>> drivers/i2c/i2c-core-base.c:101:38: warning: passing argument 1 of 'device_get_match_data' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     101 |         data = device_get_match_data(&client->dev);
         |                                      ^~~~~~~~~~~~
   In file included from include/linux/of.h:22,
                    from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from drivers/i2c/i2c-core-base.c:16:
   include/linux/property.h:382:50: note: expected 'struct device *' but argument is of type 'const struct device *'
     382 | const void *device_get_match_data(struct device *dev);
         |                                   ~~~~~~~~~~~~~~~^~~


vim +101 drivers/i2c/i2c-core-base.c

    94	
    95	const void *i2c_get_match_data(const struct i2c_client *client)
    96	{
    97		struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
    98		const struct i2c_device_id *match;
    99		const void *data;
   100	
 > 101		data = device_get_match_data(&client->dev);
   102		if (!data) {
   103			match = i2c_match_id(driver->id_table, client);
   104			if (!match)
   105				return NULL;
   106	
   107			data = (const void *)match->driver_data;
   108		}
   109	
   110		return data;
   111	}
   112	EXPORT_SYMBOL(i2c_get_match_data);
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
