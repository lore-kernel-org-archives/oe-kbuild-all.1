Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B313120FAAF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 16:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729095217; cv=none; b=fGZ5u86tjwABIm38upMqaSZ0+86bxy3YZcNuGayiP/f0wrAPRpj8XsOzmT4Xn0ducEfG63rL3/OeUlpKjdvRWCLse6FvrZr8D8YlzkQFmu2tZVpzBh1qYH8302owQN2akbJtXrEvFAJj8E2owZWhK4BaMV0HHfRT3ajA4v+KnPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729095217; c=relaxed/simple;
	bh=w3otRYw57c+7uQpT1ys+meLn+ulodHP/em4d6DX92s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AW1rwUVWH+Ao8k1j8oGyWcLeMdHK3d7hSlt0s5B/aIeA6OpkFPk7TkbuWJj8JAFcFEvwGYGqq8soaYN5bGCxppu/T2rX8XdVyOgj18jZJwAeVkdTTEKaSX7R1JUzAierDDIE2PtvTQrlDxmXaZkFKvx3e9gTMCs/qol/yDmZwxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6oC7PJr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6oC7PJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729095216; x=1760631216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w3otRYw57c+7uQpT1ys+meLn+ulodHP/em4d6DX92s0=;
  b=X6oC7PJr/s9vIAtAWOO/wwu59ERXog26IiJj/1Xzx7Cnp4HRdYlHy+0R
   yDbZ7fn+N3dgzDWFbxIx3IR7yMMSBfXlLcHfR9bLTxpbAzoOrULo1mTo4
   LnzQJOPqpQSyMKT7q20aqoDxX3rkMrdOZCqZkytsYk7cwGU0yL35jUfTg
   EZPaTXBC8A3P2mL5CkGtKfq6+J0fLLF8UbaCGcOh207dTvdrzUOsJfyhN
   r6c/WjlVfeK0t1uCRmClIHzdZbvO+4anQ1+R+0kwefs0LR8vyTCT0R0B1
   r0gFld08n5/oOKi31pIjhFgw1JWwWlVCaVRmRE0j8M4kaPeMoGnjBw2Ou
   A==;
X-CSE-ConnectionGUID: 3LcDiSOJTlKPyS8qD34W0A==
X-CSE-MsgGUID: zy3N5ZJ9Q7KqvvcaMcwaoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="53966543"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="53966543"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 09:13:31 -0700
X-CSE-ConnectionGUID: hYIAPFCoRM6cLs1lHv8A1A==
X-CSE-MsgGUID: hhFT4iDMRyqktkV7LlPA6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="82946784"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Oct 2024 09:13:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t16eN-000L6q-1U;
	Wed, 16 Oct 2024 16:13:27 +0000
Date: Thu, 17 Oct 2024 00:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: John Stultz <jstultz@google.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH] lib: stacklog_debug: Introduce helper tool for
 collecting and displaying stacktraces
Message-ID: <202410162300.hQl2Bshc-lkp@intel.com>
References: <20241010212813.2125851-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010212813.2125851-1-jstultz@google.com>

Hi John,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on linus/master v6.12-rc3 next-20241016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Stultz/lib-stacklog_debug-Introduce-helper-tool-for-collecting-and-displaying-stacktraces/20241011-052953
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20241010212813.2125851-1-jstultz%40google.com
patch subject: [RFC][PATCH] lib: stacklog_debug: Introduce helper tool for collecting and displaying stacktraces
config: nios2-kismet-CONFIG_STACKTRACE-CONFIG_STACKDEPOT-0-0 (https://download.01.org/0day-ci/archive/20241016/202410162300.hQl2Bshc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241016/202410162300.hQl2Bshc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410162300.hQl2Bshc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for STACKTRACE when selected by STACKDEPOT
   WARNING: unmet direct dependencies detected for STACKTRACE
     Depends on [n]: STACKTRACE_SUPPORT
     Selected by [y]:
     - STACKDEPOT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
