Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4513F314A90
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 04:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786941436; cv=none; b=LYHAjs4WMMRC772vhjpA+AgtEc5dcpcM39OBihL2NhNFu6dISTyTkn43NznxUcqt7GLhCdML339ZCy8CUVBaWRN90yY/3/AIExixIbTXezlLgVmxr6aTltdj9tJWOhQnwQSd/pxWAygEhnBxDW2yLZwfvQ5mkJrcekDRynhflYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786941436; c=relaxed/simple;
	bh=Zg0NeOydRQ9bSg6aEZSlqK0pDuz2wLKuGkE2J8ze4UA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K/iM7f8bDhe6b/k4n79dEAqM55r/Vd8U55wn1a4/UTkWFX2HsTwB72ZpcJgy8ErztmERW/KwrfZ8KBZPfJeXMV+Y6/6QU4++eyV6HA4iByOcNm3gxavxl03n7WT4URvPuSQDZqqC2Eh6FUxrToDcoM9ZWZ+vTCeCEkffZaxZdl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j9smVR4k; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j9smVR4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786941434; x=1818477434;
  h=date:from:to:cc:subject:message-id;
  bh=Zg0NeOydRQ9bSg6aEZSlqK0pDuz2wLKuGkE2J8ze4UA=;
  b=j9smVR4kw83veFCjKRFpkd7UzZfJvYLTCG2SVZnJ7mbqTBns4rCq9fwp
   0VhlfxoRV5LHNB+CIejx5kniYnRLH/bFH/P4JV+WhD9x2d+nzBq43GV0T
   wgDP2GcHpuivVE9fujPQnogNwEeWlGycgmj44bRsZzsGj7s0V7FbI1xdw
   7bdZSlsTV/AWEb7voDsdFz1T+Hz40pWeOtQN/72ixcwoK9brckLAun8HW
   NaOEBrVsnd8oNIIH7lbKnrjjJvDYYwC3NQHb87O3rCwFwuPi5zxixrAhO
   tf/EONLJ6EyMtDNAn1PstgEqBv2dNlM4yYdDN3puYa/MbhnCdMmqtmsVy
   w==;
X-CSE-ConnectionGUID: pmdvoILzT0qiiRB2ChriKw==
X-CSE-MsgGUID: g1SF9ePVTZ+d2bf3Fp/2WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98773623"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="98773623"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 21:37:14 -0700
X-CSE-ConnectionGUID: 0X+dNvgzRkGWPf11kT/khA==
X-CSE-MsgGUID: 2w2kCfWzT3GEntV6g0NrhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="264843656"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Aug 2026 21:37:12 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvp5x-00000000dIQ-37OK;
	Mon, 17 Aug 2026 04:37:09 +0000
Date: Mon, 17 Aug 2026 12:36:48 +0800
From: kernel test robot <lkp@intel.com>
To: Mahe Tardy <mahe.tardy@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jiayuan Chen <jiayuan.chen@linux.dev>
Subject: [bpf-next:master 2/5] net/core/bpf_ksock.c:221:18: sparse:
 sparse: symbol 'bpf_ksock_release_dtor' was not declared. Should it be
 static?
Message-ID: <202608171256.McaD8rfl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   c93cbdb13f995f87b5356329b3fe551c80bb482d
commit: 7ae4eb14c5f9d9bf0e0feabeab206151b1280512 [2/5] bpf: Add ksock kfuncs
config: nios2-randconfig-r112-20260817 (https://download.01.org/0day-ci/archive/20260817/202608171256.McaD8rfl-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171256.McaD8rfl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608171256.McaD8rfl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/bpf_ksock.c:221:18: sparse: sparse: symbol 'bpf_ksock_release_dtor' was not declared. Should it be static?

vim +/bpf_ksock_release_dtor +221 net/core/bpf_ksock.c

   220	
 > 221	__bpf_kfunc void bpf_ksock_release_dtor(void *ks)
   222	{
   223		bpf_ksock_release(ks);
   224	}
   225	CFI_NOSEAL(bpf_ksock_release_dtor);
   226	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
