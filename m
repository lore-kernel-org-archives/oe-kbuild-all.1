Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535F1145B17
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 08:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713428979; cv=none; b=Qc+edan3/ai7PHfScz99/2ODpr4vr4PBAIhNWQNRABc+3CWU8NhkO5UFoeN/FqvtrIianpJusnTQoy33Eb6SqoNY+uy/57xy3/GLRtN5JvuAxDWyJ3Nb8vn3G7zRrh5YxxUPhiOKoYpYpUoFFbz4RVNdhryHyY+tNL8b96WrlE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713428979; c=relaxed/simple;
	bh=cawfxZ9NaZWheue6HLIkIxgwSp86MRdpQnGtJi0T66w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rh9ynWs/ODzng91hp2Aq0EKQcyWzNPSXGo1+f4id5rIl9K2g+7DdnJYANXba/mkxDtFKFsa+yesltK3f3MUnP8AoSSv32pAcQzXoV1gzg2L53HebIvDvx71/UOb76FjL8ccqvLGE+BEu4mh34HFKeWjdGV15qPXnyI39sOMA+EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VKQ4RKyy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKQ4RKyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713428977; x=1744964977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cawfxZ9NaZWheue6HLIkIxgwSp86MRdpQnGtJi0T66w=;
  b=VKQ4RKyyRcQs9thuJ+xDy/W0HgqJR1sMb89TwNRXY0Y7t4xZmeaIbcFy
   xR69keW3eu6+bQdAITPMX04pSKAnwU40CoCZWnXeCYEEy9U5g/LDTAEIg
   173Mqon65ImklPvwNRUd/oeL4z8Pfuvfyb3548RXKOPYyA4b3ML9ERdki
   FupalJNpsbbkIZOmcD3XF0LhvsWW1gMZQwvEwRkmcVX0KVOMVuKnDPK2w
   nbhpR2XO9p2OsfI4Lds2gkGyH57HbLCIneRn4Lmh6mcsxfCEIhV6reiy4
   Hcl+ceacfM1UE96FQxGQQFSRy1IHPAJ0pLj/DJeKJHRv1gGB40myBtkVk
   w==;
X-CSE-ConnectionGUID: tbSXsgbjSliMCFyCayb8ug==
X-CSE-MsgGUID: FlFDEZ8vRhmwsoRNdcuKwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8824938"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="8824938"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 01:29:36 -0700
X-CSE-ConnectionGUID: DnvHVwZDR0mDHa1vMPH5DQ==
X-CSE-MsgGUID: rzhGZ8v3TkK8QhR88qpn3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="60333490"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Apr 2024 01:29:35 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxN8z-0007Qi-1G;
	Thu, 18 Apr 2024 08:29:26 +0000
Date: Thu, 18 Apr 2024 16:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:arena_lock 10/12] kernel/bpf/helpers.c:2599:31: warning:
 unused variable 'lock'
Message-ID: <202404181608.4yApniLM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git arena_lock
head:   b6ffb7fb4b4db0fefc36dbd504ce4a8fa8370f80
commit: 8ba2969c8a6df7a62a1beef5e2a464b1decd5452 [10/12] bpf: Introduce bpf_lock.
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240418/202404181608.4yApniLM-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404181608.4yApniLM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404181608.4yApniLM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/helpers.c: In function 'bad_release':
>> kernel/bpf/helpers.c:2599:31: warning: unused variable 'lock' [-Wunused-variable]
    2599 |         struct bpf_lock_kern *lock = &bpf_locks[lock_id];
         |                               ^~~~


vim +/lock +2599 kernel/bpf/helpers.c

  2596	
  2597	static void bad_release(u32 lock_id, struct bpf_prog_aux *aux)
  2598	{
> 2599		struct bpf_lock_kern *lock = &bpf_locks[lock_id];
  2600	
  2601		if (aux == &pseudo_aux)
  2602			WARN_ON_ONCE(1);
  2603		else
  2604			WRITE_ONCE(aux->bad_lock, 1);
  2605		WRITE_ONCE(bpf_locks[lock_id].locked, 1);
  2606		bpf_dec_lock_inflight(lock_id);
  2607		lock_release(&lock->lock.dep_map, _THIS_IP_);
  2608	}
  2609	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
