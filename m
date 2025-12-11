Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6B3305E3E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 17:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765474734; cv=none; b=ShzvRct4hIkodaqa4giziWXkDK4fMu/ZNJEtL2h7xwwhtIcIt6M3itqygLsFL9u6Nuxpu3fsCa6oFK5GSQ/WBP/18nYSPstSQDAWvaXPzPKmdfPxchmS6OcF+Rglhjp9wCCRjophSVuGtAij2WVj19HVymKU3jcPTOAFXzVP9Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765474734; c=relaxed/simple;
	bh=mg3/I9ZdddVNcezEO2Sz+1k9KSdhAgmIUeDqsfWmVq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nkXOV4kSxuh2j5lhhErYUfxNnddIut4inKBn4Uv/QxyblYoOoWOkuUFSEe07YQXxTVPwrm5OZzfgdBvzn/BCEeGC5Cd/YM0zmBylwoNjCwoZiWWUtH4HJBx0DMePa8j2OQLyiU7bcyapc1NjVnRHyuSVEWUlcnZsWGaXgoUvkw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GuTBroU/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GuTBroU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765474732; x=1797010732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mg3/I9ZdddVNcezEO2Sz+1k9KSdhAgmIUeDqsfWmVq0=;
  b=GuTBroU/OhliNGDNxfOuIYXITkEh9CFe54lgevoGjPcCOgtiqgucPH8U
   fA2gcOhaeooiVZpUmWTwuI5ERFrIvWm9gu3DpzkZ8iFi0sFrom+VA9po2
   flCgyIIwHW3xLr5IWOdD3rpzRQ8W3JxLNDnYjIuDUAbeeNqvq6WIa1fm5
   HjH934w/B3Ef8XrNuCmK6wnyLWPmrQL/bsjxC3uUYPtK2X3bFOYeduswu
   yL7OW8rWXknu89ICd4ZYi47vh9IQCsifKYqM7w9Z2hdBNwyqCE5vbPABK
   yrnWleAeLdxma1hNV0Zdoqssn5Q9Ln77VW96jNiVXlwypCRmfU4Qo17vZ
   Q==;
X-CSE-ConnectionGUID: w3j1m/2tRKOCRjzWXl40ew==
X-CSE-MsgGUID: JlXDPDM4SkCmke3YLd9SKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71310471"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71310471"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 09:38:51 -0800
X-CSE-ConnectionGUID: 1kajG6z6Q7mmAm4tqnyQSg==
X-CSE-MsgGUID: OTr7VguxR1yIh0k8YG+ecQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201021575"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 11 Dec 2025 09:38:51 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTkcp-000000001A0-3y3C;
	Thu, 11 Dec 2025 17:38:47 +0000
Date: Thu, 11 Dec 2025 18:37:53 +0100
From: kernel test robot <lkp@intel.com>
To: "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hao Li <hao3.li@intel.com>
Subject: [intel-lts:6.12/emt 9/9] arch/x86/kernel/tsc.c:1338: warning:
 Function parameter or struct member 'system_counter' not described in
 'convert_tsc_to_art'
Message-ID: <202512111823.lILdCWOV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   aac28a88afc1d68448c7e5672fed4da83e10fe8b
commit: 7f36119fd0bcdc0fee9bb16b971f924bb502b888 [9/9] ptp: tgpio: PSE TGPIO crosststamp, counttstamp
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512111823.lILdCWOV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111823.lILdCWOV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111823.lILdCWOV-lkp@intel.com/

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
