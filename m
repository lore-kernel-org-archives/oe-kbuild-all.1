Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED5823AD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Dec 2024 23:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734998156; cv=none; b=DOtqqKT1rTgysdHr1ZExM+7O+RBKajSUFBwj5TxSe2gzPGl8H3z7NbOChAOxSm2FG9LnVAosLqBzfrIqs+PimWIDtrC6NfZeZaKlTdtw8r4IDjt1UIa8Y8UtbMQRFP2YPVOLEcMqUJ2ZAEVJ+YiZw9YLOyqLgdtNLzUog8NIcUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734998156; c=relaxed/simple;
	bh=nrqgW9jct2EJ81LmsXqXvPKqEh8zrKDixa5RtMI/Fvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aNMnfekbM1/6jeUlGpFzwU+ql58Wg6l4YGIwn7xXZfyIP2o4KtVzRpvWUWETRpJVBD/pXFGUcAPunBXiMUnnV2LNHC0s8akxtKyxQFRsyh2vCub8WrxIlrGJ3jzTbfrwEySjdYyxqlK14VfnMZ/IGo6qHLTKEdj78PE/guuq/38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZfQSQfz7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZfQSQfz7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734998155; x=1766534155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nrqgW9jct2EJ81LmsXqXvPKqEh8zrKDixa5RtMI/Fvk=;
  b=ZfQSQfz75bwvIK/1lLIiZkepHcI+enm1FCv3WFrSjRATMfT9Tx7punxx
   raiD9HEmOkKSbFDyRlP+EH+42MHUD2rK0deohHeKLbiW4DBwaMY2LSBJZ
   8hsc8dSYE3mxJCesg72v5MBRnjxHtl8Bbpw8rOiCHMOAjN5A7Hr/ysXqt
   DU+5ab5dWGk6JWjVHDCecJc4MvFhI0H/hYf0BT+k/WT9+FamAhit8qpFe
   +0ieHH4u/1rP6pOZ3Vh5yb6xzpYC55/ut0bu8YtqB/NPmOiZhYx1bQT5f
   urm5/m7FJIy3qBT0zJAca5CpP9ebIXN8F+H/kGML+vlPigAF7CMxmZcRW
   w==;
X-CSE-ConnectionGUID: gPSRiUMxRc2AMlYAunKSrg==
X-CSE-MsgGUID: SC19D57ESDWcManOvmUPfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="35350365"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="35350365"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 15:55:54 -0800
X-CSE-ConnectionGUID: Ccx4H2ToRzqxSWVnwYbCrQ==
X-CSE-MsgGUID: udPab+b6TlmFYgvX0Cw7xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100167924"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Dec 2024 15:55:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPsH8-0000hl-2q;
	Mon, 23 Dec 2024 23:55:50 +0000
Date: Tue, 24 Dec 2024 07:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 28/32] kernel/events/core.c:6944:17: error:
 implicit declaration of function 'unwind_user_deferred'; did you mean
 'unwind_user_next'?
Message-ID: <202412240754.LALvdqAo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   b610703fefd5a3a992e07a383e2e6f6cbf9a41c8
commit: ea5b03d9c57dc5e8656b844f96a4ca3b4ab73317 [28/32] perf: Add deferred user callchains
config: i386-buildonly-randconfig-002-20241224 (https://download.01.org/0day-ci/archive/20241224/202412240754.LALvdqAo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240754.LALvdqAo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240754.LALvdqAo-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/events/core.c: In function 'perf_pending_unwind_irq':
>> kernel/events/core.c:6944:17: error: implicit declaration of function 'unwind_user_deferred'; did you mean 'unwind_user_next'? [-Werror=implicit-function-declaration]
    6944 |                 unwind_user_deferred(&perf_unwind_callback_cb, NULL, event);
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 unwind_user_next
   kernel/events/core.c: In function 'perf_event_init':
>> kernel/events/core.c:14218:9: error: implicit declaration of function 'unwind_user_register'; did you mean 'unwind_user_next'? [-Werror=implicit-function-declaration]
   14218 |         unwind_user_register(&perf_unwind_callback_cb, perf_event_callchain_deferred);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         unwind_user_next
   cc1: some warnings being treated as errors


vim +6944 kernel/events/core.c

  6938	
  6939	static void perf_pending_unwind_irq(struct irq_work *entry)
  6940	{
  6941		struct perf_event *event = container_of(entry, struct perf_event, pending_unwind_irq);
  6942	
  6943		if (event->pending_unwind) {
> 6944			unwind_user_deferred(&perf_unwind_callback_cb, NULL, event);
  6945			event->pending_unwind = 0;
  6946		}
  6947	}
  6948	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
