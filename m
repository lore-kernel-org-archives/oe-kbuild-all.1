Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1A5207670
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 06:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739428008; cv=none; b=IG4O4FQMKwkNlqQZQ77HRicya6BkSqJvodmFkDlNBb+dtAnaNv7TKU8GRlYQUGitX12/wDnZb2PHOB6gyS2VzN0Y3CSpX674PUfhTtPuC13RAQaVJfDpqyPoRXA8iq0a1sk0YPS7btJ7CjOk744YJpz1lauaOPwTNemuQ6Hv2MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739428008; c=relaxed/simple;
	bh=sX2fN95t3gh6YNemIPF4gtL/+9NoyrPnlIYTke/KoVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CyroXdhBmXpNYHsXHmYviuSO9ffHv5qArf2XwQgPw3LcS4gsnHEdHM5bdqIm6KgljlV2tM7NhGgk2X+TpTXGmo/Ssjoz7n1yty0zYnciPFHDBsxYJJYX0z0y0Q0DUS4jouplhIMv4/UeSBlkdVmhYSJq7iJCbb3qltrx3nzlaR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMLDDEfK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMLDDEfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739428008; x=1770964008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sX2fN95t3gh6YNemIPF4gtL/+9NoyrPnlIYTke/KoVs=;
  b=cMLDDEfKr/vN1ZHjIojD3xFr9QutP6YA3JTQWGMCKEVf8BPRfJikxYe9
   ASd83uComGEjpKjBBdG1KBadQUk+A+CKZLpSTRcXUJJb9nsUFVxqUsiRE
   O30vQaO0BYuiJllqXKrSbUZ0YsF+nFluw+r8Q3MMvEkHzSh0hEyKmBxPz
   egbIy/IlhlwCc1bqxOHSi39fkdSN1rOpWDaBcanZSBoFHai4ttj5Oy6Ga
   ziiKg2oeO1lLJi1ZJ1F/wNmelRSORiJ/ULQ588bZUxw06roweTQWfG4ZW
   Esq7cmI+ummGMTE78ROdfXNdiaZgYA1JBwYSTxPT7YuCH4sY+X08sijS8
   w==;
X-CSE-ConnectionGUID: Tk7et62KT7KiAxERH1GF6g==
X-CSE-MsgGUID: e4rj9tVOSzeY55b2qJ5LUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="62581471"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="62581471"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 22:26:47 -0800
X-CSE-ConnectionGUID: feoOQNg/QtSMpucZxcL+HA==
X-CSE-MsgGUID: ACGYQJfyTYe+pNjDXw6h2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143992861"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Feb 2025 22:26:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiSgN-0016dn-0k;
	Thu, 13 Feb 2025 06:26:43 +0000
Date: Thu, 13 Feb 2025 14:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:isolation 5/6] WARNING: modpost: vmlinux: section mismatch
 in reference: alloc_bootmem_cpumask_var+0x28 (section: .text) ->
 __memblock_alloc_or_panic (section: .init.text)
Message-ID: <202502131418.jNm2rUV2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git isolation
head:   7f684a3f36349d046c74e1ba46afb096a0cc2463
commit: 5f1e1e6fa5c4f220ae98b166aed05ca99ae7411d [5/6] sched/isolation: cpuset isolated_cpus don't do housekeeping work
config: s390-randconfig-002-20250213 (https://download.01.org/0day-ci/archive/20250213/202502131418.jNm2rUV2-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131418.jNm2rUV2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131418.jNm2rUV2-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: alloc_bootmem_cpumask_var+0x28 (section: .text) -> __memblock_alloc_or_panic (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
