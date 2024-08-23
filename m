Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88F51953BB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 23:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724456751; cv=none; b=KPe9nm7IZtK9I4lnaPwHIxds0gny9ILib68ae4IgH0HhYMgt2WC/ADWe0tVHnXZTmXjnfK1eQDsLtMdBJ4EfIJC6SjZq3fFRkOVPfq45dn8cv34JjXe52b330N89RuDEH+K0rXiPEb21DEtK5aDwDtjB6bwVOoFRQBvK6B+zxmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724456751; c=relaxed/simple;
	bh=zH/DQ1DbGyIfv1vIJVmHkRqY+grZCCfSLxjK6h4h7s8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fxZFH8fjYXLtIp8aWEtMUspvZ3jH343Pm0GHe19uxs705s3tOqcX/FcVvouZlOb+/szfCuTqJKkFQIQSukKlIsyztOOM5GMZ6E31bT2JIGjttx+uAldMhQ1yCdRibDndHhNLI4Dy2YyLpgGlgw/zJNA0ojUJPda+2OGJc1MtNhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2U2E/bh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2U2E/bh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724456749; x=1755992749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zH/DQ1DbGyIfv1vIJVmHkRqY+grZCCfSLxjK6h4h7s8=;
  b=W2U2E/bhyqEzRWCtkAmYoCpa7v7EiBfIyYkGxwep1hjTF9sO58q+Zklc
   Gy0+5XVawF/OZbYhQvyZqpimGYapheb6dQGXE2uwQ/vys+KvaUjhdyZuR
   EuoSnzh1+Q/L0jEZiEKe0Cy2Q5l6qCPR4TPlQ5vDW+QJ0kkXBcG5gb2+6
   YFGV2YDITl1sMAuREk/cEVLjNWar74ArrcA/8MwfW8DGSB1uWbsr1xPfP
   +Q0Ze5B7o+6TqRodj6pqOttKpM4zftclmvbD3NVxUi2HzIRtg8sOO+hyX
   cA6iBSIElsibtshxJpKX8XYTAYOkccO96rl2IWeLtMBEnBNrS92OVgeuC
   g==;
X-CSE-ConnectionGUID: 6dFGMUo3She/qg3/e1Eyng==
X-CSE-MsgGUID: 2auGH9oPSNah83uwX0HgOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="23130529"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; 
   d="scan'208";a="23130529"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 16:45:48 -0700
X-CSE-ConnectionGUID: 3SZS3kDRTJW4S4iX5MKtQw==
X-CSE-MsgGUID: QOlCuXVmTyy9Br8KXteU/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; 
   d="scan'208";a="92765455"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Aug 2024 16:45:47 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shdyT-000E6q-1Q;
	Fri, 23 Aug 2024 23:45:45 +0000
Date: Sat, 24 Aug 2024 07:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/regmap_raw_write_async 6/18]
 drivers/soundwire/stream.c:2112:48-53: WARNING: conversion to bool not
 needed here
Message-ID: <202408240728.EOY9svfI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/regmap_raw_write_async
head:   8f06c2ec21d5da4c5b68146f5057becd46402478
commit: b5a4acf5c69c0805ce1d3d4a72764bd048ef7ec4 [6/18] soundwire: stream: reuse existing code for BPT stream
config: i386-randconfig-052-20240824 (https://download.01.org/0day-ci/archive/20240824/202408240728.EOY9svfI-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408240728.EOY9svfI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/soundwire/stream.c:2112:48-53: WARNING: conversion to bool not needed here

vim +2112 drivers/soundwire/stream.c

  2030	
  2031	/**
  2032	 * sdw_stream_add_slave() - Allocate and add master/slave runtime to a stream
  2033	 *
  2034	 * @slave: SDW Slave instance
  2035	 * @stream_config: Stream configuration for audio stream
  2036	 * @stream: SoundWire stream
  2037	 * @port_config: Port configuration for audio stream
  2038	 * @num_ports: Number of ports
  2039	 *
  2040	 * It is expected that Slave is added before adding Master
  2041	 * to the Stream.
  2042	 *
  2043	 */
  2044	int sdw_stream_add_slave(struct sdw_slave *slave,
  2045				 struct sdw_stream_config *stream_config,
  2046				 const struct sdw_port_config *port_config,
  2047				 unsigned int num_ports,
  2048				 struct sdw_stream_runtime *stream)
  2049	{
  2050		struct sdw_slave_runtime *s_rt;
  2051		struct sdw_master_runtime *m_rt;
  2052		bool alloc_master_rt = false;
  2053		bool alloc_slave_rt = false;
  2054	
  2055		int ret;
  2056	
  2057		mutex_lock(&slave->bus->bus_lock);
  2058	
  2059		/*
  2060		 * check if Master is already allocated, if so skip allocation
  2061		 * and go to configuration
  2062		 */
  2063		m_rt = sdw_master_rt_find(slave->bus, stream);
  2064		if (!m_rt) {
  2065			/*
  2066			 * If this API is invoked by Slave first then m_rt is not valid.
  2067			 * So, allocate m_rt and add Slave to it.
  2068			 */
  2069			m_rt = sdw_master_rt_alloc(slave->bus, stream);
  2070			if (!m_rt) {
  2071				dev_err(&slave->dev, "%s: Master runtime alloc failed for stream:%s\n",
  2072					__func__, stream->name);
  2073				ret = -ENOMEM;
  2074				goto unlock;
  2075			}
  2076	
  2077			alloc_master_rt = true;
  2078		}
  2079	
  2080		s_rt = sdw_slave_rt_find(slave, stream);
  2081		if (!s_rt) {
  2082			s_rt = sdw_slave_rt_alloc(slave, m_rt);
  2083			if (!s_rt) {
  2084				dev_err(&slave->dev, "Slave runtime alloc failed for stream:%s\n",
  2085					stream->name);
  2086				ret = -ENOMEM;
  2087				goto alloc_error;
  2088			}
  2089	
  2090			alloc_slave_rt = true;
  2091		}
  2092	
  2093		if (!sdw_slave_port_allocated(s_rt)) {
  2094			ret = sdw_slave_port_alloc(slave, s_rt, num_ports);
  2095			if (ret)
  2096				goto alloc_error;
  2097		}
  2098	
  2099		ret =  sdw_master_rt_config(m_rt, stream_config);
  2100		if (ret)
  2101			goto unlock;
  2102	
  2103		ret = sdw_slave_rt_config(s_rt, stream_config);
  2104		if (ret)
  2105			goto unlock;
  2106	
  2107		ret = sdw_config_stream(&slave->dev, stream, stream_config, true);
  2108		if (ret)
  2109			goto unlock;
  2110	
  2111		ret = sdw_slave_port_config(slave, s_rt, port_config,
> 2112					    stream->type == SDW_STREAM_BPT ? true : false);
  2113		if (ret)
  2114			goto unlock;
  2115	
  2116		/*
  2117		 * Change stream state to CONFIGURED on first Slave add.
  2118		 * Bus is not aware of number of Slave(s) in a stream at this
  2119		 * point so cannot depend on all Slave(s) to be added in order to
  2120		 * change stream state to CONFIGURED.
  2121		 */
  2122		stream->state = SDW_STREAM_CONFIGURED;
  2123		goto unlock;
  2124	
  2125	alloc_error:
  2126		/*
  2127		 * we only cleanup what was allocated in this routine. The 'else if'
  2128		 * is intentional, the 'master_rt_free' will call sdw_slave_rt_free()
  2129		 * internally.
  2130		 */
  2131		if (alloc_master_rt)
  2132			sdw_master_rt_free(m_rt, stream);
  2133		else if (alloc_slave_rt)
  2134			sdw_slave_rt_free(slave, stream);
  2135	unlock:
  2136		mutex_unlock(&slave->bus->bus_lock);
  2137		return ret;
  2138	}
  2139	EXPORT_SYMBOL(sdw_stream_add_slave);
  2140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
