Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F32315D42
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 10:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762251990; cv=none; b=AlbF4tdlCnb5fDdku1EilvIc0hcIDDa0EL16YQccTk/ma5kA8yzaP96AyJHqI1ovCCWzMZx007MJsQiDl+3XQijVgWjbtLcNMFSJtqcPEKYqXtlpMv/SIpGGHOCs1ogvLq7MAv35ztd1stEvEpckaZQeyzd/Sf3qPE3eZpcoXgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762251990; c=relaxed/simple;
	bh=ewQHlBy3gSikdSO0wlQYtvKjg37uLB6oMkvxNisxeKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=thSGvPyhJuap0eNLh1nSxcG3UTzR05gkdSW8SFID9JrCkevSjbmi78nq4HqtMYNDbU5K+wHtPstZszOIliZtU49mLbGUVhBqVNtWzU0DYJ8roehMljZxqJrm1CTkxRcs2ntilY+XcleIcLlDpDwsPGywqXYi4uHAkGt9YVRZZUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFPOR9mQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFPOR9mQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762251989; x=1793787989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ewQHlBy3gSikdSO0wlQYtvKjg37uLB6oMkvxNisxeKU=;
  b=OFPOR9mQl0O+EDsSsY0UxMGozpKAWYrq+w26PNY4GNZ20Hx8CKvN/3si
   BxlzmD8CtIlqk8hFtpSuGXpOT+nWAK84G5sHgGL0lq0/7jH9NNQKlYdHz
   Ntd+l4hM2y514TB5v96KeOU/SgR33VSA3rIe15VAmTcHY4z1AHZqBi93r
   RAs6YdoszAe5o7UdtFSbdhj52zWhCM2lr/VrQRQpLfwdMRdPJLU6sXxTP
   9kkN+xmCeyFd016FIaQTsJREtXSJeI4LJxTu1k0ZNAQw21yhVVpWzh7yC
   DR5daC1fDPf6Xi/SgzrI6jtgIKPBNcF50edZcqCoYdAJYHUh3cwpuWvhY
   w==;
X-CSE-ConnectionGUID: +6t1PNpZQ9S5WN5Vad4VaA==
X-CSE-MsgGUID: IRct6zcITxqqMY9pteLo+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64493236"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="64493236"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 02:26:28 -0800
X-CSE-ConnectionGUID: EEjFILkIQMKG2x8k3XoBZw==
X-CSE-MsgGUID: e08sSTujQzSYlJKTOlVhJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="187568862"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 04 Nov 2025 02:26:27 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGEF7-000RGn-0C;
	Tue, 04 Nov 2025 10:26:25 +0000
Date: Tue, 4 Nov 2025 18:25:29 +0800
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 1/1] fs/rpdfs/map.c:100:undefined reference
 to `__umoddi3'
Message-ID: <202511041846.GPsV44fp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   e8e76da7ed715ef67ccc4436f4981a5b39983d9f
commit: e8e76da7ed715ef67ccc4436f4981a5b39983d9f [1/1] rpdfs: initial commit
config: i386-randconfig-005-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041846.GPsV44fp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041846.GPsV44fp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041846.GPsV44fp-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/rpdfs/map.o: in function `rpdfs_map_bnr_to_addr':
>> fs/rpdfs/map.c:100:(.text+0x821): undefined reference to `__umoddi3'


vim +100 fs/rpdfs/map.c

    85	
    86	int rpdfs_map_bnr_to_addr(struct rpdfs_fs_info *rfi, u64 bnr,
    87				  struct rpdfs_net_transport_addr *addr, u64 *mver)
    88	{
    89		struct rpdfs_map_info *minf = RPDFS_MINF(rfi);
    90		struct addr_map *amap;
    91		unsigned int seq;
    92		int ret;
    93	
    94		rcu_read_lock();
    95		do {
    96			seq = read_seqbegin(&minf->seqlock);
    97			amap = rcu_dereference(minf->amap);
    98			*mver = minf->mver;
    99			if (amap) {
 > 100				*addr = amap->addrs[bnr % amap->count];
   101				ret = 0;
   102			} else {
   103				ret = -ENOENT;
   104			}
   105		} while (read_seqretry(&minf->seqlock, seq));
   106		rcu_read_unlock();
   107	
   108		return ret;
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
