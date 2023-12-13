Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D3485374
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 16:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWqoWZm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702483257; x=1734019257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0HPRM5Sc0CDScjCnD0QXiFAx3gQDmVn67v3fS72Amu4=;
  b=PWqoWZm916VBl/MOX7b3fH034AjQkyvE+zp9XdKPCHvfFaRU7AnlGdqA
   YVei3RBC3ucIMI1TCaQCpZNPDbi05u3Wn5ucEgsvtFbB2fT505nAjVpcE
   sClGarAJ4YWMZ5QENxJqTxXboydH/MFr2+9DDvb/6CsPCUzqSkRN/o5PN
   jRlsLtkI5vOn+tlz9hzUFO6WOGn4YgO3XZoh4U9bfGG5ZNeeQbLFB9X1e
   NQ1RrpzileJiZKbdIYPmVBza8qolQNHBb7jm95JV18l8485c/ls6OcEtn
   hze58WIAHN4L3zf4kULv21o1vq3l4soQZGZve29UUyS6f4mZj/jSWId2s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="392159922"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="392159922"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 08:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="802923295"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="802923295"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Dec 2023 08:00:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDRet-000Kle-1w;
	Wed, 13 Dec 2023 16:00:27 +0000
Date: Wed, 13 Dec 2023 23:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-next 40/43] fs/afs/rotate.c:62:21: sparse: sparse:
 cast truncates bits from constant value (8000000000000000 becomes 0)
Message-ID: <202312132317.yw4CsbDs-lkp@intel.com>
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
config: parisc-randconfig-r122-20231213 (https://download.01.org/0day-ci/archive/20231213/202312132317.yw4CsbDs-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312132317.yw4CsbDs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312132317.yw4CsbDs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/afs/rotate.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
>> fs/afs/rotate.c:62:21: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)

vim +62 fs/afs/rotate.c

    17	
    18	/*
    19	 * Begin iteration through a server list, starting with the vnode's last used
    20	 * server if possible, or the last recorded good server if not.
    21	 */
    22	static bool afs_start_fs_iteration(struct afs_operation *op,
    23					   struct afs_vnode *vnode)
    24	{
    25		struct afs_server *server;
    26		void *cb_server;
    27		int i;
    28	
    29		read_lock(&op->volume->servers_lock);
    30		op->server_list = afs_get_serverlist(
    31			rcu_dereference_protected(op->volume->servers,
    32						  lockdep_is_held(&op->volume->servers_lock)));
    33		read_unlock(&op->volume->servers_lock);
    34	
    35		op->untried_servers = (1UL << op->server_list->nr_servers) - 1;
    36		op->server_index = READ_ONCE(op->server_list->preferred);
    37	
    38		cb_server = vnode->cb_server;
    39		if (cb_server) {
    40			/* See if the vnode's preferred record is still available */
    41			for (i = 0; i < op->server_list->nr_servers; i++) {
    42				server = op->server_list->servers[i].server;
    43				if (server == cb_server) {
    44					op->server_index = i;
    45					goto found_interest;
    46				}
    47			}
    48	
    49			/* If we have a lock outstanding on a server that's no longer
    50			 * serving this vnode, then we can't switch to another server
    51			 * and have to return an error.
    52			 */
    53			if (op->flags & AFS_OPERATION_CUR_ONLY) {
    54				afs_op_set_error(op, -ESTALE);
    55				return false;
    56			}
    57	
    58			/* Note that the callback promise is effectively broken */
    59			write_seqlock(&vnode->cb_lock);
    60			ASSERTCMP(cb_server, ==, vnode->cb_server);
    61			vnode->cb_server = NULL;
  > 62			if (xchg(&vnode->cb_expires_at, AFS_NO_CB_PROMISE) != AFS_NO_CB_PROMISE)
    63				vnode->cb_break++;
    64			write_sequnlock(&vnode->cb_lock);
    65		}
    66	
    67	found_interest:
    68		return true;
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
