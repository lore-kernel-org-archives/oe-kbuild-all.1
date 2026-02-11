Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6C3313E29
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770808034; cv=none; b=PiIB/y/+B1VE8vHfGK5YWeGuYtkas/RiYoScnj0kiIjkyrYrs4QCAHMzI3jbWPwRYud8YCVErksBOtYP0ED7CNJ0Y+f1lehbtwRHXuNJox5Avx44q7UmsDMZhAABYQpRco4B5xgtoQl81zmBy4M/y5D5bDjlG7JgX4hAJjIkA8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770808034; c=relaxed/simple;
	bh=at0NR81jPvU18zU6BLcd7c2hKq8DLKM4iEQgfpCbwtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9/l9cdJDlss72+xtmXpdqOGUqI8eKu1m+CIXutCG9AY8K74t/TnOORdVmxxkpfUmsgt3ZoV+olL2+IDgkGN5w5r7uhtgwatxTGM5Qctmzh3PeDQbjv4KQTYtiqnV4qIORxN+5bBerdJMbK/I7LeuYzis/VqKFPL9111iwBHTxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=koZ2KosO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="koZ2KosO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770808033; x=1802344033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=at0NR81jPvU18zU6BLcd7c2hKq8DLKM4iEQgfpCbwtU=;
  b=koZ2KosOKRZdl93aai5+CwcXNjXFvgDwuwEsigRRr+1IpPX5oD4D2c38
   lw14e27PpxS1Cn0IN07pePhqNt2F40yfKq868A9qVRz/M8szOeKVuP5p3
   wtvzT8mtczimfiJpqxMx8Vy2oYsHWqIX+G0ouARD9cWR2bL5MXgz0GC6t
   u+6Pgf4V8A684p7PwiCj93QMomakfoLsZlcJCrW31pBUhIBzdp0/TJiXM
   1azmNaYT7CdX+o0nAvvkaFf/mUqRRUA5qxpkQoZ675UdY5F3veamxk96O
   z+dl1A1Yp7HKZBtCTUU1YTkJSeZx+08I+fAKwQf6/UEsZM0+vnu7KIzU8
   w==;
X-CSE-ConnectionGUID: TAy0VhHpTnCF1TN+qJmc5Q==
X-CSE-MsgGUID: BfFSOu0xRjCGC9mjctETSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82590976"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82590976"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 03:07:13 -0800
X-CSE-ConnectionGUID: 6yS0TZOnSGarSe4Qane9zw==
X-CSE-MsgGUID: yk0mbMRuRkm1EDg1w3vAow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="217179695"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.220])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 03:07:12 -0800
Date: Wed, 11 Feb 2026 13:07:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Tamir Duberstein <tamird@kernel.org>, oe-kbuild-all@lists.linux.dev,
	Petr Mladek <pmladek@suse.com>
Subject: Re: [linux-next:master 9199/12313]
 include/linux/compiler_types.h:617:38: error: call to
 '__compiletime_assert_304' declared with attribute error: BUILD_BUG_ON
 failed: IS_ERR(PTR)
Message-ID: <aYxi3KG0gHBBbqox@smile.fi.intel.com>
References: <202602110708.x7AYvCN7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602110708.x7AYvCN7-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 11, 2026 at 07:15:01AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   fd9678829d6dd0c10fde080b536abf4b1121c346
> commit: 9bfa52dac27a20b43bcb73e56dc45aba6b9aaff1 [9199/12313] printf: convert test_hashed into macro
> config: parisc-randconfig-r122-20260211 (https://download.01.org/0day-ci/archive/20260211/202602110708.x7AYvCN7-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110708.x7AYvCN7-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602110708.x7AYvCN7-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):

Very interesting case. My theory is that this is a compiler bug or
a rare corner case. When test_hashed was converted to a macro it
affects the scope of PTR in errptr(). And compiler most likely
mistakenly drops it's value to 0.

OTOH, I do not believe that it's a problem of IS_ERR_VALUE() implementation
since that it is so low level C standard integer promotion rules and should
be covered very well by compiler tests, etc.

However, it might be possible (but very unlikely) that the 32-bit
value is considered smaller than (unsigned long)-MAX_ERRNO. If
this a case, why only now? The change was introduces in 2019 to
have this BUILD_BUG_ON()?

TL;DR: Changing a compiler version might help, I think?

-- 
With Best Regards,
Andy Shevchenko


