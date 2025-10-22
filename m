Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBE921CC4B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 05:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761109426; cv=none; b=Nc0d/sx7xKgTy5HO9DiTXGhaojhzr12V3lYFwApLNJDaS5MEtQ03P0mtj850DlwZItyrjvh/LHRpnmBhIwUA6olmI6ORkI/2EoVsf8Ba8PYTfWtxjLyVsRkjk3bCEqtWdCoyII+bwvZsYYWgduwZhL8dhIZX/skUlK5YW27lBr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761109426; c=relaxed/simple;
	bh=M06R4Xr3d1EvLgOi06R201sSRhpK+j9d6KLXN6BbOnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdyIQhwfNoAK6Mt1RsvtoFUCucsu1prVhSs3h5t+TpGZXpDwHm8JLXlUh7ZxDXTejNqSL+DKDO+3vLcM5qS6bnii1wk6Men9WBuR0uCnX98VHlgwqKQdG/gzEMMrH25HoKkHL/NvsCANHe42uolq5cBMEwIDks454GbWBxzsSnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jt1L3ykF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jt1L3ykF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761109426; x=1792645426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M06R4Xr3d1EvLgOi06R201sSRhpK+j9d6KLXN6BbOnQ=;
  b=Jt1L3ykFKYeidbZVHnf24tOzNymCGyIjG7mgovc/K52k+dRRzbBRdPDN
   w4ILpK69ydJMpvvVghPA/VX9Q7lCu85Nw2HtOBLofTIp4ENeOW/of+QVu
   TI8DHX40QF+NDinxY5YpONpSJAc5HBeCnsAt98wXp3hynzcpQtDyjksW8
   RVcjTTezuP9bI7ur1DdRvZftRKhr1tcHAE02r7I01JxQjTwikYeQE9/U2
   b+F0o2zNtmmpwP+Mj1QeP4+F4O1uplAvXyZX86LcB57yM5LaCT/w5gt2m
   D/ErPrAuL54hdV3h10GfT5w2cMoHB4oUe6YvHTLq41+1HAogRcFBUrk+w
   g==;
X-CSE-ConnectionGUID: dWAjpBBcRY2MNeTB1FbnPg==
X-CSE-MsgGUID: 4qAqRyCHQCKPCku7hnUM3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74685137"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="74685137"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 22:03:45 -0700
X-CSE-ConnectionGUID: r1+V4r40RDCa4uJf01J4wA==
X-CSE-MsgGUID: noNPTThmTQaXc7KH31B9FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="183473963"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2025 22:03:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBQzj-000C0j-12;
	Wed, 22 Oct 2025 05:03:01 +0000
Date: Wed, 22 Oct 2025 13:02:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC DRAFT 16/50] arch: hookup listns() system call
Message-ID: <202510221254.VLjnCzRJ-lkp@intel.com>
References: <20251021-work-namespace-nstree-listns-v1-16-ad44261a8a5b@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-work-namespace-nstree-listns-v1-16-ad44261a8a5b@kernel.org>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/libfs-allow-to-specify-s_d_flags/20251021-200829
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251021-work-namespace-nstree-listns-v1-16-ad44261a8a5b%40kernel.org
patch subject: [PATCH RFC DRAFT 16/50] arch: hookup listns() system call
config: i386-buildonly-randconfig-003-20251022 (https://download.01.org/0day-ci/archive/20251022/202510221254.VLjnCzRJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221254.VLjnCzRJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221254.VLjnCzRJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1624:2: warning: #warning syscall listns not implemented [-Wcpp]
--
>> <stdin>:1624:2: warning: #warning syscall listns not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
