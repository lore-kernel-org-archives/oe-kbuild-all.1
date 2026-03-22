Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC06212542
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774172373; cv=none; b=m29DGsA16o5mhxbgx2/sQ2Yt5C90Xg36PNhWIC9aycnFiEOozrQAa3OnyUTsvdV0qI9YPCm4GtAypiPgjUN35bUat6cS/Fd5uu5m5pykLR5821doWxkArfpM6/HnhC/A26dnxRLH89SMGcOWFv5ZxrAeBxz59HPsgbynuobIvXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774172373; c=relaxed/simple;
	bh=rfX4AuonTjJhmaa3Qkk05OqXNXjXNqJbZYL3ufOlztI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWMuOR0R19vBSQFrkGqdPQpCK3p0ROSWOaTVYmZsDl/haS2ExvqJrutoHYtwBJ9fg0NSDXWn7ue7Hvd4WbrPN2EfAlcuqTUDvGPHUsnTAP/0R2DkUmNsB1jBZTA4NBgBodG9Sp5JHjsd8PX5atzrSdVom7VwMNNot9PVMdnyWMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtoeolJv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtoeolJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774172372; x=1805708372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rfX4AuonTjJhmaa3Qkk05OqXNXjXNqJbZYL3ufOlztI=;
  b=PtoeolJvL+CviGVB+kONmUnQa5CdEsM1htrTqUsuH3re6mUbUmV9ApvY
   lfMtW6yOJZdzlHlG5K4L2S9SnOiu8WNAgNEuyP9R9zg4yH9ZQ1f32xAAA
   h9ifoNuTj3HHW4K3XaviJrcwL+Y/kpNU5k4btbMHvdMjZiJnGPLIad/hg
   p6E1eZLTGtjQdPCmhvQTT5CeHaYWOgBnAPrl3uJ1CSb6sJeSlc6Wi1KeD
   1dLNzCOxwAh3fibr9ZnivaiwrwbhmyvQxI3ZVPnaTYd91chT+fH60o2DF
   L14tDwjpCWPB9y5XKjsKKlLk+mDlh5sRi7Zm30GsgfAJocNHkXYiltz/w
   Q==;
X-CSE-ConnectionGUID: fILbWRqnToea2+WJ9xc+Jw==
X-CSE-MsgGUID: Ghx5wyU8SNmMG/wIznqJqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="86566373"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="86566373"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 02:39:32 -0700
X-CSE-ConnectionGUID: GuvVWS1WSCCO+RasVCh/lA==
X-CSE-MsgGUID: hR9BH9AtRgGNMSp7xFBp5g==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Mar 2026 02:39:30 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4FHL-000000001xB-3ZHJ;
	Sun, 22 Mar 2026 09:39:27 +0000
Date: Sun, 22 Mar 2026 17:38:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 4/4] locking: Add contended_release tracepoint to
 spinning locks
Message-ID: <202603221716.rnJ5Wrmr-lkp@intel.com>
References: <51aad0415b78c5a39f2029722118fa01eac77538.1773858853.git.d@ilvokhin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51aad0415b78c5a39f2029722118fa01eac77538.1773858853.git.d@ilvokhin.com>

Hi Dmitry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/locking/core]
[also build test ERROR on trace/for-next arnd-asm-generic/master linus/master v7.0-rc4 next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Ilvokhin/tracing-lock-Remove-unnecessary-linux-sched-h-include/20260320-145758
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/51aad0415b78c5a39f2029722118fa01eac77538.1773858853.git.d%40ilvokhin.com
patch subject: [RFC PATCH v3 4/4] locking: Add contended_release tracepoint to spinning locks
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20260322/202603221716.rnJ5Wrmr-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221716.rnJ5Wrmr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603221716.rnJ5Wrmr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/locking/qspinlock.c:107:17: warning: no previous prototype for 'queued_spin_unlock_traced' [-Wmissing-prototypes]
     107 | void __lockfunc queued_spin_unlock_traced(struct qspinlock *lock)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/qspinlock.c: In function 'queued_spin_unlock_traced':
>> kernel/locking/qspinlock.c:111:9: error: implicit declaration of function '__queued_spin_unlock'; did you mean 'queued_spin_unlock'? [-Wimplicit-function-declaration]
     111 |         __queued_spin_unlock(lock);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         queued_spin_unlock


vim +111 kernel/locking/qspinlock.c

   106	
 > 107	void __lockfunc queued_spin_unlock_traced(struct qspinlock *lock)
   108	{
   109		if (queued_spin_is_contended(lock))
   110			trace_contended_release(lock);
 > 111		__queued_spin_unlock(lock);
   112	}
   113	EXPORT_SYMBOL(queued_spin_unlock_traced);
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
