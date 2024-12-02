Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A991D79BE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 16:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733158724; cv=none; b=jtbmAdoiZmCaAncSW9kG4uspYsiS8iTZJDKVDXegS1gUmOpJCt4apLvIDJHyOeEzBqq+JLMDmoYA1O1ziPqHv5wBABFS6lQ9UXXV2CoaFL40yM08XbvwrgjrjeuNfETTFP2Ce2cEzR+QytRSgNH/aXCS0RUwHJnqtHiTzhheuZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733158724; c=relaxed/simple;
	bh=1laFf7nKqrSmGWLZI9lRZ2bEjRGbVi3fv7PBBGgT7oo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HIC6+hEHpgLOyvaol2062MSsfLoYQJEBJwCOFKVUZUmUcmRR0E4Bf/dD6vN6tQ2PJRiyPMhNPP/jzJb04f+wgHnGsKdDf3fymEykfAd7w7AJ2t0+g/ke8GZ2VfyUygLAoeScIxk/gFjbrP1rDSFgOr6izUndgbT23Ybr8r3gnLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiOLUkOT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiOLUkOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733158722; x=1764694722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1laFf7nKqrSmGWLZI9lRZ2bEjRGbVi3fv7PBBGgT7oo=;
  b=DiOLUkOTA8MyBrfTa99U+m6qPXkvm7J6pQheRwh7fNNFa5BWUO06Al1V
   L3+6C1osOcK20ggOTx6jJzfp3nplkG0PsQEWkQzzU93laBjgJA0aaPjhY
   yeXNRRmcHMee/XFStwGNz/EZIt/OnMvFkKcT7sD9ClIPTMRbNlBNVOtRL
   lvRzrMGOD3QbcMI6AK7XDSVuH7yWnSwmKv59SHcX+oCxewl2gExkFbs05
   qzV2xzZcSJmoC2dh70BLsiTqLhZ4kOe89ymfUrpRIaFNmG1WxH2X/bhG2
   0tUg3evM1IkXRgBUNbYMVEwLY9vsI5xbjjmQo2AaPeESb3K65HbkoFSsD
   A==;
X-CSE-ConnectionGUID: +H7Dij50ROmnBZdFZ1qNbg==
X-CSE-MsgGUID: UwjX/GvoS8iDzd4wyxuFzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="50750591"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="50750591"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 08:58:41 -0800
X-CSE-ConnectionGUID: Nr+6LIRbTXCQedvEhy8RBQ==
X-CSE-MsgGUID: pYX3cBIeRQChfoyHMHfScQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="97936077"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 02 Dec 2024 08:58:39 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI9kr-0002dT-0G;
	Mon, 02 Dec 2024 16:58:37 +0000
Date: Tue, 3 Dec 2024 00:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1455/1455] mm/memcontrol.c:4344:5: warning: no
 previous prototype for 'memcg_swapmax_read'
Message-ID: <202412030048.kxkxfpl0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9809e40d1abbcdf278f3db91f03a94507bdbb442
commit: a095a940f784db58ea4e87df361f9a4fd0dd977f [1455/1455] memcg: add restrict to swap to cgroup1
config: x86_64-buildonly-randconfig-006-20241112 (https://download.01.org/0day-ci/archive/20241203/202412030048.kxkxfpl0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030048.kxkxfpl0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030048.kxkxfpl0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:4344:5: warning: no previous prototype for 'memcg_swapmax_read' [-Wmissing-prototypes]
    4344 | u64 memcg_swapmax_read(struct cgroup_subsys_state *css, struct cftype *cft)
         |     ^~~~~~~~~~~~~~~~~~


vim +/memcg_swapmax_read +4344 mm/memcontrol.c

  4343	
> 4344	u64 memcg_swapmax_read(struct cgroup_subsys_state *css, struct cftype *cft)
  4345	{
  4346		struct mem_cgroup *memcg = mem_cgroup_from_css(css);
  4347	
  4348		if (!static_branch_likely(&memcg_swap_qos_key))
  4349			return PAGE_COUNTER_MAX * PAGE_SIZE;
  4350	
  4351		return READ_ONCE(memcg->swap_dev->max) * PAGE_SIZE;
  4352	}
  4353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
