Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B843A6EE9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 20:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787516386; cv=none; b=ueyxI+SPmEuBJY82J/Ust1zMshXcK6OiLMzbNCoOdonB6VcIQwEC8rsKc2Nf2DZwFbZGrzbF9VYTROoyvkjsQrp2u/N8RncJ0SFK/Wg6SwYqkjtVAm5c7LXWMt+HQB9e4A1vDT8GyfdTyZOyATG/mzNXq2uF1P6yd9FCxHkaSqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787516386; c=relaxed/simple;
	bh=LqlrHNXJKzrefBZaVU2VJE0Y3NhznAK1xMdxCpOAPws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hI2zPkQZRVlIEF3nWSCcKmm01L1beB4GZvBHILMhCeongVRgS3fDGoR1uHOUPmUMjDst5XKrg0RtuOFNLkO39GzBB1lxZT3yb/jITjGbhcg+6ddlUOTra7lPHToynhQMEDw0lPfvhH/6saniR/8Es+P/bSmPwmVaLtUQ4Eey+tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZPYrgbl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZPYrgbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787516385; x=1819052385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LqlrHNXJKzrefBZaVU2VJE0Y3NhznAK1xMdxCpOAPws=;
  b=dZPYrgbl1aesBxRVI/7P3h3xo9LNRZneQJx7SB2133IbDo0dMUo9/nLE
   /UMXNQDW9u5nYLaMyX4F1l0ke25VZBNlATFH9gBMSKgawTeTShN2ZmltD
   /Afi6BYApn3gwoNkNvsxPUFvmynVXty6+zwuS0w3PB1RyOH/fkQMqfIMU
   0vALKQG8laIo3JYmN7s1wNC1RozrYpVXBXgvC8qWCWIBTU7voLSOT+g+M
   XgXr6ANKLmUstVMcmwaNgwNgXRLApfemEYGkwfN1LvAon1byhB90j9cuK
   HKes7iIF9Vge1CoEm6+GRbbj1yo/CVkfmXqh/k05T0B/5c8jSCeUdK6GD
   g==;
X-CSE-ConnectionGUID: GuymPkHnRhy2sACIbRJ29A==
X-CSE-MsgGUID: d7Y/izg9ScW5fHYbU7O04Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="86924116"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="86924116"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 13:19:44 -0700
X-CSE-ConnectionGUID: memg2G1WRJmpA9bTAvj0yw==
X-CSE-MsgGUID: pKWC2hHbSgCFShHG5TzpMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="272031822"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Aug 2026 13:19:42 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyEfM-0000000006R-2jgf;
	Sun, 23 Aug 2026 20:19:40 +0000
Date: Sun, 23 Aug 2026 22:18:48 +0200
From: kernel test robot <lkp@intel.com>
To: Stephen Horvath <linux@stevetech.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] hwmon: Add Support for PMIC5000 Power Management ICs
Message-ID: <202608232257.ltZnDbDc-lkp@intel.com>
References: <20260819-pmic5000-v1-1-e5e0ddcf0863@stevetech.au>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819-pmic5000-v1-1-e5e0ddcf0863@stevetech.au>

Hi Stephen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 75f2c0b3690702c90863c2e138cb5520670845ea]

url:    https://github.com/intel-lab-lkp/linux/commits/Stephen-Horvath/hwmon-Add-Support-for-PMIC5000-Power-Management-ICs/20260819-233745
base:   75f2c0b3690702c90863c2e138cb5520670845ea
patch link:    https://lore.kernel.org/r/20260819-pmic5000-v1-1-e5e0ddcf0863%40stevetech.au
patch subject: [PATCH RFC] hwmon: Add Support for PMIC5000 Power Management ICs
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260823/202608232257.ltZnDbDc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608232257.ltZnDbDc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
>> Documentation/hwmon/pmic5000.rst:4: WARNING: Title underline too short.


vim +4 Documentation/hwmon/pmic5000.rst

     2	
     3	Kernel driver pmic5000
   > 4	=====================
     5	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
