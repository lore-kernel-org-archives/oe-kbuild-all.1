Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592571C84A0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Aug 2026 02:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786328598; cv=none; b=A5+vHy/miPx6x+ZnzfwBTIzUtKDjvC/6dykkmylAj+QdabTYIX4PNUxdX1rx8LmdEH60r0HbWiRFuwZlJe710H0Vrpi//akGt7XbfZhVXym7/Z0jdZVEWkiVDpSSy2bB2DvbvbvyuE2Kv0goyfmviqweFAQ64ICkJDWCGv1/71U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786328598; c=relaxed/simple;
	bh=agKSlV7WBHZBaplJlG+NeTn8EU/asWdBrID3TaAmlw4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YOLwNu5uy/+WTgrSfzZvMN9VucGXmn970Xtu1txrUPhnaFWr3qH+qD6P+CpJOgE+4grHl7SZSbxHK4bzJSVSY+8oDmle3vSRx/4+Ios3fAlQ0xRK0mjmNuM/2+n+TtrZNs5EBORvlkWoGcxNmRQmXYbbe/sUiXgjSP6Cpx6t0B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YuFpYbsn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YuFpYbsn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786328596; x=1817864596;
  h=date:from:to:cc:subject:message-id;
  bh=agKSlV7WBHZBaplJlG+NeTn8EU/asWdBrID3TaAmlw4=;
  b=YuFpYbsnKe2sCEGdAc67Vy4p7OIQ6bMMLw5mdGfRYvf3CIaeaG/CBnfJ
   Y6Q7TVZbunqZsB0bAjhBhkiXvlSVW7eXdL95NGm9KGHnEpaVTAguNJwkj
   Jsx0R+/Ohg5s51v/4GRTtyPo3AwCWb+4/BVbiPz69d0J3XOV7M2XuWPeU
   w39RV7Et55SFiWMAfSi5YmodQYGw+TGxIdRT8DYVfyN4vUikjdRDCBymi
   ll6xi8oBsXE+opltVAA7cLDDtscomGLekAoPugSbnd51t0i/PAUQ2/blu
   SaMIesi9S2+0kk48vCUqN6HDDVWF6jz5En8AexPZ8sEyvTs8LLrE8rwV7
   A==;
X-CSE-ConnectionGUID: eM2cMo5kRg+jb2ug7FkJOQ==
X-CSE-MsgGUID: WMxhWXXvTL6OMxK5w1a+HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86714944"
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="86714944"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 19:23:15 -0700
X-CSE-ConnectionGUID: l6DtXz98SSqwweGo0u6RoQ==
X-CSE-MsgGUID: ecodq0TXTbm6sLWhGYY4gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="264893527"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Aug 2026 19:23:14 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtFfT-00000000MYA-1DEN;
	Mon, 10 Aug 2026 02:23:11 +0000
Date: Mon, 10 Aug 2026 10:22:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 7538/13846] kernel/rcu/rcutorture.c:2363:
 Warning: missing closing `"'
Message-ID: <202608100935.0Qr9jvEK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6b8c8af514d739d0335f5579b585e02babe8a727
commit: 2178b1a440a1d1c7df1bb527a1ba9f8e471b43a4 [7538/13846] rcutorture: Test RCU readers from hardware interrupt handlers
config: s390-randconfig-001-20260810 (https://download.01.org/0day-ci/archive/20260810/202608100935.0Qr9jvEK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608100935.0Qr9jvEK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608100935.0Qr9jvEK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/srcutree.h: Assembler messages:
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
>> kernel/rcu/rcutorture.c:2363: Warning: missing closing `"'
>> kernel/rcu/rcutorture.c:2363: Warning: missing closing `"'
>> kernel/rcu/rcutorture.c:2363: Warning: missing closing `"'
>> kernel/rcu/rcutorture.c:2363: Warning: missing closing `"'
>> kernel/rcu/rcutorture.c:2363: Warning: missing closing `"'
>> kernel/rcu/rcutorture.c:2363: Warning: missing closing `"'
>> kernel/rcu/rcutorture.c:2363: Warning: missing closing `"'
>> kernel/rcu/rcutorture.c:2363: Warning: missing closing `"'
>> kernel/rcu/rcutorture.c:2363: Warning: missing closing `"'
>> kernel/rcu/rcutorture.c:2363: Warning: missing closing `"'
>> kernel/rcu/rcutorture.c:2363: Warning: missing closing `"'
>> kernel/rcu/rcutorture.c:2363: Warning: missing closing `"'
>> kernel/rcu/rcutorture.c:2363: Warning: missing closing `"'
>> kernel/rcu/rcutorture.c:2363: Warning: missing closing `"'
>> kernel/rcu/rcutorture.c:2363: Warning: missing closing `"'
>> kernel/rcu/rcutorture.c:2363: Warning: missing closing `"'
>> kernel/rcu/rcutorture.c:2363: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2368: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2368: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2368: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2368: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2368: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2368: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2368: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2368: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2368: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2368: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2368: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2368: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2368: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2368: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2368: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2368: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2368: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2695: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2695: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2695: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2695: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2695: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2695: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2695: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2695: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2695: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2695: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2695: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2695: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2695: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2695: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2695: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2695: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2695: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'
   kernel/rcu/rcutorture.c:2690: Warning: missing closing `"'


vim +2363 kernel/rcu/rcutorture.c

  2324	
  2325	/* Return a random protection state mask, but with at least one bit set. */
  2326	static int
  2327	rcutorture_extend_mask(int oldmask, struct torture_random_state *trsp)
  2328	{
  2329		int mask = rcutorture_extend_mask_max();
  2330		unsigned long randmask1 = torture_random(trsp);
  2331		unsigned long randmask2 = randmask1 >> 3;
  2332		unsigned long preempts = RCUTORTURE_RDR_PREEMPT | RCUTORTURE_RDR_SCHED;
  2333		unsigned long preempts_irq = preempts | RCUTORTURE_RDR_IRQ;
  2334		unsigned long bhs = RCUTORTURE_RDR_BH | RCUTORTURE_RDR_RBH;
  2335	
  2336		WARN_ON_ONCE(mask >> RCUTORTURE_RDR_SHIFT_1);  // Can't have reader idx bits.
  2337		/* Mostly only one bit (need preemption!), sometimes lots of bits. */
  2338		if (!(randmask1 & 0x7))
  2339			mask = mask & randmask2;
  2340		else
  2341			mask = mask & (1 << (randmask2 % RCUTORTURE_RDR_NBITS));
  2342	
  2343		// Can't have nested RCU reader without outer RCU reader.
  2344		if (!(mask & RCUTORTURE_RDR_RCU_1) && (mask & RCUTORTURE_RDR_RCU_2)) {
  2345			if (oldmask & RCUTORTURE_RDR_RCU_1)
  2346				mask &= ~RCUTORTURE_RDR_RCU_2;
  2347			else
  2348				mask |= RCUTORTURE_RDR_RCU_1;
  2349		}
  2350	
  2351		/*
  2352		 * Don't mess with interrupt masking in interrupt handlers.
  2353		 */
  2354		if (in_hardirq() || this_cpu_read(torture_in_scf_handler))
  2355			mask &= ~(preempts_irq | bhs);
  2356	
  2357		/*
  2358		 * Can't enable bh w/irq disabled.
  2359		 */
  2360		if (mask & RCUTORTURE_RDR_IRQ)
  2361			mask |= oldmask & bhs;
  2362	
> 2363	
  2364		/*
  2365		 * Ideally these sequences would be detected in debug builds
  2366		 * (regardless of RT), but until then don't stop testing
  2367		 * them on non-RT.
  2368		 */
  2369		if (IS_ENABLED(CONFIG_PREEMPT_RT)) {
  2370			/* Can't modify BH in atomic context */
  2371			if (oldmask & preempts_irq)
  2372				mask &= ~bhs;
  2373			if ((oldmask | mask) & preempts_irq)
  2374				mask |= oldmask & bhs;
  2375		}
  2376	
  2377		return mask ?: RCUTORTURE_RDR_RCU_1;
  2378	}
  2379	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
