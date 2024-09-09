Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A39B658
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 05:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725859385; cv=none; b=lL74Ep5k03fwr8aWhdH09vArJgL4hO9vuQeVwBkzuU9hDNJ3YSeKa+u4gvcxO1TYyVm7MeDY/qwg0YUhv9p75eyibdEH+pU9yad7E0rRw3pUxcqjYQkgQ6tYHtw0HUoTyps/6790cfzJCH1B30oBm6I9UgyX8TrfhMcVAWAMOVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725859385; c=relaxed/simple;
	bh=6ON845Zb+lYXiSr0kmK4nA7mqD+/7YplIJBwt4Wz+1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SMcSH0qgmRGH6iKiiLJpK9pVLHAJM1uL9BF8olCs2WBHd56kwqnvunOhL972O7rQznzg1DF2+9i0T1tYVjmGKHGD0Q8D06NUBWH7/Z4IrpQVvIx94NpfoO6ECJu/qnG3qi3BwConkm0Q6kDOqpZv/coua2SYfqOSTSe/STghRo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XIXR8syY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XIXR8syY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725859384; x=1757395384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ON845Zb+lYXiSr0kmK4nA7mqD+/7YplIJBwt4Wz+1c=;
  b=XIXR8syYKi8I33+/9Q7Abv/Df4g7cfAiHrsPrewiJ2pQkCEXpTNfs7CN
   q1RKwSwVm0E6RIib75I9MHiFb454wu9MUS9PbqchUhq1BkW/Vo6gdKLU1
   WXGU3gjEnKzBOBb/T7XIXwJb+Xkms504hPB1WTGrmB0Gpa7G3FsgtpHul
   oIMSdSYX61Zuv2wB2IK8TczzNUU+Z9b1ahBQkxmJtZqY/3iqtvxD8kzvL
   mEMsXvfrVuWQ2Pva4EjNn5ybNZ0blgIQDjE6ggZ5t88f3Acu9V44rpUFl
   VdwI8NKlKmW2/aOYaZ6wpx2nYH/EsswnKXbuNiLm+syIZHdjfcy6xuwmP
   g==;
X-CSE-ConnectionGUID: 6IyO8EGYRcKvVBdlI9+Elw==
X-CSE-MsgGUID: FC4ZmdI0TI2FBiYHdZQL0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24725582"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24725582"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 22:22:30 -0700
X-CSE-ConnectionGUID: jZg/NrKeRiOH65YcRXXDxQ==
X-CSE-MsgGUID: 7b+wm+a9SB2/egGb3553Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="67286822"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Sep 2024 22:22:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snWr4-000EKN-2F;
	Mon, 09 Sep 2024 05:22:26 +0000
Date: Mon, 9 Sep 2024 13:21:56 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 19/46] crypto/ecdsa-p1363.c:55:9: error: call to
 undeclared function 'crypto_digest_size'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202409091307.IVtcZvLe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   fc9f4270fb1c1618a497f5bc1cf9eef4ac9032d2
commit: 2ef1ba27967c53d6d87d0d8f29ba943453510418 [19/46] crypto: ecdsa - Support P1363 signature decoding
config: i386-buildonly-randconfig-001-20240909 (https://download.01.org/0day-ci/archive/20240909/202409091307.IVtcZvLe-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409091307.IVtcZvLe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091307.IVtcZvLe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> crypto/ecdsa-p1363.c:55:9: error: call to undeclared function 'crypto_digest_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      55 |         return crypto_digest_size(ctx->child);
         |                ^
   1 error generated.


vim +/crypto_digest_size +55 crypto/ecdsa-p1363.c

    50	
    51	static unsigned int ecdsa_p1363_digest_size(struct crypto_sig *tfm)
    52	{
    53		struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
    54	
  > 55		return crypto_digest_size(ctx->child);
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
