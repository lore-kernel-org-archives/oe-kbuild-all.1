Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFFE2FB08D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 05:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760505190; cv=none; b=FUj/aYntdsmAVTKiyQxj/VqpdEUVPZP6yUXNWojq8V1x+eLF2WKfjNw4qwWbUlYY3st6dyeTqD5HCQ/xeDT39O6Diw/s2tRtqh38oiY+cxmBKEbmv34zCkoCYWnilZiSF4xpOWVUnR7nVsLbBjIEuXjYO2JKnALv/vQb3mRlvbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760505190; c=relaxed/simple;
	bh=7P/FjkBMUdVPHV3AgW/cI2toWs4stH+n+Tv7O1YtHWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J+Ej+NEnpfNtHqp+HuCKXvUuRrjK0GuG9hme5vCfIVJCAji/Tk/IxXcFWXxTenyhB2p9x9NmWMpSuOxwkNb/vMGzjnkjHbS8XLoDSuUFwVKGjE8fTBynpORR1iE2Yijv7sGIQPPqKBO2V6XgyZRCt3DvCG0p4utm1w2QdKAR87U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/CzD1st; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/CzD1st"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760505189; x=1792041189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7P/FjkBMUdVPHV3AgW/cI2toWs4stH+n+Tv7O1YtHWc=;
  b=D/CzD1st6wiR/WdR6H99YoUwKIdOSNayIBdxc8twxXbBg+C2f7/SID8D
   IgGJ373Li25S0ku/1DaUWQEgKifu9VUMhsicJJ0Imst2vU3g3ff6DjSIv
   brvwaEZOCD3t+ivZSMUpEGf/q7V98TTiwFeW9nAPIdiAjrqazpKIJWUGD
   sOoAtPDz6ipS4PqkIvhYx9WVSrB3apW6fbdzd/1oJZmQBEv+F89cDISKU
   2VIoTVOPffVv6G/AhEeoPcCigtOjqbPVfaoSrrCpB/QE+j6TOyPqT6l82
   pu/d2IADXkP7NB4UVyYhOD0uOFyRwdVXlp66ak4Ce8oUrbTCdU8c5+Zx0
   w==;
X-CSE-ConnectionGUID: vVd706aETuuoccr4qK1SEg==
X-CSE-MsgGUID: 3EUsrjFdQZW8n1F+RW7MxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62713561"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="62713561"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 22:13:08 -0700
X-CSE-ConnectionGUID: Zfhv+4S8RCOn5eQHKmAx5w==
X-CSE-MsgGUID: OOOWTFDsRtqHk4M+h30iig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="212678414"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Oct 2025 22:13:07 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8toU-0003T5-00;
	Wed, 15 Oct 2025 05:12:46 +0000
Date: Wed, 15 Oct 2025 13:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.2.2 20/21] mm/oom_kill.c:1429: undefined reference
 to `bpf_psi_bpf_ops'
Message-ID: <202510151500.fJpAjSJ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.2.2
head:   45efac5878c5044a04954bf71d4e895e8c13a604
commit: 38b77a6499c8ae61c4028e57fca141888ea36af9 [20/21] filter bpf_out_of_memory access
config: parisc-randconfig-002-20251015 (https://download.01.org/0day-ci/archive/20251015/202510151500.fJpAjSJ0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510151500.fJpAjSJ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510151500.fJpAjSJ0-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: mm/oom_kill.o: in function `bpf_oom_kfunc_filter':
>> mm/oom_kill.c:1429: undefined reference to `bpf_psi_bpf_ops'
>> hppa-linux-ld: mm/oom_kill.c:1429: undefined reference to `bpf_psi_bpf_ops'


vim +1429 mm/oom_kill.c

  1426	
  1427	static int bpf_oom_kfunc_filter(const struct bpf_prog *prog, u32 kfunc_id)
  1428	{
> 1429		if (btf_id_set_contains(&bpf_oom_declare_oom_kfuncs, kfunc_id) &&
  1430		    prog->aux->st_ops != &bpf_psi_bpf_ops)
  1431			return -EACCES;
  1432	
  1433		return 0;
  1434	}
  1435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
