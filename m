Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107118;
	b=wzymVS9K+NSAHtraCWqUDk11YtHCx4n94gBnkrnIM0iZ93e0h5R5/qLwLC1UvhOGuffi
	 lEqjXRoMhq9lZGjtD85bPXTBJ7y63022yNxD9Jf/2iORDM9A8nz2j575CvOu7mkzvQsMS
	 //2c2PVf7I8WjhGgmaJVXK9DE3MUjH/+pnAxFBalypIYF/HdIsdQY8SR/v1URB+WzamEs
	 rKataG64LFmKQXLW/WLF5Oh9j9Il6+RPN0AfzamEiPs/3Ko3HPU2GCzVrdrEcMYfSyGir
	 HqF24yNU1mJ5mp5g1/m9nHaN7FPYUZ2FolYnSbWVt9d0bcl/hR6R1m+rH9Ua4r0QDtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107118;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=B/6DH3FFwvRnKAIbOA9Jvsbx865824E9HffR4ETwzIo=;
	b=2XLqZVsW7xenU8NvQqOIFhiOcJtSUXqMj5WC3L041BkUb2pGW80/ZfZsiM51frYNzYsp
	 mzsULw4Ig9/Kz+tDi0qkQKUglK8qRNM295VC8mv0yokG0IWgPnwnUvnndeV7SoyVuvMw9
	 Wkne+hZV3QRCxVBUMUBtTX5Yh49JuJgtfXCrWx77bey9iXQvMYmjnX/g6kXvMwXUris4U
	 WQs6zCiLhXN1gy7BGhDWUQ+rgNl4vijCovzelxiiAO0hrk9RrXevl5Nr/1KmXnpV7ZgYk
	 D7k1oLYaX+NXaVJAAL4VygZdK7fMGPmQIVqNHYUSjvq2oki1wtZPCFtbLhIhqKIBj5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kE4K+Ftw;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09B2606A326
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 16:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E09B2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kE4K+Ftw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795107118; x=1826643118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=alpKBfZVPL/sOG9hyOB2rfC3cwy67Mmj2pXdbSblBqE=;
  b=kE4K+Ftw6QgX/pBvi2Os8ZcsIB9+Kc9EWmCoKWG3dmoI39jeHFjZvFNq
   fITSl+x8+H9kebTGzAI5BIpzOdcnPs5Wzr+RxhryjjUoNfRNAyPLX41vN
   FxpMixJsq4FNaDRSN85ZE8UaBdqqRst5pcsab6nghU38+XR/4Pr86dm6o
   bEfc9LEyTP1F2CrrJO3/KpG/+9ubeoD6BPB95/vGtlMlbartM3l5gj1yh
   7ScgCtnj55eXbu0yrUWHYCeV9JDLYkWokBGxxoxhsI0vYNYuiEX6DMSjn
   X16uzXRMm6/mxb0LiDlMiN+RKQwUOqW694D0v6c/Hr3RcJn2L/BpDGOth
   w==;
X-CSE-ConnectionGUID: Fkw4Gen1TimQUqy9sxASiA==
X-CSE-MsgGUID: LHvw6h9bQPq9gobQVOynpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3972908"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3972908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:51:57 -0800
X-CSE-ConnectionGUID: ix55b9qhQo6NvrkZ3L/Vxw==
X-CSE-MsgGUID: cM8nOYnpT0+ilSSf+e7fkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10361290"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Nov 2026 08:51:51 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU5MR-00000001G9u-21E4;
	Thu, 19 Nov 2026 16:51:47 +0000
Date: Fri, 20 Nov 2026 00:51:47 +0800
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
Message-ID: <202611200009.RQOE0yny-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on awilliam-vfio/next]
[also build test ERROR on linus/master v7.4-rc3 next-20261116]
[cannot apply to awilliam-vfio/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Williamson/vfio-Allow-untainted-use-of-driver_override/20261118-165644
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20261118235645.2907908-2-alex%40shazbot.org
patch subject: [PATCH] vfio: Allow untainted use of driver_override
config: arm-randconfig-1000-20261119 (https://download.01.org/0day-ci/archive/20261120/202611200009.RQOE0yny-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611200009.RQOE0yny-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611200009.RQOE0yny-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/platform/vfio_platform.c:119:18: error: 'struct device_driver' has no member named 'support_driver_override'
     119 |                 .support_driver_override = true,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/vfio/platform/vfio_platform.c:119:44: error: initialization of 'const struct bus_type *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     119 |                 .support_driver_override = true,
         |                                            ^~~~
   drivers/vfio/platform/vfio_platform.c:119:44: note: (near initialization for 'vfio_platform_driver.driver.bus')


vim +119 drivers/vfio/platform/vfio_platform.c

   113	
   114	static struct platform_driver vfio_platform_driver = {
   115		.probe		= vfio_platform_probe,
   116		.remove		= vfio_platform_remove,
   117		.driver	= {
   118			.name	= "vfio-platform",
 > 119			.support_driver_override = true,
   120		},
   121		.driver_managed_dma = true,
   122	};
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
