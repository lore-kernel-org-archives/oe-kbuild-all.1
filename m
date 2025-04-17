Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2661A1F098D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 06:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870035; cv=none; b=WCd49WA3AFcUzVKVtEqlyRrx2qVSgaOMXhkupBkYpi30CijqGE7Dy2aMUsFZ7wmPVroPhE4Mn11DTBrbItD7sy2EEOTh5qkJV8wPAXWpZGOuz9373SRV0i872agGeSBdK669xjykm9NVBU+0ugG3v2CRzUqPonqjsLpUbvWxSik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870035; c=relaxed/simple;
	bh=APt3LPKEf5Q+WSSXHyKdxv+GUjt1N6b04MF5BYeZUN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kh53oEstSvcPsq1uIvPeb6n9TdHWh+Ih2f1c6BqPExpNHJ2GVmOpwxC41Kw+Loq1dz+7Q+zxA0Ph9TTM9cdi2v8Bzi0t9gwIKTzdYKKfMEuHePebiYfKYQyrl7tHlTYZLicIWA0Nhz2D5TfkD6EOymKPLtLheSaq/WX06Q1JCvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkoRByou; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkoRByou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744870032; x=1776406032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=APt3LPKEf5Q+WSSXHyKdxv+GUjt1N6b04MF5BYeZUN4=;
  b=kkoRByouxQqitzVrY2wDjKVGTewsZlqmjkpLY+tDcqFr4w2PfGM+0fyp
   WgqXNROQVvXR/0oakl/ZVvH6OBYNLQlGElpHxtIvnGQ3IAdVyWXX9PUtE
   NEHNWZbF1/o5b4wt25yeOZczHhNBc2stcgBGwHah/qJtsuePw4aNaJMrB
   +pGlDaHOgFwNlmNK8BFXhqFn8ENCHg83+f/2nTg3UqA7CcKh9uaEQ8pH4
   TKiHIQP0RoO8nZ/bgnYnsEOp6CbYMOs5ZE10mvppqGxH5DPJwE+m9Er1M
   a/f+98ad15uIAXU1Tve4F2KtopEIxoyNuSstTxz60GFKMnJGe6cJTcXGQ
   w==;
X-CSE-ConnectionGUID: kQFKPEhKT/OA/U/f+dkrbw==
X-CSE-MsgGUID: C5CsbSf+Q2mzmtwCdSOMkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45575888"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="45575888"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:07:09 -0700
X-CSE-ConnectionGUID: KdQCNCshQJqP/bwZPdK/wA==
X-CSE-MsgGUID: 4zmjA6NWTQqnM+p3gm4Qkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="161744321"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Apr 2025 23:07:08 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5IOw-000LW1-0C;
	Thu, 17 Apr 2025 06:07:06 +0000
Date: Thu, 17 Apr 2025 14:06:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2862/2862] fs/cachefiles/rdwr.o: warning:
 objtool: cachefiles_prepare_read()+0x218: unreachable instruction
Message-ID: <202504171410.vxZz7s2a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   2affea8965688b8231cf977864ba7539320d5db8
commit: 33ba25cc4869bab81ad31784e7bbb25e5da2a2ad [2862/2862] anolis: fscache,cachefiles: add fscache_prepare_read() helper
config: x86_64-buildonly-randconfig-005-20250415 (https://download.01.org/0day-ci/archive/20250417/202504171410.vxZz7s2a-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504171410.vxZz7s2a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171410.vxZz7s2a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/cachefiles/rdwr.o: warning: objtool: cachefiles_prepare_read()+0x218: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
