Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827B01DFD5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 12:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710334132; cv=none; b=ciuaNufDZK3p7yc3F3lLUoHsFjIx87lICNvXGdvXtm38QCmQo+DSz03v/DMbhFxQTCwLIu41j+UbSvXYptrcn/u0k5EjOuUpXl0Kusbty0wPPU2dnuzglbfHQtPiWoSFr8BRg8/Gb6jfnF0zT/r/zHBS9NN+4JIuIO4qI99zFYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710334132; c=relaxed/simple;
	bh=s9Xzh3l8/FOMea6ja9M2hgVPbjJchh+RFF989ybhjOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nikr+PJ1uS++i8pBrsgWEJP8kPJMwyoHVii2Wun3tfTb6E2ijjd4079vvwYM8PJ0WsejrU3m2tOay1cIb+LZux3gxLNrSq7Q3nkxTYJhVb+TQblvi4qUPVYhx6fFqmkbx4NVINE62znTarrnWf6rXXlfT/XjVZ+vRxr7zjayrY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+Jab3Vs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+Jab3Vs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710334130; x=1741870130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s9Xzh3l8/FOMea6ja9M2hgVPbjJchh+RFF989ybhjOc=;
  b=k+Jab3VsSb2+h0NIXvJpvxtY//sxbITu300omuWlF1iDFXwLjiSFxyh9
   Zw06Q+/WIpUle+72v3eYpI29NQbFraWgdgfBQfWsA/0JvA8kZ2EaC1B2p
   Wecu71cgPUEuq3iWFqe8Q8U+VYhURiaymi8431ZyTfTAqxhXepL6BOma5
   PkWcwRTkZVrkQVx72XpHob1q6QRD2uc4p+oSN7908jtr3zAZnuFVov4n0
   GzbSoYPyzHNl/JxAvaYyhcl/xoivGpJmTT8ORmTPYNzAmyUEATxorFiB/
   uBs9vLvuQsOo6RILzmXI3JH3uj3P0Rfb50XXDzJJHSBPsj7PNsPOF1it/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5701547"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="5701547"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 05:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="11814997"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Mar 2024 05:48:49 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkO2I-000CNz-0M;
	Wed, 13 Mar 2024 12:48:46 +0000
Date: Wed, 13 Mar 2024 20:47:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 8452/21854] kernel/ktask.c:80:5:
 sparse: sparse: symbol 'ktask_max_threads' was not declared. Should it be
 static?
Message-ID: <202403132000.KEN5Ibpb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b318937609077b966b3bd130583ee3aaaa4d015a
commit: c48676ef6b6f9cb8497d6264ae9ff71b87630337 [8452/21854] ktask: multithread CPU-intensive kernel work
config: x86_64-randconfig-122-20240313 (https://download.01.org/0day-ci/archive/20240313/202403132000.KEN5Ibpb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403132000.KEN5Ibpb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403132000.KEN5Ibpb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/ktask.c:80:5: sparse: sparse: symbol 'ktask_max_threads' was not declared. Should it be static?

vim +/ktask_max_threads +80 kernel/ktask.c

    78	
    79	/* Maximum number of threads for a single task. */
  > 80	int ktask_max_threads = KTASK_DEFAULT_MAX_THREADS;
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
