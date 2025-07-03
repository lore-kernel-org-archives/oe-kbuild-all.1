Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BC7235360
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 03:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751513671; cv=none; b=SWYj0eW3oar3YaKABKNiyvlu1hO+wF5JFdCmhm0reBQdWmGFkXMynL/3hkL+5PnJDguP8YXCv3TK8UPBY9NlHbQC+QL+ahIohFbF5Ni6t4XXUTNv88sempvEGVng5oBRRl5dzM1WuYFn2pHknLWtfjg21RSLnITEc8ZU7EHhgSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751513671; c=relaxed/simple;
	bh=IYaZ1hZByABYICaITw8ch1STdk36QSgMBgMNb0X2kdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HO5KsO8dvSkLvJHs6ForiDR0e9Skiy+i9KnCuZ/z/hbCkKo6xjS18/QXmcsJqUJ3h4yWyX0sT6x4H+yaIVpBdhpHQ88AR3GY3zKJCQnbD10Y+C3ZZCSc0IbFw3Zv0OYn83pEJvhu3OvYg+dBtXlO2UszRpRZIXD8x9Ps8nzkoKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2KwlIaD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2KwlIaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751513669; x=1783049669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IYaZ1hZByABYICaITw8ch1STdk36QSgMBgMNb0X2kdc=;
  b=Q2KwlIaDjK9sclzdzdWmdPwR2IW0+qiDXYI0uQACpE6lEj6qpqQhg77i
   EWRZUWRz6BD3kINCYf1ATcsUn2f1PizIJn4FftFtwWMjezZ8vawmsH0BT
   Ihd4F9lRW/siyGwnpc4L5Gxp1kYBod9TYhrQjGYTFZyR7W2T88qbsTtkJ
   8gR+Wcha6/uHkNZ/jpE0Dmw/y/5+QmhJw5wDP7UpE86G3xtCAhZJoTKnn
   SgDdma0eR+vnLAagh4WYxRHWQcQp83GpjF2YoKctyA4IJi5H7n4kPVu0e
   I7ufkZy7jOduVPi0rzIz9L4rtV3jiAx09uozKL/wmCs2r89/d8D4kiNm2
   w==;
X-CSE-ConnectionGUID: UVY86uZYS9C5gr8i4OSKNw==
X-CSE-MsgGUID: 9bOVNfIWSL+uOS7hwscxVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64424003"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="64424003"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 20:34:26 -0700
X-CSE-ConnectionGUID: Iv5zmgkCT+WVzZ82b6T37w==
X-CSE-MsgGUID: 7Gt0lTNLQd2KsoG9vtoR3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="191418371"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Jul 2025 20:34:24 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXAiM-0001Rl-1z;
	Thu, 03 Jul 2025 03:34:22 +0000
Date: Thu, 3 Jul 2025 11:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/irq-exit-v2 3/4] kernel/rcu/tree.c:734:6: error:
 conflicting types for 'rcu_set_exp_qs_needed'; have 'void(bool)' {aka
 'void(_Bool)'}
Message-ID: <202507031109.9FwJQYGB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/irq-exit-v2
head:   2d2b43727789cf79a5fc38149bd16cc1b90513cc
commit: 581d39453276167f6fe9aa88c68e5d6d71d85447 [3/4] rcu: Add helper functions for cpu_no_qs flag setting
config: s390-randconfig-001-20250703 (https://download.01.org/0day-ci/archive/20250703/202507031109.9FwJQYGB-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507031109.9FwJQYGB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507031109.9FwJQYGB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/tree.c:734:6: error: conflicting types for 'rcu_set_exp_qs_needed'; have 'void(bool)' {aka 'void(_Bool)'}
     734 | void rcu_set_exp_qs_needed(bool value)
         |      ^~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:69:
   kernel/rcu/tree.h:551:6: note: previous declaration of 'rcu_set_exp_qs_needed' with type 'void(void)'
     551 | void rcu_set_exp_qs_needed(void);
         |      ^~~~~~~~~~~~~~~~~~~~~
>> kernel/rcu/tree.c:745:6: error: conflicting types for 'rcu_set_exp_qs_needed_cpu'; have 'void(struct rcu_data *, bool)' {aka 'void(struct rcu_data *, _Bool)'}
     745 | void rcu_set_exp_qs_needed_cpu(struct rcu_data *rdp, bool value)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.h:552:6: note: previous declaration of 'rcu_set_exp_qs_needed_cpu' with type 'void(struct rcu_data *)'
     552 | void rcu_set_exp_qs_needed_cpu(struct rcu_data *rdp);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +734 kernel/rcu/tree.c

   730	
   731	/**
   732	 * rcu_set_exp_qs_needed - Set expedited quiescent state needed flag.
   733	 */
 > 734	void rcu_set_exp_qs_needed(bool value)
   735	{
   736		struct rcu_data *rdp = this_cpu_ptr(&rcu_data);
   737		
   738		ASSERT_EXCLUSIVE_WRITER_SCOPED(rdp->cpu_no_qs.b.exp);
   739		__this_cpu_write(rcu_data.cpu_no_qs.b.exp, value);
   740	}
   741	
   742	/**
   743	 * rcu_set_exp_qs_needed_cpu - Set expedited quiescent state needed flag for CPU.
   744	 */
 > 745	void rcu_set_exp_qs_needed_cpu(struct rcu_data *rdp, bool value)
   746	{
   747		ASSERT_EXCLUSIVE_WRITER_SCOPED(rdp->cpu_no_qs.b.exp);
   748		WRITE_ONCE(rdp->cpu_no_qs.b.exp, value);
   749	}
   750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
