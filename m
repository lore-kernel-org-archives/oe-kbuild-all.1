Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F5479FE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 01:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754012942; cv=none; b=ZN0WJaycrVeBqRp/T9nmFcNPIH6fnw4bqvJCM6HtXfEG/OI7M+fcKVvfSXpUCOijeRYgbMJlijv8fXfa+p8qNe1hdNK7BkdUZ2OLLivdqRzJKElyaRxbqgXgPi6lfFQLO3lfTBq6PnX+t2wtwPeKMd+85jZrlUDVrNhPF36QjKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754012942; c=relaxed/simple;
	bh=qJaaP1z4x2mmCKqReu/ledD+uRCEdsh/3Yp5+/FAuAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UUGPDHIeCYv6LWVNCHxILy8+4WlkcA0txFfsSdyq4l1i9fNdYdy4ztlA7k5LNgfeAALc8QWjjbFGHs/3kZo5QvQORFVvh5JlCBEurW2SC/ZoEs0L9KmMEWaYC37RRcg1+NkbC711aEXJeqg/XKvN0g5bIMcHPOdcxJLdMcA1T1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHFaqhcu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHFaqhcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754012940; x=1785548940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qJaaP1z4x2mmCKqReu/ledD+uRCEdsh/3Yp5+/FAuAg=;
  b=cHFaqhcuFjfZlPzBUZiFWsAlp4m6UdKQZXZpZyIuX/ayptuz8LeyoP+S
   H4pd7CL9SUOnNIl5Ys4va8KKQbQDLIQ1vybZTf53TGcrFhyH9S80MKgYn
   eG+lh9qgNOXWc/aDW1nGJY5oaZVZvRXV7ZJNOXsozeQ/CcRuN6mrHzGYJ
   sfhZlgPht51Y2JCQj/HHwYBdLkuFXYdd+i5Ar5oIGVorvpg7n0xwjUnjZ
   Q14vAAA7l7YJvHVbWRnHg0RmcXVl24HlEZUIvxhRpUpuh8GZ1CzCocJnj
   358XMHBFNJEAFhqwzaddtM7DCcjrzzyZGDFOYeiMsYoWTWsBhIodOarWo
   g==;
X-CSE-ConnectionGUID: aZRC2vGDQsm3uNuIA1oTSQ==
X-CSE-MsgGUID: p+xSym+hQDeyINAvmWjaKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="78899927"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="78899927"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 18:49:00 -0700
X-CSE-ConnectionGUID: pgO/6o43Q0eoqqEo4aR9WA==
X-CSE-MsgGUID: wmRal/CnQwOlMFNTN0+ffw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="194256457"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jul 2025 18:48:58 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhetD-0004Ha-1Q;
	Fri, 01 Aug 2025 01:48:55 +0000
Date: Fri, 1 Aug 2025 09:48:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740] mm/mem_reliable.c:272:5:
 sparse: sparse: symbol 'reliable_debug_handler' was not declared. Should it
 be static?
Message-ID: <202508010943.aN5Z6t5l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   82c1d53a78e21e34d4f1699fb3262b22022ce343
commit: 851a3ff0b4de68403c9a344c3d5378aa590705b7 [1740/1740] mm: Introduce proc interface to control memory reliable features
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20250801/202508010943.aN5Z6t5l-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250801/202508010943.aN5Z6t5l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010943.aN5Z6t5l-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mem_reliable.c:52:14: sparse: sparse: restricted gfp_t degrades to integer
   mm/mem_reliable.c:199:5: sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it be static?
>> mm/mem_reliable.c:272:5: sparse: sparse: symbol 'reliable_debug_handler' was not declared. Should it be static?
   mm/mem_reliable.c:199:5: warning: no previous prototype for 'reliable_limit_handler' [-Wmissing-prototypes]
     199 | int reliable_limit_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/mem_reliable.c:272:5: warning: no previous prototype for 'reliable_debug_handler' [-Wmissing-prototypes]
     272 | int reliable_debug_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~

vim +/reliable_debug_handler +272 mm/mem_reliable.c

   271	
 > 272	int reliable_debug_handler(struct ctl_table *table, int write,
   273		void __user *buffer, size_t *length, loff_t *ppos)
   274	{
   275		unsigned long old_ctrl_bits, new_ctrl_bits;
   276		static DEFINE_MUTEX(reliable_debug_mutex);
   277		int ret;
   278	
   279		mutex_lock(&reliable_debug_mutex);
   280		old_ctrl_bits = mem_reliable_ctrl_bits;
   281		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   282		if (ret == 0 && write) {
   283			if (mem_reliable_ctrl_bits > (1 << CTRL_BITS_SHIFT) - 1) {
   284				mem_reliable_ctrl_bits = old_ctrl_bits;
   285				mutex_unlock(&reliable_debug_mutex);
   286	
   287				return -EINVAL;
   288			}
   289	
   290			new_ctrl_bits = mem_reliable_ctrl_bits;
   291			mem_reliable_ctrl_bits = old_ctrl_bits;
   292			if (!!test_bit(MEM_RELIABLE_ALL, &new_ctrl_bits))
   293				mem_reliable_parse_ctrl_bits(new_ctrl_bits);
   294			else
   295				mem_reliable_disable_all();
   296		}
   297	
   298		mutex_unlock(&reliable_debug_mutex);
   299	
   300		return ret;
   301	}
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
