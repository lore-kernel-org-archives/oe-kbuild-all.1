Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF7715383D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732532503; cv=none; b=QDI5lWFqy5W3CVV9J9atlwZsepjzdhmrGfyv0T2JMzeOT3hjPHeTcCSJ03E6+oaLLMw+LILtF0yXnr/pa6TP7U54GQJYRxDKN9R+6igjZPrii9Cvi17v55H9JOkTyfGJVv3CJ1QN4O590RCvPCISMp3Ty587o7CiDX8cDBIvjMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732532503; c=relaxed/simple;
	bh=GeS/sXxisUKXRaBplCuUvRUYY2y3FwDw/tUjarGxM8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rrQD8U5t325nK+HRzFOb26uNrXZelk/Av5duaGYVZrZgpfeVW7qB6GGfQn6vQmvy9KnC7fHqQeQ+gk16I3P0eUNdGahgVe7L+K+7Fk8AafghC0KonYsRHwQ4/SyjrChh2khjv47sHnbqiKdb05PdsBQkC+IBgLpu2cQ6cAGvaBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/JO/BBZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/JO/BBZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732532502; x=1764068502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GeS/sXxisUKXRaBplCuUvRUYY2y3FwDw/tUjarGxM8c=;
  b=X/JO/BBZsq9FoBPAgSepQDH9/wDpV7MvTayHRnk2H6yrDQku1lM6XcOt
   ihPWsCnkeIdpnzGKMOBfadhmZa4Yj1xy6G+4G/yO6Zm30nGARZNknKWGi
   REvIbPEfxZbK6kYkfWPrZlIuaR+XkFQ99kdOKUIFsKhwIK88BMPQTsJTx
   7Q3Wke3i+ZzptWcL8tg7lG0VTyTz0QFh4lQ8Qwnw3Z6W/AaqnU4onyMSU
   KB17HI5sbfUxBGRGfcApKk2HP2GWk+w0K/THirpTBPrQtmYnpT/T4kDyN
   CHGeMEA7BQcSVwZdj0ZIe0rpZckuBqf1/8WDHp4RSddMQxlAEDsZFdsNe
   Q==;
X-CSE-ConnectionGUID: 0J9cQkrjThePhwJ0RO2fwQ==
X-CSE-MsgGUID: yPZSz+1uSP6SsvAeR6EerQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43290702"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="43290702"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 03:01:41 -0800
X-CSE-ConnectionGUID: ccBqSayKQzqXPCjAbi0s0g==
X-CSE-MsgGUID: yQtFq9sESequ5iKA/b7YGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96289495"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2024 03:01:40 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFWqY-0006BK-05;
	Mon, 25 Nov 2024 11:01:38 +0000
Date: Mon, 25 Nov 2024 19:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfs-6.13-fixes 159/160] fs/xfs/xfs_dquot_item.c:235:1:
 error: expected identifier or '('
Message-ID: <202411251823.Vvjhxn42-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfs-6.13-fixes
head:   90f5ef1b89eb33844fc8254ba587ba0616c0bf26
commit: 96b52de46213f7649b154a413fd9dfcf65b2f109 [159/160] xfs: attach dquot buffer to dquot log item buffer
config: i386-buildonly-randconfig-002-20241125 (https://download.01.org/0day-ci/archive/20241125/202411251823.Vvjhxn42-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251823.Vvjhxn42-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251823.Vvjhxn42-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_dquot_item.c:6:
   In file included from fs/xfs/xfs.h:26:
   In file included from fs/xfs/xfs_linux.h:25:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/xfs/xfs_dquot_item.c:235:1: error: expected identifier or '('
     235 | xfs_qm_dquot_logitem_precommit(
         | ^
   fs/xfs/xfs_dquot_item.c:231:48: note: expanded from macro 'xfs_qm_dquot_logitem_precommit'
     231 | # define xfs_qm_dquot_logitem_precommit(...)    ((void)0)
         |                                                   ^
>> fs/xfs/xfs_dquot_item.c:235:1: error: expected ')'
   fs/xfs/xfs_dquot_item.c:231:48: note: expanded from macro 'xfs_qm_dquot_logitem_precommit'
     231 | # define xfs_qm_dquot_logitem_precommit(...)    ((void)0)
         |                                                   ^
   fs/xfs/xfs_dquot_item.c:235:1: note: to match this '('
   fs/xfs/xfs_dquot_item.c:231:47: note: expanded from macro 'xfs_qm_dquot_logitem_precommit'
     231 | # define xfs_qm_dquot_logitem_precommit(...)    ((void)0)
         |                                                  ^
>> fs/xfs/xfs_dquot_item.c:235:1: error: expected ')'
     235 | xfs_qm_dquot_logitem_precommit(
         | ^
   fs/xfs/xfs_dquot_item.c:231:53: note: expanded from macro 'xfs_qm_dquot_logitem_precommit'
     231 | # define xfs_qm_dquot_logitem_precommit(...)    ((void)0)
         |                                                        ^
   fs/xfs/xfs_dquot_item.c:235:1: note: to match this '('
   fs/xfs/xfs_dquot_item.c:231:46: note: expanded from macro 'xfs_qm_dquot_logitem_precommit'
     231 | # define xfs_qm_dquot_logitem_precommit(...)    ((void)0)
         |                                                 ^
>> fs/xfs/xfs_dquot_item.c:253:19: error: use of undeclared identifier 'xfs_qm_dquot_logitem_precommit'; did you mean 'xfs_qm_dquot_logitem_format'?
     253 |         .iop_precommit  = xfs_qm_dquot_logitem_precommit,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           xfs_qm_dquot_logitem_format
   fs/xfs/xfs_dquot_item.c:45:1: note: 'xfs_qm_dquot_logitem_format' declared here
      45 | xfs_qm_dquot_logitem_format(
         | ^
>> fs/xfs/xfs_dquot_item.c:253:19: error: incompatible function pointer types initializing 'int (*)(struct xfs_trans *, struct xfs_log_item *)' with an expression of type 'void (struct xfs_log_item *, struct xfs_log_vec *)' [-Wincompatible-function-pointer-types]
     253 |         .iop_precommit  = xfs_qm_dquot_logitem_precommit,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 5 errors generated.


vim +235 fs/xfs/xfs_dquot_item.c

   233	
   234	static int
 > 235	xfs_qm_dquot_logitem_precommit(
   236		struct xfs_trans	*tp,
   237		struct xfs_log_item	*lip)
   238	{
   239		struct xfs_dq_logitem	*qlip = DQUOT_ITEM(lip);
   240		struct xfs_dquot	*dqp = qlip->qli_dquot;
   241		int			error;
   242	
   243		error = xfs_dquot_attach_buf(tp, dqp);
   244		if (error)
   245			return error;
   246	
   247		xfs_qm_dquot_logitem_precommit_check(dqp);
   248		return 0;
   249	}
   250	
   251	static const struct xfs_item_ops xfs_dquot_item_ops = {
   252		.iop_size	= xfs_qm_dquot_logitem_size,
 > 253		.iop_precommit	= xfs_qm_dquot_logitem_precommit,
   254		.iop_format	= xfs_qm_dquot_logitem_format,
   255		.iop_pin	= xfs_qm_dquot_logitem_pin,
   256		.iop_unpin	= xfs_qm_dquot_logitem_unpin,
   257		.iop_release	= xfs_qm_dquot_logitem_release,
   258		.iop_committing	= xfs_qm_dquot_logitem_committing,
   259		.iop_push	= xfs_qm_dquot_logitem_push,
   260	};
   261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
