Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C618538C42A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154927; cv=none; b=WYw9xF2vBS2IUwwFBngSenP5dZuBGW+HKzNG0Ix//UQ1+bLBxvDKMT+PNnxtXdqcGtajEs3TFV+kVXT4B5+lVWiAo1JPdBDTPbZYKyI+/CXoKMHmsD3r75gW6qXPsgo4CSDUAXT4PvOBhcasnOveAFCcPh4Lxntj+zKfN3hTblU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154927; c=relaxed/simple;
	bh=5u8M9dntTirGfLRiHITBvhhxWnF7SV5sqCjxoSQfrrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nL9t7MjHndg3UfNCOFN+h1SYmL/gGMEwCZrhGztktcNkxNx7gO9En+1mCLu6T9q2uMxuw5+HJFZ8+FQvRxyucXFwfAVUuouzGH9tqSNRK33r4tri3CnyxmEi+YYS93WT/3vMzWuSH36aFQmM02kW/yKC7yYEiFQd1mL9ZXR1bsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlOX+it5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlOX+it5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787154926; x=1818690926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5u8M9dntTirGfLRiHITBvhhxWnF7SV5sqCjxoSQfrrE=;
  b=jlOX+it59pg8LVz05q1Z3v8ro9n24JNJ2u2gLseN7UzROk8bWtVla664
   rHxjbcrjeEPZ85qc5jOt5cVGKCwgHbetxcMeAWGlcYUYoqGPBCVvkaPIl
   38caOTTFJB4+SuwFTe8N6aSVGAGfZajqsoZIXb7PsU9xvoHl2Vbq9Q+S0
   keX4oUuAyDCIY5DmAN2njLmsTr+FvdMj5qkjsYA0ZOCNbxD5twYDaIEAD
   uNOehIqceX+Qrd9Icqtpjs4N1PHCl+6xyMfxCJjjrIWIcgBzMtadWD7NW
   z1NluBi10RSPEVzsCQffBO2KBnbXghcRGSKjsWQYj+lfcgkY7xVEqixWL
   w==;
X-CSE-ConnectionGUID: I1w+jir/Sm6VqiKzOVGALA==
X-CSE-MsgGUID: FckNlXdOTxuRwakcjOcuZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="75204140"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="75204140"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 08:55:25 -0700
X-CSE-ConnectionGUID: kFsNUE9JQ3OJrwGwBAfOLA==
X-CSE-MsgGUID: R6nVbkhtTFagEcoPQVwgqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="289099009"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Aug 2026 08:55:23 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwidN-00000000fgE-15mW;
	Wed, 19 Aug 2026 15:55:21 +0000
Date: Wed, 19 Aug 2026 23:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-ratelimit-2 61/76]
 lib/dynamic_debug_ratelimit.c:151:4-9: WARNING: NULL check before some
 freeing functions is not needed.
Message-ID: <202608192319.yPitUgGb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-ratelimit-2
head:   31212444bcca4d1547711ec572b5a398d74640ca
commit: 3ffeebe328d9f1bc581ba7163321a9519ec821d3 [61/76] lib/dynamic_debug: Implement dynamic solo and shared rate-limiting
config: nios2-randconfig-r051-20260819 (https://download.01.org/0day-ci/archive/20260819/202608192319.yPitUgGb-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608192319.yPitUgGb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> lib/dynamic_debug_ratelimit.c:151:4-9: WARNING: NULL check before some freeing functions is not needed.

vim +151 lib/dynamic_debug_ratelimit.c

   140	
   141	void ddebug_ratelimit_free_info(const struct _ddebug_info *di)
   142	{
   143		int i;
   144		struct _ddebug *dp;
   145	
   146		for (i = 0; i < di->descs.len; i++) {
   147			dp = &di->descs.start[i];
   148			if (dp->flags & _DPRINTK_FLAGS_RATELIMIT_SOLO) {
   149				struct ddebug_ratelimit_solo *wrapper = mtree_erase(&dd_ratelimits_solo, (unsigned long)dp);
   150				if (wrapper)
 > 151					kfree(wrapper); /* Unloading module context is safe for direct kfree */

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
