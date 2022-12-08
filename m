Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ED77F1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Dec 2022 08:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670489230; x=1702025230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I8N7JecfIiQIATbWWv00NC9eoVsc5mY0sQbfMXkpx6w=;
  b=eiz0QfZAZp+WiyG7yET+Y/YbyfHleET0k7by/qRL3xzoDotOFYufUUgn
   ZXGZXHUIVZcJoYGWlxmOFnG1hPlZ61DRB6QtqB3pOh5ethse61KkLaa4a
   2L8NNtf75dtKJybk+nLNPl6ve9VKUGgDczrBCs3ujjux+ipFlrAdRw1bp
   lv9JAEmhYVAl2tR2xlAAYCGY0xfuHNVejJ89ep1kfzDHkIioS7InRgML2
   u945pAMjkEleXqjM5h3fkcb2q3KGCgZI1DyUy6g0h2GhWjXT1GwH/EBSK
   MttEkZYLS5Yl1AIFjJiOeyGydJGXlxYvwjJqTISBt3N7V0nM6d6P5xA1y
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="381409905"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="381409905"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 00:47:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="975781632"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="975781632"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 08 Dec 2022 00:47:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1p3CYd-006ClE-09;
	Thu, 08 Dec 2022 10:47:07 +0200
Date: Thu, 8 Dec 2022 10:47:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Chen, Rong A" <rong.a.chen@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 11969/13282]
 drivers/net/thunderbolt.c:733:47: sparse: sparse: restricted __le32 degrades
 to integer
Message-ID: <Y5GkipQqVz9WVGtq@smile.fi.intel.com>
References: <202212061455.6GE7y0jg-lkp@intel.com>
 <Y49apAPQ/xvoqpXl@smile.fi.intel.com>
 <d70e9a74-e965-b21b-9c58-eef4029e247a@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d70e9a74-e965-b21b-9c58-eef4029e247a@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 08, 2022 at 03:04:52PM +0800, Chen, Rong A wrote:
> On 12/6/2022 11:07 PM, Andy Shevchenko wrote:
> > On Tue, Dec 06, 2022 at 02:40:16PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   5d562c48a21eeb029a8fd3f18e1b31fd83660474
> > > commit: a479f9264bddfd0c266615b83f784222eccf9b91 [11969/13282] net: thunderbolt: Use bitwise types in the struct thunderbolt_ip_frame_header
> > > config: openrisc-randconfig-s041-20221205
> > > compiler: or1k-linux-gcc (GCC) 12.1.0
> > > reproduce:
> > >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >          chmod +x ~/bin/make.cross
> > >          # apt-get install sparse
> > >          # sparse version: v0.6.4-39-gce1a6720-dirty
> > >          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a479f9264bddfd0c266615b83f784222eccf9b91
> > >          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > >          git fetch --no-tags linux-next master
> > >          git checkout a479f9264bddfd0c266615b83f784222eccf9b91
> > >          # save the config file
> > >          mkdir build_dir && cp config build_dir/.config
> > >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/net/ drivers/nvme/target/
> > > 
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > 
> > Yes, it's expected. The change flip-flopped the warnings. As a result the
> > amount of warnings has been reduced from 17 to 9.
> 
> Hi Andy,
> 
> Sorry for the inconvenience, we'll add it to our ignore list.

Ideally you should have compared the warnings before and after the change and
tell something like warnings number dropped or increased to N (arbitrary
number, should be real one based on the parser's output) and leave new warnings
to be produced.

> > (wsum warning is not counted in the above statistics)

And this warning is still in place, so it shouldn't be reflected in the
statistics.

> > > sparse warnings: (new ones prefixed by >>)
> > > > > drivers/net/thunderbolt.c:733:47: sparse: sparse: restricted __le32 degrades to integer
> > > > > drivers/net/thunderbolt.c:741:47: sparse: sparse: restricted __le16 degrades to integer
> > >     drivers/net/thunderbolt.c:742:44: sparse: sparse: restricted __le16 degrades to integer
> > > > > drivers/net/thunderbolt.c:838:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] frame_size @@     got unsigned int [assigned] [usertype] frame_size @@
> > >     drivers/net/thunderbolt.c:838:40: sparse:     expected restricted __le32 [usertype] frame_size
> > >     drivers/net/thunderbolt.c:838:40: sparse:     got unsigned int [assigned] [usertype] frame_size
> > > > > drivers/net/thunderbolt.c:839:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] frame_count @@     got unsigned int [usertype] @@
> > >     drivers/net/thunderbolt.c:839:41: sparse:     expected restricted __le32 [usertype] frame_count
> > >     drivers/net/thunderbolt.c:839:41: sparse:     got unsigned int [usertype]
> > > > > drivers/net/thunderbolt.c:840:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] frame_index @@     got unsigned short [usertype] @@
> > >     drivers/net/thunderbolt.c:840:41: sparse:     expected restricted __le16 [usertype] frame_index
> > >     drivers/net/thunderbolt.c:840:41: sparse:     got unsigned short [usertype]
> > > > > drivers/net/thunderbolt.c:841:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] frame_id @@     got unsigned short [usertype] @@
> > >     drivers/net/thunderbolt.c:841:38: sparse:     expected restricted __le16 [usertype] frame_id
> > >     drivers/net/thunderbolt.c:841:38: sparse:     got unsigned short [usertype]
> > >     drivers/net/thunderbolt.c:842:62: sparse: sparse: restricted __le32 degrades to integer
> > >     drivers/net/thunderbolt.c:842:35: sparse: sparse: restricted __le16 degrades to integer
> > >     drivers/net/thunderbolt.c:953:23: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __wsum [usertype] wsum @@     got restricted __be32 [usertype] @@
> > >     drivers/net/thunderbolt.c:953:23: sparse:     expected restricted __wsum [usertype] wsum
> > >     drivers/net/thunderbolt.c:953:23: sparse:     got restricted __be32 [usertype]
> > 

-- 
With Best Regards,
Andy Shevchenko


