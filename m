Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183974F21B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 21:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707169547; cv=none; b=EW/ivNUmb0MMhpUO0xeUQ7dp2Xpzpd5qi9Pmdtuhv7TnVFyq/hdBuybFNHd2MqPA1H+x5j+OHORAzIfmtp0oYCbvD943geEnYAiPQArhatdgdcJjGTmRRmRZpxFC6ccRlfJyQG3V8DBMv4DWlgS+780HYJg4w7xDf+hglC5baU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707169547; c=relaxed/simple;
	bh=fN/HKQscSNDQ4igk9DbTibMISjMMDfxqiFL5hen61es=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e3JOcmPYCbIt2FVFZx1YohMDbAjw99ndLiuuSseWHabPdR/oOtZkPj9+mZumLa4TBSaTA5v6EyfaJq52yvVRvGAvP1Wan0r+TM43slX0KKhyaM8EESXIYWsFYSGqqVXmBMpW0a2zyuHJ/7FFRe7a/0JIKyo8bvf4Vq706Hui3k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJlp5Tdt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJlp5Tdt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707169546; x=1738705546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fN/HKQscSNDQ4igk9DbTibMISjMMDfxqiFL5hen61es=;
  b=CJlp5TdtfT7pU+tFVWep/x8Z2fRgwIOmfRqPD9v/rbwxogHUVJFS6ED3
   8eZjPKAtPLTig4mV8Jw2WSFQ0hLvBiqSZ+osn2KgDuLNylgQGxdZ/5mmo
   Um3XRerptPHlSlLL6TC3yX5vsxtuxJXlyBUE+HTfIuSUM71zLkr5ezQT2
   HoDJbGDcpR8rg+OQ2L3hOyjJknMUfRmi4QxUi6DP9FfN7GtGn7MBtAfiJ
   86ObvqXVDAOKcxq88mCEvVvIEokselbIsPWiCV78dzfwKmSYC9QUQx0Yg
   GdPsWgYv2eN4o4CZ9ijA2HWh+mZFEXRKU+TkgJr/eAdw7bEBXv07tzWVo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="770158"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="770158"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 13:45:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="885407"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Feb 2024 13:45:42 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX6ma-0000pc-0a;
	Mon, 05 Feb 2024 21:45:40 +0000
Date: Tue, 6 Feb 2024 05:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Brauner <brauner@kernel.org>, NeilBrown <neilb@suse.de>
Subject: [linux-next:master 3181/4021] fs/smb/client/file.c:1584:9: error:
 implicit declaration of function 'for_each_file_lock'; did you mean
 'for_each_node_mask'?
Message-ID: <202402060506.76gqE6ri-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   23e11d0318521e8693459b0e4d23aec614b3b68b
commit: 39647541cb269fded1345c1e522f829e144f5af8 [3181/4021] smb/client: convert to using new filelock helpers
config: mips-randconfig-r012-20230715 (https://download.01.org/0day-ci/archive/20240206/202402060506.76gqE6ri-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402060506.76gqE6ri-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402060506.76gqE6ri-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/smb/client/file.c: In function 'cifs_posix_lock_test':
   fs/smb/client/file.c:1412:13: error: implicit declaration of function 'lock_is_unlock'; did you mean 'lock_pin_lock'? [-Werror=implicit-function-declaration]
    1412 |         if (lock_is_unlock(flock) && !cinode->can_cache_brlcks) {
         |             ^~~~~~~~~~~~~~
         |             lock_pin_lock
   fs/smb/client/file.c: In function 'cifs_push_posix_locks':
>> fs/smb/client/file.c:1584:9: error: implicit declaration of function 'for_each_file_lock'; did you mean 'for_each_node_mask'? [-Werror=implicit-function-declaration]
    1584 |         for_each_file_lock(flock, &flctx->flc_posix) {
         |         ^~~~~~~~~~~~~~~~~~
         |         for_each_node_mask
>> fs/smb/client/file.c:1584:53: error: expected ';' before '{' token
    1584 |         for_each_file_lock(flock, &flctx->flc_posix) {
         |                                                     ^~
         |                                                     ;
>> fs/smb/client/file.c:1553:15: warning: unused variable 'length' [-Wunused-variable]
    1553 |         __u64 length;
         |               ^~~~~~
>> fs/smb/client/file.c:1550:26: warning: unused variable 'type' [-Wunused-variable]
    1550 |         int rc = 0, xid, type;
         |                          ^~~~
   fs/smb/client/file.c: In function 'cifs_read_flock':
   fs/smb/client/file.c:1684:13: error: implicit declaration of function 'lock_is_write'; did you mean 'op_is_write'? [-Werror=implicit-function-declaration]
    1684 |         if (lock_is_write(flock)) {
         |             ^~~~~~~~~~~~~
         |             op_is_write
   fs/smb/client/file.c:1693:20: error: implicit declaration of function 'lock_is_read'; did you mean 'lock_is_held'? [-Werror=implicit-function-declaration]
    1693 |         } else if (lock_is_read(flock)) {
         |                    ^~~~~~~~~~~~
         |                    lock_is_held
   cc1: some warnings being treated as errors


vim +1584 fs/smb/client/file.c

  1540	
  1541	#ifdef CONFIG_CIFS_ALLOW_INSECURE_LEGACY
  1542	static int
  1543	cifs_push_posix_locks(struct cifsFileInfo *cfile)
  1544	{
  1545		struct inode *inode = d_inode(cfile->dentry);
  1546		struct cifs_tcon *tcon = tlink_tcon(cfile->tlink);
  1547		struct file_lock *flock;
  1548		struct file_lock_context *flctx = locks_inode_context(inode);
  1549		unsigned int count = 0, i;
> 1550		int rc = 0, xid, type;
  1551		struct list_head locks_to_send, *el;
  1552		struct lock_to_push *lck, *tmp;
> 1553		__u64 length;
  1554	
  1555		xid = get_xid();
  1556	
  1557		if (!flctx)
  1558			goto out;
  1559	
  1560		spin_lock(&flctx->flc_lock);
  1561		list_for_each(el, &flctx->flc_posix) {
  1562			count++;
  1563		}
  1564		spin_unlock(&flctx->flc_lock);
  1565	
  1566		INIT_LIST_HEAD(&locks_to_send);
  1567	
  1568		/*
  1569		 * Allocating count locks is enough because no FL_POSIX locks can be
  1570		 * added to the list while we are holding cinode->lock_sem that
  1571		 * protects locking operations of this inode.
  1572		 */
  1573		for (i = 0; i < count; i++) {
  1574			lck = kmalloc(sizeof(struct lock_to_push), GFP_KERNEL);
  1575			if (!lck) {
  1576				rc = -ENOMEM;
  1577				goto err_out;
  1578			}
  1579			list_add_tail(&lck->llist, &locks_to_send);
  1580		}
  1581	
  1582		el = locks_to_send.next;
  1583		spin_lock(&flctx->flc_lock);
> 1584		for_each_file_lock(flock, &flctx->flc_posix) {
  1585			if (el == &locks_to_send) {
  1586				/*
  1587				 * The list ended. We don't have enough allocated
  1588				 * structures - something is really wrong.
  1589				 */
  1590				cifs_dbg(VFS, "Can't push all brlocks!\n");
  1591				break;
  1592			}
  1593			length = cifs_flock_len(flock);
  1594			if (lock_is_read(flock) || flock->fl_type == F_SHLCK)
  1595				type = CIFS_RDLCK;
  1596			else
  1597				type = CIFS_WRLCK;
  1598			lck = list_entry(el, struct lock_to_push, llist);
  1599			lck->pid = hash_lockowner(flock->fl_owner);
  1600			lck->netfid = cfile->fid.netfid;
  1601			lck->length = length;
  1602			lck->type = type;
  1603			lck->offset = flock->fl_start;
  1604		}
  1605		spin_unlock(&flctx->flc_lock);
  1606	
  1607		list_for_each_entry_safe(lck, tmp, &locks_to_send, llist) {
  1608			int stored_rc;
  1609	
  1610			stored_rc = CIFSSMBPosixLock(xid, tcon, lck->netfid, lck->pid,
  1611						     lck->offset, lck->length, NULL,
  1612						     lck->type, 0);
  1613			if (stored_rc)
  1614				rc = stored_rc;
  1615			list_del(&lck->llist);
  1616			kfree(lck);
  1617		}
  1618	
  1619	out:
  1620		free_xid(xid);
  1621		return rc;
  1622	err_out:
  1623		list_for_each_entry_safe(lck, tmp, &locks_to_send, llist) {
  1624			list_del(&lck->llist);
  1625			kfree(lck);
  1626		}
  1627		goto out;
  1628	}
  1629	#endif /* CONFIG_CIFS_ALLOW_INSECURE_LEGACY */
  1630	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
