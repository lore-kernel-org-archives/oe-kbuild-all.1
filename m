Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992961FBC92
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 08:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758011318; cv=none; b=FeUYwAMfgxXXMRS3V9EQH6P9VJxvmj2x6lj7rLMdD9BEzY9rq6vomGhsI17UddB988vY421UapogNKCe+HvN84rR9SdCQrgSU6rLl28Q6Gliq/baeuCc/GPTCh752OT6Ai+X3dnoF6UOZBAq+O00uiDwjUpIWXMjVcoV1CyeTBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758011318; c=relaxed/simple;
	bh=Vncd2EAZlER9MEbEykRoyTX/d2nPft+UBy1jBeMjh4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TlOPlC/j/JUKb8JtM/bkcpTOXNGfPfxJzW8WZUp5yhQoqKGfUnkbj/PQ8JpDXPKtz2gweaAxMQKHCvQ1yTkAXix1kX15EU5QILiCQYxh/8e0Q99xGQou6SMJQ35wfP4FcjTwrUTGaC4Rpon/4ekOyWr2hjeBQ2Nw9TpfFJgVvQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/BcJnpR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/BcJnpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758011317; x=1789547317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vncd2EAZlER9MEbEykRoyTX/d2nPft+UBy1jBeMjh4I=;
  b=U/BcJnpR+Qa7cou9maeTS9HyRueZJW9k6f6L3wIsW6+W3bR2qS6Y+VP8
   kcuyOKuOMmtpPXsYzqwCBQUJWaDuiCDIMeuG82lIKLaxSeVLvglpuA0BJ
   SELljaN6b/jTuLx3bDzksblb916aVMeWzzBabbcaX1Yg+4clK3QIO6Rmp
   ksVOavEBp7blwIazUuhLpgR9WS2cijJ78TBu7HI06K2q/GpvyywMqxSzc
   wgX1qN4w3cPZGXpwWFuMmBtrz3hsgd2fButb5p20/oDachUxmgxTi88aO
   z+/akL6H9knSbh00wTiYWen1pUczyYYmxn5iD4us4IqbM5HOi0N4Q6hRJ
   Q==;
X-CSE-ConnectionGUID: /OCD5qdwSjWwe9wT29MLaw==
X-CSE-MsgGUID: mQx+NCjoRriSfOaYgy/dQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64089334"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64089334"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 01:28:37 -0700
X-CSE-ConnectionGUID: /PSuz6+9SOGOk163JGh3Qg==
X-CSE-MsgGUID: /ZLQd6sXTAWNEl0bN99Hkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="174424346"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Sep 2025 01:28:35 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyR3A-00006J-35;
	Tue, 16 Sep 2025 08:28:32 +0000
Date: Tue, 16 Sep 2025 16:28:07 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] printk: Use console_flush_one_record for legacy
 printer kthread
Message-ID: <202509161646.Vk8fhX9G-lkp@intel.com>
References: <20250915-printk_legacy_thread_console_lock-v1-2-f34d42a9bcb3@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-printk_legacy_thread_console_lock-v1-2-f34d42a9bcb3@thegoodpenguin.co.uk>

Hi Andrew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on f83ec76bf285bea5727f478a68b894f5543ca76e]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Murray/printk-Introduce-console_flush_one_record/20250915-204736
base:   f83ec76bf285bea5727f478a68b894f5543ca76e
patch link:    https://lore.kernel.org/r/20250915-printk_legacy_thread_console_lock-v1-2-f34d42a9bcb3%40thegoodpenguin.co.uk
patch subject: [PATCH RFC 2/2] printk: Use console_flush_one_record for legacy printer kthread
config: s390-randconfig-002-20250916 (https://download.01.org/0day-ci/archive/20250916/202509161646.Vk8fhX9G-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509161646.Vk8fhX9G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509161646.Vk8fhX9G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/printk.c:3389:13: warning: '__console_flush_unlocked' defined but not used [-Wunused-function]
    static void __console_flush_unlocked(void)
                ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/__console_flush_unlocked +3389 kernel/printk/printk.c

  3388	
> 3389	static void __console_flush_unlocked(void)
  3390	{
  3391		bool handover;
  3392		bool flushed;
  3393		u64 next_seq;
  3394	
  3395		do {
  3396			flushed = console_flush_all_unlocked(&next_seq, &handover);
  3397		} while (flushed && !handover && prb_read_valid(prb, next_seq, NULL));
  3398	}
  3399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
