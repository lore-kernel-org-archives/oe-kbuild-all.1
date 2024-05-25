Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE7519E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 01:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716599739; cv=none; b=SYbKHtuUGsoEq6DMQZ4iruMfGNNHWSb5ry/TKIImcInrPbD5xF8JnKbMg2tGoeemqFrm6ClLB2sIedIh2R4VMeINCPlgvzOqatFLZB8I+1zxIFRrhEO3C96wkqKBMaNeCK0bqgB/61Qd6wM0rmcfCfqO+blm3H4/VsH6wJwTczY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716599739; c=relaxed/simple;
	bh=s3ZLXm/cE8Q5SvcpmbzxQakXIWuiIxnEqQp+ySd3ykU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qfZ3sfyRA8v95P7Fa1XOSbdeCZUDlcP0On/RQxi9n8aeggtyED/Ks3XNYeai32t0QyvFjK74Fjm55rZAmjoSTrD3qQ3K6FBrg128AE+BaSR7QqKtoMdrPYAsOpsl6S8r9tn5CRzNOh0vZUechDgbfILCheHSTyz1eD900ycaMiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xzq2dBlQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xzq2dBlQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716599738; x=1748135738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s3ZLXm/cE8Q5SvcpmbzxQakXIWuiIxnEqQp+ySd3ykU=;
  b=Xzq2dBlQqpGeTS5Sy+a9vqqHqH4COyh1N6i/o9qok9dIeYmIz42R5nNR
   4ygNFiiuPR46hJ78y4slzpXzWvIXPSAQ5bJHAVo+m0JZjbVncu55q+Z0Q
   7z1iw1CkasVrYic86Er8eGhh8SnxijjiCaNbQvRQ2aVs2pl0bxxVDV8t2
   WabzqIOg+wMh6B3Iru7vkmdaVTb6fuGt3QbAY5es6Qs1ZVUcYFW0Y5h5H
   T6s9M8JPkwvKEGaP+B9CjWtnLOd8knoREP4cxGJTzPcZdbaxbkJoGyDSV
   xNdDX8L5NI3yT9a8qvUnrGWU63cIISKsFzCoUWl8M7c7dKnLaTpvBRnnW
   g==;
X-CSE-ConnectionGUID: fpP/IEStRqeBE6eP0zvy6g==
X-CSE-MsgGUID: haJCz+gERJKy2fIT5Yv8mA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="30526329"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="30526329"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 18:15:36 -0700
X-CSE-ConnectionGUID: AM+zPZTzR++d/r6LbShOnw==
X-CSE-MsgGUID: UT3qUVccTbii2NIdvWRAIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="34689600"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 May 2024 18:15:34 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAfz6-00065L-1N;
	Sat, 25 May 2024 01:15:29 +0000
Date: Sat, 25 May 2024 09:13:49 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:memcontrol_v1.1 14/14] memcontrol.c:undefined reference
 to `memcg_check_events'
Message-ID: <202405250900.k6QZHxht-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git memcontrol_v1.1
head:   6ca307b436323286aa40a1bb61e3adb733abbc05
commit: 6ca307b436323286aa40a1bb61e3adb733abbc05 [14/14] mm: memcg: put cgroup v1-related members of task_struct under config option
config: i386-buildonly-randconfig-005-20240525 (https://download.01.org/0day-ci/archive/20240525/202405250900.k6QZHxht-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250900.k6QZHxht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250900.k6QZHxht-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/memcontrol.o: in function `uncharge_batch':
>> memcontrol.c:(.text+0x327f): undefined reference to `memcg_check_events'
   ld: mm/memcontrol.o: in function `mem_cgroup_commit_charge':
   memcontrol.c:(.text+0x5028): undefined reference to `memcg_check_events'
   ld: mm/memcontrol.o: in function `mem_cgroup_replace_folio':
   memcontrol.c:(.text+0x697d): undefined reference to `memcg_check_events'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
