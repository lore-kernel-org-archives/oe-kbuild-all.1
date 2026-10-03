Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F76157A5A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 22:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791065495; cv=none; b=KhGoGlNjLkCkGa+/XecbQVVM/Xe+EJb79OaGAG3FSToktAsZwI/n0LE9ksz+yv1QAOEVXr1tf2gw/578qLki5dmTERo1Ey9eecB1vDm/FazvarOiF9qsFwdCFkNm7VPeknb3lTdpD/LqoK+lqc/Jiuaax64eul5ZXaZU991ahBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791065495; c=relaxed/simple;
	bh=Kr+6h8x4NwCyuk4JFqkkxoG/UokvjL23ROwtim/jPxo=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNeSL0Imn+htizh3AadCTzn/l3O13jHuTbMUhIUbZx2DV1au2/O0yS4CyF+mYKfvkvU37mdyrGW/TSxjpTXoACQs60CiIbyCr/Bd6K650KbD1GOIdc17AbOpSCK1FQ9w0DttS4VAwcx7/ZDahcBGAIaAgMeV2kXK9s0mukzg860=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TifMEbr7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TifMEbr7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791065489; x=1822601489;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=Kr+6h8x4NwCyuk4JFqkkxoG/UokvjL23ROwtim/jPxo=;
  b=TifMEbr7Uwjx0nObeXgvs7HOgTi0ZOFoNsw0anmx9AkcNt4bg8OCSE3r
   zZVCr8+0CZife2Bx/mUSkbBDK92WemW/2VPXfP6nooxsYS1VLlVBxupJx
   iBAwd6PziCZZbNQmrFdVShnQYLaJiGC+mPwTS2ltSmmXhaAidshNagCty
   HtKNvcWbfbiaRs/z0G0n9WjUNGST1GtliIcNk8p/Dsu0EQPMW1GQc63h3
   CGTN2d51u+vQAbHSQc8YkgIfhnVq35/JeJFO33RRWPCDErtTtHVJkVZaX
   bMYLBdH2eY32nlX24eo7jFH11dM2fgh2C30SCOFtrLSDly73dUjCxK69a
   w==;
X-CSE-ConnectionGUID: pXgV0grXSpahdFDxDF1ypQ==
X-CSE-MsgGUID: TcbC8bsbRomGlqgbzKdyIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="91894627"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="91894627"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 15:11:28 -0700
X-CSE-ConnectionGUID: tv+86eNkSe6+LNOJz1JCTw==
X-CSE-MsgGUID: sY4yv3PdS4C4SSGMNfHcfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="281238519"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Oct 2026 15:11:27 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xD7wz-00000000UFX-0Z0L
	for oe-kbuild-all@lists.linux.dev;
	Sat, 03 Oct 2026 22:11:25 +0000
Date: Sun, 4 Oct 2026 06:10:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: nfs/localio: pin clients during global invalidation
Message-ID: <202610040648.34KSnXrl-lkp@intel.com>
References: <202610040648.34KSnXrl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610040648.34KSnXrl-lkp@intel.com>

Hi Jinpyo,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Jinpyo-Lee/nfs-localio-pin-clients-during-global-invalidation/20260930-145053
base:   
patch link:    https://lore.kernel.org/r/202610040648.34KSnXrl-lkp%40intel.com
config: nios2-randconfig-1001-20261003 (https://download.01.org/0day-ci/archive/20261004/202610040648.34KSnXrl-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610040648.34KSnXrl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610040648.34KSnXrl-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: fs/nfs_common/nfslocalio.o: in function `nfs_localio_invalidate_clients':
>> fs/nfs_common/nfslocalio.c:253:(.text+0x7f0): undefined reference to `nfs_put_client'
>> fs/nfs_common/nfslocalio.c:253:(.text+0x7f0): relocation truncated to fit: R_NIOS2_CALL26 against `nfs_put_client'


vim +253 fs/nfs_common/nfslocalio.c

   225	
   226	void nfs_localio_invalidate_clients(struct list_head *nn_local_clients,
   227					    spinlock_t *nn_local_clients_lock)
   228	{
   229		nfs_uuid_t *nfs_uuid;
   230		struct nfs_client *clp;
   231	
   232		for (;;) {
   233			spin_lock(nn_local_clients_lock);
   234			nfs_uuid = list_first_entry_or_null(nn_local_clients,
   235							    nfs_uuid_t, list);
   236			if (!nfs_uuid) {
   237				spin_unlock(nn_local_clients_lock);
   238				break;
   239			}
   240			if (WARN_ON(nfs_uuid->list_lock != nn_local_clients_lock)) {
   241				spin_unlock(nn_local_clients_lock);
   242				break;
   243			}
   244			clp = container_of(nfs_uuid, struct nfs_client, cl_uuid);
   245			if (!refcount_inc_not_zero(&clp->cl_count)) {
   246				spin_unlock(nn_local_clients_lock);
   247				cond_resched();
   248				continue;
   249			}
   250			spin_unlock(nn_local_clients_lock);
   251	
   252			nfs_localio_disable_client(clp);
 > 253			nfs_put_client(clp);
   254		}
   255	}
   256	EXPORT_SYMBOL_GPL(nfs_localio_invalidate_clients);
   257	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
