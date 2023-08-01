Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA904DC60
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 14:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690901958; x=1722437958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9WtORg9ICe4cJKnB5dQPkrNEObZycRB/xV8WTCzQTxY=;
  b=Dz1D52j+hnuDOLnIoVyZRD1WjAp/pXbXiyUF0WonBAH+Ak4pVfDeQhJP
   AJ2LXHfa23a13hfj2JFUps3hAQoh/ksit1QMlMfcjQGXJXHqFEAm0Msl8
   h9Kwu5FUE2ZvOs03TsvJRgDucMIqZugM6RIqHO16DDvu/9LkiX7sEEoFG
   rY5lDqVyPu0GO2QSyKsvS5y0xDv8syDDtC/u4jHjEnfAsRGeup8Cr1vsS
   ICGK9EuYcxlbRmDGwMZmX8ecaZ9b5ChophIDql1wZ4DfK1AI8oT7lHKbZ
   nMusugGRRLYiS8RSTzwJtcq9+PBV8yOfZTjOjzBgPQt3nTZClp/yGbW8C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="369313282"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="369313282"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 07:58:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="705846281"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="705846281"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Aug 2023 07:58:00 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQqox-0000N1-2U;
	Tue, 01 Aug 2023 14:57:59 +0000
Date: Tue, 1 Aug 2023 22:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: zhouscd <zhouscd@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, dan.scally@ideasonboard.com,
	laurent.pinchart@ideasonboard.com, m.grzeschik@pengutronix.de,
	john@keeping.me.uk, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, zhouscd <zhouscd@gmail.com>
Subject: Re: [PATCH] USB: gadget: Fix the function name error in
 sourcesink/loopback.
Message-ID: <202308012224.vyXfjJMA-lkp@intel.com>
References: <20230801045449.156348-1-zhouscd@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801045449.156348-1-zhouscd@gmail.com>

Hi zhouscd,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.5-rc4 next-20230801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhouscd/USB-gadget-Fix-the-function-name-error-in-sourcesink-loopback/20230801-125745
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230801045449.156348-1-zhouscd%40gmail.com
patch subject: [PATCH] USB: gadget: Fix the function name error in sourcesink/loopback.
config: sparc-randconfig-r015-20230731 (https://download.01.org/0day-ci/archive/20230801/202308012224.vyXfjJMA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308012224.vyXfjJMA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308012224.vyXfjJMA-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/usb/gadget/function/f_sourcesink.o: in function `sourcesinkmod_init':
>> f_sourcesink.c:(.init.text+0x0): multiple definition of `init_module'; drivers/usb/gadget/function/f_loopback.o:f_loopback.c:(.init.text+0x0): first defined here
   sparc64-linux-ld: drivers/usb/gadget/function/f_sourcesink.o: in function `sourcesinkmod_exit':
>> f_sourcesink.c:(.exit.text+0x0): multiple definition of `cleanup_module'; drivers/usb/gadget/function/f_loopback.o:f_loopback.c:(.exit.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
