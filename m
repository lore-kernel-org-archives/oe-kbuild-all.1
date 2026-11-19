Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110563;
	b=Xm4ou2HLdmW2JP6AgW1WISlSWK2ayb4WYgPb8Xb+8n8CsEhv/gxC1bYAWcQx4nNlDTDp
	 WAXuduCDhbrqKNh4eFTHVmD/jW4m7cfuL71Xq/9wZ8lE30TxXF395QZkssO6SFYmTB+lN
	 nIdPTEW5xSUEOqcU2CAeEKZUvh3dd58WoJlQqX08IPKkW2evyGAG66Huk9AGlfl8uBEJY
	 uRzYLpgYE6Sf4U759CNL1GVSFsOmYNkIqQGPCvXaxgzneK4T8b0u/J/gOXzqLdwnHolU1
	 xtvbmsFDDfwCpljyVY2eo3pqi2N8RxTijHrytjgQXgZuesQ49KHdmiSr/dWguOQeD2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110563;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=X3thD56eRhlxvtdhiBwioW7SAEb3u1XRB1xRVjxuY8U=;
	b=gsr5qafCixe4+mfe4NGRoXbDw6RG/gbpXhmIkvlj/wh+/ny2Qq+2aCxt7RnC3XdpCR9o
	 XpO/28YUk7InpjLWPhHLOXJFcKtxvgtJvuPdBkoOS2LRSPMG5F0fJlsPK4YmBmJMh/fof
	 H4WdgMeGJ7rMw/SniBPWNXsOQ+vpvgHb/I1epeDth/eD8LemA1qAFtIFwbcJj1eWHKxZk
	 0wii4eYZWUcAHjxZ2bPd6/fxR/Ok3Lp0vxzfj3t7vbH7mFiCSMLRSIt6YAxgzaZ2vEpOk
	 TPk203PMAv+J4z0Alb73y4FaXNZdcOeoZkKudmpQXpKx3gnmxJJxF2WlI+KO81YY7sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EP+PIYaZ;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C510E606A320
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 17:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C510E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EP+PIYaZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795110563; x=1826646563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A/J5nq/xKqdeWa+x6wK6TKgb+xxyzfQwFmtoS5NTXSY=;
  b=EP+PIYaZMhYvFVlEyzoaHxRCg4xkMYCboXxpL2uweTgjcdBq9dBcC3+E
   H1E4ECGuyG7Oq+N3muKlj7Ouph9YQetJFO35Pz36oVYj8Jf2kLEZZJZe8
   ZE68gXIg/uwrq1i5glXWMfZHX9LM+WTKO4QWRaLocHfLxsUSy16F7T+RB
   RKNMPcVHIcIIsTMgD/dGa8Ci0Z9e4HX6prrwhc+PCN9VzLjs3ewNlJTb/
   D7NwsnSzYnHptXBu6R7rjIwl0iOvJY1ZZ7475vLbqkEE0cKqfkKBbfrDx
   LJqqc27F4lLXm2eZ/Cpa4up7SycYxT07fqhBJeZjdEq8jxEYv/f1sJif+
   Q==;
X-CSE-ConnectionGUID: oISSEgtLQKudxkdcCmtupQ==
X-CSE-MsgGUID: a8EKcCjFSHGvlgfEDr8+3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3822052"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3822052"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:41:16 -0800
X-CSE-ConnectionGUID: 30vIl787TtuN+WjijE5STg==
X-CSE-MsgGUID: zruBp4AySZy2bNCTKELpPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10825046"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Nov 2026 09:41:10 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU68A-00000001GH0-0Dp9;
	Thu, 19 Nov 2026 17:41:06 +0000
Date: Fri, 20 Nov 2026 01:40:21 +0800
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
Subject: Re: [PATCH] vfio: Allow untainted use of driver_override
Message-ID: <202611200125.3szMlcTc-lkp@intel.com>
References: <20261118235645.2907908-2-alex@shazbot.org>
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
In-Reply-To: <20261118235645.2907908-2-alex@shazbot.org>

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on awilliam-vfio/next]
[also build test WARNING on linus/master v7.4-rc3 next-20261116]
[cannot apply to awilliam-vfio/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Williamson/vfio-Allow-untainted-use-of-driver_override/20261118-165644
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20261118235645.2907908-2-alex%40shazbot.org
patch subject: [PATCH] vfio: Allow untainted use of driver_override
config: sparc64-randconfig-1000-20261119 (https://download.01.org/0day-ci/archive/20261120/202611200125.3szMlcTc-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611200125.3szMlcTc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611200125.3szMlcTc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/vfio/pci/pds/pci_drv.c:188:22: error: 'struct device_driver' has no member named 'support_driver_override'
     188 |                     .support_driver_override = true },
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/vfio/pci/pds/pci_drv.c:188:48: warning: initialization of 'void (*)(struct device *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     188 |                     .support_driver_override = true },
         |                                                ^~~~
   drivers/vfio/pci/pds/pci_drv.c:188:48: note: (near initialization for 'pds_vfio_pci_driver.driver.coredump')


vim +188 drivers/vfio/pci/pds/pci_drv.c

   181	
   182	static struct pci_driver pds_vfio_pci_driver = {
   183		.name = KBUILD_MODNAME,
   184		.id_table = pds_vfio_pci_table,
   185		.probe = pds_vfio_pci_probe,
   186		.remove = pds_vfio_pci_remove,
   187		.driver = { .pm = pm_ptr(&pds_vfio_pm_ops),
 > 188			    .support_driver_override = true },
   189		.err_handler = &pds_vfio_pci_err_handlers,
   190		.driver_managed_dma = true,
   191	};
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
