Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AC25258
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 05:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736832048; cv=none; b=Pzr7/3+Kzg4lBYzYu8DrhJf7erAo7xFlavRwxtyoq4pzc9S91jZZzFJ1/olTW+L8o85AK9LJaoQ020epCfXmLOTe7SVRs8DRWTNGWvPrNwQTi52KVtybu+oUDFWy0LJ01MI4mSQxDgKrWJi5uIO3tY5zZ1YoMWbotOXo4iEF1lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736832048; c=relaxed/simple;
	bh=1gKqmWpilf03gr9c33U2EHie3buENUO4ga5Ux7T3/Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f18JDGeP79m4/rVeQU/FHRV24OZATF64ODeurO5L5m2jzip+LAvCWHDgXWpuop/MEHxq0kDQ0zEw9AOEly+5yqEQDSBcVtHKvE+jqNakTI10zNsuijbpenYkGKI/roxj0GRub2whRjPxVda8IN/kiIgoYNQcXFY/I16VXcFq6E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XUFASjEQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XUFASjEQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736832047; x=1768368047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1gKqmWpilf03gr9c33U2EHie3buENUO4ga5Ux7T3/Zo=;
  b=XUFASjEQZU1Da+4wQf6L1qbJsv9vhrd+BEPx75l+yB80Pu9/tXkJMx76
   ZAdcEjJw266eM8FMDPQKFNycDiZoznkRpcRZMOsIXqGci4xQGjEIXchZn
   1xApRwRjBKW5Etitno8dM1lGxs/6YFrtgcrAUNgOunMMYSJV4ieyrpT6A
   niK8l1xnZzZOjimMSgxpY7mZBp2CQBuVIL0z0ntJYiRO+pp1k0AxeDi5+
   /0JAlNAQqcxIbggYhisuuSZhptujmMxd+LH+p39ldG4DwQTIBX90J3NUz
   OlVRvygbzOwjRSZszp3Mjstw/Vl8FjoM/as1GV6/jvVwexvIuhBKU16h9
   w==;
X-CSE-ConnectionGUID: zSgKJXVPRsmns1jGlXo3UA==
X-CSE-MsgGUID: bAFc8EHVQqai8rtkf5LfTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48498180"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="48498180"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 21:20:46 -0800
X-CSE-ConnectionGUID: z4JL1M0+Q4COixnzm5R0zg==
X-CSE-MsgGUID: ZPbDrKmrTPO7m33hPK+RUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="104464439"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Jan 2025 21:20:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXZM2-000O8h-0w;
	Tue, 14 Jan 2025 05:20:42 +0000
Date: Tue, 14 Jan 2025 13:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:sframe_unwinder.rfc 6/6]
 arch/arm64/kernel/stacktrace.c:340:21: error: no member named 'reliable' in
 'struct unwind_state'
Message-ID: <202501141343.zrpWLnLJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git sframe_unwinder.rfc
head:   de8b6f19951d0f45e4ff55813f6259c3b58b7a0c
commit: de8b6f19951d0f45e4ff55813f6259c3b58b7a0c [6/6] unwind: arm64: add reliable stacktrace support for arm64
config: arm64-randconfig-001-20250114 (https://download.01.org/0day-ci/archive/20250114/202501141343.zrpWLnLJ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501141343.zrpWLnLJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501141343.zrpWLnLJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/stacktrace.c:340:21: error: no member named 'reliable' in 'struct unwind_state'
     340 |         if (!state->common.reliable) {
         |              ~~~~~~~~~~~~~ ^
   1 error generated.


vim +340 arch/arm64/kernel/stacktrace.c

   334	
   335	static __always_inline bool
   336	arch_kunwind_reliable_consume_entry(const struct kunwind_state *state, void *cookie)
   337	{
   338		struct kunwind_reliable_consume_entry_data *data = cookie;
   339	
 > 340		if (!state->common.reliable) {
   341			data->reliable = false;
   342			return false;
   343		}
   344		return data->consume_entry(data->cookie, state->common.pc);
   345	}
   346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
