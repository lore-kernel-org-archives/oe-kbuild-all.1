Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048EC1822E5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 14:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732543753; cv=none; b=DkFzPbLTTJZIWtdNlfhg45PVVIchXCslinxNwIGBEs0OISr7T+teFsAmuSft2RyHz7fb2tGeY0Lt/1kabENBH38qolPIhBWgGvJ5nNvBvcTO7C6ZLenBVAVdPdjqfRj9tKTiIQphiloDc+j+Hd2e8H1xtER3u0dWUmv6ctLkVes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732543753; c=relaxed/simple;
	bh=zjzASUA4AJs+mcjW37FdUGtV2q3dLXARx0gRcOV7Rvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tQLzaV76OvauG3EiukJLptMBcotZstsdbezxoPP1D1vQ/HbpdwJt7fB46XsCv26yTfuKFvoDTynQwUqrGtJZCQ430rj0D4tSqyXTqeqmS+Z2bU2pNCTw111Mpxw3DQmVYteTR74ggxnVORhqLYoo/c5NNShlLE7tMTPwwyrUiNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXoZgbi9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXoZgbi9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732543752; x=1764079752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zjzASUA4AJs+mcjW37FdUGtV2q3dLXARx0gRcOV7Rvc=;
  b=EXoZgbi9VGvoAo7BDJXPBLt9aTWJb7fU9mdiynM0i8TMzNM8YL9rfRwE
   UO+uChRerhOBkB1przvcqGF2joqFlEYMOQHwRZVWVy+mXun1gwDhyi3Wi
   EBS5EeD3YHrW0ohy0nsEwiuWtr42978Bbc0L29gEFCYTITezHpHDI8HhX
   pHkpgbWJ2Jg/pQiphUDXQKrlWgdGQc12djkprJf1bTu8DQi3kRQ9RVlIk
   duF+sqnGx13mMrozXPbRudartt/DfuamrBpuEu3tT/aF1Gx4N32Vsdmzx
   2e0H4jj7PXaUBL6+Otlmb22PPTzdxNpQJB63BG2rirK84d81b1SRzLkPi
   w==;
X-CSE-ConnectionGUID: XTHNzsPRRqaK2edYOKijzg==
X-CSE-MsgGUID: h8HK/42qTaOmJ4DOPylcXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="58058537"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="58058537"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 06:09:11 -0800
X-CSE-ConnectionGUID: qM+vwGIHTIOF1C+EOyMavQ==
X-CSE-MsgGUID: 4nlHHrSxRvSAUX8BTRzmIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="122116174"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Nov 2024 06:09:11 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFZm0-0006TB-0E;
	Mon, 25 Nov 2024 14:09:08 +0000
Date: Mon, 25 Nov 2024 22:08:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 4036/30000]
 drivers/mmc/core/crypto.c:14:6: warning: no previous prototype for function
 'mmc_crypto_setup_queue'
Message-ID: <202411252231.d5z6kBaM-lkp@intel.com>
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
head:   fbf9853a3c7e6b840268e383293c967b267c31c7
commit: 555cf12eb672727979bc7b7840c7503f3de27220 [4036/30000] ANDROID: mmc: MMC crypto API
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241125/202411252231.d5z6kBaM-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411252231.d5z6kBaM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411252231.d5z6kBaM-lkp@intel.com/

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
