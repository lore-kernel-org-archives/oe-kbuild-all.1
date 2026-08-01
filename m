Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D6728506C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785587707; cv=none; b=qUKtLhIVjUdB5zkdgBHg8mP4vtseK2pgGQ3gSljCzJEZsH8/VkAUPI9UetCGiA78ItRfZDvQmXmmgT2DuTxvojnPB41Q1T64k5QhUALX7hj7ZkuQE4RyJ4cWdX9Vakw+lFDVbL10xkRSXUeUHfM1koQrdpSQf/SYPmrJgeZTApo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785587707; c=relaxed/simple;
	bh=9nWqxALfSs5y8el0tLvA7eTFI9RHdxlaXRS53uZ1iLw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TYIgmR8gJahdmTTFSdGXDnC5hzM522b14263Xx8oi9117wo7gxTNbFAqHcLEPAEctd+cfcsSSXHkXIM/7sbZio6tqyS1Vnsx6uFggRzl7wgMGKmeleLmS/KypS5xJj8xBoVt0z892sb7Fb6Fu65BwkWZrnrx0cwjKgLcM1nbxpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bI6HgKli; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bI6HgKli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785587705; x=1817123705;
  h=date:from:to:cc:subject:message-id;
  bh=9nWqxALfSs5y8el0tLvA7eTFI9RHdxlaXRS53uZ1iLw=;
  b=bI6HgKliiD4WKqhYsb8ikSc61GX0ElAyP8S4F9K9A9xtjbEKBYQ8BpKQ
   qxS2sjX8mhqA1qj3nlvp59EDUXJtPfmdMoYNxNwTURbdl6mpEckoQeC4Z
   kkOTSQyE+F2Zp2BODkX2ggO1VOTaM1Z5/YKp3dO/J/SpVVhxGHviwc6xq
   yKflrR67fnJixrVD45H3r995EX/AnDFtAcU4YR92sI8EVmnouPdfPeMtN
   MJ5q3VxxnmdTYItOhxYUJwI3HTsBsFbL9aJGdy5Z5RMgpIwtiBKyZ2+qD
   L3LaHE4YWnJ+5rlqFer9NfO/S0kBiT+2LJ9UKm0CVpitIPHv1IoYMosk/
   Q==;
X-CSE-ConnectionGUID: PdjhW6RgSNqD/JZEkd9ZXQ==
X-CSE-MsgGUID: 0DTB935lTmuvO1awsX/iXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="89874074"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="89874074"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 05:35:01 -0700
X-CSE-ConnectionGUID: AuPXAR2oR6SBtZK3li9p5g==
X-CSE-MsgGUID: 7V3NLfjfS1eRXavcBM/Img==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="259007704"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Aug 2026 05:35:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq8vZ-000000003LD-3T0P;
	Sat, 01 Aug 2026 12:34:57 +0000
Date: Sat, 01 Aug 2026 20:34:22 +0800
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 83/93] fs/rpdfs/ehtable.c:344:12:
 warning: variable 'pl' set but not used
Message-ID: <202608012035.P1DZQM2k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   7dd9571ed4664ad741e8519b4a4369a2d84523f6
commit: 2658c3c902752b51b9bebb9bb36cf7dcde32d28d [83/93] rpdfs: add meta code for caching metadata
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260801/202608012035.P1DZQM2k-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608012035.P1DZQM2k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608012035.P1DZQM2k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/rpdfs/ehtable.c:9:
   fs/rpdfs/meta.h:8:43: warning: 'struct rpdfs_iget_data' declared inside parameter list will not be visible outside of this definition or declaration
       8 | int rpdfs_folio_loc_from_block_key(struct rpdfs_iget_data *igd, pgoff_t *index,
         |                                           ^~~~~~~~~~~~~~~
   fs/rpdfs/ehtable.c: In function 'compact_items':
>> fs/rpdfs/ehtable.c:344:12: warning: variable 'pl' set but not used [-Wunused-but-set-variable=]
     344 |         u8 pl;
         |            ^~
   fs/rpdfs/ehtable.c: In function 'read_items':
>> fs/rpdfs/ehtable.c:454:12: warning: variable '_unused' set but not used [-Wunused-but-set-variable=]
     454 |         u8 _unused;
         |            ^~~~~~~


vim +/pl +344 fs/rpdfs/ehtable.c

bc6c59466912ed0 Zach Brown 2026-07-09  325  
bc6c59466912ed0 Zach Brown 2026-07-09  326  /*
bc6c59466912ed0 Zach Brown 2026-07-09  327   * Compact the block by moving all the items to the front of the block,
bc6c59466912ed0 Zach Brown 2026-07-09  328   * gathering free space at the end of the block.
bc6c59466912ed0 Zach Brown 2026-07-09  329   *
bc6c59466912ed0 Zach Brown 2026-07-09  330   * This isn't the most efficient thing in the world.  We're using a
bc6c59466912ed0 Zach Brown 2026-07-09  331   * trivial loop that moves items and updates the offsets individually.
bc6c59466912ed0 Zach Brown 2026-07-09  332   * Moving larger runs of items and then updating all their offsets would
bc6c59466912ed0 Zach Brown 2026-07-09  333   * probably be quicker.
bc6c59466912ed0 Zach Brown 2026-07-09  334   */
bc6c59466912ed0 Zach Brown 2026-07-09  335  static void compact_items(struct rpdfs_ehtable_block *ehb)
bc6c59466912ed0 Zach Brown 2026-07-09  336  {
bc6c59466912ed0 Zach Brown 2026-07-09  337  	struct rpdfs_ehtable_entry *ent;
bc6c59466912ed0 Zach Brown 2026-07-09  338  	struct rpdfs_ehtable_item *item;
bc6c59466912ed0 Zach Brown 2026-07-09  339  	u16 *indirect;
bc6c59466912ed0 Zach Brown 2026-07-09  340  	u16 size;
bc6c59466912ed0 Zach Brown 2026-07-09  341  	u16 off;
bc6c59466912ed0 Zach Brown 2026-07-09  342  	u16 nr;
bc6c59466912ed0 Zach Brown 2026-07-09  343  	u16 i;
bc6c59466912ed0 Zach Brown 2026-07-09 @344  	u8 pl;
bc6c59466912ed0 Zach Brown 2026-07-09  345  
bc6c59466912ed0 Zach Brown 2026-07-09  346  	if (ehb->tail_free == ehb->total_free)
bc6c59466912ed0 Zach Brown 2026-07-09  347  		return;
bc6c59466912ed0 Zach Brown 2026-07-09  348  
bc6c59466912ed0 Zach Brown 2026-07-09  349  	indirect = get_cpu_var(pcpu_indirect);
bc6c59466912ed0 Zach Brown 2026-07-09  350  	nr = 0;
bc6c59466912ed0 Zach Brown 2026-07-09  351  
bc6c59466912ed0 Zach Brown 2026-07-09  352  	/* gather populated indices */
bc6c59466912ed0 Zach Brown 2026-07-09  353  	for_each_entry(ehb, 0, ent, pl) {
bc6c59466912ed0 Zach Brown 2026-07-09  354  		if (!ent_is_empty(ent)) {
bc6c59466912ed0 Zach Brown 2026-07-09  355  			indirect[nr++] = ent_index(ehb, ent);
bc6c59466912ed0 Zach Brown 2026-07-09  356  			if (nr == le16_to_cpu(ehb->nr_entries))
bc6c59466912ed0 Zach Brown 2026-07-09  357  				break;
bc6c59466912ed0 Zach Brown 2026-07-09  358  		}
bc6c59466912ed0 Zach Brown 2026-07-09  359  	}
bc6c59466912ed0 Zach Brown 2026-07-09  360  
bc6c59466912ed0 Zach Brown 2026-07-09  361  	/* sort indirect indices by offset */
bc6c59466912ed0 Zach Brown 2026-07-09  362  	sort_r(indirect, nr, sizeof(indirect[0]), cmp_indirect_ent_offset, NULL, ehb);
bc6c59466912ed0 Zach Brown 2026-07-09  363  
bc6c59466912ed0 Zach Brown 2026-07-09  364  	off = ptr_offset(ehb, &ehb->entries[RPDFS_EHTABLE_ENTRIES]);
bc6c59466912ed0 Zach Brown 2026-07-09  365  	for (i = 0; i < nr; i++) {
bc6c59466912ed0 Zach Brown 2026-07-09  366  		ent = indirect_entry(ehb, indirect, i);
bc6c59466912ed0 Zach Brown 2026-07-09  367  		item = ent_item(ehb, ent);
bc6c59466912ed0 Zach Brown 2026-07-09  368  		size = item_size(item);
bc6c59466912ed0 Zach Brown 2026-07-09  369  
bc6c59466912ed0 Zach Brown 2026-07-09  370  		if (le16_to_cpu(ent->offset) != off) {
bc6c59466912ed0 Zach Brown 2026-07-09  371  			memmove(offset_item(ehb, off), item, size);
bc6c59466912ed0 Zach Brown 2026-07-09  372  			ent->offset = cpu_to_le16(off);
bc6c59466912ed0 Zach Brown 2026-07-09  373  		}
bc6c59466912ed0 Zach Brown 2026-07-09  374  		off += size;
bc6c59466912ed0 Zach Brown 2026-07-09  375  	}
bc6c59466912ed0 Zach Brown 2026-07-09  376  
bc6c59466912ed0 Zach Brown 2026-07-09  377  	put_cpu_var(indirect);
bc6c59466912ed0 Zach Brown 2026-07-09  378  
bc6c59466912ed0 Zach Brown 2026-07-09  379  	/* zero the newly vacated free space at the end */
bc6c59466912ed0 Zach Brown 2026-07-09  380  	memset(offset_item(ehb, off), 0, free_offset(ehb) - off);
bc6c59466912ed0 Zach Brown 2026-07-09  381  
bc6c59466912ed0 Zach Brown 2026-07-09  382  	ehb->tail_free = ehb->total_free;
bc6c59466912ed0 Zach Brown 2026-07-09  383  }
bc6c59466912ed0 Zach Brown 2026-07-09  384  
bc6c59466912ed0 Zach Brown 2026-07-09  385  
bc6c59466912ed0 Zach Brown 2026-07-09  386  /*
bc6c59466912ed0 Zach Brown 2026-07-09  387   * Copy the items in the block referenced by the indirect index array
bc6c59466912ed0 Zach Brown 2026-07-09  388   * into the buffer.  We fill an array of iargs structs from the start of
bc6c59466912ed0 Zach Brown 2026-07-09  389   * the buffer and copy keys and values from the end of the buffer.
bc6c59466912ed0 Zach Brown 2026-07-09  390   */
bc6c59466912ed0 Zach Brown 2026-07-09  391  static int fill_item_args(struct rpdfs_ehtable_block *ehb, u16 *indirect, u16 nr,
bc6c59466912ed0 Zach Brown 2026-07-09  392  			  void *buf, size_t size)
bc6c59466912ed0 Zach Brown 2026-07-09  393  {
bc6c59466912ed0 Zach Brown 2026-07-09  394  	struct rpdfs_ehtable_item_args *iargs;
bc6c59466912ed0 Zach Brown 2026-07-09  395  	struct rpdfs_ehtable_item *item;
bc6c59466912ed0 Zach Brown 2026-07-09  396  	struct rpdfs_ehtable_entry *ent;
bc6c59466912ed0 Zach Brown 2026-07-09  397  	u16 copied = 0;
bc6c59466912ed0 Zach Brown 2026-07-09  398  	u16 len;
bc6c59466912ed0 Zach Brown 2026-07-09  399  	u16 i;
bc6c59466912ed0 Zach Brown 2026-07-09  400  
bc6c59466912ed0 Zach Brown 2026-07-09  401  	for (i = 0; i < nr; i++) {
bc6c59466912ed0 Zach Brown 2026-07-09  402  		ent = indirect_entry(ehb, indirect, i);
bc6c59466912ed0 Zach Brown 2026-07-09  403  		item = ent_item(ehb, ent);
bc6c59466912ed0 Zach Brown 2026-07-09  404  		len = sizeof(struct rpdfs_ehtable_item_args) + get_key_size(item) +
bc6c59466912ed0 Zach Brown 2026-07-09  405  		      get_val_size(item);
bc6c59466912ed0 Zach Brown 2026-07-09  406  
bc6c59466912ed0 Zach Brown 2026-07-09  407  		if (size < len)
bc6c59466912ed0 Zach Brown 2026-07-09  408  			break;
bc6c59466912ed0 Zach Brown 2026-07-09  409  
bc6c59466912ed0 Zach Brown 2026-07-09  410  		iargs = buf;
bc6c59466912ed0 Zach Brown 2026-07-09  411  		iargs->hash = le32_to_cpu(ent->hash);
bc6c59466912ed0 Zach Brown 2026-07-09  412  		iargs->pos = ent_pos(ent);
bc6c59466912ed0 Zach Brown 2026-07-09  413  		iargs->key_size = get_key_size(item);
bc6c59466912ed0 Zach Brown 2026-07-09  414  		iargs->val_size = get_val_size(item);
bc6c59466912ed0 Zach Brown 2026-07-09  415  		iargs->val = buf + size - iargs->val_size;
bc6c59466912ed0 Zach Brown 2026-07-09  416  		iargs->key = iargs->val - iargs->key_size;
bc6c59466912ed0 Zach Brown 2026-07-09  417  		memcpy((void *)iargs->key, item_key(item), iargs->key_size);
bc6c59466912ed0 Zach Brown 2026-07-09  418  		memcpy((void *)iargs->val, item_val(item), iargs->val_size);
bc6c59466912ed0 Zach Brown 2026-07-09  419  
bc6c59466912ed0 Zach Brown 2026-07-09  420  		copied++;
bc6c59466912ed0 Zach Brown 2026-07-09  421  		buf = iargs + 1;
bc6c59466912ed0 Zach Brown 2026-07-09  422  		size -= len;
bc6c59466912ed0 Zach Brown 2026-07-09  423  	}
bc6c59466912ed0 Zach Brown 2026-07-09  424  
bc6c59466912ed0 Zach Brown 2026-07-09  425  	return copied;
bc6c59466912ed0 Zach Brown 2026-07-09  426  }
bc6c59466912ed0 Zach Brown 2026-07-09  427  
bc6c59466912ed0 Zach Brown 2026-07-09  428  /*
bc6c59466912ed0 Zach Brown 2026-07-09  429   * Copy items from the block to the caller's buffer.  We fill an array
bc6c59466912ed0 Zach Brown 2026-07-09  430   * of iargs structs at the start of the buffer that reference their keys
bc6c59466912ed0 Zach Brown 2026-07-09  431   * and values in the buffer.
bc6c59466912ed0 Zach Brown 2026-07-09  432   *
bc6c59466912ed0 Zach Brown 2026-07-09  433   * Items are copied in pos sorted order, starting with the caller's pos.
bc6c59466912ed0 Zach Brown 2026-07-09  434   * The number of items read and copied into the buffer is returned.
bc6c59466912ed0 Zach Brown 2026-07-09  435   *
bc6c59466912ed0 Zach Brown 2026-07-09  436   * We work in groups of populated entries that start with a base index.
bc6c59466912ed0 Zach Brown 2026-07-09  437   * In each group, we only collect the entries with a greater pos and
bc6c59466912ed0 Zach Brown 2026-07-09  438   * which are in our base group so that we skip wrapped entries when we
bc6c59466912ed0 Zach Brown 2026-07-09  439   * encounter them in the front of the block.  Once we hit an empty entry
bc6c59466912ed0 Zach Brown 2026-07-09  440   * we know we've hit a gap in the sort order by hash, so we must have
bc6c59466912ed0 Zach Brown 2026-07-09  441   * hit a gap in the sort order by pos.  We sort the entries by pos and
bc6c59466912ed0 Zach Brown 2026-07-09  442   * fill the buffer.
bc6c59466912ed0 Zach Brown 2026-07-09  443   */
bc6c59466912ed0 Zach Brown 2026-07-09  444  static u16 read_items(struct rpdfs_ehtable_block *ehb, u32 pos, void *buf, size_t size)
bc6c59466912ed0 Zach Brown 2026-07-09  445  {
bc6c59466912ed0 Zach Brown 2026-07-09  446  	struct rpdfs_ehtable_item_args *iargs;
bc6c59466912ed0 Zach Brown 2026-07-09  447  	struct rpdfs_ehtable_entry *ent;
bc6c59466912ed0 Zach Brown 2026-07-09  448  	bool stop_at_empty = false;
bc6c59466912ed0 Zach Brown 2026-07-09  449  	u16 *indirect;
bc6c59466912ed0 Zach Brown 2026-07-09  450  	u16 copied = 0;
bc6c59466912ed0 Zach Brown 2026-07-09  451  	u16 filled;
bc6c59466912ed0 Zach Brown 2026-07-09  452  	u16 start;
bc6c59466912ed0 Zach Brown 2026-07-09  453  	u16 nr = 0;
bc6c59466912ed0 Zach Brown 2026-07-09 @454  	u8 _unused;
bc6c59466912ed0 Zach Brown 2026-07-09  455  	u8 pl = 0;
bc6c59466912ed0 Zach Brown 2026-07-09  456  
bc6c59466912ed0 Zach Brown 2026-07-09  457  	/* entries aren't sorted by pos, be sure to check all pos at hash */
bc6c59466912ed0 Zach Brown 2026-07-09  458  	start = least_pos_hash(pos);
bc6c59466912ed0 Zach Brown 2026-07-09  459  
bc6c59466912ed0 Zach Brown 2026-07-09  460  	indirect = get_cpu_var(pcpu_indirect);
bc6c59466912ed0 Zach Brown 2026-07-09  461  
bc6c59466912ed0 Zach Brown 2026-07-09  462  	for_each_entry(ehb, start, ent, _unused) {
bc6c59466912ed0 Zach Brown 2026-07-09  463  		if (ent == &ehb->entries[RPDFS_EHTABLE_ENTRIES - 1])
bc6c59466912ed0 Zach Brown 2026-07-09  464  			stop_at_empty = true;
bc6c59466912ed0 Zach Brown 2026-07-09  465  
bc6c59466912ed0 Zach Brown 2026-07-09  466  		if (ent_is_empty(ent)) {
bc6c59466912ed0 Zach Brown 2026-07-09  467  			if (nr > 0) {
bc6c59466912ed0 Zach Brown 2026-07-09  468  				sort_r(indirect, nr, sizeof(indirect[0]),
bc6c59466912ed0 Zach Brown 2026-07-09  469  				       cmp_indirect_ent_pos, NULL, ehb);
bc6c59466912ed0 Zach Brown 2026-07-09  470  				filled = fill_item_args(ehb, indirect, nr, buf, size);
bc6c59466912ed0 Zach Brown 2026-07-09  471  				if (filled == 0)
bc6c59466912ed0 Zach Brown 2026-07-09  472  					break;
bc6c59466912ed0 Zach Brown 2026-07-09  473  
bc6c59466912ed0 Zach Brown 2026-07-09  474  				iargs = buf;
bc6c59466912ed0 Zach Brown 2026-07-09  475  				iargs += filled - 1;
bc6c59466912ed0 Zach Brown 2026-07-09  476  				buf = iargs + 1;
bc6c59466912ed0 Zach Brown 2026-07-09  477  				size = (void *)iargs->key - buf;
bc6c59466912ed0 Zach Brown 2026-07-09  478  				copied += filled;
bc6c59466912ed0 Zach Brown 2026-07-09  479  
bc6c59466912ed0 Zach Brown 2026-07-09  480  				if (filled < nr || copied == le16_to_cpu(ehb->nr_entries))
bc6c59466912ed0 Zach Brown 2026-07-09  481  					break;
bc6c59466912ed0 Zach Brown 2026-07-09  482  
bc6c59466912ed0 Zach Brown 2026-07-09  483  				nr = 0;
bc6c59466912ed0 Zach Brown 2026-07-09  484  			}
bc6c59466912ed0 Zach Brown 2026-07-09  485  
bc6c59466912ed0 Zach Brown 2026-07-09  486  			pl = 0;
bc6c59466912ed0 Zach Brown 2026-07-09  487  
bc6c59466912ed0 Zach Brown 2026-07-09  488  			if (stop_at_empty)
bc6c59466912ed0 Zach Brown 2026-07-09  489  				break;
bc6c59466912ed0 Zach Brown 2026-07-09  490  		} else {
bc6c59466912ed0 Zach Brown 2026-07-09  491  			if (ent->probe_len <= pl && ent_pos(ent) >= pos)
bc6c59466912ed0 Zach Brown 2026-07-09  492  				indirect[nr++] = ent_index(ehb, ent);
bc6c59466912ed0 Zach Brown 2026-07-09  493  			pl++;
bc6c59466912ed0 Zach Brown 2026-07-09  494  		}
bc6c59466912ed0 Zach Brown 2026-07-09  495  	}
bc6c59466912ed0 Zach Brown 2026-07-09  496  
bc6c59466912ed0 Zach Brown 2026-07-09  497  	put_cpu_var(indirect);
bc6c59466912ed0 Zach Brown 2026-07-09  498  
bc6c59466912ed0 Zach Brown 2026-07-09  499  	return copied;
bc6c59466912ed0 Zach Brown 2026-07-09  500  }
bc6c59466912ed0 Zach Brown 2026-07-09  501  

:::::: The code at line 344 was first introduced by commit
:::::: bc6c59466912ed0c3e69c4283a40e05484ed517c rpdfs: add ehtable for indexing key-value pairs

:::::: TO: Zach Brown <zab@zabbo.net>
:::::: CC: Zach Brown <zab@zabbo.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
