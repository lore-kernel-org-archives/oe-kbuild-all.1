Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0667021A421
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760024633; cv=none; b=t9lQHRnz8bUsrY+eKJqKUe+zgY6v4TIeoHoSg8JfhotE1X1+kuxYgZ2dUKUvfAPhkfgGXeSqC6kgA6HD6gkNFnSr1U5ccWKmPnuZ4o8Nb2e5WxJ5g16Ucp7ti7JSXqzOpUGZ1scwtRS1HN8a0C31u55t7QiUIkqXG83KKPVV5MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760024633; c=relaxed/simple;
	bh=mHIVE4C/yxH1E90xBp3/eRpU+afJwpfbBGGG5d9Fnj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pnejetvfQDLGEfEwrAb14OAHPRpKJBEfwD6OSy3ljF1QJvuk/6sHp2D+qyA7mk62mx/PKX/E0Rv0ILitJmb5osfBpkqXqW+koh5lubP/HXCrfPp7F4WlQltGiKIo+NGZi0VqEi4qQijyNhjAjGaWqlitshcpEIo4hlE56OUkj2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNQCn5Tf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNQCn5Tf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760024632; x=1791560632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mHIVE4C/yxH1E90xBp3/eRpU+afJwpfbBGGG5d9Fnj8=;
  b=UNQCn5TfsrpBh581z9VUj+vI213ahIwVfMssWxmn8wde8rIgTz43EEmY
   2YKt8dDikiyVr3ZLZCsv7mU2vaLDNsLI2KLAg4WWt9EQoFi77/BCQZl50
   5k5Qa9B2d/9AAQhf7phheAusyjSOfb3nEq/x5WHrQMlU+CcrlQB9sgBRV
   M9R9iiZ43sFPCWrFe/5kfAQQ+diAP3MHiVJNxjM1L39xa8cVvO+NjpMCj
   9BogHlRRpiHYJmHj1WbmhFqShFdtqQAep0Jc+u8YnHZUKlqmTx6nbVshD
   okbo9HyNOKl9wlG1yINTP2u4KqpUC0jp6JtZKFLce7wAOBvVgbaXEMd2O
   Q==;
X-CSE-ConnectionGUID: CupW+y3sRPyTDCW2gsg94Q==
X-CSE-MsgGUID: eGrihJQASAaUosspq7hv/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="65887004"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="65887004"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 08:43:51 -0700
X-CSE-ConnectionGUID: BteL2XaZQDurGUkfNU7hDQ==
X-CSE-MsgGUID: mHoCpO6mQE2F7bQeMDe5wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="180689071"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2025 08:43:50 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6snz-0000vH-09;
	Thu, 09 Oct 2025 15:43:47 +0000
Date: Thu, 9 Oct 2025 23:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 150/150]
 kernel/events/ring_buffer.c:22:9: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202510092338.jYiZNWEQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   ebf29ad7213c358a4591e96c6b1b5d9d25bd91f8
commit: ef0398cf5cf150364839ffea0b0dd7c71edf2e62 [150/150] perf/ring_buffer: Allow the EPOLLRDNORM flag for poll
config: arm-randconfig-r133-20250727 (https://download.01.org/0day-ci/archive/20251009/202510092338.jYiZNWEQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251009/202510092338.jYiZNWEQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510092338.jYiZNWEQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/events/ring_buffer.c:22:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected int volatile @@     got restricted __poll_t @@
   kernel/events/ring_buffer.c:22:9: sparse:     expected int volatile
   kernel/events/ring_buffer.c:22:9: sparse:     got restricted __poll_t
   kernel/events/ring_buffer.c:170:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer *
   kernel/events/ring_buffer.c:170:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer *
   kernel/events/ring_buffer.c:170:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer *

vim +22 kernel/events/ring_buffer.c

    19	
    20	static void perf_output_wakeup(struct perf_output_handle *handle)
    21	{
  > 22		atomic_set(&handle->rb->poll, EPOLLIN | EPOLLRDNORM);
    23	
    24		handle->event->pending_wakeup = 1;
    25		irq_work_queue(&handle->event->pending);
    26	}
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
