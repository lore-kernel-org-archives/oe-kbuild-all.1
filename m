Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A9A1428F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 09:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljDfgEN6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696929754; x=1728465754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YOulgYPt+9DF/7D1x0qPs8vFa4eGK7AtlzrbYpiCd9M=;
  b=ljDfgEN6DZ+01vSgGvOwio7jnEpPwnvv0ZoPL6f70XGQvJH/c0jiPX+c
   vNdXpQqw8xVyzF+sOuUJXlEs/b9ApBLDuS/8XV5zY1ADARLkGsVhEF3z8
   pXadi5NwzsKqFXtbAaA+7Hj22QGd2SypDvqj//uCQSjlgDAM5iwIT+i9z
   V/OHe4bN0vIGj+DTdpUjyppondNjeFSFYJhECOA4zYOFfOM5TqMnptQRd
   htmqTBMAG5SVK6DnVhiv8MMQGkuit+d5tzDXlpt7NfpjMemZxMBQRvDrM
   pHXyPTz0Qvlw3y5+uKqDQzReeXyhZOJgKaHbbXLXBHz0YG/PJAzLUeBrr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="369414279"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="369414279"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 02:22:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="788512821"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="788512821"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Oct 2023 02:22:32 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qq8wg-0000EC-05;
	Tue, 10 Oct 2023 09:22:30 +0000
Date: Tue, 10 Oct 2023 17:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, cluster-devel@redhat.com
Subject: [gfs2:extents 14/14] fs/gfs2/extents.c:318: warning: Function
 parameter or member 'ip' not described in 'find_extent'
Message-ID: <202310101746.0Tygjkh3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git extents
head:   86474c69cac46872bd311318c02fb8e9e25abd10
commit: 86474c69cac46872bd311318c02fb8e9e25abd10 [14/14] gfs2: Add some initial extents-based inode code
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231010/202310101746.0Tygjkh3-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310101746.0Tygjkh3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310101746.0Tygjkh3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/gfs2/extents.c:318: warning: Function parameter or member 'ip' not described in 'find_extent'
>> fs/gfs2/extents.c:318: warning: Function parameter or member 'block' not described in 'find_extent'
>> fs/gfs2/extents.c:416: warning: Function parameter or member 'ip' not described in 'insert_extent'
>> fs/gfs2/extents.c:416: warning: Function parameter or member 'path' not described in 'insert_extent'
>> fs/gfs2/extents.c:416: warning: Function parameter or member 'new_ex' not described in 'insert_extent'


vim +318 fs/gfs2/extents.c

   306	
   307	/**
   308	 * find_extent - look up the path to an extent
   309	 *
   310	 * Upon success, a new path into the extent tree is returned.  In this path,
   311	 * pc_ex of the last path component is NULL if the tree is empty, and
   312	 * points to the closest extent starting before or at @block otherwise.
   313	 *
   314	 * Return: an ERR_PTR upon failure.
   315	 */
   316	static struct gfs2_extent_path *
   317	find_extent(struct gfs2_inode *ip, u64 block)
 > 318	{
   319		struct gfs2_extent_path *path;
   320		struct gfs2_extent_pc *pc, *last_pc;
   321		u32 mtype = GFS2_METATYPE_XI;
   322		int ret;
   323	
   324		if (!gfs2_has_extents(ip) || ip->i_height < 1)
   325			return ERR_PTR(-EINVAL);
   326	
   327		path = kzalloc(sizeof(*path) + (ip->i_height - 1) * sizeof(*pc), GFP_NOFS);
   328		if (!path)
   329			return ERR_PTR(-ENOMEM);
   330		path->p_height = ip->i_height;
   331		pc = first_path_component(path);
   332		last_pc = last_path_component(path);
   333		ret = gfs2_meta_inode_buffer(ip, &pc->pc_bh);
   334		if (ret)
   335			goto fail;
   336		ret = verify_inode(ip, pc->pc_bh);
   337		if (ret)
   338			goto fail;
   339		pc->pc_eh = (void *)pc->pc_bh->b_data + sizeof(struct gfs2_dinode);
   340		while (pc != last_pc) {
   341			struct gfs2_extent_idx *ei;
   342	
   343			ei = search_index(pc->pc_eh, block);
   344			if (!ei) {
   345				ret = -EIO;
   346				goto fail;
   347			}
   348			pc->pc_ei = ei;
   349			pc--;
   350			if (pc == last_pc)
   351				mtype = GFS2_METATYPE_XL;
   352			ret = gfs2_meta_buffer(ip, mtype, ei_leaf(ei), &pc->pc_bh);
   353			if (ret)
   354				goto fail;
   355			ret = verify_block(mtype, pc->pc_bh);
   356			if (ret)
   357				goto fail;
   358			pc->pc_eh = (void *)pc->pc_bh->b_data + sizeof(struct gfs2_meta_header);
   359		}
   360		last_pc->pc_ex = search_extent(last_pc->pc_eh, block);
   361		return path;
   362	
   363	fail:
   364		gfs2_free_ext_path(path);
   365		return ERR_PTR(ret);
   366	}
   367	
   368	static bool extent_includes(struct gfs2_extent *ex, u64 block)
   369	{
   370		u64 start = ex_start(ex);
   371	
   372		return block >= start && block < start + ex_len(ex);
   373	}
   374	
   375	static bool
   376	extents_can_be_merged(struct gfs2_extent *left, struct gfs2_extent *right)
   377	{
   378		u16 len = ex_len(left);
   379	
   380		if (ex_start(left) + len != ex_start(right))
   381			return false;
   382		if (ex_addr(left) + len != ex_addr(right))
   383			return false;
   384		if (left->ex_flags != right->ex_flags)
   385			return false;
   386		return true;
   387	}
   388	
   389	static void
   390	remove_extent_at(struct gfs2_extent *ex, struct gfs2_extent_header *eh)
   391	{
   392		struct gfs2_extent *last_ex = last_extent(eh);
   393	
   394		memmove(ex, ex + 1, (last_ex - ex) * sizeof(*ex));
   395		memset(last_ex, 0, sizeof(*last_ex));
   396		be16_add_cpu(&eh->eh_entries, -1);
   397	}
   398	
   399	static void
   400	insert_extent_at(struct gfs2_extent *ex, struct gfs2_extent_header *eh)
   401	{
   402		struct gfs2_extent *last_ex = last_extent(eh);
   403	
   404		memmove(ex + 1, ex, (last_ex - ex + 1) * sizeof(*ex));
   405		be16_add_cpu(&eh->eh_entries, 1);
   406	}
   407	
   408	/**
   409	 * insert_extent - 
   410	 *
   411	 * non-overlapping
   412	 */
   413	static int
   414	insert_extent(struct gfs2_inode *ip, struct gfs2_extent_path *path,
   415		      struct gfs2_extent *new_ex)
 > 416	{
   417		struct gfs2_extent_pc *pc;
   418		struct gfs2_extent *ex, *last_ex;
   419		struct gfs2_extent_header *eh;
   420	
   421		if (path->p_height != 1)
   422			return -EIO;
   423	
   424		pc = last_path_component(path);
   425		eh = pc->pc_eh;
   426		ex = pc->pc_ex;
   427		last_ex = last_extent(eh);
   428		if (!ex) {
   429			/* empty tree */
   430			BUG_ON(eh->eh_entries);
   431			*first_extent(eh) = *new_ex;
   432			eh->eh_entries = cpu_to_be16(1);
   433			return 0;
   434		}
   435	
   436		if (ex_start(ex) < ex_start(new_ex)) {
   437			if (extents_can_be_merged(ex, new_ex)) {
   438				/* append */
   439				be16_add_cpu(&ex->ex_len, ex_len(new_ex));
   440				goto merge_right;
   441			}
   442	
   443			if (ex != last_ex && extents_can_be_merged(new_ex, ex + 1)) {
   444				ex++;
   445				goto prepend;
   446			}
   447			ex++;
   448		} else {
   449			if (extents_can_be_merged(new_ex, ex))
   450				goto prepend;
   451		}
   452	
   453		/* insert */
   454		if (leaf_needs_splitting(path))
   455			return -ENOSPC;
   456		insert_extent_at(ex, eh);
   457		*ex = *new_ex;
   458		return 0;
   459	
   460	prepend:
   461		ex->ex_start = new_ex->ex_start;
   462		ex->ex_addr = new_ex->ex_addr;
   463		be16_add_cpu(&ex->ex_len, ex_len(new_ex));
   464		return 0;
   465	
   466	merge_right:
   467		if (ex < last_ex && extents_can_be_merged(ex, ex + 1)) {
   468			be16_add_cpu(&ex->ex_len, ex_len(ex + 1));
   469			remove_extent_at(ex + 1, eh);
   470		}
   471		return 0;
   472	}
   473	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
