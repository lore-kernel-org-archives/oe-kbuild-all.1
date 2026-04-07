Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F043CAE6D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 15:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775577189; cv=none; b=HXGh3S7Chy+y+eFCujsCWlk3I4DOT6XhN+LSjppqGl4EG2yLTylUFvY04FJEO6XB6YcmwoBoB/TTPNNUUF1Rbxc0TDa6nOh9bL+cs66XfWx5pCjCuSN1tzp91WQUs5gNIF/hsDhmOCUpycxAibc027W/Y1/Uf1mSW7LNb43iaxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775577189; c=relaxed/simple;
	bh=LIzLhb4pKtwd5ZDuN0gaYlYAei0hdkMIZFfxp02mQYI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mot5jL1yqFDXoaNMnnIQenFZXxe5TZNmbZYaQif5geFgcnkBEOhDYUIi0lv65RD1H7RDjBJDvzuy1P70YkzPfJ/Kt9mZ5pATrUBZJieIu2V5hkCDqxKZFydcCoqMiIQTlI1G7npELx2Ur3721judyj75pEcCLPGtX9n5orjI/0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIsyRPkH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIsyRPkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775577178; x=1807113178;
  h=date:from:to:cc:subject:message-id;
  bh=LIzLhb4pKtwd5ZDuN0gaYlYAei0hdkMIZFfxp02mQYI=;
  b=GIsyRPkHi+IPqcFFmCzBmBr+J1dvXg4UfFbv+8+lcF474wT/yEmSuF/Z
   ya/GEFTcCXm0G1OShPf+Bn1HWm3apD7yrHuYNZwD54bas+wc+dx7j1C01
   ueVlTukfgXKpfmZcLYMPD9pUCCxFPT/rew4pIjWT5ySIFGmtxQjHlIqnU
   EIzPsMOvTzgha0MfcYrvaggI0ErB2lbgo364IwDjG4ykuubssYM13gT4E
   rXnlNPWQ8tXeaF2jCOc+896FY5paMs3c4Xm7AEWREMeqmYeyukITqdd4K
   ttMReRcWQ7wnIqSYfhixqy0KpmRVQepSyk0al2l338CQX2A3J83MR4xqS
   A==;
X-CSE-ConnectionGUID: vK+FSPXCTVOh2FqL+izRvA==
X-CSE-MsgGUID: 2N1av3PiSdGVAbxa4U0DOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="101999349"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="101999349"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 08:52:55 -0700
X-CSE-ConnectionGUID: IYKddsulQfe3/+myS4zcJg==
X-CSE-MsgGUID: MRz5ntCtQQOctfpCoQ50SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="233167879"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Apr 2026 08:52:54 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA8jT-000000000lZ-1VHD;
	Tue, 07 Apr 2026 15:52:51 +0000
Date: Tue, 07 Apr 2026 23:52:39 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dakr:devres/stage 10/10] drivers/base/devres.c:936:3-8:
 WARNING: NULL check before some freeing functions is not needed.
Message-ID: <202604072313.epXtZqM4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git devres/stage
head:   784ac2ed774f170efd1045b65df30bdd0cc4bb2b
commit: 784ac2ed774f170efd1045b65df30bdd0cc4bb2b [10/10] wip: devres stage rework
config: hexagon-randconfig-r052-20260407 (https://download.01.org/0day-ci/archive/20260407/202604072313.epXtZqM4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604072313.epXtZqM4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/base/devres.c:936:3-8: WARNING: NULL check before some freeing functions is not needed.

vim +936 drivers/base/devres.c

   900	
   901	/**
   902	 * devres_remove_group - Remove a devres group
   903	 * @dev: Device to remove group for
   904	 * @id: ID of target group, can be NULL
   905	 *
   906	 * Remove the group identified by @id across all stages.  If @id is NULL,
   907	 * the latest open group is selected.  Note that removing a group doesn't
   908	 * affect any other resources - only the group markers are removed.
   909	 */
   910	void devres_remove_group(struct device *dev, void *id)
   911	{
   912		struct devres_group *grp_array[DEVRES_STAGE_MAX];
   913		enum devres_stage stage;
   914		unsigned long flags;
   915	
   916		spin_lock_irqsave(&dev->devres_lock, flags);
   917	
   918		/* Find and remove the group from each stage, saving pointers */
   919		devres_for_each_stage(stage) {
   920			grp_array[stage] = find_group(dev, id, stage);
   921			if (grp_array[stage]) {
   922				list_del_init(&grp_array[stage]->node[0].entry);
   923				list_del_init(&grp_array[stage]->node[1].entry);
   924				if (stage == DEVRES_STAGE_REGISTRATION)
   925					devres_log(dev, &grp_array[stage]->node[0], "REM");
   926			} else if (stage == DEVRES_STAGE_REGISTRATION) {
   927				WARN_ON(1);
   928			}
   929		}
   930	
   931		spin_unlock_irqrestore(&dev->devres_lock, flags);
   932	
   933		/* Free all N group structures */
   934		devres_for_each_stage(stage) {
   935			if (grp_array[stage])
 > 936				kfree(grp_array[stage]);
   937		}
   938	}
   939	EXPORT_SYMBOL_GPL(devres_remove_group);
   940	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
