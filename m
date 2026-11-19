Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795128984;
	b=SepmYGVr1IiXtfDVFPOGLle73mHerI599xH4iVYTpndO3zbxU1EC0rzYY3n0NdLx7rJH
	 T+hWlqZP2NvWTyxIVyWlFSgdhKAB0s/pNfAx1rCS4GMn4kQy5rRZiP6hl9UwjX3XrgEgY
	 9F1PBG20iSZEw/BkPEzm+Ego66SE6HhL1xfbCV1NIVrbAvJE39Nj8zfze2GmA6x8ynuLz
	 fVcfM5VQ2UU3e4PXZcrSlENdOJzP7dnBaVna5/DQqIL2kAmJCLBMp+GT/8rFprO0hpn4a
	 4B7TEQbf8nNoC8MeegB3DBf9VQ8kXeb5E2E6DImVsarv64STec9vGSUQ/J2QJvowgxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128984;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gpGbjtqguZRyVAmxSdFOuwH2auGVhYrc8eDlQirRmwk=;
	b=1yqD5bLuwGkhOGQtcL5oNhKH/xfDBeJA7LhUDwAn8BQxlRIkZwzqFOvb8OxcR2cra6ae
	 ygdgOekTtnlNOkZDF8tsxheXUDKm3+ETxj3f5Qlmgh6VkB9UNRVRj7DlG7TN2T4+UujS1
	 zw+zv/RkBfUbmJFqJeVNkzzkqRSPCQraZ1EpmflLL9KXwd+lxjpng7/VqMjUnB5BQjmal
	 4kQjUxs6KLlFdnGjVwOELD1zpbcl6I2pypdf+tinMgBmDwdasAZWpAyOEEs54B93wr6VN
	 dmsFmLUNGRZCENoFGY827g6Ny3Wce0DSeeyom4dCIhpsPcjz8pB5KKsUOq+mLu5rN7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fAxV4pxV;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA78606A325
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 22:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA78606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fAxV4pxV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795128983; x=1826664983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BERqUxXIG6eb8qjmYCZHieE6/mV4PKmER+ojmsY9aW0=;
  b=fAxV4pxVRNtGNPro9lo1ozfmgRZ12LIcjB2N8cyAShDN0YFrnmI3HLBB
   7CDTihRalgfI9aHrSBNQ3dfafnQDntZdblx3iEZOOJLWSQY/y69ZIGbsK
   AOfcsG6WRRENAwEf8YRN7D8EwWxNkgNf5DlEQnaHASDyL2ySaPMDIMGpQ
   WJnuRAMh/xup/DQ2QsPcjU2h0dzlt0lYEOEgS/dobbqaJ0gVRhfnWtjy5
   O74Q8/Zd/g360RubKDlLl6tvED6Yp9tl8RjHqtzYcbEitKpdQMLj6Y2qO
   cHvBTkY2rxS6wcmn/Ab0Qt3dfzLLuv8sqfg5z1k9a/iyvPGFrbeCVqTIT
   A==;
X-CSE-ConnectionGUID: I9SGpwttRaqKxObmK5PtVg==
X-CSE-MsgGUID: CkBFi5xJQKepS1K3S/nQTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3887611"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3887611"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 14:56:22 -0800
X-CSE-ConnectionGUID: DhUYb+4nQNihgcpOEr9/gA==
X-CSE-MsgGUID: rkmUwII/Tu+oQsUJi6AZ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10570485"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Nov 2026 14:56:16 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUB36-00000001Ghr-2sUZ;
	Thu, 19 Nov 2026 22:56:12 +0000
Date: Fri, 20 Nov 2026 06:55:49 +0800
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
Message-ID: <202611200633.VVreDSbc-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on kvms390/next]
[also build test ERROR on awilliam-vfio/next soc/for-next awilliam-vfio/for-linus linus/master v7.4-rc3 next-20261116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Williamson/s390-vfio-Allow-untainted-use-of-driver_override/20261118-221504
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git next
patch link:    https://lore.kernel.org/r/20261119051507.3306075-1-alex%40shazbot.org
patch subject: [PATCH] s390/vfio: Allow untainted use of driver_override
config: s390-randconfig-1001-20261119 (https://download.01.org/0day-ci/archive/20261120/202611200633.VVreDSbc-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611200633.VVreDSbc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611200633.VVreDSbc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/s390/cio/vfio_ccw_drv.c:378:18: error: 'struct device_driver' has no member named 'support_driver_override'
     378 |                 .support_driver_override = true,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/cio/vfio_ccw_drv.c:378:44: error: initialization of 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     378 |                 .support_driver_override = true,
         |                                            ^~~~
   drivers/s390/cio/vfio_ccw_drv.c:378:44: note: (near initialization for 'vfio_ccw_sch_driver.drv.mod_name')


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
