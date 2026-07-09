Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE77240911B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 10:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591241; cv=none; b=kk6FbeI9ABQqjGxXyY8pB5IfENPJ9U8s3NirhNhpb/xrhc8dOd63nxmckTXbmilTErc5wFda7MPt0nbdsA8WBTr7aJGNv20ELILNv90ezdLLNKF1Ghmgz04hDRhuX6SPA8ydrLjawgNK2rHSZNfMfGTwiVjBbjwmXgA9H6SyxF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591241; c=relaxed/simple;
	bh=0cJoZC+qaLhu9Bg6i+Ath8h0hHRAV8J8wL90JZ+AZZE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AZa2kLbWIOS4LVjaTZ3c6CTAGXc11RSJaj0iZVM8LvsOA9BUAc87xccLvaDLGQgvhZ9p+DNmZjJCLPxwUZp0pXK4zab3Z41vk4Ny4QeHGmuecZ4umfuXHta1jqDEVQ1vOnFFE0kGoEKCP4k3+ureDoO5r66TTS2HK98/gz6j9As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SrxL/iEh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SrxL/iEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783591240; x=1815127240;
  h=date:from:to:cc:subject:message-id;
  bh=0cJoZC+qaLhu9Bg6i+Ath8h0hHRAV8J8wL90JZ+AZZE=;
  b=SrxL/iEhFrXAaqnY+Ey92Q/xWcwGBcjLy16629IUlrS0x/0laLFEHka/
   usI96D17qLT/oicD21HpYeUuPnT0KYIGtTiqUzRtMXO/t0l5z95UjfUAK
   1Ufwh+WABVC7EeU2tKiZKPILyVIPOYAwKYufK6hpTLJ/YiRjgpGD8Bd/D
   8qPFRQDm2veCQJNHA+LtrIcothbOiwuuWiITJDXrhVlotgLznPYgDMbzJ
   kZUuHLZYvIYOGtZ/s5y4lEbf/pOUPcfedp4rheDn8zUSGlCNjwqHF/0De
   lGoMw5peL9ygZJFH3L8K8xQ+M0MVaC/DqEkPpNYCahol7zVR12pq0mduH
   A==;
X-CSE-ConnectionGUID: qlYmZuhJSraZjvbChAMxSQ==
X-CSE-MsgGUID: mZStOchbTzqT5TTqTWNzNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71787460"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="71787460"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:00:36 -0700
X-CSE-ConnectionGUID: OmH+vFaKQ8ehc0En6Au0aQ==
X-CSE-MsgGUID: ZKk3Lb4bQzOcoydwEY77DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258845039"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 09 Jul 2026 03:00:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whlYU-00000000HX9-3zxq;
	Thu, 09 Jul 2026 10:00:30 +0000
Date: Thu, 09 Jul 2026 17:59:52 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 mm-commits@vger.kernel.org, Abhishek Bapat <abhishekbapat@google.com>
Subject: [akpm-mm:mm-new 344/369] mm/alloc_tag.c:356:58: error:
 implicit declaration of function 'compat_ptr'
Message-ID: <202607091820.qbjlGhKK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   59e34180e138a293260301c139cf7ee800978533
commit: 27ace96bf8195484c9e9e1a08eb5af5a4e81f9f0 [344/369] alloc_tag: add ioctl to /proc/allocinfo
config: sparc64-randconfig-001-20260709 (https://download.01.org/0day-ci/archive/20260709/202607091820.qbjlGhKK-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091820.qbjlGhKK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091820.qbjlGhKK-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/alloc_tag.c: In function 'allocinfo_compat_ioctl':
>> mm/alloc_tag.c:356:58: error: implicit declaration of function 'compat_ptr' [-Wimplicit-function-declaration]
     356 |         return allocinfo_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
         |                                                          ^~~~~~~~~~


vim +/compat_ptr +356 mm/alloc_tag.c

   351	
   352	#ifdef CONFIG_COMPAT
   353	static long allocinfo_compat_ioctl(struct file *file, unsigned int cmd,
   354					   unsigned long arg)
   355	{
 > 356		return allocinfo_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
   357	}
   358	#endif
   359	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
