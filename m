Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4BB321262
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 11:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758625671; cv=none; b=UaauN3bwfEiJDINVnYW4UOhIHH4yn/l/VhOqOmQBAP63OF8zMUFqiYhqtQCmeorW5HOiN/Sab61wN9ss+3xRYgg/ZkYN3Rf695mU4RhlnnD2te48NzeaebSARRO00nFAlBo3EA5q3AHfAolvMAu+mY+SHBRW8naewGFAI3Q3azE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758625671; c=relaxed/simple;
	bh=Uf9bs5k9QG+5nyGAjqLHS32cg0hRvydRERDb3MH2K7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdoUwr2y3cIPzvcKutyx1Q+SlIuyS8eakX2uDFVroG2UGAKoW7j4ut09sX1+P2e8dMTXrrW0sRykm+1yDDsmmQZVFy6RNieTgQJ6FbzVBIO0ik+m0aClpXq7Bq/BWgqCo3rntMso3hYfaodfugulJevQFjuhA1cWEIsOHwlZ3xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZqzuTqh+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZqzuTqh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758625670; x=1790161670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uf9bs5k9QG+5nyGAjqLHS32cg0hRvydRERDb3MH2K7s=;
  b=ZqzuTqh+S16+fhNTAUHXP+dYteRe6mLZiiLDaWQXnU9YMe5JM5HeAaQo
   RXl0l7/h0EdBHwTr6705DBt9typg+Zab5JODGUGK/sMq2eUaLb47u4Vsw
   Itbf0v53hwqCoV6qn7WYWld13Jk5gdeShx8ac41Z32Y2mxR6tYdLCH15q
   TE+gZZQrISRv0ti3/T8Y4ViXRyR5RMWWuwLozSAd5JNB7P2xLtsTuASIO
   +CLmAfoqLkGzZvoO0t4cqs7hq7SfIuHf+u4NcpN2u0loGRdYQCU/C0F7W
   YQStCzbWgqlYKmKLalYAqIQ9UJZlwcIsy8BTRdCORxS3jNDhccbqKwLLZ
   Q==;
X-CSE-ConnectionGUID: q349bwvNTNaN3fYdCLzwcg==
X-CSE-MsgGUID: 2glOnu9zRwCowhG2SDuwmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60119385"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="60119385"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:07:50 -0700
X-CSE-ConnectionGUID: A0hX7eCORfmMYV+pqUM0xw==
X-CSE-MsgGUID: XFw+UBKWTTafDHqYtEDBUA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2025 04:07:46 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v10s4-00032v-1w;
	Tue, 23 Sep 2025 11:07:44 +0000
Date: Tue, 23 Sep 2025 19:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-pci@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] PCI: rcar-host: Add static assertion to check
 !PCI_LOCKLESS_CONFIG
Message-ID: <202509231859.HdRgUtEm-lkp@intel.com>
References: <20250922153352.99197-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922153352.99197-1-marek.vasut+renesas@mailbox.org>

Hi Marek,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v6.17-rc7 next-20250922]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/PCI-rcar-host-Add-static-assertion-to-check-PCI_LOCKLESS_CONFIG/20250922-233709
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250922153352.99197-1-marek.vasut%2Brenesas%40mailbox.org
patch subject: [PATCH] PCI: rcar-host: Add static assertion to check !PCI_LOCKLESS_CONFIG
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250923/202509231859.HdRgUtEm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231859.HdRgUtEm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231859.HdRgUtEm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:30,
                    from include/linux/bitops.h:6,
                    from drivers/pci/controller/pcie-rcar-host.c:14:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "!IS_ENABLED(CONFIG_PCI_LOCKLESS_CONFIG)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-rcar-host.c:43:1: note: in expansion of macro 'static_assert'
      43 | static_assert(!IS_ENABLED(CONFIG_PCI_LOCKLESS_CONFIG));
         | ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
