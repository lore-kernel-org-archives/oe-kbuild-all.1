Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C3829009C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Apr 2025 17:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745342459; cv=none; b=lfvdSKekOPH8spgxTYmdmEIIk8g+o5JBlRWc/qnLbMio7IMdVMaqt1trJk8ddmRPpllNhEf5ebYcz2lred0bGuy38c5ITfyYUH4VtVFJFMqTQDedzReum5rSNj82IMdo1ALV18n9B2xtX5wPz9bDOskda9yT91NMkwpyHoGTH+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745342459; c=relaxed/simple;
	bh=FBIphwXmieq9cyewg/1/UltMns/M0qBVfL0FvHwYMo4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tlhy/+8s7q2zNWT1CCPu6YOENMd/nmNLv73IKrih7yTimwdUQkxOV8632Z7ZoNeJiLp2SsDnmqOo8SRyxfx7K1MonU0mWpNUVJMoInmOuMbaZ05fq5YR0/8MvpdiJ9z8EfT5ohCsWEby27HmLPYxonVj2gqKKlbHvn5NSGyfQQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+BjY13+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+BjY13+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745342458; x=1776878458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FBIphwXmieq9cyewg/1/UltMns/M0qBVfL0FvHwYMo4=;
  b=l+BjY13+uhUDQoqYWKnNDswRBBjbdpMBFIUGN7C/Cz+PpBwkwnATslOr
   2SVR7NzMc1Jqy4rTimC379Eb1q74teWQud9d+3P0ll0tvIt6pCG0glWiv
   wehJbmzjhXMXzt75GGtaYoPsmyHhHg+qnHc/7VFlJ6tH6VjopFPSPeDFj
   9al+zhfzjgAfHwWF+rYGnCudhaYN2/Wzhg1s4Ldyq7DsTy1gmI+r4Bu1e
   xw8uxzC86IHOFLOcRxCY+ul+1dHpzCSfTXD3ue9RKZLKBqLhRPsihkkGh
   nodKm6epT9DLDqEDicHwhxT0iHFUGTWv/PnfnIUsG2TUFtR0HyjGyrikC
   A==;
X-CSE-ConnectionGUID: 4VWd2J6OQfiHvSn3WWGj5Q==
X-CSE-MsgGUID: JEX0sm9iS0SZEPczGufcBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="72299322"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="72299322"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 10:20:56 -0700
X-CSE-ConnectionGUID: vvEKZ4C3QeO7wAS932FEmQ==
X-CSE-MsgGUID: FmajFkYATgG5aiVlYnHRoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="136161841"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Apr 2025 10:20:50 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7HId-0001Cx-39;
	Tue, 22 Apr 2025 17:20:47 +0000
Date: Wed, 23 Apr 2025 01:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4057/5419] crypto/ahash.c:1058:8-15: WARNING
 opportunity for kmemdup
Message-ID: <202504230118.1CxUaUoX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2c9c612abeb38aab0e87d48496de6fd6daafb00b
commit: 04bfa4c7d5119ca38f8133bfdae7957a60c8b221 [4057/5419] crypto: hash - Add HASH_REQUEST_ON_STACK
config: nios2-randconfig-r054-20250422 (https://download.01.org/0day-ci/archive/20250423/202504230118.1CxUaUoX-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504230118.1CxUaUoX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> crypto/ahash.c:1058:8-15: WARNING opportunity for kmemdup

vim +1058 crypto/ahash.c

  1051	
  1052	struct ahash_request *ahash_request_clone(struct ahash_request *req,
  1053						  size_t total, gfp_t gfp)
  1054	{
  1055		struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
  1056		struct ahash_request *nreq;
  1057	
> 1058		nreq = kmalloc(total, gfp);
  1059		if (!nreq) {
  1060			ahash_request_set_tfm(req, tfm->fb);
  1061			req->base.flags = CRYPTO_TFM_REQ_ON_STACK;
  1062			return req;
  1063		}
  1064	
  1065		memcpy(nreq, req, total);
  1066		ahash_request_set_tfm(req, tfm);
  1067		return req;
  1068	}
  1069	EXPORT_SYMBOL_GPL(ahash_request_clone);
  1070	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
