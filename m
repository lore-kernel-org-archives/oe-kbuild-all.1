Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE49D3DD52D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 09:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343335; cv=none; b=o3brTgQxYipkNSwQ/+pCiPoDkt6F10QnL6a88JrFY5DH+zWzyo2C3cuWUeabSU6i5mdMwL20gMwbiUtAATtEF+tafdld3QirnEImrwXYfv1WGaDHrZGEQu0fbBHuZqPeT+m5qKvPzon7O+yZUN6QvLJJaQTh4yFem8yxIQqT9QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343335; c=relaxed/simple;
	bh=lJ/NbLaUQUfQ0p5YnUn/FpzJad7ZJPQ6RLy09IjmprI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N9ip4g6o6ujhj3q2zeyld4+fETCydMHGEpgbqjeCLi+0whTDHYnKV15FNaLDRhzA3Cw9eNRNaH+cJSKg1SPrw7No4R4nc03LE0U9GDGJERLjmoqZSTDydbn/54edvoTjJuPg/CnF8/rMOXfvBv+pSIi5UTqk1ZjaHKEIsadiyxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2zGTdBL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2zGTdBL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774343328; x=1805879328;
  h=date:from:to:cc:subject:message-id;
  bh=lJ/NbLaUQUfQ0p5YnUn/FpzJad7ZJPQ6RLy09IjmprI=;
  b=R2zGTdBLzxEt/o4dTwGzkeiI4V22Ber6f7R5SLUKh4AU65QfA9jhN8iu
   /E5k2b0DjNV9/z9yKj8TmLZmfkPL01/p3sU5/Q8P0X640oKS9qyaQDl5b
   Lsz2WHK2QFeiYoIKi/XDPmUdmeT5UW7Ak/9KvPYkYdMrDy5mzNIbaGMZv
   UZp91mmi0SPU/Lt7cofz6b67pJce0FYbU5eIw8aivYpfPzJDmSADP6FVl
   XfPvKKUP2huGeYw7W1EoMGBqshMomoHp0z25WF7DzzHHHCVNTU8+UNl9b
   WdN46L6vzzua6DT6OZA7kJ+M2kYIqdPbseK3+oH2PPeiLiyID+jL418QD
   Q==;
X-CSE-ConnectionGUID: o2unR4uEQ4eaIqz8R2JfXA==
X-CSE-MsgGUID: cRJtH4vUTsmBzVvk0ubbEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75259965"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75259965"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 02:08:47 -0700
X-CSE-ConnectionGUID: sdXvTzbnTxewQdv2vhMlvg==
X-CSE-MsgGUID: BbzlBnS5QY++4cry91uhIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="229041927"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Mar 2026 02:08:45 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4xkg-000000004Ib-2pQU;
	Tue, 24 Mar 2026 09:08:42 +0000
Date: Tue, 24 Mar 2026 17:07:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dillon Varone <Dillon.Varone@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:862
 dmub_srv_fb_cmd_execute() warn: inconsistent indenting
Message-ID: <202603241709.34oBV0zd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: a3b7dc4a1ec4e184f48c2f8205d2ec88d31310fe drm/amd/display: Add Support for reg inbox0 for host->DMUB CMDs
date:   12 months ago
config: x86_64-randconfig-r073-20260323 (https://download.01.org/0day-ci/archive/20260324/202603241709.34oBV0zd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241709.34oBV0zd-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:862 dmub_srv_fb_cmd_execute() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:961 dmub_srv_wait_for_pending() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:994 dmub_srv_wait_for_idle() warn: inconsistent indenting

vim +862 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c

   842	
   843	enum dmub_status dmub_srv_fb_cmd_execute(struct dmub_srv *dmub)
   844	{
   845		struct dmub_rb flush_rb;
   846	
   847		if (!dmub->hw_init)
   848			return DMUB_STATUS_INVALID;
   849	
   850		if (dmub->power_state != DMUB_POWER_STATE_D0)
   851			return DMUB_STATUS_POWER_STATE_D3;
   852	
   853		/**
   854		 * Read back all the queued commands to ensure that they've
   855		 * been flushed to framebuffer memory. Otherwise DMCUB might
   856		 * read back stale, fully invalid or partially invalid data.
   857		 */
   858		flush_rb = dmub->inbox1.rb;
   859		flush_rb.rptr = dmub->inbox1_last_wptr;
   860		dmub_rb_flush_pending(&flush_rb);
   861	
 > 862			dmub->hw_funcs.set_inbox1_wptr(dmub, dmub->inbox1.rb.wrpt);
   863	
   864		dmub->inbox1_last_wptr = dmub->inbox1.rb.wrpt;
   865	
   866		return DMUB_STATUS_OK;
   867	}
   868	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
