Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C67D1C2443
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718492; cv=none; b=QCK9Tl0WmPlXcLAevmFEIX7eSW+gQFjxqWxyX7VrkKUx37IINhY5PCKARcg/g6ZK/5KpGU/0GcjVxvE9qFs2rSqBcWnhVCYBPx0MsBL05oZHclMao2aMbn9PMn6wzhoZjx0YvO1+NNdFXOp/FPZ8RGj3TNAJVZAPLHZjZJQJ00k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718492; c=relaxed/simple;
	bh=GjZG5wVCAPvOIvP1OuxPVitKYlGNJVSorP73l+04uw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q8Y8MCm2ySmWs6wcdx7ZFGrk+jegIpBMfaQW4y6Nq50Myhewmrm2IFCneExMAMIskBfm8jwDGdFoT4ihCdEA7+OgfIzhHoclkc8PR7D18EvIVRxuagY+Meine+x75A+UHzchTv7y/Jb4BWRixiB36ab9s7ELrS56QIYz0KTzmXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbBuoHPz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbBuoHPz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730718490; x=1762254490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GjZG5wVCAPvOIvP1OuxPVitKYlGNJVSorP73l+04uw8=;
  b=YbBuoHPzcJokXetRM8qzUBKdLu0Igaj0YZ8QTeoqYk9WsXCi6BeNAeXg
   //Ph2u+rpoVl4vWueFoFQWxuBssf+LzDfRlcJLwBTxY8ng1i3/7MrBjXm
   aJZFjjF3cVe7gk8kixwPyFREdTpZMEuJ8CEhN/DN7k8YrnFiD1DLUM5aN
   MyPisi6dtc3WtRVPKz+R2pgE3eZpMWDGjVZWt2UR+E1MXIIcFFs2z5B5n
   S4OBjER8+n9CaXWFjP5kJpOrF95P58AZbbOs3gmf8n0KDkEftVSdEhYIb
   xFbLRbOZs/dGDEux/FV55FS2FRITWeyl7Tfzab8VM4EeDN1864hSShkEa
   A==;
X-CSE-ConnectionGUID: j2Wj6GiZTquXIEWKvpOJ8w==
X-CSE-MsgGUID: QfleCoEpQAKRLYo/bHXrtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="33247647"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="33247647"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 03:08:08 -0800
X-CSE-ConnectionGUID: qMUSCCGzRXKTg7s27/17BQ==
X-CSE-MsgGUID: W8IFWlrrQkaL67NxAtuC6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="87560924"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2024 03:08:06 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7uwG-000kkf-0t;
	Mon, 04 Nov 2024 11:08:04 +0000
Date: Mon, 4 Nov 2024 19:07:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1225/1225] fs/crypto/crypto.o: warning:
 objtool: fscrypt_do_page_crypto()+0x3b8: unreachable instruction
Message-ID: <202411041950.2aZl0qHh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   22dcf78e532857efd97dab81b5edf3aa6f4b2f1c
commit: 3ce03ba72d5afd7df8b73a68e92ea17bcdb09c14 [1225/1225] fscrypt: clean up some BUG_ON()s in block encryption/decryption
config: x86_64-buildonly-randconfig-002-20241028 (https://download.01.org/0day-ci/archive/20241104/202411041950.2aZl0qHh-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041950.2aZl0qHh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041950.2aZl0qHh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/crypto/crypto.c:22:
   include/linux/pagemap.h:401:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     401 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> fs/crypto/crypto.o: warning: objtool: fscrypt_do_page_crypto()+0x3b8: unreachable instruction
   fs/crypto/crypto.o: warning: objtool: missing symbol for section .text.unlikely.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
