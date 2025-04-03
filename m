Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667EDB672
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 03:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743651434; cv=none; b=aIh0PrN4apTrCvE6kCwlJKH9lySFbRHjJHO+i96FzwVKcPChfDtmCZ9EM3aPn5ZiJix50A4yvooopnNDL79YDrDel2+If8vRIIGYgZqgHRRZrSDqoWRv+Vmv/+xZ/h5Rfzmht86TyYTmhpZnttpixyCzzfqt8avr7v2k6J0c7qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743651434; c=relaxed/simple;
	bh=sXkJM6R83dNz9qTR9VIDmEJyAIXNYtLVRSAlSn7d+pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NbFUFTSTV8gsCHMnq9pP+GVGFgvENP3LmgzqC9FwA+bPL8Cgk+MPT3JVZC0nMiWEHDl7b1ynanrDv+R5VSE0rOmydFEJRmwAHGwwRE188WK3cRZC5S4l7fdT4z/kHFo7y1dDmm1YIIjf5Rkh1huWW98+k8nDuSOIz6ceU1G3TlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ast2a0m9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ast2a0m9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743651432; x=1775187432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sXkJM6R83dNz9qTR9VIDmEJyAIXNYtLVRSAlSn7d+pQ=;
  b=ast2a0m93tA+7zcHaXyfGc/v9/86MupmK6btRXeIvQV+kYI8WbCR0Qfp
   OdeFfEXIwetjuUy6zr3HFCz0dHw/YXW87E+BRFx4OdiH7XuSooU1Pw9Gl
   ucfJX+dn6GiID3lRGXX4DyV19z60Two49dLEvVuhetAmhr0Y7ksu5EU0J
   VBwfbIJCK2tC/Xc6qdj8wYYsjpWLsxhsAk6pHx6/00e9WpKP4crvxav7q
   nVndDDbRbfjnooAGepQnh9st5TmJarAXayzLxD/wazwTi9qgrhfjlB8Xz
   NBjy9AbO7IX+Hi1AyTwFeqTO6UQ+jIijXgrnk9t3y5WxTN1w5vXl5CcXX
   g==;
X-CSE-ConnectionGUID: K10cCJm+Sk2+KxGkNL2M6g==
X-CSE-MsgGUID: litDyOeeQwifN6fLQ+o1xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62580515"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="62580515"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 20:37:11 -0700
X-CSE-ConnectionGUID: qFoHuouCTx6oIbHhmQ1LvQ==
X-CSE-MsgGUID: sw0BJbDaS5+C3fBVBa/Oiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="131862923"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Apr 2025 20:37:11 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0BO8-000035-0l;
	Thu, 03 Apr 2025 03:37:08 +0000
Date: Thu, 3 Apr 2025 11:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 7/7]
 drivers/crypto/ccp/sev-dev.c:1744: warning: Function parameter or member
 'prio' not described in 'vpsp_queue_overcommit_entry_inactive'
Message-ID: <202504031112.8fQeNT4R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   5bcfae793917ca097364501bd3ff69d749df729e
commit: 1b2ead5b056310461d551d9ef40b061b6d7200be [7/7] anolis: crypto: ccp: Support vpsp ringbuffer overcommit
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250403/202504031112.8fQeNT4R-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504031112.8fQeNT4R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504031112.8fQeNT4R-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/sev-dev.c:1744: warning: Function parameter or member 'prio' not described in 'vpsp_queue_overcommit_entry_inactive'
   drivers/crypto/ccp/sev-dev.c:2036: warning: Function parameter or member 'api_major' not described in 'user_data_status'
   drivers/crypto/ccp/sev-dev.c:2036: warning: Function parameter or member 'api_minor' not described in 'user_data_status'
   drivers/crypto/ccp/sev-dev.c:2036: warning: Function parameter or member 'reserved1' not described in 'user_data_status'


vim +1744 drivers/crypto/ccp/sev-dev.c

  1738	
  1739	/**
  1740	 * Ensure that the 'status' field of cmd statval
  1741	 * in the range from tail to overcommit tail in the queue is 0.
  1742	 */
  1743	static void vpsp_queue_overcommit_entry_inactive(int prio)
> 1744	{
  1745		int tail = 0, overcommit_tail = 0, i = 0;
  1746	
  1747		mutex_lock(&vpsp_rb_mutex);
  1748	
  1749		tail = get_queue_tail(prio);
  1750		overcommit_tail = get_queue_overcommit_tail(prio);
  1751		for (i = tail; i < overcommit_tail; ++i)
  1752			vpsp_set_cmd_status(prio, i, 0);
  1753	
  1754		mutex_unlock(&vpsp_rb_mutex);
  1755	}
  1756	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
