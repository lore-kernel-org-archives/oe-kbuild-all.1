Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7659C202628
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731426930; cv=none; b=cCnAWpPIOebHU/2uvkn9yXNOLHoWcjKuJ2R2SkWVZ137NTA88jZfb5U4ZyS+jM4if5+Y+LJdIY1PH+e7Lifg2iOxYpMYHlQ+sEPbu7baH0vCVAQmJORfNXPr28NA/H/M7e6NJaGbSGrLeMBOdl+Rq5uGJ6QU414aw7y7eWVJEj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731426930; c=relaxed/simple;
	bh=2xxB0rcJjujLxnsFiyGaQskIxx9UAcNYn9c//NU/TcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S8bMK8CD4xsE92IVkM9wJaGISwI0Wc6l0Xgbe9FYbt3ObidtCbYz+ZyG7IkE9L5b1MzE5KSgiPqYj/tECly6ALTGxB5nsQh9SytjTwdqCPoLC5xtnRR1Ar2fMrRqNg2Aq8hb7hLbaXiZ67mMlC6ecp0byD5aeb/DBdu/1c5fGds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/hbQWBw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/hbQWBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731426928; x=1762962928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2xxB0rcJjujLxnsFiyGaQskIxx9UAcNYn9c//NU/TcM=;
  b=g/hbQWBwkrwacv3xhX+BDiDezxi1Ql2dWuPSsisTY4sT8Rx8nPqPHo/G
   NDigvO4meVLHNaX14mDpOh3CGMCMoIyQKyBs3fH2oHCunuEzipDIiQ6gp
   oTF/qGtHdQflAQZOn0T2fUGwcQyh+J4cVzea6QliWTY7t2Wn8P+s6jTtA
   h2x6wQOWqoON6LL5yCf2PRU9IfBbfOfgjJizD54Ubch4U6IJHb1Nrioh1
   8cdNX9wZW7WD6CyKNFp9mWCZt7jyRY2gVeKxy+Od/wGsM2udGpejZg2uG
   fAmfUJvP5Yp89vgCUa0FKgEyQJ91wrg/GRyWuAjd8mQdfQlLgHu53VRJe
   A==;
X-CSE-ConnectionGUID: 2Vg9GJpsRXG6vNZaFB2y/w==
X-CSE-MsgGUID: hNvOjYq5TROYRH83JaoCcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30672548"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="30672548"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 07:55:27 -0800
X-CSE-ConnectionGUID: LVnBEbFkQKWnunmbCCioGw==
X-CSE-MsgGUID: +WtWOqTER26e5QVqnmxSTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="88348799"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Nov 2024 07:55:26 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAtEi-0001UL-1A;
	Tue, 12 Nov 2024 15:55:24 +0000
Date: Tue, 12 Nov 2024 23:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 4068/30000]
 drivers/mmc/core/crypto.c:14:6: warning: no previous prototype for function
 'mmc_crypto_setup_queue'
Message-ID: <202411122318.SqeMpP9N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Satya,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   7e62fa505ac29c320cb5f59527c9ba13421454f0
commit: 555cf12eb672727979bc7b7840c7503f3de27220 [4068/30000] ANDROID: mmc: MMC crypto API
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241112/202411122318.SqeMpP9N-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411122318.SqeMpP9N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411122318.SqeMpP9N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/core/crypto.c:14:6: warning: no previous prototype for function 'mmc_crypto_setup_queue' [-Wmissing-prototypes]
      14 | void mmc_crypto_setup_queue(struct mmc_host *host, struct request_queue *q)
         |      ^
   drivers/mmc/core/crypto.c:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      14 | void mmc_crypto_setup_queue(struct mmc_host *host, struct request_queue *q)
         | ^
         | static 
>> drivers/mmc/core/crypto.c:21:6: warning: no previous prototype for function 'mmc_crypto_free_host' [-Wmissing-prototypes]
      21 | void mmc_crypto_free_host(struct mmc_host *host)
         |      ^
   drivers/mmc/core/crypto.c:21:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      21 | void mmc_crypto_free_host(struct mmc_host *host)
         | ^
         | static 
>> drivers/mmc/core/crypto.c:26:6: warning: no previous prototype for function 'mmc_crypto_prepare_req' [-Wmissing-prototypes]
      26 | void mmc_crypto_prepare_req(struct mmc_queue_req *mqrq)
         |      ^
   drivers/mmc/core/crypto.c:26:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      26 | void mmc_crypto_prepare_req(struct mmc_queue_req *mqrq)
         | ^
         | static 
   3 warnings generated.


vim +/mmc_crypto_setup_queue +14 drivers/mmc/core/crypto.c

    13	
  > 14	void mmc_crypto_setup_queue(struct mmc_host *host, struct request_queue *q)
    15	{
    16		if (host->caps2 & MMC_CAP2_CRYPTO)
    17			q->ksm = host->ksm;
    18	}
    19	EXPORT_SYMBOL_GPL(mmc_crypto_setup_queue);
    20	
  > 21	void mmc_crypto_free_host(struct mmc_host *host)
    22	{
    23		keyslot_manager_destroy(host->ksm);
    24	}
    25	
  > 26	void mmc_crypto_prepare_req(struct mmc_queue_req *mqrq)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
