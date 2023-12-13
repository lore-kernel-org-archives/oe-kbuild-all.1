Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567622E821
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 14:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoOq+voU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702476869; x=1734012869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KsCsRfzOQHBDZyTJhXSxUqvxPC7X4K/a3aTo0yZ7DOo=;
  b=VoOq+voUv1Wm9QmbuVFN6XMpw1U4PuZM7Fe4+qrhk0A1p3XDLNLUCWLE
   7Gv4FFEPt2kAaZg7neji1GE8s/7OQ6O9v+6w7U3umVyAvGKOZWVBVDAo9
   XmpfYSGGfgWuGXFWxDt/g0cwVS/KxU7BUhaBM6bhmROH4jkl4zoYURBPM
   AR7hhdnllqvLEieyDcpZuynpWS8AXxzRWY9ovRxfSEZPBO036by3mnuI5
   SQYCuU+ttjNyEuwZMVzGX1+htS2Gz3qrlsJFZXec1HJwxfQehza8MDRtk
   2f68ebHq0iYLtJBUlTNYIMjqYGPyc4b1LA5ASGyXS+N9FXzRLm6J+vdtC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="2147430"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="2147430"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 06:14:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="773964000"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="773964000"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Dec 2023 06:14:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDQ0F-000KfB-0M;
	Wed, 13 Dec 2023 14:14:23 +0000
Date: Wed, 13 Dec 2023 22:13:41 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-next 40/43] fs/afs/callback.c:82:13: sparse:
 sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
Message-ID: <202312132235.mTdYGBd1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-next
head:   f1302568cc65d3fdd85e6413688779e5235f4e2b
commit: b8f604776e35dd984fbf93f49276543461cbbb22 [40/43] afs: Overhaul invalidation handling to better support RO volumes
config: nios2-randconfig-r112-20231213 (https://download.01.org/0day-ci/archive/20231213/202312132235.mTdYGBd1-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312132235.mTdYGBd1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312132235.mTdYGBd1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/afs/callback.c:82:13: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
   fs/afs/callback.c:146:22: sparse: sparse: context imbalance in 'afs_lookup_volume_rcu' - different lock contexts for basic block

vim +82 fs/afs/callback.c

    73	
    74	/*
    75	 * actually break a callback
    76	 */
    77	void __afs_break_callback(struct afs_vnode *vnode, enum afs_cb_break_reason reason)
    78	{
    79		_enter("");
    80	
    81		clear_bit(AFS_VNODE_NEW_CONTENT, &vnode->flags);
  > 82		if (xchg(&vnode->cb_expires_at, AFS_NO_CB_PROMISE) != AFS_NO_CB_PROMISE) {
    83			vnode->cb_break++;
    84			vnode->cb_v_check = atomic_read(&vnode->volume->cb_v_break);
    85			afs_clear_permits(vnode);
    86	
    87			if (vnode->lock_state == AFS_VNODE_LOCK_WAITING_FOR_CB)
    88				afs_lock_may_be_available(vnode);
    89	
    90			if (reason != afs_cb_break_for_deleted &&
    91			    vnode->status.type == AFS_FTYPE_FILE &&
    92			    atomic_read(&vnode->cb_nr_mmap))
    93				queue_work(system_unbound_wq, &vnode->cb_work);
    94	
    95			trace_afs_cb_break(&vnode->fid, vnode->cb_break, reason, true);
    96		} else {
    97			trace_afs_cb_break(&vnode->fid, vnode->cb_break, reason, false);
    98		}
    99	}
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
