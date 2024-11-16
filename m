Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF4A193416
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 19:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731784926; cv=none; b=Z6Yo0UOKN6oLNgqNgt7fzWhdL/gMnFkcmz6QLPuyuzjqS6K/cEEjcU/njCWsqOSR7HowoEIjgihX9UeyUxjVZp+i8lfv5QRhUWjT+aZV8vO62CPwdA+8Wb/KwfuDXkbX2J8y42GRKSeudDvSkDZzmhtvFJqssbigDlnCRFgXEC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731784926; c=relaxed/simple;
	bh=EZxUymGfUCBP4nEU5M/YFmx5pVd03LC7dltbPR3iuBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cZIBtmStpnzQZdISoH6nnJwzB6HUkIIMiA4hLmEz4Q+IrpNWLkGcIfdU2uFf2eTKQZyExIcKgh+h3h/6lJ/ZM/kmKIMIQTZiDCSPGq5HInuMmEW2+pFjiEbVQgUtkryEEfTaz3NB0mDUCaNXSPuVHqkgCRjqiB2/e7aX1ozOkDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1021M8z; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1021M8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731784924; x=1763320924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EZxUymGfUCBP4nEU5M/YFmx5pVd03LC7dltbPR3iuBk=;
  b=I1021M8zC2CWO3sOi4TSTYsp0NDxGTf2TFp6yFJyeI0HJc8DiP8wi/Ac
   zU85T9cqIzHBCvodf3Qqe2OV/LlzNIy9zoI4EW1lfw5bc9X3aphgzgjpB
   fU66TH0UktCf0kgiekT0a6xkYNbKoOurCm8ZJMnp5MqILw1TQLX9zmNaV
   yVsFR8WDWwl16R4zp8MxT9Zr6x1ZMeqarFMwxW35jzxNsZB02HZU1BlpL
   4fwKxuFCb8j0BlgkEayI1x0YppprpUJkG0ZAjkt+2AjNG/Gmc7bFHc7gk
   AekR56NsY1IcLWbQCbd1lfBBWbt5RtssKfD8orm+9n9IILo5fLHo+y6uW
   w==;
X-CSE-ConnectionGUID: eCTBYgxATdm1upIGFAjAwA==
X-CSE-MsgGUID: vRtmaLmERMytRqJnFrzGBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31840586"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="31840586"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 11:22:01 -0800
X-CSE-ConnectionGUID: 2dvjM8X3TL2rptqbVpPfjg==
X-CSE-MsgGUID: Wi9BVswGS5mivbvszJSlCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88849459"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Nov 2024 11:22:01 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCOMo-00013f-1H;
	Sat, 16 Nov 2024 19:21:58 +0000
Date: Sun, 17 Nov 2024 03:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Gu Bowen <gubowen5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] security/integrity/ima/ima_main.c:645:
 warning: Function parameter or member 'bprm' not described in
 'ima_bprm_creds_for_exec'
Message-ID: <202411170343.CvgDZzI7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c547c6bbe6b6a9cedf63d7cdadb2529404df633
commit: b89997c5e3ffa58c43c4cb3547eb0c11b75d0634 [1474/1474] IMA support script execution check
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241117/202411170343.CvgDZzI7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170343.CvgDZzI7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170343.CvgDZzI7-lkp@intel.com/

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
