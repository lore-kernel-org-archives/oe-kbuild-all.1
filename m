Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262871922C4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Apr 2025 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338133; cv=none; b=Lz8R0X1n0jUzIcoXmqe8Q4JtlUKUPmOjrhWQjcec+0c/UQT5yu4OoUqDPj+zpAGdTHyMEZoZyEh+lyAYAFKmGY6KwiBCAHuTy/e31CGFbcEL9QQ0QL6Su+BSyIEM1T/6l8/yjRi7j6P/9lxNkc4K+oRJvSK1yYIiiaunQyG306Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338133; c=relaxed/simple;
	bh=6vBdqn/6SjM5ifSy8wclyXbXw1Fj3kJq22Nb37p9VDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CcLEMeFThLVAUD+gPes4Qu525Sy113hOzuOGDWMIshr924Rsh1sLlNsrJkUjEN/JCDCI1IN/iXupPNkHNOkqe7mNHAEnT1SuL58E+grKBRzTHFOKInMUFQV2K/eT6AOQcPw70Cc4qFxdLrFN8dHYgch3joZltJHqsZtrhUzZPoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4maBT/9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4maBT/9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745338132; x=1776874132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6vBdqn/6SjM5ifSy8wclyXbXw1Fj3kJq22Nb37p9VDc=;
  b=d4maBT/9g3QNEGNzpmUEwj0NElDb/THwkx+8E397B9y1jiTZzm9ngd9y
   ZHrhqpWF1IDp+Rlb3CLpPs+QnJJT+BwsIedwdfF+Y+XTJWrS2c5cKyDaj
   Jmprj6e3hj0WJo0YvZBX10w1y/dgqWh2e5KRgc4Ur/8jdJ8rn5+6iIg8a
   rcSfN1Fj7y/zzG4hP/S6N2WJ9Y6zS6irT2hS+iouv1DR1Hb2I6FZXyANl
   kTA5FQnGX9wacS3MO4ORs0iBnZwTtXSScldBvk7TGDEhU0oByIme5Khng
   aCCCFUUGU85H8zWmWADMTQBqVSyuBNEjiaTFqA2j8fFt8Hzwryjma011X
   Q==;
X-CSE-ConnectionGUID: 6R2IE6s8SRep1eGAKRyJWQ==
X-CSE-MsgGUID: tkULOWfNQ9Kr1kUPEMR69w==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="69396442"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="69396442"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 09:08:45 -0700
X-CSE-ConnectionGUID: jo0HP+glQfyjhY6lvekSJQ==
X-CSE-MsgGUID: Dg+8cG5jSrmVI8uCvgf5oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="131802800"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Apr 2025 09:08:45 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7GAs-00019t-1Q;
	Tue, 22 Apr 2025 16:08:42 +0000
Date: Wed, 23 Apr 2025 00:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4012/5419] crypto/acompress.c:616:8-15: WARNING
 opportunity for kmemdup
Message-ID: <202504230004.c7mrY0C6-lkp@intel.com>
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
commit: 097c432caaa6d91f87732fe991cb08139e31101a [4012/5419] crypto: acomp - Add ACOMP_REQUEST_CLONE
config: nios2-randconfig-r054-20250422 (https://download.01.org/0day-ci/archive/20250423/202504230004.c7mrY0C6-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504230004.c7mrY0C6-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> crypto/acompress.c:616:8-15: WARNING opportunity for kmemdup

vim +616 crypto/acompress.c

   609	
   610	struct acomp_req *acomp_request_clone(struct acomp_req *req,
   611					      size_t total, gfp_t gfp)
   612	{
   613		struct crypto_acomp *tfm = crypto_acomp_reqtfm(req);
   614		struct acomp_req *nreq;
   615	
 > 616		nreq = kmalloc(total, gfp);
   617		if (!nreq) {
   618			acomp_request_set_tfm(req, tfm->fb);
   619			req->base.flags = CRYPTO_TFM_REQ_ON_STACK;
   620			return req;
   621		}
   622	
   623		memcpy(nreq, req, total);
   624		acomp_request_set_tfm(req, tfm);
   625		return req;
   626	}
   627	EXPORT_SYMBOL_GPL(acomp_request_clone);
   628	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
