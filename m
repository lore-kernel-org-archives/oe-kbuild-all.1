Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FB54A02
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 04:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734496627; cv=none; b=jqHpbjA1SzNxu59qD+RV6L3qd16jEhRD2dXlICminAvIk7lgha48jPIF8aN+JT3pBvYFMUqNC1INEQtBUs2WTdkRXYYhlroXIhCfPkYLpm9h32UOrg0T0jHHYzzLwY9on/T6H7woWdjwitmuPQ8K4tRhvi5ezhFrGgBgQN9UFjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734496627; c=relaxed/simple;
	bh=2JKQo46YTib7VeeKNQdvGB8uF42goGkMjlurI8OhO2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eL0QKsTmQPdccrJ+oPLu9HZE6Cpo5Fq/23WsA1DCCN2IahiBMHfPbF7vA4HnUBbriv9Qsh+7tkMHxwQg39igUXl6ZDrqtWjMd6L542705o7CRTk616YCsb8EQcpVNQmJWLU3g7Ov+TcJGyee6HDLigDDE/GYgA4cAKkjvZURc18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKGSwZKC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKGSwZKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734496624; x=1766032624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2JKQo46YTib7VeeKNQdvGB8uF42goGkMjlurI8OhO2Q=;
  b=UKGSwZKCcDMOWc6N4ip4YPPpmAW8niUEgUTobkXA9X/GZnClhhjv4Nc8
   wLXTof8lXH5KHG3MbvfpcuJ8b8MS5kKz8cD4jFgEVbj99D71udHJqg+bH
   J3HSjWwDSZxQMtH2hzjEIp2Dw70328Shh2L0FiH7PUgNngkIqu2Lkou47
   Wo2cE87orQdx/T3FG1JVerFKlCqmRb/WICx1Og4SjKZw0jQlgs1L7CO5V
   9ALeYlBnFrsaSLsdcr7B0fOEkFfn7KG+Z2ldl3aygJriE0ltzHv9dw2hi
   ZCsU42u/V0DaAsszFjYD0tzOvSDV3ecjZrHED6thfJXwxIotH97L9LtZx
   g==;
X-CSE-ConnectionGUID: 9NIbLXcCRBSy1AgQQz6xJQ==
X-CSE-MsgGUID: gHqiaEBqSE6+q9WA1pzXmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34858676"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="34858676"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 20:37:03 -0800
X-CSE-ConnectionGUID: oOLWMF2pQ+K1HsAmDyuKQw==
X-CSE-MsgGUID: T/UZFzV/RVyezYlPUuFeaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102352491"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Dec 2024 20:37:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNlnx-000G3z-0I;
	Wed, 18 Dec 2024 04:37:01 +0000
Date: Wed, 18 Dec 2024 12:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hao Li <hao3.li@intel.com>
Subject: [intel-lts:6.12/linux 914/985] arch/x86/kernel/tsc.c:1338: warning:
 Function parameter or struct member 'system_counter' not described in
 'convert_tsc_to_art'
Message-ID: <202412181249.sBTnrcMY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   cc39c53db6bcd7f04407f1cae883e5d0af6db765
commit: 7f36119fd0bcdc0fee9bb16b971f924bb502b888 [914/985] ptp: tgpio: PSE TGPIO crosststamp, counttstamp
config: x86_64-buildonly-randconfig-003-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181249.sBTnrcMY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181249.sBTnrcMY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181249.sBTnrcMY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/tsc.c:1338: warning: Function parameter or struct member 'system_counter' not described in 'convert_tsc_to_art'
>> arch/x86/kernel/tsc.c:1338: warning: Function parameter or struct member 'art' not described in 'convert_tsc_to_art'


vim +1338 arch/x86/kernel/tsc.c

  1326	
  1327	/**
  1328	 * convert_tsc_to_art() - Returns ART value associated with system counter
  1329	 *
  1330	 * Converts input TSC to the corresponding ART value using conversion
  1331	 * factors discovered by detect_art()
  1332	 *
  1333	 * Return:
  1334	 * u64 ART value
  1335	 */
  1336	int convert_tsc_to_art(
  1337		const struct system_counterval_t *system_counter, u64 *art)
> 1338	{
  1339		u64 tmp, res, rem;
  1340	
  1341		if (system_counter->cs_id != CSID_X86_TSC)
  1342			return -EINVAL;
  1343	
  1344		res = system_counter->cycles - art_to_tsc_offset;
  1345		rem = do_div(res, art_to_tsc_numerator);
  1346	
  1347		*art = res * art_to_tsc_denominator;
  1348		tmp = rem * art_to_tsc_denominator;
  1349	
  1350		do_div(tmp, art_to_tsc_numerator);
  1351		*art += tmp;
  1352	
  1353		return 0;
  1354	}
  1355	EXPORT_SYMBOL(convert_tsc_to_art);
  1356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
