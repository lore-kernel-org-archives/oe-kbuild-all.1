Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0873612CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 02:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787020212; cv=none; b=YimIwO+zf/tI+vmLJFvCZ252S9UvNA5amVyyKkZjuuZ3p/1Dcp5dAD+0o6zI+46rQwpW+8mPdaXrNkVssPVABYMToGaygPfFLjOkzywoOOsUfdXMoeaxrmsSv+UfLRDg95zfOmgunsl5F4s38HqgxRODh7q7LKG9ePJzgUjMUSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787020212; c=relaxed/simple;
	bh=TpDZld1137Vw9fcsiDXyuy3OHh2qiRneuw8isnQLqlU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qtmg5FlLGf63LyHOoCQTxyYHMCsJB+AqjXbwcVFDm+5L5nRTMbpXtYTP5rK4lQeqfjOTTJA82FRfDux9jN0h4slVHlSv0yCyojtQb9bxDtsrbGECHyDWnKQB5Ndl2xUJQ/sFOAm1Hat8uhoM5Duh6rruIEd1M65ihahNo0TEURg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgJOoJyj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgJOoJyj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787020210; x=1818556210;
  h=date:from:to:cc:subject:message-id;
  bh=TpDZld1137Vw9fcsiDXyuy3OHh2qiRneuw8isnQLqlU=;
  b=fgJOoJyjoWbqxn1/lsYX7QhOT4T9uoIodv9zWuuK73Vpak832ur8hhP/
   WG0F51Q49SAOoB49NbczxJCJ3o8PHt4uxtgfCVk9RE9PiXNGV07MgJaxJ
   qQZwvwzJBUtc5o1HQGsmwvcuH+NHB7Woqm1lCTSp6/j39SzGviP8OKEkC
   LaraPsC9MHGSFd6oDN4AtWsc88FrUXZg9Vv49MOVZMZ0/OxaGxktvWB3O
   T9c3e3MdPoe+DG8b9E0zvQCss4baBiUTv6csA+SY6fbcMYxcF4wo/n9iC
   V3zO9t0TkOyqzErfrSAYt50UfYdvcw18VipHh8TFe/GhZ2n8VoIcfaXcr
   g==;
X-CSE-ConnectionGUID: vIqzWdMJSR6Wi6T3dAdspw==
X-CSE-MsgGUID: LF2oF8VXTqKPHSA+3mBimA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98168250"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98168250"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 19:30:09 -0700
X-CSE-ConnectionGUID: 9EXEnzu5Q+ah6F14RVxfyg==
X-CSE-MsgGUID: PETkQ1lFRta1AY46K0BrfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="260865185"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Aug 2026 19:30:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ww9aX-00000000e3E-3LF5;
	Tue, 18 Aug 2026 02:30:05 +0000
Date: Tue, 18 Aug 2026 10:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:collapse/rfc-v1 66/76] mm/madvise.c:285:13: warning:
 'mark_vma_lock_dropped' defined but not used
Message-ID: <202608181050.GhC4SHmh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git collapse/rfc-v1
head:   efac4ce42bf9ea34a32d1563fe3370ee837a751f
commit: 0d2ea7c0b6b1a192e14fa351107df1ebec90a43b [66/76] mm/madvise: collapse under a per-VMA read lock
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260818/202608181050.GhC4SHmh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181050.GhC4SHmh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181050.GhC4SHmh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/madvise.c:285:13: warning: 'mark_vma_lock_dropped' defined but not used [-Wunused-function]
     285 | static void mark_vma_lock_dropped(struct madvise_behavior *madv_behavior)
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/mark_vma_lock_dropped +285 mm/madvise.c

   278	
   279	/*
   280	 * The VMA-lock counterpart, for a behaviour that releases the VMA it was handed
   281	 * and locks what it needs for itself.  The walk has nothing left to release,
   282	 * and unlike the mmap_lock case it has nothing to carry on with either: the VMA
   283	 * fast path applies to one VMA and returns.
   284	 */
 > 285	static void mark_vma_lock_dropped(struct madvise_behavior *madv_behavior)
   286	{
   287		VM_WARN_ON_ONCE(madv_behavior->lock_mode != MADVISE_VMA_READ_LOCK);
   288		madv_behavior->lock_dropped = true;
   289	}
   290	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
