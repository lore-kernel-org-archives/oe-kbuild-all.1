Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792801254;
	b=FVyxa/oJ6T22xtEbwWYtvio54szGUhfN9MNpcbiOEJLKJJAA5QhYEr5RqOG74yzwGj3W
	 xeT1GI4SXeLVj0zBEZZAX/IJHvurYVSLWQ1FebPpu1O4+0KCGSISh4TYNogbwoSXazP0O
	 Q6JkafxDj70F2j2sLfuVFhcNDb62jxHUxhwsZyWn4HHLKX/gZ0my6ISdlyTmzRgUjDbQ5
	 m15SuB2irFDWc3V1nD+BueoRYCZfC2dtlbaHlxRauglcbFHGVBjjzqD02FV40C89Ralkc
	 4PRoTUK5NJg73fwKow1VVwrvP2SmVo7J6uNO+kEUI4XvTzTxwqX/PwlMUJYVv4oJcWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792801254;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=17nM5O68eKtmqdbd3XC2ws9UOxWuocS2TqjlT4WbeMU=;
	b=ez91PPATk20ElMX6HwhF5bd3t9GRmWPy90Cu8d+ISDHPyahihNRd1i0RiB3rOCXJ50iC
	 aEvW3QcLz+kjuSfFM8LkZOsP3OQgCM5TmQ8+SjmRtKn3EWiyIhYzid6mJkClQaLe+RzR5
	 WzEMCFC3tgH/fme2tyWOeyPdS2I3SO+SGqYwNeDSEjf0ngMO+ocSqBwO6ithdAFdUP7mT
	 pGa2xKK+8DNuH9YkDdHxtajlDJib0xZ1zZm/DIZ+UV4JL1/LsDsWy3TyGgaZnKakNSeXp
	 kpmp+JIVO/KE7CvyJht0poh6OIcVA+Hd1/HY5dnit4L8N2sbbXn8fKrZcDafi2rl25Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=as739X0C;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA31D606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 00:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA31D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=as739X0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792801252; x=1824337252;
  h=date:from:to:cc:subject:message-id;
  bh=HNOY/ygLlre1BFPpQfEYOccSZG4wSqzdC+QP9vBkZIg=;
  b=as739X0Ck+Hhf86CjKbSWP30VOQim6gpcCtQeyBef/KZ1TRONl7a6IaX
   ERhYqgrwJpo1v1MiF/S3XpCW8UH1ug8pSV4CGa1U1zB9wVrBdQ15Vh+lh
   OijG/VLM1KrpN5E6RkuY4MXr96RTRZi/G1c65aXiU/PwjOITYytXIqpKw
   7mh1b3lZ4Vf2F4IMn3ffayqVg1BmtI4CnnMgYBWA9MXoKVzgtVltQMnrq
   Xj8Sqykfw0WQovUm9ajupj6aC4GCDbyL+JEL+AhVMANWiTGYTe1b3BH3b
   InqLnnpgia69Bkc6iBv7hEgR7sFmDhJYDBapr5bDyzhEuRWDybahuOXfJ
   A==;
X-CSE-ConnectionGUID: /9bXFUJ3QjK/u1bkZa5LSQ==
X-CSE-MsgGUID: 8kl+DuCpRpa5Be8JesNWHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1439527"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1439527"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 17:20:51 -0700
X-CSE-ConnectionGUID: PU7Y4pflSw2YoOFjaEwhWQ==
X-CSE-MsgGUID: JgW+/TJGR+KJOutEydgZow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3836101"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 23 Oct 2026 17:20:50 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKPV9-000000002nv-0pQH;
	Sat, 24 Oct 2026 00:20:47 +0000
Date: Sat, 24 Oct 2026 02:19:54 +0200
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 83/98] fs/rpdfs/ehtable.c:259:2:
 warning: variable 'del' is used uninitialized whenever 'for' loop exits
 because its condition is false
Message-ID: <202610240228.NDsWRPuI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   8a293e5c1bf0416f4d4e116bf8693c00dbe876da
commit: 2658c3c902752b51b9bebb9bb36cf7dcde32d28d [83/98] rpdfs: add meta code for caching metadata
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20261024/202610240228.NDsWRPuI-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610240228.NDsWRPuI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610240228.NDsWRPuI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:372:9: note: previous definition is here
     372 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from fs/rpdfs/ehtable.c:9:
   fs/rpdfs/meta.h:8:43: warning: declaration of 'struct rpdfs_iget_data' will not be visible outside of this function [-Wvisibility]
       8 | int rpdfs_folio_loc_from_block_key(struct rpdfs_iget_data *igd, pgoff_t *index,
         |                                           ^
>> fs/rpdfs/ehtable.c:259:2: warning: variable 'del' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
     259 |         for_each_entry(ehb, iargs->hash, ent, pl) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/rpdfs/ehtable.c:148:2: note: expanded from macro 'for_each_entry'
     148 |         __for_each_entry(ehb, base_entry(ehb, hash), ent, pl)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/rpdfs/ehtable.c:144:7: note: expanded from macro '__for_each_entry'
     144 |              (ent = &ehb->entries[(ent - ehb->entries) & RPDFS_EHTABLE_ENTRIES_MASK]); \
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/rpdfs/ehtable.c:275:31: note: uninitialized use occurs here
     275 |         for_each_entry_continue(ehb, del, ent, pl) {
         |                                      ^~~
   fs/rpdfs/ehtable.c:259:2: note: remove the condition if it is always true
     259 |         for_each_entry(ehb, iargs->hash, ent, pl) {
         |         ^
   fs/rpdfs/ehtable.c:148:2: note: expanded from macro 'for_each_entry'
     148 |         __for_each_entry(ehb, base_entry(ehb, hash), ent, pl)
         |         ^
   fs/rpdfs/ehtable.c:144:7: note: expanded from macro '__for_each_entry'
     144 |              (ent = &ehb->entries[(ent - ehb->entries) & RPDFS_EHTABLE_ENTRIES_MASK]); \
         |              ^
   fs/rpdfs/ehtable.c:254:33: note: initialize the variable 'del' to silence this warning
     254 |         struct rpdfs_ehtable_entry *del;
         |                                        ^
         |                                         = NULL
   3 warnings generated.


vim +259 fs/rpdfs/ehtable.c

bc6c59466912ed0 Zach Brown 2026-07-09  243  
bc6c59466912ed0 Zach Brown 2026-07-09  244  /*
bc6c59466912ed0 Zach Brown 2026-07-09  245   * Find and delete an entry that matches the key.  Returns errors if no
bc6c59466912ed0 Zach Brown 2026-07-09  246   * key was found or gives the caller the offset of the item whose entry
bc6c59466912ed0 Zach Brown 2026-07-09  247   * was removed.
bc6c59466912ed0 Zach Brown 2026-07-09  248   */
bc6c59466912ed0 Zach Brown 2026-07-09  249  static int delete_entry(struct rpdfs_ehtable_block *ehb, struct rpdfs_ehtable_item_args *iargs,
bc6c59466912ed0 Zach Brown 2026-07-09  250  			u16 *offset)
bc6c59466912ed0 Zach Brown 2026-07-09  251  {
bc6c59466912ed0 Zach Brown 2026-07-09  252  	struct rpdfs_ehtable_item *item;
bc6c59466912ed0 Zach Brown 2026-07-09  253  	struct rpdfs_ehtable_entry *ent;
bc6c59466912ed0 Zach Brown 2026-07-09  254  	struct rpdfs_ehtable_entry *del;
bc6c59466912ed0 Zach Brown 2026-07-09  255  	u8 pl;
bc6c59466912ed0 Zach Brown 2026-07-09  256  	int ret;
bc6c59466912ed0 Zach Brown 2026-07-09  257  
bc6c59466912ed0 Zach Brown 2026-07-09  258  	/* search for the entry to delete, setting offset */
bc6c59466912ed0 Zach Brown 2026-07-09 @259  	for_each_entry(ehb, iargs->hash, ent, pl) {
bc6c59466912ed0 Zach Brown 2026-07-09  260  		if (ent_is_empty(ent) || pl > ent->probe_len) {
bc6c59466912ed0 Zach Brown 2026-07-09  261  			ret = -ENOENT;
bc6c59466912ed0 Zach Brown 2026-07-09  262  			goto out;
bc6c59466912ed0 Zach Brown 2026-07-09  263  		}
bc6c59466912ed0 Zach Brown 2026-07-09  264  
bc6c59466912ed0 Zach Brown 2026-07-09  265  		item = ent_item(ehb, ent);
bc6c59466912ed0 Zach Brown 2026-07-09  266  		if (keys_match(le32_to_cpu(ent->hash), item_key(item), get_key_size(item),
bc6c59466912ed0 Zach Brown 2026-07-09  267  			       iargs->hash, iargs->key, iargs->key_size)) {
bc6c59466912ed0 Zach Brown 2026-07-09  268  			*offset = le16_to_cpu(ent->offset);
bc6c59466912ed0 Zach Brown 2026-07-09  269  			del = ent;
bc6c59466912ed0 Zach Brown 2026-07-09  270  			break;
bc6c59466912ed0 Zach Brown 2026-07-09  271  		}
bc6c59466912ed0 Zach Brown 2026-07-09  272  	}
bc6c59466912ed0 Zach Brown 2026-07-09  273  
bc6c59466912ed0 Zach Brown 2026-07-09  274  	/* move later entries with nonzero probe length back to fill the gap, finally clearing */
bc6c59466912ed0 Zach Brown 2026-07-09  275  	for_each_entry_continue(ehb, del, ent, pl) {
bc6c59466912ed0 Zach Brown 2026-07-09  276  		if (ent_is_empty(ent) || ent->probe_len == 0) {
bc6c59466912ed0 Zach Brown 2026-07-09  277  			memset(del, 0, sizeof(struct rpdfs_ehtable_entry));
bc6c59466912ed0 Zach Brown 2026-07-09  278  			break;
bc6c59466912ed0 Zach Brown 2026-07-09  279  		}
bc6c59466912ed0 Zach Brown 2026-07-09  280  
bc6c59466912ed0 Zach Brown 2026-07-09  281  		*del = *ent;
bc6c59466912ed0 Zach Brown 2026-07-09  282  		del->probe_len--;
bc6c59466912ed0 Zach Brown 2026-07-09  283  		del = ent;
bc6c59466912ed0 Zach Brown 2026-07-09  284  	}
bc6c59466912ed0 Zach Brown 2026-07-09  285  
bc6c59466912ed0 Zach Brown 2026-07-09  286  	ret = 0;
bc6c59466912ed0 Zach Brown 2026-07-09  287  out:
bc6c59466912ed0 Zach Brown 2026-07-09  288  	return ret;
bc6c59466912ed0 Zach Brown 2026-07-09  289  }
bc6c59466912ed0 Zach Brown 2026-07-09  290  

:::::: The code at line 259 was first introduced by commit
:::::: bc6c59466912ed0c3e69c4283a40e05484ed517c rpdfs: add ehtable for indexing key-value pairs

:::::: TO: Zach Brown <zab@zabbo.net>
:::::: CC: Zach Brown <zab@zabbo.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
