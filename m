Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881541F947
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 11:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716289703; cv=none; b=eusrB5VKYnn6LUH4T1+YuPdFd/lcyeHDWdJd5KuGbNG+BxJ08wFGLmbM3HMguX2On1PFORMevUj/Gbd0CLRe2IM+d8ALRaRPziUU+9f92s0heMVDDEOn93WZSRLzHHWanmtvqsaMxtEgBCc951mPves+WGBAUxnv21CcqVTk8EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716289703; c=relaxed/simple;
	bh=p4icMg7epm2NIXpVHpTra5QsJhnh2Atbx8fBHxpqoLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G2yUqN9I1VcBZzs6tDNrAE8hPbZ+kHGYeoewmj+0yj89wlBUHhOyRi/b3GYWIpRT2GRTbPs2tSNBnJNfmcsN2bnblcZjT9obP9Ci7rQF1YnPH+0gJR3St6PZzlmVulAzArerd/HOW1ArjXMvvcrG3Ud/mfI13kcwsnzMLPxvuuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZKhk5YD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZKhk5YD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716289702; x=1747825702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p4icMg7epm2NIXpVHpTra5QsJhnh2Atbx8fBHxpqoLI=;
  b=EZKhk5YDt/yaxU6mgJgFAox4Plf3oiz9XFVyy7PWKvvx7ajmSGm21MOF
   LCOZYAInraWlGlgPYOj6HDQMkTmsv0TisF6M6G0RDfvVnJDXWPbM806dG
   iMtPAl2dpEAW8dB7H2RvJbGX0nZ9y84MtkaaPwmwYDm2KolDu9I5U1P1e
   JYRyS7N0xlbklYS6xv0hvgMJ5ymhwpFNpCwX2ft74FpjX6GoCpwRR+YED
   IJoWrWooDuoRB//4pCehW7+YBePc7lV7oq1KPKvwJwTg2kSt0zAzIbdGF
   qU3dq/MYdpAjfozbD2B8rsPxdA6f8xvu+YTSjws6IVyX6Ip6OMZSd5a21
   g==;
X-CSE-ConnectionGUID: uv4T3zu8QZqrLarcOL6MVw==
X-CSE-MsgGUID: wPJVXqVQQMeVGNy2rZuHcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="29983087"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="29983087"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 04:08:21 -0700
X-CSE-ConnectionGUID: jTXtzHp1S+ON/C+27t60Rw==
X-CSE-MsgGUID: Oaqbs6mVTYGCy738SFN26w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="37841884"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 May 2024 04:08:20 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9NLt-0006IW-1i;
	Tue, 21 May 2024 11:08:17 +0000
Date: Tue, 21 May 2024 19:07:33 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/rt712-quirks 19/24]
 drivers/soundwire/slave.c:91:undefined reference to
 `sdca_lookup_interface_revision'
Message-ID: <202405211946.PwCEHZPV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/rt712-quirks
head:   00d39334f0f6f7d27e80b4741b63e4742e073fb7
commit: 2b3abca668a1f59e1426ea6e13d9c07672552f6f [19/24] soundwire: slave: parse SDCA function mask and revision
config: x86_64-randconfig-104-20240521 (https://download.01.org/0day-ci/archive/20240521/202405211946.PwCEHZPV-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405211946.PwCEHZPV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211946.PwCEHZPV-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `sdw_slave_add':
>> drivers/soundwire/slave.c:91:(.text+0x1472da0): undefined reference to `sdca_lookup_interface_revision'
>> ld: drivers/soundwire/slave.c:92:(.text+0x1472da8): undefined reference to `sdca_lookup_function_mask'


vim +91 drivers/soundwire/slave.c

    25	
    26	int sdw_slave_add(struct sdw_bus *bus,
    27			  struct sdw_slave_id *id, struct fwnode_handle *fwnode)
    28	{
    29		struct sdw_slave *slave;
    30		int ret;
    31		int i;
    32	
    33		slave = kzalloc(sizeof(*slave), GFP_KERNEL);
    34		if (!slave)
    35			return -ENOMEM;
    36	
    37		/* Initialize data structure */
    38		memcpy(&slave->id, id, sizeof(*id));
    39		slave->dev.parent = bus->dev;
    40		slave->dev.fwnode = fwnode;
    41	
    42		if (id->unique_id == SDW_IGNORED_UNIQUE_ID) {
    43			/* name shall be sdw:ctrl:link:mfg:part:class */
    44			dev_set_name(&slave->dev, "sdw:%01x:%01x:%04x:%04x:%02x",
    45				     bus->controller_id, bus->link_id, id->mfg_id, id->part_id,
    46				     id->class_id);
    47		} else {
    48			/* name shall be sdw:ctrl:link:mfg:part:class:unique */
    49			dev_set_name(&slave->dev, "sdw:%01x:%01x:%04x:%04x:%02x:%01x",
    50				     bus->controller_id, bus->link_id, id->mfg_id, id->part_id,
    51				     id->class_id, id->unique_id);
    52		}
    53	
    54		slave->dev.bus = &sdw_bus_type;
    55		slave->dev.of_node = of_node_get(to_of_node(fwnode));
    56		slave->dev.type = &sdw_slave_type;
    57		slave->dev.groups = sdw_slave_status_attr_groups;
    58		slave->bus = bus;
    59		slave->status = SDW_SLAVE_UNATTACHED;
    60		init_completion(&slave->enumeration_complete);
    61		init_completion(&slave->initialization_complete);
    62		slave->dev_num = 0;
    63		slave->probed = false;
    64		slave->first_interrupt_done = false;
    65		mutex_init(&slave->sdw_dev_lock);
    66	
    67		for (i = 0; i < SDW_MAX_PORTS; i++)
    68			init_completion(&slave->port_ready[i]);
    69	
    70		mutex_lock(&bus->bus_lock);
    71		list_add_tail(&slave->node, &bus->slaves);
    72		mutex_unlock(&bus->bus_lock);
    73	
    74		ret = device_register(&slave->dev);
    75		if (ret) {
    76			dev_err(bus->dev, "Failed to add slave: ret %d\n", ret);
    77	
    78			/*
    79			 * On err, don't free but drop ref as this will be freed
    80			 * when release method is invoked.
    81			 */
    82			mutex_lock(&bus->bus_lock);
    83			list_del(&slave->node);
    84			mutex_unlock(&bus->bus_lock);
    85			put_device(&slave->dev);
    86	
    87			return ret;
    88		}
    89		sdw_slave_debugfs_init(slave);
    90	
  > 91		sdca_lookup_interface_revision(slave);
  > 92		sdca_lookup_function_mask(slave);
    93	
    94		return ret;
    95	}
    96	EXPORT_SYMBOL(sdw_slave_add);
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
