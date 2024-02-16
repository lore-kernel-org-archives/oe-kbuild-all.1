Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92ECDDA3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Feb 2024 01:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708048488; cv=none; b=Z3WMdm7rWxT2FyO4xcoikNgSlTmkDCZ9cstbJmceid7mVx4LGP8LTECkpdKXRJ07NoyNJfAtAR9N3cf9MxgqkQoJ1tGWSweByc5hIOK/GQ9Syl5m0U2B7J4jPPuEa6Z1yLLd5FaEiwJneoGEYtyrhx4OJGuIEmDCBZZ8oRJClT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708048488; c=relaxed/simple;
	bh=B0BsOsgqeWZMYS+uSGOcCu0eCAs37Yp+bwFNHbFSqDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtxUAnmWZGWDe6Tc/LtBFitGZ7ziBBTTGfXE0FJFQ7Kx+Vy9OprEykwvE60jP8J6eEEImwxLF+z8BRwwlooodl4IWScz4I2+HBk1YANMZZnFxO5HVHZ2karT8BuLUjw4Nm2KmAFOIvqJQ45bFO4MVMBDqVO8xA4ZIM9E23SKfJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFusMC9V; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFusMC9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708048485; x=1739584485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B0BsOsgqeWZMYS+uSGOcCu0eCAs37Yp+bwFNHbFSqDw=;
  b=OFusMC9VUMEjS57EUDepPUn3otVHj8Oc+LLSNGwEAWhzsfc/5RfUIk3o
   YqYar1sCtZdcPccHL1ghoCZkIAeSqmGMaXv2ZjTutS9AeLr8BGkznd04l
   Vzl8sArEnx3r84AXALI3lzrcQWbZfOZgok1wUhno+PL6GbIW144/itm9r
   VKsDCHuvo7d26NEBupLFuvEismW53w+pnrC/AvUHvKq2WdXa/ra0oGB58
   +cJliZXuz4idx1uphgd8O+tiuNB90Gee/tQhxLYuFeURcJ/lx0JhBDFw/
   fAKvWCrNfftNW/nYtqYHRWBQnX6YiiMFA+5PKJwysObFpB02tD33xJED6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2026584"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="2026584"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 17:54:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="3793993"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 Feb 2024 17:54:38 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ranQx-0000w1-1c;
	Fri, 16 Feb 2024 01:54:35 +0000
Date: Fri, 16 Feb 2024 09:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Tesarik <petrtesarik@huaweicloud.com>,
	Jonathan Corbet <corbet@lwn.net>,
	David Kaplan <david.kaplan@amd.com>,
	Larry Dewey <larry.dewey@amd.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Carlos Bilbao <carlos.bilbao@amd.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Petr Mladek <pmladek@suse.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Eric DeVolder <eric.devolder@oracle.com>,
	Marc =?iso-8859-1?Q?Aur=E8le?= La France <tsi@tuyoix.net>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Christian Brauner (Microsoft)" <brauner@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Mike Christie <michael.christie@oracle.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Maninder Singh <maninder1.s@samsung.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Roberto Sassu <roberto.sassu@huaweicloud.com>, petr@tesarici.cz,
	Petr Tesarik <petr.tesarik1@huawei-partners.com>
Subject: Re: [PATCH v1 4/5] sbm: SandBox Mode KUnit test suite
Message-ID: <202402160907.r0qgAoRs-lkp@intel.com>
References: <20240214113035.2117-5-petrtesarik@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214113035.2117-5-petrtesarik@huaweicloud.com>

Hi Petr,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.8-rc4 next-20240215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Petr-Tesarik/sbm-SandBox-Mode-core-data-types-and-functions/20240214-193528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240214113035.2117-5-petrtesarik%40huaweicloud.com
patch subject: [PATCH v1 4/5] sbm: SandBox Mode KUnit test suite
config: mips-randconfig-r121-20240215 (https://download.01.org/0day-ci/archive/20240216/202402160907.r0qgAoRs-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240216/202402160907.r0qgAoRs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402160907.r0qgAoRs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sbm_test.c:300:13: sparse: sparse: symbol 'static_bss' was not declared. Should it be static?

vim +/static_bss +300 kernel/sbm_test.c

   293	
   294	/**************************************************************
   295	 * Memory write to kernel BSS.
   296	 *
   297	 * Sandbox mode cannot write to kernel BSS.
   298	 */
   299	
 > 300	struct data static_bss;
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
