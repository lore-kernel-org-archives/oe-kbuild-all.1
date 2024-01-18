Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF71184C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 01:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705541127; cv=none; b=BIe2uOVYdC0OSeSl58Dwhq6dBEXqGg7bAZCJPVAULu/1gfYD9npTe4q3k1sLFKQjPIMidXm4gnpTf89EHv29MbiUkh0G05qdYPPQ+YaPK5jPo9n89IZPDmiEj40tKbRNGepTcxyEITtu+0hHYmFJIj3wKCrcpuW9SyWQAyGa8hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705541127; c=relaxed/simple;
	bh=f7bOY1tRKchz4KDkt0MIq0pSh5Bnqv8hqdiiqoyIQIs=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=bMNGCO0a1mGdqNVJAP+AYG2yaSEoJtyCU0nfzA+HvqXdp1ZHxPUguLmtwxKP0TXVX0nv+SD5z63bmM/Oee/8+sT8D7nuBOd8HKZbAE615Us9VgXwKD8LRJg0tYz00kw3VVPoMAz1Jcejq8WHKu56VR1MM+Pvm4GgkChdRFoUXLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHpqelOD; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHpqelOD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705541125; x=1737077125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f7bOY1tRKchz4KDkt0MIq0pSh5Bnqv8hqdiiqoyIQIs=;
  b=ZHpqelODmo2uQlLMlhrueEgh9ck7dL1w8lH6JrF8aBHlnbRYjSe17eNB
   IiKqJIT+ssaMsUATf3V4SIUltAEnF2iuJVKkuFxMORr3lpM3YuIOP1Iq1
   GHgN+DWmCr59k/r+por49O5vc+qVrsDzdrl6ZS2VsKgUq4vrpb+AWk7YX
   /+n7T7oW0tkh+i+KufNHw6xobL8xqkbf6BuxG5Xe/B4ByhUeZaFVgtBPR
   MDIXgh4jP9smtCxNCPWgGquFq8gA7xE2xWfqQzl92bBC6cPQCxi/0OmyQ
   Z5PnmUWQIiYUnf2CsnFpZITdjeHvzeTa6uHk4D/HsvILnCqLyJzWRnYtr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="404085429"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="404085429"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 17:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="195086"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jan 2024 17:25:24 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQH9l-0002UE-2J;
	Thu, 18 Jan 2024 01:25:21 +0000
Date: Thu, 18 Jan 2024 09:25:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 722/2425] inet_hashtables.c:(.text+0x3564):
 dangerous relocation: unsupported relocation
Message-ID: <202401180939.2N529UUe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ec7d78798bfb669efc713c2c416a553a40d4dc77
commit: 208a72041292a93cb0e383d1e2bb8a9b0cab964d [722/2425] tcp/dccp: Add another way to allocate local ports in connect()
config: arm64-randconfig-003-20240117 (https://download.01.org/0day-ci/archive/20240118/202401180939.2N529UUe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180939.2N529UUe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180939.2N529UUe-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: net/ipv4/inet_hashtables.o: in function `__inet_hash_connect':
   inet_hashtables.c:(.text+0x3564): undefined reference to `sysctl_local_port_allocation'
   aarch64-linux-ld: net/ipv4/inet_hashtables.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `sysctl_local_port_allocation' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> inet_hashtables.c:(.text+0x3564): dangerous relocation: unsupported relocation
   aarch64-linux-ld: inet_hashtables.c:(.text+0x3568): undefined reference to `sysctl_local_port_allocation'
   aarch64-linux-ld: inet_hashtables.c:(.text+0x3580): undefined reference to `sysctl_local_port_allocation'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
