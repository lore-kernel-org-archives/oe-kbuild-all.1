Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130254;
	b=2tjlYvPz6CG15R/AlOkuzwo+TMHtaCDU8P/LspgC1B61uOr88mOwAe9nl0FMvKNr6HmG
	 D5qhGkFDOBaVOuISem1Q1KRqABrUyJXg3ZUaPcSVQHUUKdTz/L+lO4X55duX9oBIQ0Ng6
	 B85lGAGfa1Jc5olOjDXZcDQtDL05+5i4K0NQrIL12UMSlIVizCdHCdU+jutTwgwCYQY20
	 181rEp9PrPdpzMy5EZulb+f9WWSe2pn1oNLqf+Nd9whZCVHCRcQ4ZCwNfeTWpINqx0Giq
	 5atBOXIZnpEZ0Iiml+cza/shqdgnaCzXBMId+imFvoYPMriGhBUwvdkz5IpLMR1xTBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130254;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=NSoDlJexnx0K08l+2Qf6ZJZfvrTlP9o1+Zq+v2dVC5Q=;
	b=GZHRO11dzEEN4KWrA/rHJZ8jVPo/Bb+ZomlR7yZByV8ErymY5sQJqDa7sPt66hrs+ldG
	 TSuiTCAqQaT9gktBLP/kc3kCCWTdd78F4NdsP0t61mfQ+/9MUhOK9zwA/WuzkrvCRmGFp
	 5qT7aUCzFu+HaWMTdk7jeoTgSyNprbGWKlMgp3udvIwrfOGdLac429t81fmhOGQA6gYLV
	 4P9ZJUWhAedjvy7y1hT1hoV9P2csSfIzp06L/G5GJuYNB8Cyx1Rw6kcEZZBkubwKFu5s9
	 pgMaEoV3pg/5X3eA3W730dEFoSx5e3KeDqSYcrWlYHj54kfjfNwv9Vdh3l7B3qY1AWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="QbpewT4/";
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0B4606A325
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 23:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D0B4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QbpewT4/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795130253; x=1826666253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nNP6wYTOo3X6rE/Zgy3P1nPZCzq06y4k5FBZ9GaAEJ4=;
  b=QbpewT4/PwcHbsjWrUpEY9PCvCAzBzA3LzjkLB60pougEXivKWyFTzCh
   dYEmQfjB5g67BbCgGaWEjW3pq0xW3G3jWsrznCGI0BM3e77Qj9C9EIVCm
   DhEFPnz5bv0ksQBLgOcYLKVqp9KcK1+CtGuoga046LdwHbfUi77qM4xAB
   880AebaLABeOKjlSi/cZ+faFAlMprbtwTF9XpTSejtbYSwWhVkzX+xtUT
   Z2WGKXEY0mbWLF10duCQv0ngQ7mqdRrvFnwPd1sSm1jcecTcmmPRA3oQI
   vWKNeb9aIvpDl9RW46pje3KsPZKUrtopBZ7AQ6eVj7icsbLXSjHvt4RNo
   g==;
X-CSE-ConnectionGUID: q7ONqE96RkqKzSh6cA3NyQ==
X-CSE-MsgGUID: wYQWDJG4SjGGSuGsTsxmzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4008601"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4008601"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 15:17:32 -0800
X-CSE-ConnectionGUID: fc2s4AyMQsStgMZGPMwArw==
X-CSE-MsgGUID: sL4FM2BYRxSiR6j7+Tddsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="12262871"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 19 Nov 2026 15:17:26 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUBNa-00000001Gjj-0x4P;
	Thu, 19 Nov 2026 23:17:22 +0000
Date: Fri, 20 Nov 2026 07:16:47 +0800
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
Subject: Re: [PATCH] s390/vfio: Allow untainted use of driver_override
Message-ID: <202611200615.C2fWqXpC-lkp@intel.com>
References: <20261119051507.3306075-1-alex@shazbot.org>
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
In-Reply-To: <20261119051507.3306075-1-alex@shazbot.org>

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvms390/next]
[also build test WARNING on awilliam-vfio/next soc/for-next awilliam-vfio/for-linus linus/master v7.4-rc3 next-20261116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Williamson/s390-vfio-Allow-untainted-use-of-driver_override/20261118-221504
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git next
patch link:    https://lore.kernel.org/r/20261119051507.3306075-1-alex%40shazbot.org
patch subject: [PATCH] s390/vfio: Allow untainted use of driver_override
config: s390-randconfig-1000-20261119 (https://download.01.org/0day-ci/archive/20261120/202611200615.C2fWqXpC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611200615.C2fWqXpC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611200615.C2fWqXpC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/s390/cio/vfio_ccw_drv.c:378:4: error: 'struct device_driver' has no member named 'support_driver_override'
      .support_driver_override = true,
       ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/cio/vfio_ccw_drv.c:378:30: warning: initialization of 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      .support_driver_override = true,
                                 ^~~~
   drivers/s390/cio/vfio_ccw_drv.c:378:30: note: (near initialization for 'vfio_ccw_sch_driver.drv.mod_name')


vim +378 drivers/s390/cio/vfio_ccw_drv.c

   373	
   374	static struct css_driver vfio_ccw_sch_driver = {
   375		.drv = {
   376			.name = "vfio_ccw",
   377			.owner = THIS_MODULE,
 > 378			.support_driver_override = true,
   379		},
   380		.subchannel_type = vfio_ccw_sch_ids,
   381		.irq = vfio_ccw_sch_irq,
   382		.probe = vfio_ccw_sch_probe,
   383		.remove = vfio_ccw_sch_remove,
   384		.shutdown = vfio_ccw_sch_shutdown,
   385		.sch_event = vfio_ccw_sch_event,
   386		.chp_event = vfio_ccw_chp_event,
   387	};
   388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
