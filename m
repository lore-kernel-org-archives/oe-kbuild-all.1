Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1DB49CF43
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 17:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791308182; cv=none; b=u+AtZ9DD8Cc9AshoV41tUx686dOXeXq6i/Y+Y3lx36Q0cPgCK/TKAQ9qtT6bClgQvuy0pqooxJvWYNpsCVSKvXA8g30ERIzoXqxAmlhYRvEadnoo5xQq1cS8ePm5aZN5nCtoyIpcclTMiV3eT+Xc8sBcDuT3Cm2tBLWa+I9LAOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791308182; c=relaxed/simple;
	bh=NsdJuvzNzgTZi8FjhTXlgDccIL6bt2y1TzGcxibwTH8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GCdXe7tGjIuB9MGU1aHzin7vLaSky6gFwllmt80W901p6KjPJQx9sWNbOp/kf08h8ZEfUTG+j0cDS6yCoTfyjnTfrAcdsUJCtrr7S6RNxfKB2+OP3vKYkmsJg91kQQauNDv7gZrbxHV6D3zXw6e7a+1MDjSg0c1f1TbHZUlBStc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfRQ+B3F; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfRQ+B3F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791308180; x=1822844180;
  h=date:from:to:cc:subject:message-id;
  bh=NsdJuvzNzgTZi8FjhTXlgDccIL6bt2y1TzGcxibwTH8=;
  b=XfRQ+B3FQL15NyX6bANkJ+9yoab4ELn4EUDLBc1VOI6TxbLnJrQ30Oc1
   +OyGYUprS5pROwib3tbixrPnEqPLCRR/mEv0xRc05YoXHloEHhnLH21kh
   L2sFtN/10vlzmvF0tLHG5onqSGZVc+sfRIvzu5QYSHeEztcEXVQZNAUw2
   1I39AIqp5QFZhfQG+/re4tj1zanrgIf8gxiMlLM52Zn5i5ofZT9vtPeFb
   o0zhyzhuOrE71AhVREt/5E+H8wOX4/72Qsc+A4CMtUO4MEsr+LJ8tLxm+
   BNyRya9W3SpxGFggb8pzNgskoT2KJ0jYwb3CepWC5dERzwMweUlFJq7Lx
   w==;
X-CSE-ConnectionGUID: oWL9ytSqTQGueHRi7zFOvw==
X-CSE-MsgGUID: vMtgFsrOR129T1bW6p7OAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="95823413"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="95823413"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 10:36:17 -0700
X-CSE-ConnectionGUID: EwXMxeusR8yXXB7dvaS+ig==
X-CSE-MsgGUID: vx02bnzrQ5WbgNr67Q4z0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="277349857"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 06 Oct 2026 10:36:15 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE95J-000000001ZX-37YP;
	Tue, 06 Oct 2026 17:36:13 +0000
Date: Tue, 06 Oct 2026 19:35:17 +0200
From: kernel test robot <lkp@intel.com>
To: Benjamin Coddington <ben.coddington@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Anna Schumaker <anna.schumaker@hammerspace.com>
Subject: [linux-next:master 7165/14724]
 fs/nfs/flexfilelayout/flexfilelayoutdev.c:361:15: sparse: sparse: cast
 removes address space '__rcu' of expression
Message-ID: <202610061959.iAgcNy7q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eea3fef32a9cf36abcb5975a5a594e4135a6b026
commit: a716422fb73d157548429c1ccb2d8675f525cdbd [7165/14724] NFSv4/flexfiles: Make the pinned device node pointer RCU-managed
config: riscv-randconfig-r2307-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061959.iAgcNy7q-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061959.iAgcNy7q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061959.iAgcNy7q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfs/flexfilelayout/flexfilelayoutdev.c:361:15: sparse: sparse: cast removes address space '__rcu' of expression
>> fs/nfs/flexfilelayout/flexfilelayoutdev.c:361:15: sparse: sparse: cast removes address space '__rcu' of expression
>> fs/nfs/flexfilelayout/flexfilelayoutdev.c:361:15: sparse: sparse: cast removes address space '__rcu' of expression
>> fs/nfs/flexfilelayout/flexfilelayoutdev.c:361:15: sparse: sparse: cast removes address space '__rcu' of expression
>> fs/nfs/flexfilelayout/flexfilelayoutdev.c:361:15: sparse: sparse: cast removes address space '__rcu' of expression
>> fs/nfs/flexfilelayout/flexfilelayoutdev.c:361:15: sparse: sparse: cast removes address space '__rcu' of expression
>> fs/nfs/flexfilelayout/flexfilelayoutdev.c:361:15: sparse: sparse: cast removes address space '__rcu' of expression

vim +/__rcu +361 fs/nfs/flexfilelayout/flexfilelayoutdev.c

   314	
   315	/*
   316	 * Resolve the stripe's deviceid on first use and pin the node on the
   317	 * mirror.  Returns a node the caller must put, or an ERR_PTR.
   318	 */
   319	struct nfs4_ff_layout_ds *
   320	ff_layout_get_mirror_ds(struct pnfs_layout_hdr *lo,
   321				struct nfs4_ff_layout_mirror *mirror,
   322				u32 dss_id)
   323	{
   324		struct nfs4_ff_layout_ds *mirror_ds, *old;
   325		struct nfs4_deviceid_node *node;
   326	
   327		if (mirror == NULL)
   328			return ERR_PTR(-ENODEV);
   329	
   330	retry:
   331		rcu_read_lock();
   332		mirror_ds = rcu_dereference(mirror->dss[dss_id].mirror_ds);
   333		if (mirror_ds && !IS_ERR(mirror_ds) &&
   334		    atomic_inc_not_zero(&mirror_ds->id_node.ref)) {
   335			rcu_read_unlock();
   336			return mirror_ds;
   337		}
   338		rcu_read_unlock();
   339		if (IS_ERR(mirror_ds))
   340			return mirror_ds;
   341		if (mirror_ds != NULL)
   342			/* raced with a reset; the field is being re-pointed */
   343			goto retry;
   344	
   345		node = nfs4_find_get_deviceid(NFS_SERVER(lo->plh_inode),
   346				&mirror->dss[dss_id].devid, lo->plh_lc_cred,
   347				GFP_KERNEL);
   348		if (node) {
   349			mirror_ds = FF_LAYOUT_MIRROR_DS(node);
   350			/*
   351			 * Take the caller's reference before the pointer becomes
   352			 * visible below, so a concurrent reset of the installed
   353			 * pointer cannot drop the last reference under us.
   354			 */
   355			atomic_inc(&node->ref);
   356		} else {
   357			mirror_ds = ERR_PTR(-ENODEV);
   358		}
   359	
   360		/* check for race with another call to this function */
 > 361		old = unrcu_pointer(cmpxchg(&mirror->dss[dss_id].mirror_ds,
   362					    NULL, RCU_INITIALIZER(mirror_ds)));
   363		if (old == NULL)
   364			return mirror_ds;
   365	
   366		/* lost the race; use the winner's node instead */
   367		if (node) {
   368			nfs4_put_deviceid_node(node);
   369			nfs4_put_deviceid_node(node);
   370		}
   371		goto retry;
   372	}
   373	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
