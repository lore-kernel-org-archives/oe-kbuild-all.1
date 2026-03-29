Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E86481B1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 06:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765236; cv=none; b=Rv/thwCSQN/rJkfF4TnTWg8JzdV1/pUzrm7VpHEeyikn//2WkH9Jc8gsmsvlaCzxQE562twCX/IzNPziSzFmBad+6MiANDGhwFXTPLwsYzwyKS05ClzJhdaMq/X4MS9X/onmIb9k99Wn6NEeNIxrOR/ug+F6TzoXQScmqueKsS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765236; c=relaxed/simple;
	bh=eG8PiKSl8h9tI7u7nDOG3e/a1Yi3uWaKlrjMdu1yLTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=L6piJAHyXozWptiyybkw/H/b7uf6C67HfmbacYQKChWq3e2JOpCNT3NkL9pzo0iMroifIVgYEW8IVM0PYLd9tcCXaOfAIY7CJD1k6P3JyrhX9R+wxGxszGybfAz7vaVnwPFAzBu6fWvWOfd+wDtBgDWk6Q/Ozm+EULQd/85WOoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7Ir00Wv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7Ir00Wv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774765234; x=1806301234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eG8PiKSl8h9tI7u7nDOG3e/a1Yi3uWaKlrjMdu1yLTU=;
  b=j7Ir00WvfzT5wt0U89Bxut9qclRfVTqbwZOzlen4TX/xZMdZLtnyS6KC
   gcwQfNqq4Q5cvmajviRxryKjOSxkUAM4SsqiY+b4z6wXu47W87567NmGh
   4a+jUUDSNR/eDsIkLTaiUN6oin2jeUW2AO1Xv0bF0zt1A8NrKPJ/8uis2
   UGqV71zLKg4S8hk2BOwLSqZ5gFEgdK0HT/RaJwLybVuRWrb3thEQmnlqO
   5xs0fHTJRqyvrnA1QWP9A3B6i/Lk2zyHQTBLHDkt8Ni5KaMIimeu3TGFs
   fovYKBLFff3902kiy/XChJadSmmPpxW6hSnJtcbDoDvOfiAjd1smJjkMR
   A==;
X-CSE-ConnectionGUID: BLC3p6W3T12XJ945HMH4eA==
X-CSE-MsgGUID: 8tDZCewVTnWmc/GEWncvkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86092583"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="86092583"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 23:20:33 -0700
X-CSE-ConnectionGUID: tpznbXdPS8qh++VAikpVqg==
X-CSE-MsgGUID: EYGS0W29QmujlMaX74MIoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="224914678"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Mar 2026 23:20:32 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6jVd-00000000C8r-26xm;
	Sun, 29 Mar 2026 06:20:29 +0000
Date: Sun, 29 Mar 2026 14:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-go 73/82] lib/dynamic_debug.c:1547:12:
 warning: 'ddebug_remove_module' declared 'static' but never defined
Message-ID: <202603291404.hatWgUwE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-shrink-go
head:   f409704b5c87caf13b0b57711d45606be12d5572
commit: c50f2af2aade2450c4fe338b5ed4aa2cca853bec [73/82] dyndbg: save _ddebug_site mod,file,func fields into maple-trees
config: nios2-randconfig-002-20260329 (https://download.01.org/0day-ci/archive/20260329/202603291404.hatWgUwE-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603291404.hatWgUwE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603291404.hatWgUwE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1547:12: warning: 'ddebug_remove_module' declared 'static' but never defined [-Wunused-function]
    1547 | static int ddebug_remove_module(const char *mod_name);
         |            ^~~~~~~~~~~~~~~~~~~~


vim +1547 lib/dynamic_debug.c

  1546	
> 1547	static int ddebug_remove_module(const char *mod_name);
  1548	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
