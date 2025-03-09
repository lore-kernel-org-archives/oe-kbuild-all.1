Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68BF19BBC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 07:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741506148; cv=none; b=bhhdhaMAHbf3PjEBsnNobheK2oOwIPFUKuomf0Ho/0bhgPATmMk8BJyYjY3Tm68OPE1+WhhUlRKhYy4LBcngkAqAOI6wX7zVFYpU6HcTUQk050qfxYi9c4X0fIoHTpr0uOvdZN3sWziT57HHndItvdyfjeTZtpmIzA/RV7dRoLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741506148; c=relaxed/simple;
	bh=RE7lPsZzR/eOzNpRYQWpzd4nNHiiOIPFgDoM5fx8/7k=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fvqUQSRlHdaRIATlrtoE+qXIIpqzSqOUJeLCmsuTM3iLg2OBhp2Duy+CS88vHQVuApD7f0/1n/iU8hz7aUhvLi4Znnp1dTtHt31TChu8BmoBPpWsg46wjtiQdZItQgFjGUZvi21V3FwDKJltKoZYPIbV5QFCCy9UzYyjPoE2Nv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHiq/qw8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHiq/qw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741506147; x=1773042147;
  h=date:from:cc:subject:message-id:mime-version;
  bh=RE7lPsZzR/eOzNpRYQWpzd4nNHiiOIPFgDoM5fx8/7k=;
  b=hHiq/qw8Q6TNFr5XqduI0lx2e8trxn8xpZmOUiHL1R2r3Uts27kdB9dF
   ksxnbG0k4yL9RtV4q/B6BujWi11+WKKvV1N9E1metsh9exGQBsdM3Pz5p
   adn+JYFjE8elh5Pao3TotwWzD2mmZSkGw//ND3YYCaRYtvVNUTvQEvqwN
   bEgk6Z81gN6Jg6ZLB/JblT+X+j+msnEGtzdDoKijVhwUBo6CGrIMXNqMk
   hBbUalTGyqyy8h/8aTvslNGh9r6litP9iX8of4NDryETDOBZ8SMGkJg1r
   j30GkPHqhYd4bck1Arg/3sjr8pgv9hA3FyW1hSRGMbZ/UUDifI/9llde7
   A==;
X-CSE-ConnectionGUID: 2VU/ch+BR1m7Hrb59xx5CA==
X-CSE-MsgGUID: ZGE9Z19qQ4+pxlms2mXX5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="46294425"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="46294425"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 23:42:26 -0800
X-CSE-ConnectionGUID: 5z1sa5F1R76lgNihNYb7IQ==
X-CSE-MsgGUID: Fkf8/ZVCTfyChEnNveOjiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123894551"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 08 Mar 2025 23:42:25 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trBIl-0002oP-0q
	for oe-kbuild-all@lists.linux.dev;
	Sun, 09 Mar 2025 07:42:23 +0000
Date: Sun, 9 Mar 2025 15:41:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] security/safesetid/lsm.c:213:5: warning: no
 previous prototype for function 'add_safesetid_whitelist_entry'
Message-ID: <202503091510.Rj1oRsX1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Micah,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: aeca4e2ca65c1aeacfbe520684e6421719d99417 [1/1] LSM: add SafeSetID module that gates setid calls
config: x86_64-buildonly-randconfig-006-20250217 (https://download.01.org/0day-ci/archive/20250309/202503091510.Rj1oRsX1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091510.Rj1oRsX1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091510.Rj1oRsX1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/safesetid/lsm.c:213:5: warning: no previous prototype for function 'add_safesetid_whitelist_entry' [-Wmissing-prototypes]
     213 | int add_safesetid_whitelist_entry(kuid_t parent, kuid_t child)
         |     ^
   security/safesetid/lsm.c:213:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     213 | int add_safesetid_whitelist_entry(kuid_t parent, kuid_t child)
         | ^
         | static 
>> security/safesetid/lsm.c:234:6: warning: no previous prototype for function 'flush_safesetid_whitelist_entries' [-Wmissing-prototypes]
     234 | void flush_safesetid_whitelist_entries(void)
         |      ^
   security/safesetid/lsm.c:234:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     234 | void flush_safesetid_whitelist_entries(void)
         | ^
         | static 
   2 warnings generated.


vim +/add_safesetid_whitelist_entry +213 security/safesetid/lsm.c

   212	
 > 213	int add_safesetid_whitelist_entry(kuid_t parent, kuid_t child)
   214	{
   215		struct entry *new;
   216	
   217		/* Return if entry already exists */
   218		if (check_setuid_policy_hashtable_key_value(parent, child))
   219			return 0;
   220	
   221		new = kzalloc(sizeof(struct entry), GFP_KERNEL);
   222		if (!new)
   223			return -ENOMEM;
   224		new->parent_kuid = __kuid_val(parent);
   225		new->child_kuid = __kuid_val(child);
   226		spin_lock(&safesetid_whitelist_hashtable_spinlock);
   227		hash_add_rcu(safesetid_whitelist_hashtable,
   228			     &new->next,
   229			     __kuid_val(parent));
   230		spin_unlock(&safesetid_whitelist_hashtable_spinlock);
   231		return 0;
   232	}
   233	
 > 234	void flush_safesetid_whitelist_entries(void)
   235	{
   236		struct entry *entry;
   237		struct hlist_node *hlist_node;
   238		unsigned int bkt_loop_cursor;
   239		HLIST_HEAD(free_list);
   240	
   241		/*
   242		 * Could probably use hash_for_each_rcu here instead, but this should
   243		 * be fine as well.
   244		 */
   245		spin_lock(&safesetid_whitelist_hashtable_spinlock);
   246		hash_for_each_safe(safesetid_whitelist_hashtable, bkt_loop_cursor,
   247				   hlist_node, entry, next) {
   248			hash_del_rcu(&entry->next);
   249			hlist_add_head(&entry->dlist, &free_list);
   250		}
   251		spin_unlock(&safesetid_whitelist_hashtable_spinlock);
   252		synchronize_rcu();
   253		hlist_for_each_entry_safe(entry, hlist_node, &free_list, dlist) {
   254			hlist_del(&entry->dlist);
   255			kfree(entry);
   256		}
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
