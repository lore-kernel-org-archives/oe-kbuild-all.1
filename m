Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B323DBBA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710331611; cv=none; b=kOk97uTKbFdgY3R1H6VjTJt3Jc9YDNhVSkXQa8Oo49t+HHzFuQwO5c+yKMsjBkEwXyxLCSVvaSv7Nmg7/HNXmtBNPMdcPQzWqwjNrKOG/Y+Krm/qhpg19BLsnNuRQDcNeS02NJP+jB0HGlJAZdTelByQ7VMfo5m3D0AUplHnFfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710331611; c=relaxed/simple;
	bh=bF+Q4mgEtganQvF0whh39wo/t/uymQgU4nubU0mf9Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HACzZxkAPTyzfgWLvvyrNjkCZVK7DHLiE3Oc14pwRFW6s2LHUPBu0F5lDBfopSLWBCC46SwKIgZopZTEOrLUvVbrRHokDnF3ozuaKvWLmHycxB6Bgd4vP3sxj/840Ow/ZhxDAwMhJfRcV11q4MJZRCO+2LGrPWXCkLSD0Inz7Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=koRi/fp7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="koRi/fp7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710331609; x=1741867609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bF+Q4mgEtganQvF0whh39wo/t/uymQgU4nubU0mf9Cs=;
  b=koRi/fp7scIqTsGKcvR051w+LmlOzzPu9O0IuTjmjyM1KnAFM5bA11b+
   7agVYSPMfAWDI5q9qdEl5bjoAdkSyQ7G7Y7krMzyy7/dVf84nvFZIh+pG
   1adXfBg1e4ChgPczwpreG6WaxyuEOvUPo3M03ZgsDhfzWAxkyMHZZpDSr
   az2i4noaDUsyPwMOMKscR8PSnAD6eiKtj6NpmyX6n9hbC6MzAAgOQtFmG
   oj01U8BnU9WRBebPstYXF9OfpnWESuiFiJqjTimOps3j10HvLMWffdIKa
   DZ2ofMLsIQbgY6Y6Ifk3lid7rg038AE1uNNs9ZMt77PqPwKL+zcgxTtPD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4946700"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="4946700"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 05:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="42837017"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Mar 2024 05:06:46 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkNNc-000CLd-2l;
	Wed, 13 Mar 2024 12:06:44 +0000
Date: Wed, 13 Mar 2024 20:05:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 32/32] fs/nfs/dir.c:3016:53: warning: format '%x'
 expects argument of type 'unsigned int', but argument 3 has type 'long
 unsigned int'
Message-ID: <202403131939.8GWZJoQW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   244db11a7d6835249946adae4255d53cb0edf7f6
commit: 244db11a7d6835249946adae4255d53cb0edf7f6 [32/32] DEBUG: more printks
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240313/202403131939.8GWZJoQW-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403131939.8GWZJoQW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403131939.8GWZJoQW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/nfs/dir.c: In function 'nfs_access_get_cached_locked':
>> fs/nfs/dir.c:3016:53: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'long unsigned int' [-Wformat=]
    3016 |                 trace_printk("%s: cache_validity=0x%x\n", __func__, nfsi->cache_validity);
         |                                                    ~^               ~~~~~~~~~~~~~~~~~~~~
         |                                                     |                   |
         |                                                     unsigned int        long unsigned int
         |                                                    %lx


vim +3016 fs/nfs/dir.c

  2996	
  2997	static int nfs_access_get_cached_locked(struct inode *inode, const struct cred *cred, u32 *mask, bool may_block)
  2998	{
  2999		struct nfs_inode *nfsi = NFS_I(inode);
  3000		u64 login_time = nfs_access_login_time(current, cred);
  3001		struct nfs_access_entry *cache;
  3002		bool retry = true;
  3003		int err;
  3004	
  3005		spin_lock(&inode->i_lock);
  3006		for(;;) {
  3007			if (nfsi->cache_validity & NFS_INO_INVALID_ACCESS)
  3008				goto out_zap;
  3009			cache = nfs_access_search_rbtree(inode, cred);
  3010			err = -ENOENT;
  3011			if (cache == NULL)
  3012				goto out;
  3013			/* Found an entry, is our attribute cache valid? */
  3014			if (!nfs_check_cache_invalid(inode, NFS_INO_INVALID_ACCESS))
  3015				break;
> 3016			trace_printk("%s: cache_validity=0x%x\n", __func__, nfsi->cache_validity);
  3017			if (!retry)
  3018				break;
  3019			err = -ECHILD;
  3020			if (!may_block)
  3021				goto out;
  3022			spin_unlock(&inode->i_lock);
  3023			err = __nfs_revalidate_inode(NFS_SERVER(inode), inode);
  3024			if (err)
  3025				return err;
  3026			spin_lock(&inode->i_lock);
  3027			retry = false;
  3028		}
  3029		err = -ENOENT;
  3030		if ((s64)(login_time - cache->timestamp) > 0)
  3031			goto out;
  3032		*mask = cache->mask;
  3033		list_move_tail(&cache->lru, &nfsi->access_cache_entry_lru);
  3034		err = 0;
  3035	out:
  3036		spin_unlock(&inode->i_lock);
  3037		return err;
  3038	out_zap:
  3039		spin_unlock(&inode->i_lock);
  3040		nfs_access_zap_cache(inode);
  3041		return -ENOENT;
  3042	}
  3043	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
