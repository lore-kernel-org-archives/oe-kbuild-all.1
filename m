Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2987125A655
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 20:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760040159; cv=none; b=btw9/V9Oe/pDw++Q3Amj+mHp2X3Rps14zPkZhtgcQz6WJid9jZ+PIgRixUl/nLqWbfl9TvIRAjNLPfWeUNI/TFNO1mKubFfB30vokthzhLWf50E2Wvxp55yUDhorZG9Ib3/tYqa2ZTmXg4skX+A+gt9jjS6fI38Ph8vodjxTX1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760040159; c=relaxed/simple;
	bh=aH/nQNbOf1C1fDA05OKHVQZSUxiJwJSjFw576qEgLUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uwDiZ5nirbO2BVNSRpXlwtnyVl79zNUxQ+21of0ubkgqK/UOrxzUp5pW14s/pHtZ345MRY6/RDT4xfIfWyqp/KE9ZmcwwbZujyKF8TeMaHEGWPHzMIP5VZAMp5Lemf8mQhxk8D6PsvlJDSkW1UPOFUgP8JX0uetXmzP1hDYUKiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2f6c1m0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2f6c1m0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760040159; x=1791576159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aH/nQNbOf1C1fDA05OKHVQZSUxiJwJSjFw576qEgLUQ=;
  b=K2f6c1m0oed1XhXE4hwDSlQDixsvHq3B63EodeBNBxUXf9UnbyaAxCeS
   43Iw+6n+y+J7q/uoI/oG3tNzVdsDSxJglUjivLmn7I3chBY9F7uu8PPda
   1u156x7jAXjbKs38WqFQMOvjkyRSqPJSMcINZtBjovTZpRhsnQr50ity3
   5FDLf9uofX7GMtYvX/xOB+GSEUpFE/XE3K47+kc5FokDI425KbpvhegBE
   AhiMA/4Q3+4tvGBD9l5rYD2h2tup+5e5N9+hqXijuDU9/WV91pkDtVXS3
   c/0dNVYduiVEFJVQ9EEiayYFtOB+MjO/KfBFLnwFa9crWy+PjR7CP/HLv
   Q==;
X-CSE-ConnectionGUID: kJ4t8wsoQHiAufY/Tk7dvg==
X-CSE-MsgGUID: 6/p+wWfoTdCSaUhjozGeog==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62301775"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="62301775"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 13:02:38 -0700
X-CSE-ConnectionGUID: GNIShs5iSTuCC2s2NCSuKA==
X-CSE-MsgGUID: /O5fw0onSVqXtzsup9FRyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="184829054"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Oct 2025 13:02:36 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6wqQ-0001MF-1h;
	Thu, 09 Oct 2025 20:02:34 +0000
Date: Fri, 10 Oct 2025 04:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-wrapped-keys-pixel 3/5]
 drivers/soc/google/gsa_mbox.c:73:13: error: implicit declaration of function
 'readl'
Message-ID: <202510100336.iy40BkPQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-wrapped-keys-pixel
head:   ecc5e8a50b95d1f6fc660f096cf5898c504c5faf
commit: d64dd19171cd5ed080da78948efd530080ba42fa [3/5] soc: google: Add driver for Google Security Anchor (GSA)
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251010/202510100336.iy40BkPQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100336.iy40BkPQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100336.iy40BkPQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/google/gsa_mbox.c: In function 'gsa_mbox_mask_irq0':
>> drivers/soc/google/gsa_mbox.c:73:13: error: implicit declaration of function 'readl' [-Wimplicit-function-declaration]
      73 |         v = readl(mbox->base + MBOX_INTMR0_REG);
         |             ^~~~~
>> drivers/soc/google/gsa_mbox.c:75:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
      75 |         writel(v, mbox->base + MBOX_INTMR0_REG);
         |         ^~~~~~


vim +/readl +73 drivers/soc/google/gsa_mbox.c

    66	
    67	static void gsa_mbox_mask_irq0(struct gsa_mbox *mbox, u32 mask)
    68	{
    69		u32 v;
    70		unsigned long irq_flags;
    71	
    72		spin_lock_irqsave(&mbox->slock, irq_flags);
  > 73		v = readl(mbox->base + MBOX_INTMR0_REG);
    74		v |= mask;
  > 75		writel(v, mbox->base + MBOX_INTMR0_REG);
    76		mbox->exp_intmr0 = v;
    77		spin_unlock_irqrestore(&mbox->slock, irq_flags);
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
