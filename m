Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473111;
	b=St2Gab/84HvFl57G1a4C3RxYRMyiCF0V8sS8ovQp+RDOIfe0NUcAX3yAGDIwoqEDCgd4
	 mtq/ocmq5XXGBx1c2Y7iV0IyJF7x9MyOSbn/i8H7K01yvn+L97pUfMQo26GyntR9BTrtl
	 7x1S9eyEHvnY0dxilL8A0D1Mu+rf4MVRFVjXUzQRqyURSPzGq4rCxOYhlyoDhOxjs8wL3
	 iqbgkU2IuGv2yH+R4WWZ2R8Q8h98uOfYExq4O/mOZype1IoBXa74FU8B/yhXswZ55fhcs
	 Pifs4ZmK1Fzc+Q/u01AxM1aYgiLP6h43hq/I1gaYdguXx8q2WiE2pCkGKiBB7pBRtPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473111;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cc7gIPj81fOyKiwHPqpLWPwHB9W993LDOjyrxqrFVaE=;
	b=5h9CRwFIuB1z9dQCSlxThpVEPWgDa6TfrKG67OwFh42+zrzKkceoc3vmmWSAYbRKlPHI
	 NGXZybu+kCj89Uyx5Mp9GVQxh282tiacjZ05jCQYrX5csNZhtE5VH6jNblxNi1pqFDLsH
	 6H4DrIE0Sx8t92HhW/OS2hxdduD4P6HqVM2LWvoPnnJxJw1K0n/aCobqlgs4dznROqzRP
	 BVgzHxqiW8oYhhQDsux7Vt0YUE8Igq4k/soUHAMp1hamrOPR3Hl9EbekdrUBD3K1lNYHv
	 NK+R0oKDnkwqEe4dmZRw1urVeGpfmxfmIoCduzFZ38eP2lPrCqDXJN/pW9h5Vm9FBKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dBptFvIl;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE16A606A33D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 08:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE16A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dBptFvIl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794473111; x=1826009111;
  h=date:from:to:cc:subject:message-id;
  bh=a84ppQVNvH6zV9YzLEAmft3qVLDsLHXL0pkHKZkwaNk=;
  b=dBptFvIlBUBEMbmHGdDcSy41cWpx/UItrlWmJizZVZ7V8Q1VWd5kMpn5
   Qs8yGHFP8VWXDEcHZvQvR4F/FINfJ1oxWar0ZBw6ZusiNIFbJa6/GPW3f
   tBwzBTbRdDZhlLNpyJcGNSP+UgGnsWJ7JDS/njgQA058xtbyX2HpER3dN
   YWjGjjeo6JvHtQ9j2FGfhADQKHcFmTGDrTnIZD4q0CcGwj048Jd04L1OG
   gjQYGnAWlh6hQEg+uuM+DV4Izk+IZcJdBp2XlnZbrDPID3ER69VZeOJpi
   w0tsAGQbxQjXY8Ta8Os+uRVLnw6tI9YFyUbmiJjg0GXBdZbhLFLtdGQrX
   Q==;
X-CSE-ConnectionGUID: 04c+tCrwR0yfSVtGB+Nj0Q==
X-CSE-MsgGUID: UoLM/ZzPTTiUHWdYQgHGRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3278428"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3278428"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 00:45:10 -0800
X-CSE-ConnectionGUID: Hxq+pwObSjucoYOozi9GvA==
X-CSE-MsgGUID: qz/fr7UiRfyXo9qBBedWvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="10492271"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 12 Nov 2026 00:45:09 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRQQa-000000010qT-1yOR;
	Thu, 12 Nov 2026 08:45:04 +0000
Date: Thu, 12 Nov 2026 16:44:58 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 118/128] kernel/sched/alt_core.c:5356:6:
 warning: no previous prototype for 'rt_mutex_futex_pre_schedule'
Message-ID: <202611121629.XxX9PHMh-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Steven,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   0e9b4632056a823b0595507f7fa5d2a638a8defc
commit: ecdb5900a34a8291a8457c0e29cca911c55dbf67 [118/128] sched/alt: [Sync] b715872ef0cc futex: Provide rt_mutex_.*_schedule() equivalents for futex scheduling
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20261112/202611121629.XxX9PHMh-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611121629.XxX9PHMh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611121629.XxX9PHMh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/alt_core.c:5356:6: warning: no previous prototype for 'rt_mutex_futex_pre_schedule' [-Wmissing-prototypes]
    5356 | void rt_mutex_futex_pre_schedule(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:5375:6: warning: no previous prototype for 'rt_mutex_futex_post_schedule' [-Wmissing-prototypes]
    5375 | void rt_mutex_futex_post_schedule(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rt_mutex_futex_pre_schedule +5356 kernel/sched/alt_core.c

  5351	
  5352	/*
  5353	 * Used within the futex syscall context, skips sched_submit_work() because none
  5354	 * its work will be done. Asserts ensure that it is indeed the case.
  5355	 */
> 5356	void rt_mutex_futex_pre_schedule(void)
  5357	{
  5358		lockdep_assert(!(current->flags & (PF_WQ_WORKER | PF_IO_WORKER)));
  5359		lockdep_assert(!current->plug);
  5360		lockdep_assert(!fetch_and_set(current->sched_rt_mutex, 1));
  5361	}
  5362	
  5363	void rt_mutex_schedule(void)
  5364	{
  5365		lockdep_assert(current->sched_rt_mutex);
  5366		__schedule_loop(SM_NONE);
  5367	}
  5368	
  5369	void rt_mutex_post_schedule(void)
  5370	{
  5371		sched_update_worker(current);
  5372		lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
  5373	}
  5374	
> 5375	void rt_mutex_futex_post_schedule(void)
  5376	{
  5377		lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
  5378	}
  5379	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
