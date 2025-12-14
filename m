Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05E828507B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 07:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765697926; cv=none; b=UWBDprkUGUuRwnIG+BMANR50rjiik0GICIecud/fezYbv/Qcbo9zQbiS5AqSc3VQyIBbZWmMKqiVydCti2JtT3I8YyEj/e9FQx9Y+v1EV5sg29tIaJq3Im7pJgY/8gLrH/F2sclUXY15mPSL7N8I+7YINVbCTR0YJjGUGsu9p0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765697926; c=relaxed/simple;
	bh=08XlQ/GPBq9QKfTDHTvjxph05+3V0QDxArHViUxnE7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bBZpSdnDZaWb6zcHb+ITyE7m0g7oPsnG+kjRE+JUoz1uzlhPyF/Z9RmrHOvQhlCvBLSwrw6bBUnZM/VM5Cf1rgXCh6UW/x4NFBITXViRuKkn3Y2t34tTMtm8IMXgwRwvgyq2QMPkA7XdWVj2Ti9F5jSGoBNESr8tLRJB/GdYbDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3HE2QL0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3HE2QL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765697924; x=1797233924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=08XlQ/GPBq9QKfTDHTvjxph05+3V0QDxArHViUxnE7A=;
  b=Q3HE2QL0A1+6onm4/0yLn52VOMJcghwzWoK4n3VeiseCqbz9Bvgd5/NW
   JyZdqQ4MJyo0Q5apoZOxDnqfUSsjuSrQf/gz0dyZb5/pFhcizIROf7Jjk
   PSFeCye7zkEeTvyCB30R5Du5b+44u/RlPiiRGZ0Rw25SN3Z7ZWpBHvQr8
   beNgNECsrWkoYXuXFfRD0iGJBfg9tRtUvtB8dD0S0yXfcM7pVuDnQyjkd
   F7ZUpSIzP8ehJuDZpcDp4uQyquBP4UHS7aSe0cXd+uNk7y0MDyhN2zpI8
   yuvnqzqNJAVqsJx+lb5xWy1BT5glnTH3HlWOhqQDolkdYFCw2bUxNH+3f
   g==;
X-CSE-ConnectionGUID: cNQm+5qMROO+sfOvfXft2w==
X-CSE-MsgGUID: dKrOFfJ6RMWsEXDZJHMRWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="66623062"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="66623062"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 23:38:43 -0800
X-CSE-ConnectionGUID: MizquJn+Ro6v9u5/GTKgnw==
X-CSE-MsgGUID: O6tZ6gbLR+eIeTO/cE3NsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="202553555"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Dec 2025 23:38:42 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUggh-000000002JY-3LBx;
	Sun, 14 Dec 2025 07:38:39 +0000
Date: Sun, 14 Dec 2025 08:38:30 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Gu Bowen <gubowen5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] security/integrity/ima/ima_main.c:645:
 warning: Function parameter or member 'bprm' not described in
 'ima_bprm_creds_for_exec'
Message-ID: <202512140803.11mHUPzh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: b89997c5e3ffa58c43c4cb3547eb0c11b75d0634 [3534/3534] IMA support script execution check
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251214/202512140803.11mHUPzh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140803.11mHUPzh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140803.11mHUPzh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/ima/ima_main.c:645: warning: Function parameter or member 'bprm' not described in 'ima_bprm_creds_for_exec'


vim +645 security/integrity/ima/ima_main.c

   640	
   641	/**
   642	 * ima_bprm_creds_for_exec - ima support exec check.
   643	 */
   644	int ima_bprm_creds_for_exec(struct linux_binprm *bprm)
 > 645	{
   646		if (!bprm->is_check)
   647			return 0;
   648	
   649		return ima_bprm_check(bprm);
   650	}
   651	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
