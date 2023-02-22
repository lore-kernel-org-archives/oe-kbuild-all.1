Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F330029A8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 19:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677093160; x=1708629160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BU1YgwIXWTtVBAG2H/y5BYFDvMaglAsy8CLBgbSjzTA=;
  b=IKZhdwrLCa7UwDi686l1C3OEJZg5/RmdZkJRRYUksnNAkt9xP12+mxQD
   D4PjT5jR1sVypTZhJleucfkEsmJL2C07quSqZfBXlhI6sx8kiIucgu3mY
   2uetaHjHUl/L1ymOPobTstOVNgthqVOjHzbc2ZET+G8MkRYpGDUiSX7Ik
   zUA/OYpKfKDnY3zjvmIh68A434kQKDGkxIA7cJf1EtXcuBSsjeFvhMTXE
   vFjHvoJ0d5zJMwfig2+N2d5YsGmvqM8VWMNWIjKWggQofqFbTh8Shu1Q8
   Ow9UGI6erT02mtxQKxkKjQA8iiPNSawa6Hb6YBzQ26lmhT/6sG3EOBJsh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="334384106"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="334384106"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 11:12:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="740952501"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="740952501"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 22 Feb 2023 11:12:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pUuXd-00AaQs-13;
	Wed, 22 Feb 2023 21:12:37 +0200
Date: Wed, 22 Feb 2023 21:12:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [linux-next:master 7757/13727]
 arch/arm/mach-davinci/board-da830-evm.c:18:10: fatal error:
 linux/platform_data/pcf857x.h: No such file or directory
Message-ID: <Y/ZpJfvFo0Y/e8Xj@smile.fi.intel.com>
References: <202302230244.9GrTbcGc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302230244.9GrTbcGc-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 23, 2023 at 02:40:42AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   aaf70d5ad5e2b06a8050c51e278b0c3a14fabef5
> commit: 91a0192e90e9df40d4b63c4ce11126114ed5d79d [7757/13727] gpio: pcf857x: Get rid of legacy platform data
> config: arm-buildonly-randconfig-r003-20230222 (https://download.01.org/0day-ci/archive/20230223/202302230244.9GrTbcGc-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=91a0192e90e9df40d4b63c4ce11126114ed5d79d
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 91a0192e90e9df40d4b63c4ce11126114ed5d79d
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202302230244.9GrTbcGc-lkp@intel.com/
> 
> Note: the linux-next/master HEAD aaf70d5ad5e2b06a8050c51e278b0c3a14fabef5 builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):

Not an issue for upstream. The file arch/arm/mach-pxa/balloon3.c is removed in
Torvalds' tree before this patch will come there.

-- 
With Best Regards,
Andy Shevchenko


