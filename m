Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E332921CC5C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739800965; cv=none; b=QyfGrXgLDDkhK6Ocu7XlEn4U/oA5w0JKVlxyIi1tK1yV0dfV41RiuBvjs95oIBt+7xyXWsv0fgugp8ve270EqgOg0H7GzeQtcMKzy6Ij7KW5hA+PTf7Ia/+KIss24a5Zzgs6xGs7ZYwdr45jBFXt56nIpmFhFQk6HaGIUNdgOzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739800965; c=relaxed/simple;
	bh=+YrVjTHwhB5jmpMuN8kBvT4evacZG7CeXEzHBVWrHfI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GqS7ZjaSpZ1wmNg5b08AQBTRLfubsTq2ct28vjDXwWm5MOeH8doSqdUE/SkaRzojE3L/W9/1ByEmh3Ridyj671Tb8iYeRhs3gJClD6Qcdg82xDJWZ6TxqlDMFJ4wO3DW8UChBA3K4EvBM124z8RsSsSgdVFPToFDModeqDx4WDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A1OedfgI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A1OedfgI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739800964; x=1771336964;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+YrVjTHwhB5jmpMuN8kBvT4evacZG7CeXEzHBVWrHfI=;
  b=A1OedfgIFWZ6jtUfLw0a9qlMmPuwMFbXosAdmITPvJ/pYgcPhDc6OuFX
   6J+wkm03QO0QNREBWBaVn1/1AOKPHYYPVTBR3W+IEyNRr23x/6iRZ6ASd
   tcz9cVQFXHT/IHnRuwNxzIl5P6gvr15CiMaKeqNuXzMdpUtEIOFhWoz9b
   2To2cWjkG1wP4sEUI8+/DXYTY/arCV+u6gdWY8BmRencxYJTuX0aXB2Y9
   oM7L3Li0qmflj9otZK2CywrIoFMzoE/CcManj6A5pT+BotUPzC4qOL96G
   OvT6hxfVDDITkTrcpJZ0ouDRD2dHiPuTtjAffaY86FILAyhD4BjUVXbPb
   g==;
X-CSE-ConnectionGUID: BWoB6ExJRmOIKwkhXKOxYQ==
X-CSE-MsgGUID: jpVeXjS7Tw2M2PHAcT13OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44410938"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="44410938"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 06:02:43 -0800
X-CSE-ConnectionGUID: w2bqPZIVT/adRHLfr0qzvQ==
X-CSE-MsgGUID: BaK7iKzBSfClt4ExjH4sgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145044268"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Feb 2025 06:02:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk1ho-001DBT-1T
	for oe-kbuild-all@lists.linux.dev;
	Mon, 17 Feb 2025 14:02:40 +0000
Date: Mon, 17 Feb 2025 22:01:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] security/safesetid/lsm.c:213:5: warning: no
 previous prototype for 'add_safesetid_whitelist_entry'
Message-ID: <202502172157.Wnir0VaC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: aeca4e2ca65c1aeacfbe520684e6421719d99417 [1/1] LSM: add SafeSetID module that gates setid calls
config: nios2-randconfig-001-20250217 (https://download.01.org/0day-ci/archive/20250217/202502172157.Wnir0VaC-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502172157.Wnir0VaC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502172157.Wnir0VaC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/safesetid/lsm.c:213:5: warning: no previous prototype for 'add_safesetid_whitelist_entry' [-Wmissing-prototypes]
     213 | int add_safesetid_whitelist_entry(kuid_t parent, kuid_t child)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> security/safesetid/lsm.c:234:6: warning: no previous prototype for 'flush_safesetid_whitelist_entries' [-Wmissing-prototypes]
     234 | void flush_safesetid_whitelist_entries(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
