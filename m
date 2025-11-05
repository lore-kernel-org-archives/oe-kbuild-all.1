Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794332D7BF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 02:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762310928; cv=none; b=XnKihqCf7it5C9VPBcZnvffekqC/eOeZUHi1ZeFC4Mn7HvyD9lv9OLtjd3ZV00UzZLAnHJmMIe72E4gzI7E0B1gjrOjIpIMpEVZvQtZXngU1D9uE0tTlwvZcsVgYGwyWLCl2RgRsq0LQ+oUUI8dJVaYyEWt0BqwUP/g72LaimsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762310928; c=relaxed/simple;
	bh=9lJf/r74RTFpZJo+gpvDCzp0cAknTpNQidsOIvJvv0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d8ERbtRjV3NXABNlPYAYYq2RgVeRKjOd9wOaEdi/ZJ8J2j78sAVY84FEiY9nJGjaaDEhaw5nb7zILcEd5pqTDxGcP+dNPpqzUT2RmRwlg/+EUx390PalmAuYMFqPvu2WFagL0VViiKUpRV7Rxaog5h4aot4vjK90BzXl0J3AKSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQ1RrWeq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQ1RrWeq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762310926; x=1793846926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9lJf/r74RTFpZJo+gpvDCzp0cAknTpNQidsOIvJvv0I=;
  b=TQ1RrWeqwjW9p5/fqn8d5/aJilqj9etS+QU2qWIRhO4sXXjCRZUuDY8O
   7dGFFh5GhjZ6mdT8O8UQsCAeFGogrmZqtbDa5TATITW+2V7X1fuelSvM/
   Dlt+BrSf5aB2Vxfj15dRDJqucVQ/AaSi6BRuO11R9nuogy5yjApNKS5Om
   p9I98xojxLpEpZtwl+zoET2q7Wn6eogLsnDFxBSXc6Ag1YHqDMezLSFkY
   JaqYfbaEQReyivJ68o2jQE10SokeR+zF9rQI7CinVNIQNZ3+HfG7qPOzD
   ZP+EZycTews/mzjsUQVzzG3EW7vXApPPjcOscAWUAPh5KPLx2MBjVewFG
   Q==;
X-CSE-ConnectionGUID: q6hvuaaYRlSNss1Pv50aLQ==
X-CSE-MsgGUID: 4RPNyBHgTt+NkIU9l44+Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="67033151"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="67033151"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 18:48:46 -0800
X-CSE-ConnectionGUID: 9MQBMuzcQ9G8Qgx6PIpmJg==
X-CSE-MsgGUID: Jj6/8DygR9CoT0+oK25owg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="217972257"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2025 18:48:45 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGTZi-000S5h-24;
	Wed, 05 Nov 2025 02:48:42 +0000
Date: Wed, 5 Nov 2025 10:44:42 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.1 9/27] oom_kill.c:undefined reference to
 `bpf_handle_oom'
Message-ID: <202511051013.hRBRpdTZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.3.1
head:   176f3f07db49e29a193bd0b986301486bc19a5a1
commit: c7b8c1b6edf92a358bdf64967bb6ed4df72b6470 [9/27] mm: introduce BPF struct ops for OOM handling
config: nios2-randconfig-002-20251105 (https://download.01.org/0day-ci/archive/20251105/202511051013.hRBRpdTZ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051013.hRBRpdTZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051013.hRBRpdTZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: mm/oom_kill.o: in function `out_of_memory':
>> oom_kill.c:(.text+0x1030): undefined reference to `bpf_handle_oom'
>> oom_kill.c:(.text+0x1030): relocation truncated to fit: R_NIOS2_CALL26 against `bpf_handle_oom'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
