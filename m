Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED498BEB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Dec 2022 15:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670339240; x=1701875240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iClVVExPn+fhNXrIkrHdRlhurNW2BnPY6vZoe5rvkJ8=;
  b=Go5CmhV1K3LZa01AER+Mjxn6GwCWPsQ4gBZVICghHQDUOSyMjdvvrJbl
   Z4612NJYdCKM33LIsPCeetKVP5bKVB69xPDQEPtss3HHowsY0VtP6rYX2
   syH2/lxTutkzWRN9dXifPF0Zy8d7D3olkdH/cwTkMERSZcp4x3PS0WAMn
   o6i4MUj+wGq/QulstrwF65lYVkgaal0q75cRvR2OpKqTTqwWaY4oUFVl4
   aoCgGqs1434x5nX/nQhpKtlcrHw7j39/W6g13nIABeFybJjtzL3mMauT7
   82wQuNbmIrYHYKrAq4i8KW4GZ55vkY7xq9jFamZsEJJQdipAH7vViE+BR
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="297000120"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="297000120"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 07:07:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="770751505"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="770751505"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 06 Dec 2022 07:07:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1p2ZXR-005M5C-0c;
	Tue, 06 Dec 2022 17:07:17 +0200
Date: Tue, 6 Dec 2022 17:07:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 11969/13282]
 drivers/net/thunderbolt.c:733:47: sparse: sparse: restricted __le32 degrades
 to integer
Message-ID: <Y49apAPQ/xvoqpXl@smile.fi.intel.com>
References: <202212061455.6GE7y0jg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212061455.6GE7y0jg-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 06, 2022 at 02:40:16PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   5d562c48a21eeb029a8fd3f18e1b31fd83660474
> commit: a479f9264bddfd0c266615b83f784222eccf9b91 [11969/13282] net: thunderbolt: Use bitwise types in the struct thunderbolt_ip_frame_header
> config: openrisc-randconfig-s041-20221205
> compiler: or1k-linux-gcc (GCC) 12.1.0
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
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/net/ drivers/nvme/target/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>

Yes, it's expected. The change flip-flopped the warnings. As a result the
amount of warnings has been reduced from 17 to 9.

(wsum warning is not counted in the above statistics)

> sparse warnings: (new ones prefixed by >>)
> >> drivers/net/thunderbolt.c:733:47: sparse: sparse: restricted __le32 degrades to integer
> >> drivers/net/thunderbolt.c:741:47: sparse: sparse: restricted __le16 degrades to integer
>    drivers/net/thunderbolt.c:742:44: sparse: sparse: restricted __le16 degrades to integer
> >> drivers/net/thunderbolt.c:838:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] frame_size @@     got unsigned int [assigned] [usertype] frame_size @@
>    drivers/net/thunderbolt.c:838:40: sparse:     expected restricted __le32 [usertype] frame_size
>    drivers/net/thunderbolt.c:838:40: sparse:     got unsigned int [assigned] [usertype] frame_size
> >> drivers/net/thunderbolt.c:839:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] frame_count @@     got unsigned int [usertype] @@
>    drivers/net/thunderbolt.c:839:41: sparse:     expected restricted __le32 [usertype] frame_count
>    drivers/net/thunderbolt.c:839:41: sparse:     got unsigned int [usertype]
> >> drivers/net/thunderbolt.c:840:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] frame_index @@     got unsigned short [usertype] @@
>    drivers/net/thunderbolt.c:840:41: sparse:     expected restricted __le16 [usertype] frame_index
>    drivers/net/thunderbolt.c:840:41: sparse:     got unsigned short [usertype]
> >> drivers/net/thunderbolt.c:841:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] frame_id @@     got unsigned short [usertype] @@
>    drivers/net/thunderbolt.c:841:38: sparse:     expected restricted __le16 [usertype] frame_id
>    drivers/net/thunderbolt.c:841:38: sparse:     got unsigned short [usertype]
>    drivers/net/thunderbolt.c:842:62: sparse: sparse: restricted __le32 degrades to integer
>    drivers/net/thunderbolt.c:842:35: sparse: sparse: restricted __le16 degrades to integer
>    drivers/net/thunderbolt.c:953:23: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __wsum [usertype] wsum @@     got restricted __be32 [usertype] @@
>    drivers/net/thunderbolt.c:953:23: sparse:     expected restricted __wsum [usertype] wsum
>    drivers/net/thunderbolt.c:953:23: sparse:     got restricted __be32 [usertype]

-- 
With Best Regards,
Andy Shevchenko


