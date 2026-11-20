Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141971;
	b=O/rCbnsUfiSoAqfRTBdTUa3hoDw3dci5q4CKsgmdblPELeUf6TINZ3BwuDJBssVrzqky
	 TTDwtR40oEC2kn9j3LGYa0M4uYbo1djECVoO8tmb/uUEW7No+nSyqTHB7KY4WWeMfY/M4
	 AL8xiqoA1sTcLkb+V4k5JqqYgFMB7k2a2ftLoaCzHRARhB4qb269j9aFqxobWi4XGfyS3
	 dhAQqAkBxftFzvdsThy2+qIZlJfBhrnLmHWhwM4pSpcj3Pct3vXW6H2RdWJf2yoly2T5T
	 qzmPonoDJ5IdA1a/mB0FSPCCsWSrd85fG+sDP08FPSE39mfXxvKqnrF+eE37wgMJTtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141971;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=T4wXbm+O9fevfK2Qx5G101XrVBE78mAE7FgUuBIBaz4=;
	b=XAFwujAHQVUpiOWEfBe9woY1sfsZqlXluXdbpNkeR1O3/jzk68JADyozloB14C5MKE1P
	 fM0FjupEfXCuIslTxxGgH/d9x2//2SbRVk9A1F1enwuGcgOGL1SSks1CQjFx99LHkIKUv
	 fJc1HGFmXibbCVzL1Ai3tJWRO/eGlBjfKrI3GXvVV9+plCa7ngikTsxRMcL5e/eKzmWOQ
	 zJ84qYack0+1PDxYykT9yY6Aq6ED/UY7VMqWZ/btB/wcjlmQd4g/2w+xNl3IH08vwG32O
	 +Kx4WTllPLmDtt9qRIQPFB2ImXcRFQprvPvOR9vXlMa5z1KecAxQSzFx5jkhCUbZ5iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f4eO2pj3;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E61A606A325
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 02:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E61A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f4eO2pj3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795141972; x=1826677972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=elISg0j4CbGtr/3NgbR8Wu6oUDLUFQ25svm7SwkGMDY=;
  b=f4eO2pj3qmkrYMnKIw2KWMX1PBpvA044Q35VwIt6wA1i5VdrWkjRSzwO
   idAqaB8Bio2UeiOdNB4Q+y7sXYeBFkgozDaeZXvP/+X/QsAsx6/n9sfNn
   dKFclVvy0mLTPdvs12z/3YONG6XNfxICtNZk/ca4fJzPdJqIxxM/3ujHp
   iLdHfKML0B74pR2I/3GLRWZBcZxCAU/aaBRrn4TpEga5tbRFLP1RikpAs
   xs4rK0Cuq5bPa5ARJfHAO6Rlzjofxk3mzkhn7ZThTQe0L3HZS2lGxZplf
   Y3172TRJxoSBIEFkhnBC58X09D/CmT3NpYWAMPZMb/jIKR1j2OSexitJP
   w==;
X-CSE-ConnectionGUID: NB6eYqfXTuyQNsxQvPbU3Q==
X-CSE-MsgGUID: Cp0grLQ+RDCKoH4Xb+YfQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3906649"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3906649"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:32:51 -0800
X-CSE-ConnectionGUID: GSdlH1DaSK22flRLpa/N+g==
X-CSE-MsgGUID: c3Yw6mbvRpyxP3Y5GxfaUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10577917"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Nov 2026 18:32:44 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUEQa-00000001GzH-0B6X;
	Fri, 20 Nov 2026 02:32:40 +0000
Date: Fri, 20 Nov 2026 10:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Williamson <alex@shazbot.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	David Lechner <dlechner@baylibre.com>, Armin Wolf <W_Armin@gmx.de>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Marco Elver <elver@google.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Bradley Morgan <brads@mainlining.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Petr Mladek <pmladek@suse.com>,
	Pnina Feder <pnina.feder@mobileye.com>,
	Mete Durlu <meted@linux.ibm.com>
Subject: Re: [PATCH] PCI: Allow untainted driver_override for PCI stub drivers
Message-ID: <202611201053.O40xQFuN-lkp@intel.com>
References: <20261118235645.2907908-1-alex@shazbot.org>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118235645.2907908-1-alex@shazbot.org>

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v7.4-rc3 next-20261116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Williamson/PCI-Allow-untainted-driver_override-for-PCI-stub-drivers/20261118-165643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20261118235645.2907908-1-alex%40shazbot.org
patch subject: [PATCH] PCI: Allow untainted driver_override for PCI stub drivers
config: s390-randconfig-1000-20261120 (https://download.01.org/0day-ci/archive/20261120/202611201053.O40xQFuN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611201053.O40xQFuN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611201053.O40xQFuN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/pci-pf-stub.c:39:17: error: 'struct device_driver' has no member named 'support_driver_override'
      39 |         .driver.support_driver_override = true,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/pci-pf-stub.c:39:43: warning: initialization of 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      39 |         .driver.support_driver_override = true,
         |                                           ^~~~
   drivers/pci/pci-pf-stub.c:39:43: note: (near initialization for 'pf_stub_driver.driver.name')


vim +39 drivers/pci/pci-pf-stub.c

    33	
    34	static struct pci_driver pf_stub_driver = {
    35		.name			= "pci-pf-stub",
    36		.id_table		= pci_pf_stub_whitelist,
    37		.probe			= pci_pf_stub_probe,
    38		.sriov_configure	= pci_sriov_configure_simple,
  > 39		.driver.support_driver_override = true,
    40	};
    41	module_pci_driver(pf_stub_driver);
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
