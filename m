Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265C48BE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 00:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719275198; cv=none; b=GtL2nPhALLOSHrsX4LVwF2PBTA1zTp+w071WeTKIs78/CqLkYlnTgSaCoxkZYwaJ9tnmc3ABOMSKwnXJIivNWCAo/n5oyyauJC1OVBapkPspq+pXgFrL6BeLqjuh8VT5UwsjtpuV4u0igk7G3BmwXOzYtsnQndq0Xavm+CvxBuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719275198; c=relaxed/simple;
	bh=olxLTSTPfxG3hexFC0dTVKxOyVxHHShYQk7sGqeGBT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rao0zTszdhX0zw+DjsQWPIQ/yeH8HLCR85Ro2pX0PJE+ZFyLsyqseFSnQ1VMCHzYNkXZ62hDfrAgIj9puiqX47KraBKQZvPU2OqSOSZyW3DaHj8UF6sIzKwlAvRuVAu3UqgfzisvL43myw4GiFUNGducw+i92T9dEyywoywjX40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/Cv9cYx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/Cv9cYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719275196; x=1750811196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=olxLTSTPfxG3hexFC0dTVKxOyVxHHShYQk7sGqeGBT4=;
  b=k/Cv9cYxluYPUq0BTYh0BNjCb858dOgyPvzUl78dRfFruBSOndPIhRg2
   18Ckv2tngJs4Sg08mlLT1jYLD9iKuEV4RSIz3/id66A7K1BYU/8kWt3Ga
   ApWV+tPCwzB+YZ/BAkcJ2ThFOJBLG3NzWE4DC6Y2htoFHxySLMXlCD6tc
   vZNchGIZqD+iZGtOM/m9Oqd2ATp2yIBbiHGhyIkp/Klrh0DdFG486QSmX
   4ZQVQhpvnNDInmQIYziqKCy5cp6OMgQQYdsrutv6l28ECKsv4JGti0nNs
   Kpzyi8Eq/UNKnJsBcgrhrl6Hy+zpQGs2GuroH2cKbkcwZMrijus/vrJt8
   Q==;
X-CSE-ConnectionGUID: woDmpDcqT86+0XVE+tGLFw==
X-CSE-MsgGUID: VqD7EqxCTVenDXzPk+inbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="20041745"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="20041745"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 17:26:35 -0700
X-CSE-ConnectionGUID: era7idWaS76IrRjmpI9yyQ==
X-CSE-MsgGUID: qLftC1qyQ4unr8vxlVdRhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="66689028"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jun 2024 17:26:34 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLu12-000Dqw-00;
	Tue, 25 Jun 2024 00:26:32 +0000
Date: Tue, 25 Jun 2024 08:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrii Nakryiko <andrii@kernel.org>
Subject: [linux-next:master 7010/8016] tools/lib/bpf/btf_relocate.c:61:25:
 sparse: sparse: dubious one-bit signed bitfield
Message-ID: <202406250808.rsBmro61-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   62c97045b8f720c2eac807a5f38e26c9ed512371
commit: 8646db238997df36c6ad71a9d7e0b52ceee221b2 [7010/8016] libbpf,bpf: Share BTF relocate-related code with kernel
config: x86_64-randconfig-123-20240624 (https://download.01.org/0day-ci/archive/20240625/202406250808.rsBmro61-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406250808.rsBmro61-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406250808.rsBmro61-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> tools/lib/bpf/btf_relocate.c:61:25: sparse: sparse: dubious one-bit signed bitfield

vim +61 tools/lib/bpf/btf_relocate.c

19e00c897d5031 Alan Maguire 2024-06-13  56  
19e00c897d5031 Alan Maguire 2024-06-13  57  /* <name, size, id> triple used in sorting/searching distilled base BTF. */
19e00c897d5031 Alan Maguire 2024-06-13  58  struct btf_name_info {
19e00c897d5031 Alan Maguire 2024-06-13  59  	const char *name;
19e00c897d5031 Alan Maguire 2024-06-13  60  	/* set when search requires a size match */
19e00c897d5031 Alan Maguire 2024-06-13 @61  	int needs_size:1,
19e00c897d5031 Alan Maguire 2024-06-13  62  	    size:31;
19e00c897d5031 Alan Maguire 2024-06-13  63  	__u32 id;
19e00c897d5031 Alan Maguire 2024-06-13  64  };
19e00c897d5031 Alan Maguire 2024-06-13  65  

:::::: The code at line 61 was first introduced by commit
:::::: 19e00c897d5031bed969dd79af28e899e038009f libbpf: Split BTF relocation

:::::: TO: Alan Maguire <alan.maguire@oracle.com>
:::::: CC: Andrii Nakryiko <andrii@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
