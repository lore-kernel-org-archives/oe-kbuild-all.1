Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0A93FC2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 15:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725894028; cv=none; b=s7MZcBQOwXuDX+JuRtm7oAIFExIRqEMYTpV7XSjzqTyuMnoIc7wO5UHfqALo+j++WsIBM9sc4lrgQox2+1MkjEdclMH2k/dcgpYWtLIs33oN/RVBZlAwPcgG8bG4rxfWe5zc9aNF0chEWBHGMFWvm9VV4UC4c+F5iARogNRC5fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725894028; c=relaxed/simple;
	bh=nQ95XrpgtxT6O91numBZuf7ydrfaG/SIt7KxB9ElMr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DZbhxtYovSqYnsBldU0S88Id/h6j3A/EyaUSgQCKuxZeWr11BsOkN2eem6dyFIt1xZ/9v8vXRh6GzYU8BDuBHs1BhZNFOponz+SOzjrGGKW0ZqSQ9C6O8VkVFBp1hRlpbHGxxrnrne4qjIzUtOMTu1KGfk0EvDAGpzaLvW0FBg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwW9KjO6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwW9KjO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725894027; x=1757430027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nQ95XrpgtxT6O91numBZuf7ydrfaG/SIt7KxB9ElMr8=;
  b=DwW9KjO6+DBYrrjHR+ISrt6WEWBL4h8DfD9Hit6NY5AmPMz/XJcS3KZl
   gyfILGPNqpQch9aOkUU3CrlTa4GgO8CuvL+/ky8o7c9pT106kafAAptKM
   HkrUjhnydJTOZD0R2d77MGUPNQRA77CTaBwDj7W2nudcgdGYuzjZJo7Rf
   hesOlBiI0GehEJ8Q9GBDvP3od1/QaZSL6jlCtr/9XNtevfXfnYp3DDdvY
   NrRaOvbCvWitV9W6c0l+6Y9ynE96u2GJydSY3DusSQjryL41WicxtdwLL
   sgsdN7d0NKAxZHKTeXarglGVnMUk1I6ZNhv482Qe4YTmEogcoWToX32qF
   Q==;
X-CSE-ConnectionGUID: oZejhmrBQjmW6ZdRzgQ5Fg==
X-CSE-MsgGUID: s7yi4L+MRfGIwQrifwJnIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="27518190"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="27518190"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 08:00:26 -0700
X-CSE-ConnectionGUID: VU79aNwkT/SwJy2pmSSH+A==
X-CSE-MsgGUID: BathEMFZT2GOP9k0j360rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="66666114"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Sep 2024 08:00:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snfsN-000Ere-1j;
	Mon, 09 Sep 2024 15:00:23 +0000
Date: Mon, 9 Sep 2024 22:59:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 194/258] main.c:undefined
 reference to `kvfree_rcu_pending_init'
Message-ID: <202409092248.jWwuuWss-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: 66de14f67dd993fb93e846432af241600f522d83 [194/258] rcu: Switch kvfree_rcu() to new rcu_pending
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240909/202409092248.jWwuuWss-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409092248.jWwuuWss-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409092248.jWwuuWss-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: init/main.o: in function `start_kernel':
>> main.c:(.init.text+0xff0): undefined reference to `kvfree_rcu_pending_init'
>> main.c:(.init.text+0xff0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `kvfree_rcu_pending_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
