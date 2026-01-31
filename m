Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADD63542C6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 13:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769867481; cv=none; b=LeFPZ+YEBPXbMmOd4edJ3p6GvgrqeVrwJtpjrBbgxtyw9/B3tAxa1diN9hHTY6cyRPJhqqbH6p+aTz7gHQIoBhMVdjqhL+Ga/2X3Ssr8yaLdgvnYRj7Al/IKt//CfipuwiTIRLQ456nfgksv9D4FdXVA0rGliQ+0HOWb8uUR/P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769867481; c=relaxed/simple;
	bh=K17SkNjEUfUVyw893pxmFeFXEZSVqj7rYZtzrb/lL+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TnFTn9RbHrm5KnCIskI+I/l7JedCCp8ZkCNNKzUPeU+hEWTqz4toTkc2hNmo0SGqEt5XlbloGh6bOfVL3kNGywje0u2j7WbSNvng5XRXc8Pu5w+GQRzA/BK+WXZCSqJeYFdL5F98OpRjptNF38RV+7Mtl8jLOdWbe0CVB+oazdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DG7XndY2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DG7XndY2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769867478; x=1801403478;
  h=date:from:to:cc:subject:message-id;
  bh=K17SkNjEUfUVyw893pxmFeFXEZSVqj7rYZtzrb/lL+M=;
  b=DG7XndY2fkXwcuct48au/Z4b44tKMf9n4CNou7lKAQ7DjqINjgPwSZuI
   uGW2rPXaeo36rnRERA8ZxZ+ZUOwRtn1VC7UevykX3jMdcztO2k7uJW0n9
   BzX1Z1krcJ2/dI6BZ/3TXWTTnoJI8ws4n9aAu8eyvnfR18nD/0xJH3/ne
   z4Ft/562rxRgB4ZSuOq6OlQ2Ts/SmhB2JJk3cQtv9L/+/nxn1rYIt+gvB
   bwhxXz3CifM2O0ueF7N1ha7QCP776Ovm4AITwdgjCL81SaW+Y7OhMIWwM
   9v9EM8vG+/ZR8UgLaXDwClvgGoPwxyUl0Nvtn4GA3vKv7HyrNsLA6TO7q
   g==;
X-CSE-ConnectionGUID: +ZS13ltrQbi3ePlF03rmEQ==
X-CSE-MsgGUID: 4y+GRwNURL6K5v9xHDKuLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71181647"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="71181647"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 05:51:17 -0800
X-CSE-ConnectionGUID: B8w/jXj8Rz+Ta/oK3m4Irg==
X-CSE-MsgGUID: GDjq2avmSEqSKN6lYj0B2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="246695579"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 31 Jan 2026 05:51:15 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmBNZ-000000002hp-2UWK;
	Sat, 31 Jan 2026 13:51:13 +0000
Date: Sat, 31 Jan 2026 14:50:44 +0100
From: kernel test robot <lkp@intel.com>
To: Shyam Prasad N <sprasad@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: fs/smb/client/cached_dir.c:795:36: error: 'tcon' undeclared
Message-ID: <202601311413.O7Orgujx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/nspmangalore-gmail-com/cifs-Fix-locking-usage-for-tcon-fields/20260131-160419
head:   68dd5747a63ed7eff74e8ecaaf352a73943479c6
commit: 68dd5747a63ed7eff74e8ecaaf352a73943479c6 cifs: Fix locking usage for tcon fields
date:   6 hours ago
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260131/202601311413.O7Orgujx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311413.O7Orgujx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311413.O7Orgujx-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/client/cached_dir.c: In function 'cfids_laundromat_worker':
>> fs/smb/client/cached_dir.c:795:36: error: 'tcon' undeclared (first use in this function)
     795 |                         spin_lock(&tcon->tc_lock);
         |                                    ^~~~
   fs/smb/client/cached_dir.c:795:36: note: each undeclared identifier is reported only once for each function it appears in
--
   fs/smb/client/smb2ops.c: In function 'smb2_get_dfs_refer':
>> fs/smb/client/smb2ops.c:3178:17: error: too few arguments to function 'cifs_put_tcon'
    3178 |                 cifs_put_tcon(tcon);
         |                 ^~~~~~~~~~~~~
   In file included from fs/smb/client/smb2ops.c:20:
   fs/smb/client/cifsproto.h:273:6: note: declared here
     273 | void cifs_put_tcon(struct cifs_tcon *tcon, enum smb3_tcon_ref_trace trace);
         |      ^~~~~~~~~~~~~


vim +/tcon +795 fs/smb/client/cached_dir.c

   757	
   758	static void cfids_laundromat_worker(struct work_struct *work)
   759	{
   760		struct cached_fids *cfids;
   761		struct cached_fid *cfid, *q;
   762		LIST_HEAD(entry);
   763	
   764		cfids = container_of(work, struct cached_fids, laundromat_work.work);
   765	
   766		spin_lock(&cfids->cfid_list_lock);
   767		/* move cfids->dying to the local list */
   768		list_cut_before(&entry, &cfids->dying, &cfids->dying);
   769	
   770		list_for_each_entry_safe(cfid, q, &cfids->entries, entry) {
   771			if (cfid->last_access_time &&
   772			    time_after(jiffies, cfid->last_access_time + HZ * dir_cache_timeout)) {
   773				cfid->on_list = false;
   774				list_move(&cfid->entry, &entry);
   775				cfids->num_entries--;
   776				if (cfid->has_lease) {
   777					/*
   778					 * Our lease has not yet been cancelled from the
   779					 * server. Steal that reference.
   780					 */
   781					cfid->has_lease = false;
   782				} else
   783					kref_get(&cfid->refcount);
   784			}
   785		}
   786		spin_unlock(&cfids->cfid_list_lock);
   787	
   788		list_for_each_entry_safe(cfid, q, &entry, entry) {
   789			list_del(&cfid->entry);
   790	
   791			dput(cfid->dentry);
   792			cfid->dentry = NULL;
   793	
   794			if (cfid->is_open) {
 > 795				spin_lock(&tcon->tc_lock);
   796				++cfid->tcon->tc_count;
   797				trace_smb3_tcon_ref(cfid->tcon->debug_id, cfid->tcon->tc_count,
   798						    netfs_trace_tcon_ref_get_cached_laundromat);
   799				spin_unlock(&tcon->tc_lock);
   800				queue_work(serverclose_wq, &cfid->close_work);
   801			} else
   802				/*
   803				 * Drop the ref-count from above, either the lease-ref (if there
   804				 * was one) or the extra one acquired.
   805				 */
   806				close_cached_dir(cfid);
   807		}
   808		queue_delayed_work(cfid_put_wq, &cfids->laundromat_work,
   809				   dir_cache_timeout * HZ);
   810	}
   811	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
