Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2F6A31
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 01:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728179619; cv=none; b=YOv3BXojcDNxqGUM5ysnyf4t7RGZuoh2o0TZ27vv4WgnPRubHqsuCyWNURyUNR4qxFBO14r/B6feyuq2q/keBMpIExyORvLcRioBhj87DHTEbMATrdyCDVwt661F3akYdbNm3YsBsfx/wD6oUQSXbnnXxfOOCiouR5SZB/axMuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728179619; c=relaxed/simple;
	bh=GPqUBx/MC1tji/DgZerY8CB4eiSxwVhumn6C36OrqWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mmIQbg2YTNiZm1AcjJt5LoJDaBs8lH9J8n0UEffJ75yQHQI3exVTGAqFtstyuq62J6J5ztl41mHxq7Xi8Tq3p73oMwZ7LnW8zEJKN6uwJyZzA9dv/z0bgy5Q4MzDaMuoQ04fU6nIoCxEdc3zLV16vlf+eIDXCPTlzgrLMbeCG4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egfkloiU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egfkloiU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728179617; x=1759715617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GPqUBx/MC1tji/DgZerY8CB4eiSxwVhumn6C36OrqWo=;
  b=egfkloiUaX5UQSbPICna1istwLZJEChHcUQaJiw8XjWDi7dOwZKKbxNO
   nld1bUCedzvIDdStO0X8Agvkemc2ZkvZAZQytuUZPnaJpYoY9aH3EjSbk
   0z5w+j6NgexjitwEk7U5l62sBsxx4axZvUXLgLpxD5J3V3ck4EZK4bA+R
   lHfEJBPCMQIyWpIlaoFyFp8cPKRIjlnYYlV7cVCFEwrDC4schUDZ6AF8d
   u7pP1oALe5JuAv2PU56OF616ZuevHcTpY3Q20TEej4OyF9VRiYWLV4Dco
   DbJWwUNQ+oTHwBvZAjTEcwVKz3oYkfFl/8orj04TmDg23LS4fJk1yAATh
   A==;
X-CSE-ConnectionGUID: LTiFfMXBR1iLIdIWR9JPcg==
X-CSE-MsgGUID: qBwIoIniQ5yYEBimTGvoAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="37964118"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="37964118"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 18:53:36 -0700
X-CSE-ConnectionGUID: DTs+THcATqut1Vuf6d8kaQ==
X-CSE-MsgGUID: fR/LA/wiQjS5soiHimR2JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="79671265"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Oct 2024 18:53:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxGSj-0003Wg-0n;
	Sun, 06 Oct 2024 01:53:33 +0000
Date: Sun, 6 Oct 2024 09:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_next_wrap 4/9] include/linux/cpumask.h:291:6: error:
 use of undeclared identifier 'n'
Message-ID: <202410060952.EmE4OVrn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_next_wrap
head:   064db2e196607c2f2afa41380b0c9adf68a239d6
commit: fd224778f474e339cce1fe59438ee07f446a02d7 [4/9] cpumask: temp cpumask_next_wrap__
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20241006/202410060952.EmE4OVrn-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060952.EmE4OVrn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060952.EmE4OVrn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hardirq.h:5:
   In file included from include/linux/context_tracking_state.h:5:
   In file included from include/linux/percpu.h:5:
   In file included from include/linux/alloc_tag.h:13:
>> include/linux/cpumask.h:291:6: error: use of undeclared identifier 'n'
     291 |         if (n != -1)
         |             ^
   include/linux/cpumask.h:292:17: error: use of undeclared identifier 'n'
     292 |                 cpumask_check(n);
         |                               ^
   include/linux/cpumask.h:293:67: error: use of undeclared identifier 'n'
     293 |         return find_next_bit_wrap(cpumask_bits(src), small_cpumask_bits, n + 1);
         |                                                                          ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:119:11: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     119 |                 return  (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:11:
   include/linux/signal.h:119:27: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     119 |                 return  (set1->sig[1] == set2->sig[1]) &&


vim +/n +291 include/linux/cpumask.h

   286	
   287	static __always_inline
   288	unsigned int cpumask_next_wrap__(int start, const struct cpumask *src)
   289	{
   290		/* -1 is a legal arg here. */
 > 291		if (n != -1)
   292			cpumask_check(n);
   293		return find_next_bit_wrap(cpumask_bits(src), small_cpumask_bits, n + 1);
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
