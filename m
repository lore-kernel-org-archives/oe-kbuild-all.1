Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6D48C1A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Dec 2022 21:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670450047; x=1701986047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k5iBr9WTC8Ru/hPnDXy+RtrV235a7fO36CkAe0f+geE=;
  b=JExgt3YGtrd0PMY44t8mW3PsxQQibzpr99JtuTZMulearjFDlXN4Y0BN
   mhwBi1CBCZl005O4+U0HGGYbm2RRfupxkO1TiQzG6V7tmspmd/7NOzaPM
   0nS6VKRcKVJb4mfNJBjs6ZKPOT1YfitTkd/HIMMc3hcuX2IMg9+xhmlo4
   gXMNTBeRREcP0qZj2IpMMP+uCyHrwCBf7Y3oZbZyugHrdSkvpZIk3jW2j
   ghZaZCj3ZzMQvzzjS/Y0u0x9zb0rFUQEYNB1Zx3beBRXCT8vjt86CpxKF
   CI60k4z0FJAoakFp8qHZ/fK09b1+PTNacNg056W8aKIs71VkZoO1tgXC+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="297368560"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="297368560"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 13:53:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="710219814"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="710219814"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 07 Dec 2022 13:53:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1p32MX-0060gI-0A;
	Wed, 07 Dec 2022 23:53:57 +0200
Date: Wed, 7 Dec 2022 23:53:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 11968/13707]
 drivers/net/thunderbolt.c:733:47: sparse: sparse: restricted __le32 degrades
 to integer
Message-ID: <Y5ELdPsDBwv0cqsf@smile.fi.intel.com>
References: <202212080214.epOxawk7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212080214.epOxawk7-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 08, 2022 at 02:53:05AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   591cd61541b9b95401e17dca24be486e32104cb8
> commit: a479f9264bddfd0c266615b83f784222eccf9b91 [11968/13707] net: thunderbolt: Use bitwise types in the struct thunderbolt_ip_frame_header
> config: csky-randconfig-s032-20221206
> compiler: csky-linux-gcc (GCC) 12.1.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a479f9264bddfd0c266615b83f784222eccf9b91
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout a479f9264bddfd0c266615b83f784222eccf9b91
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky SHELL=/bin/bash drivers/net/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>

It's expected. And it was already explained in reply to the previous LKP report.

-- 
With Best Regards,
Andy Shevchenko


