Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBD61F5834
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 21:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776375506; cv=none; b=YI7sm3k0x76h5wVCpMHUrnMcAjY9xoEqoYpCMpcQ6nxy6Av7yxeOj7UHuSWX6V1EtSGK2rNcY9ZGpVejLYAGf3VvPfDADKIrhaHaYKyQTfKHi45MCpyPDQS9INCWNRO4+T7LkWFWRozvIJUZnh8yqIu65ghSUoWzplCfnpCRbIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776375506; c=relaxed/simple;
	bh=xMsPUsNVkgV/Ej8JipbLnkxws2FnJJTbZIipqFsN4lk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UfbwUY5lZvYFe165i8Wk5g1fGh/sQ8kOdHd6X3SOJ58+/EgGwivjw8ypGEJbBGcZ3Vq+tg0AkFCjJEccou3edKs2ADkczMiHdRi2yvJ54+8C6bk2MNifmYAZuIjF82RUKTjZIG7OX+zyw7qq9dVi6eJKcT7wExL6mGRpzC2ElyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fSJkw4mb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fSJkw4mb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776375504; x=1807911504;
  h=date:from:to:cc:subject:message-id;
  bh=xMsPUsNVkgV/Ej8JipbLnkxws2FnJJTbZIipqFsN4lk=;
  b=fSJkw4mbLqWrl70TGDveDqAVQotHx7nm2u/archgpH4FedANqUnFR3TX
   Elzub3/p8t1TTv92nOno3dBrtJ8yTV29u3h8yCsK0VKqSbrmti3LqfvFo
   K03GSOJFN7ROiGN49bjMLSSJN+C4f/oP6UnNtaiKjsaR9DMQoPTfXwgWg
   DhJeXIjnCiIZ3mHhasnFF60TkBR8hxW79rjly6tF6WU/ymPxMq8dazfpW
   7fsYMBVEhmWEAdEU1FNHt1Xixx5OWeVjUXDnVuhUjB/YD2Ub4xVhMaSVq
   mt/ycbLhiCcuXV/eQuxbYS7m5J5z+oUcUrrshvZRkNRrhfYgmqFrDm8rY
   g==;
X-CSE-ConnectionGUID: hef0FZaHQPGK7DE7WnuX2w==
X-CSE-MsgGUID: LR5AzQsDT16Ajw+EiW3OYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="80988145"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="80988145"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 14:38:24 -0700
X-CSE-ConnectionGUID: oBQFwDLZSdytuZhkkOSIBQ==
X-CSE-MsgGUID: ZMIGHVY8S7eY//ccfwuYVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="226505227"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Apr 2026 14:38:22 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDUPj-000000001za-3tmT;
	Thu, 16 Apr 2026 21:38:19 +0000
Date: Fri, 17 Apr 2026 05:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: Anna Schumaker <anna.schumaker@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anna-nfs:dir-delegations/client2 153/155]
 fs/nfs/callback_proc.c:432 nfs4_callback_notify() warn: unsigned 'res' is
 never less than zero.
Message-ID: <202604170512.w8ko8b5H-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.linux-nfs.org/projects/anna/linux-nfs.git dir-delegations/client2
head:   3c8c0b59c6a78d787961c27e97a799a2cf869a5c
commit: 21fe64ccdc08024cafc2e90dc506cbfbee5866e5 [153/155] NFS: Add support for CB_NOTIFY4_REMOVE_ENTRY
config: i386-randconfig-141-20260416 (https://download.01.org/0day-ci/archive/20260417/202604170512.w8ko8b5H-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604170512.w8ko8b5H-lkp@intel.com/

smatch warnings:
fs/nfs/callback_proc.c:432 nfs4_callback_notify() warn: unsigned 'res' is never less than zero.

vim +/res +432 fs/nfs/callback_proc.c

   394	
   395	__be32 nfs4_callback_notify(void *argp, void *resp,
   396				    struct cb_process_state *cps)
   397	{
   398		struct cb_notifyargs *args = argp;
   399		struct dentry *parent;
   400		struct inode *inode;
   401		unsigned int i;
   402		__be32 res;
   403	
   404		if (!cps->clp) {
   405			res = htonl(NFS4ERR_OP_NOT_IN_SESSION);
   406			goto out;
   407		}
   408	
   409		inode = nfs_delegation_find_inode(cps->clp, &args->cna_fh);
   410		if (IS_ERR(inode)) {
   411			res = htonl(NFS4ERR_BADHANDLE);
   412			goto out;
   413		}
   414		parent = d_find_alias(inode);
   415		if (!parent) {
   416			res = 0;
   417			goto out;
   418		}
   419	
   420		for (i = 0; i < args->cna_n_changes; i++) {
   421			struct cb_notify_changes *change = &args->cna_changes[i];
   422	
   423			switch (change->notify_mask) {
   424			case CB_NOTIFY4_REMOVE_ENTRY:
   425				res = nfs4_cb_notify_remove(cps, parent,
   426							    &change->notify_remove);
   427				break;
   428			default:
   429				return htonl(NFS4ERR_NOTSUPP);
   430			}
   431	
 > 432			if (res < 0)
   433				break;
   434		}
   435	
   436		dput(parent);
   437	out:
   438		kfree(args->cna_changes);
   439		return res;
   440	}
   441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
