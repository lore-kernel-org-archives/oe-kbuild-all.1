Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6461AD5E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 05:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709617299; cv=none; b=uW5ollITP0gZpQhkSJb9vauuDyj/MIi8ishDKozLZrTzwHNxT6pezpbZdHUW6J1XL0DWHsu81c7z8QE1+0/67B+q0doCDDFYWKCL9NpkPbYx0cpVd40cltZGhb9ZxlVZFFHSeAzlHTU/wOTX6UeA5jbBZBBOHxkVo/Z41YnTpp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709617299; c=relaxed/simple;
	bh=CnghG1myBwDxOCIRRjPME9yHx7gT2xVDB/wLHnFUCCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H7PXxqk3dhW1JN4xWXFUJkLXe0KXrHEcddVa/CVtVwVJxVWd+cAVYBcCCMVEJQPp/BxVAnyPsGTA1k/PyYjByzUXGMM6TwrW7CaSFFMqdvVFRa+PzjZaH2bro739As1vg3B0SvTSwuYNWoFAi0VVDOINru6zXZNmQtqMZFSctt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVdP1KMQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVdP1KMQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709617298; x=1741153298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CnghG1myBwDxOCIRRjPME9yHx7gT2xVDB/wLHnFUCCM=;
  b=DVdP1KMQxy44+f3M7j313boxilAAd/0GALAH3517o7kELV87vw43UWVO
   JiTpxAgZuettZMQ4ETSgz0vAwmlqxBPqFI08VvXiJQKNWyJxd2MHWGCOS
   hJhVcxQTpjhk2qMyJ3iot58YS3iEaw2H41X5gRPbpyBo6S5VIy9VDSK0/
   ZP297+Y3kY+WjviCIaKQu8CtdWOb++IbVTfigUyxAlx0oxkCCidBYZbav
   Z624zHQkLGR9ahkoOZNGxIBz5y8jjkeCDvT6ylcVDxADIg4F09XWl7fU4
   0QAEqL5npa6nO/1rXr/XOxBGAmOaWpW7pdvpRr64MruGiLeScNj7cT2Jm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21677092"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="21677092"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 21:41:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="13754070"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Mar 2024 21:41:34 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhNYS-00034b-0N;
	Tue, 05 Mar 2024 05:41:32 +0000
Date: Tue, 5 Mar 2024 13:41:12 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/cgroup/cgroup.c:5373 cgroup_create() warn: inconsistent
 indenting
Message-ID: <202403051342.CzctCXe8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 7600f2ca4450f694f3d0ae89dbd741ea1d0f8ffa tqos/rqm: Tencent Quality Monitor Buffer
date:   2 years, 4 months ago
config: x86_64-randconfig-161-20240305 (https://download.01.org/0day-ci/archive/20240305/202403051342.CzctCXe8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051342.CzctCXe8-lkp@intel.com/

smatch warnings:
kernel/cgroup/cgroup.c:5373 cgroup_create() warn: inconsistent indenting

vim +5373 kernel/cgroup/cgroup.c

  5329	
  5330	/*
  5331	 * The returned cgroup is fully initialized including its control mask, but
  5332	 * it isn't associated with its kernfs_node and doesn't have the control
  5333	 * mask applied.
  5334	 */
  5335	static struct cgroup *cgroup_create(struct cgroup *parent)
  5336	{
  5337		struct cgroup_root *root = parent->root;
  5338		struct cgroup *cgrp, *tcgrp;
  5339		int level = parent->level + 1;
  5340		int ret;
  5341	
  5342		/* allocate the cgroup and its ID, 0 is reserved for the root */
  5343		cgrp = kzalloc(struct_size(cgrp, ancestor_ids, (level + 1)),
  5344			       GFP_KERNEL);
  5345		if (!cgrp)
  5346			return ERR_PTR(-ENOMEM);
  5347	
  5348		ret = percpu_ref_init(&cgrp->self.refcnt, css_release, 0, GFP_KERNEL);
  5349		if (ret)
  5350			goto out_free_cgrp;
  5351	
  5352		if (cgroup_on_dfl(parent)) {
  5353			ret = cgroup_rstat_init(cgrp);
  5354			if (ret)
  5355				goto out_cancel_ref;
  5356		}
  5357	
  5358		/*
  5359		 * Temporarily set the pointer to NULL, so idr_find() won't return
  5360		 * a half-baked cgroup.
  5361		 */
  5362		cgrp->id = cgroup_idr_alloc(&root->cgroup_idr, NULL, 2, 0, GFP_KERNEL);
  5363		if (cgrp->id < 0) {
  5364			ret = -ENOMEM;
  5365			goto out_stat_exit;
  5366		}
  5367	
  5368		init_cgroup_housekeeping(cgrp);
  5369	
  5370		cgrp->self.parent = &parent->self;
  5371		cgrp->root = root;
  5372		cgrp->level = level;
> 5373	    cgrp->mbuf = NULL;
  5374	
  5375		ret = psi_cgroup_alloc(cgrp);
  5376		if (ret)
  5377			goto out_idr_free;
  5378	
  5379		ret = cgroup_bpf_inherit(cgrp);
  5380		if (ret)
  5381			goto out_psi_free;
  5382	
  5383		/*
  5384		 * New cgroup inherits effective freeze counter, and
  5385		 * if the parent has to be frozen, the child has too.
  5386		 */
  5387		cgrp->freezer.e_freeze = parent->freezer.e_freeze;
  5388		if (cgrp->freezer.e_freeze) {
  5389			/*
  5390			 * Set the CGRP_FREEZE flag, so when a process will be
  5391			 * attached to the child cgroup, it will become frozen.
  5392			 * At this point the new cgroup is unpopulated, so we can
  5393			 * consider it frozen immediately.
  5394			 */
  5395			set_bit(CGRP_FREEZE, &cgrp->flags);
  5396			set_bit(CGRP_FROZEN, &cgrp->flags);
  5397		}
  5398	
  5399		spin_lock_irq(&css_set_lock);
  5400		for (tcgrp = cgrp; tcgrp; tcgrp = cgroup_parent(tcgrp)) {
  5401			cgrp->ancestor_ids[tcgrp->level] = tcgrp->id;
  5402	
  5403			if (tcgrp != cgrp) {
  5404				tcgrp->nr_descendants++;
  5405	
  5406				/*
  5407				 * If the new cgroup is frozen, all ancestor cgroups
  5408				 * get a new frozen descendant, but their state can't
  5409				 * change because of this.
  5410				 */
  5411				if (cgrp->freezer.e_freeze)
  5412					tcgrp->freezer.nr_frozen_descendants++;
  5413			}
  5414		}
  5415		spin_unlock_irq(&css_set_lock);
  5416	
  5417		if (notify_on_release(parent))
  5418			set_bit(CGRP_NOTIFY_ON_RELEASE, &cgrp->flags);
  5419	
  5420		if (test_bit(CGRP_CPUSET_CLONE_CHILDREN, &parent->flags))
  5421			set_bit(CGRP_CPUSET_CLONE_CHILDREN, &cgrp->flags);
  5422	
  5423		cgrp->self.serial_nr = css_serial_nr_next++;
  5424	
  5425		/* allocation complete, commit to creation */
  5426		list_add_tail_rcu(&cgrp->self.sibling, &cgroup_parent(cgrp)->self.children);
  5427		atomic_inc(&root->nr_cgrps);
  5428		cgroup_get_live(parent);
  5429	
  5430		/*
  5431		 * @cgrp is now fully operational.  If something fails after this
  5432		 * point, it'll be released via the normal destruction path.
  5433		 */
  5434		cgroup_idr_replace(&root->cgroup_idr, cgrp, cgrp->id);
  5435	
  5436		/*
  5437		 * On the default hierarchy, a child doesn't automatically inherit
  5438		 * subtree_control from the parent.  Each is configured manually.
  5439		 */
  5440		if (!cgroup_on_dfl(cgrp))
  5441			cgrp->subtree_control = cgroup_control(cgrp);
  5442	
  5443		cgroup_propagate_control(cgrp);
  5444	
  5445		return cgrp;
  5446	
  5447	out_psi_free:
  5448		psi_cgroup_free(cgrp);
  5449	out_idr_free:
  5450		cgroup_idr_remove(&root->cgroup_idr, cgrp->id);
  5451	out_stat_exit:
  5452		if (cgroup_on_dfl(parent))
  5453			cgroup_rstat_exit(cgrp);
  5454	out_cancel_ref:
  5455		percpu_ref_exit(&cgrp->self.refcnt);
  5456	out_free_cgrp:
  5457		kfree(cgrp);
  5458		return ERR_PTR(ret);
  5459	}
  5460	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
