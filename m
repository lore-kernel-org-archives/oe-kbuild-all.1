Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2421F170
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 18:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705688475; cv=none; b=nJHMy3WWU8gM1LK6ou2hlSESJ+j5xe3Y2Ry63CvLp5fsXoI9V2q3kF/PqheaG/Hws2PtgkJFEsH+NNLjaqGEIhYf/EajgoMwD9BNMqlWb2j8HmB3Z9ONQ7Qs8giGjkz7CgsJMerCmRgBmrExt6qVGf4rQBOgVf5dfNIxJ5mOCMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705688475; c=relaxed/simple;
	bh=7kxWcQj8i/+nGKg2mBD1PJ+pywcCxyUT4sCr3IniXwk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZIJRw+InYvWripHZUehyVp4XTJahcjsOmKy+j5pQJgLadXFeOvRgU12NrcHpid2bQXNd1Q/U77VuOwfNIXf2i9EnsjdN+cdg8BvccbiXjFS14NCwMtAKwBRyvKqX2GR4Eca1SfrolMvfgpPzUoRrVZBRKp4HaamWNrdkYeNoUus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZmBCR9L; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZmBCR9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705688473; x=1737224473;
  h=date:from:cc:subject:message-id:mime-version;
  bh=7kxWcQj8i/+nGKg2mBD1PJ+pywcCxyUT4sCr3IniXwk=;
  b=jZmBCR9LaCnHTpeHrIiiIBkcpt4fk0HvOQgFJ2gcS1qEstLJwRpOLt1d
   JQiccq6NZCz+hld6FIQMTsYMce9bvGIGomt7vzhZFVy38ztPlj5N1/2tA
   C2O582qAIOLTMU+1ovjDCTWftZstimRgFO4dWTM7Y/5bAw5v1DjMLd5VA
   MFlV5h4R3F5W4DnztwjAp5zaoPqWEVzoUBBhRnPKI4RmUBG1BdCTVZBlr
   eCw10sRUidrKlRe99JizXJMGjP7GqVjrySD2KmGJ7RbyJNKLPW0Pr3CrA
   B0wzSZMKVah06+SDkrN5MlTcn3YyjQFzTmdvaR4J9XU6bAoVb7F0cMeaB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="404575215"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="404575215"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 10:21:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="642594"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jan 2024 10:21:12 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQtUM-0004Lk-0b
	for oe-kbuild-all@lists.linux.dev;
	Fri, 19 Jan 2024 18:21:10 +0000
Date: Sat, 20 Jan 2024 02:20:39 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.14-rebase 2902/9999]
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:291:21: warning: variable 'hw_mdp'
 set but not used
Message-ID: <202401200216.JpNgqjDF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: 0cd2491bb127c67f683085510db07dd59f66d32f [2902/9999] FROMGIT: drm/msm/dpu: remove cdm block support from resource manager
config: arm-randconfig-001-20240118 (https://download.01.org/0day-ci/archive/20240120/202401200216.JpNgqjDF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200216.JpNgqjDF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200216.JpNgqjDF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c: In function '_dpu_rm_hw_blk_create':
>> drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:291:21: warning: variable 'hw_mdp' set but not used [-Wunused-but-set-variable]
     struct dpu_hw_mdp *hw_mdp;
                        ^~~~~~


vim +/hw_mdp +291 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c

4c774770eee65f Jeykumar Sankaran 2018-06-27  281  
4c774770eee65f Jeykumar Sankaran 2018-06-27  282  static int _dpu_rm_hw_blk_create(
4c774770eee65f Jeykumar Sankaran 2018-06-27  283  		struct dpu_rm *rm,
4c774770eee65f Jeykumar Sankaran 2018-06-27  284  		struct dpu_mdss_cfg *cat,
4c774770eee65f Jeykumar Sankaran 2018-06-27  285  		void __iomem *mmio,
4c774770eee65f Jeykumar Sankaran 2018-06-27  286  		enum dpu_hw_blk_type type,
4c774770eee65f Jeykumar Sankaran 2018-06-27  287  		uint32_t id,
4c774770eee65f Jeykumar Sankaran 2018-06-27  288  		void *hw_catalog_info)
4c774770eee65f Jeykumar Sankaran 2018-06-27  289  {
4c774770eee65f Jeykumar Sankaran 2018-06-27  290  	struct dpu_rm_hw_blk *blk;
4c774770eee65f Jeykumar Sankaran 2018-06-27 @291  	struct dpu_hw_mdp *hw_mdp;
4c774770eee65f Jeykumar Sankaran 2018-06-27  292  	void *hw;
4c774770eee65f Jeykumar Sankaran 2018-06-27  293  
4c774770eee65f Jeykumar Sankaran 2018-06-27  294  	hw_mdp = rm->hw_mdp;
4c774770eee65f Jeykumar Sankaran 2018-06-27  295  
4c774770eee65f Jeykumar Sankaran 2018-06-27  296  	switch (type) {
4c774770eee65f Jeykumar Sankaran 2018-06-27  297  	case DPU_HW_BLK_LM:
4c774770eee65f Jeykumar Sankaran 2018-06-27  298  		hw = dpu_hw_lm_init(id, mmio, cat);
4c774770eee65f Jeykumar Sankaran 2018-06-27  299  		break;
4c774770eee65f Jeykumar Sankaran 2018-06-27  300  	case DPU_HW_BLK_CTL:
4c774770eee65f Jeykumar Sankaran 2018-06-27  301  		hw = dpu_hw_ctl_init(id, mmio, cat);
4c774770eee65f Jeykumar Sankaran 2018-06-27  302  		break;
4c774770eee65f Jeykumar Sankaran 2018-06-27  303  	case DPU_HW_BLK_PINGPONG:
4c774770eee65f Jeykumar Sankaran 2018-06-27  304  		hw = dpu_hw_pingpong_init(id, mmio, cat);
4c774770eee65f Jeykumar Sankaran 2018-06-27  305  		break;
4c774770eee65f Jeykumar Sankaran 2018-06-27  306  	case DPU_HW_BLK_INTF:
4c774770eee65f Jeykumar Sankaran 2018-06-27  307  		hw = dpu_hw_intf_init(id, mmio, cat);
4c774770eee65f Jeykumar Sankaran 2018-06-27  308  		break;
4c774770eee65f Jeykumar Sankaran 2018-06-27  309  	case DPU_HW_BLK_SSPP:
4c774770eee65f Jeykumar Sankaran 2018-06-27  310  		/* SSPPs are not managed by the resource manager */
4c774770eee65f Jeykumar Sankaran 2018-06-27  311  	case DPU_HW_BLK_TOP:
4c774770eee65f Jeykumar Sankaran 2018-06-27  312  		/* Top is a singleton, not managed in hw_blks list */
4c774770eee65f Jeykumar Sankaran 2018-06-27  313  	case DPU_HW_BLK_MAX:
4c774770eee65f Jeykumar Sankaran 2018-06-27  314  	default:
4c774770eee65f Jeykumar Sankaran 2018-06-27  315  		DPU_ERROR("unsupported block type %d\n", type);
4c774770eee65f Jeykumar Sankaran 2018-06-27  316  		return -EINVAL;
4c774770eee65f Jeykumar Sankaran 2018-06-27  317  	}
4c774770eee65f Jeykumar Sankaran 2018-06-27  318  
4c774770eee65f Jeykumar Sankaran 2018-06-27  319  	if (IS_ERR_OR_NULL(hw)) {
4c774770eee65f Jeykumar Sankaran 2018-06-27  320  		DPU_ERROR("failed hw object creation: type %d, err %ld\n",
4c774770eee65f Jeykumar Sankaran 2018-06-27  321  				type, PTR_ERR(hw));
4c774770eee65f Jeykumar Sankaran 2018-06-27  322  		return -EFAULT;
4c774770eee65f Jeykumar Sankaran 2018-06-27  323  	}
4c774770eee65f Jeykumar Sankaran 2018-06-27  324  
4c774770eee65f Jeykumar Sankaran 2018-06-27  325  	blk = kzalloc(sizeof(*blk), GFP_KERNEL);
4c774770eee65f Jeykumar Sankaran 2018-06-27  326  	if (!blk) {
4c774770eee65f Jeykumar Sankaran 2018-06-27  327  		_dpu_rm_hw_destroy(type, hw);
4c774770eee65f Jeykumar Sankaran 2018-06-27  328  		return -ENOMEM;
4c774770eee65f Jeykumar Sankaran 2018-06-27  329  	}
4c774770eee65f Jeykumar Sankaran 2018-06-27  330  
4c774770eee65f Jeykumar Sankaran 2018-06-27  331  	blk->type = type;
4c774770eee65f Jeykumar Sankaran 2018-06-27  332  	blk->id = id;
4c774770eee65f Jeykumar Sankaran 2018-06-27  333  	blk->hw = hw;
4c774770eee65f Jeykumar Sankaran 2018-06-27  334  	list_add_tail(&blk->list, &rm->hw_blks[type]);
4c774770eee65f Jeykumar Sankaran 2018-06-27  335  
4c774770eee65f Jeykumar Sankaran 2018-06-27  336  	return 0;
4c774770eee65f Jeykumar Sankaran 2018-06-27  337  }
4c774770eee65f Jeykumar Sankaran 2018-06-27  338  

:::::: The code at line 291 was first introduced by commit
:::::: 4c774770eee65f0c397d53d6ad82fd2b2db228ab UPSTREAM: drm/msm: Add SDM845 DPU support

:::::: TO: Jeykumar Sankaran <jsanka@codeaurora.org>
:::::: CC: chrome-bot <chrome-bot@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
