Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058C3193B2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 22:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693001525; x=1724537525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d06Ym1OR231s1BlQkpEJ2L9jqZfwRikkoh8ONsyj0OE=;
  b=U5wTms6FOHMWR1SQuk12x8D+txTRSX+Ki9D7Y/PAq94Hyq05chSTDmn2
   cx4+MPVi4hbKjzamjwyhBhFgVKltfUWsEAlu0woOKhxYSPJ0nXISJ5sEO
   znG5fbryNTpiDjLdOaqI62nnO+9wAbMnz2BHN9LwjZCfXQsIRGz50icRN
   zY+sSwiYwiSosMyxHEX5NDNcVbBZC6rYBQP1jsolS487gkVV0lItSkR6A
   lE36JnNl9i+sVb2ZXFqhTGZDNgcUPLop+Hseywmw0DcPfhtASPtYnNQFo
   5PbdOMW3675htrFymJ8Ev6ItSqq0bjnwasQgz+8LNICpy1TOE8mvJ18oF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="372214067"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="372214067"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 15:12:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="807673893"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="807673893"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 25 Aug 2023 15:12:02 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZf2A-00043b-0R;
	Fri, 25 Aug 2023 22:12:02 +0000
Date: Sat, 26 Aug 2023 06:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [povik:sio-v2-wip 2/5] drivers/dma/apple-sio.c:234:25: warning: no
 previous prototype for 'sio_alloc_desc'
Message-ID: <202308260650.sv1Dx6Tk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/povik/linux sio-v2-wip
head:   ca354f32cf579dac12daf68f098dc50ed434f5c9
commit: 33553c01448be5606fcca75ccae587fe454ea8fe [2/5] dmaengine: apple-sio: Add Apple SIO driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230826/202308260650.sv1Dx6Tk-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260650.sv1Dx6Tk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260650.sv1Dx6Tk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/apple-sio.c:234:25: warning: no previous prototype for 'sio_alloc_desc' [-Wmissing-prototypes]
     234 | struct sio_coproc_desc *sio_alloc_desc(struct sio_data *sio)
         |                         ^~~~~~~~~~~~~~
>> drivers/dma/apple-sio.c:245:6: warning: no previous prototype for 'sio_free_desc' [-Wmissing-prototypes]
     245 | void sio_free_desc(struct sio_data *sio, struct sio_coproc_desc *desc)
         |      ^~~~~~~~~~~~~
>> drivers/dma/apple-sio.c:250:5: warning: no previous prototype for 'sio_coproc_desc_slot' [-Wmissing-prototypes]
     250 | int sio_coproc_desc_slot(struct sio_data *sio, struct sio_coproc_desc *desc)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c: In function 'sio_recv_msg':
>> drivers/dma/apple-sio.c:564:12: warning: variable 'param' set but not used [-Wunused-but-set-variable]
     564 |         u8 param, type, tag, sioep;
         |            ^~~~~
   In file included from include/linux/device.h:15,
                    from drivers/dma/apple-sio.c:11:
   drivers/dma/apple-sio.c: In function 'sio_call':
>> drivers/dma/apple-sio.c:666:36: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
     666 |                 dev_warn(sio->dev, "call %8x timed out\n", msg);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/dma/apple-sio.c:666:17: note: in expansion of macro 'dev_warn'
     666 |                 dev_warn(sio->dev, "call %8x timed out\n", msg);
         |                 ^~~~~~~~
   drivers/dma/apple-sio.c:666:44: note: format string is defined here
     666 |                 dev_warn(sio->dev, "call %8x timed out\n", msg);
         |                                          ~~^
         |                                            |
         |                                            unsigned int
         |                                          %8llx


vim +/sio_alloc_desc +234 drivers/dma/apple-sio.c

   233	
 > 234	struct sio_coproc_desc *sio_alloc_desc(struct sio_data *sio)
   235	{
   236		int i;
   237	
   238		for (i = 0; i < SIO_NO_DESC_SLOTS; i++)
   239			if (!test_and_set_bit(i, sio->desc_allocated))
   240				return sio->shmem_desc_base + i;
   241	
   242		return NULL;
   243	}
   244	
 > 245	void sio_free_desc(struct sio_data *sio, struct sio_coproc_desc *desc)
   246	{
   247		clear_bit(desc - sio->shmem_desc_base, sio->desc_allocated);
   248	}
   249	
 > 250	int sio_coproc_desc_slot(struct sio_data *sio, struct sio_coproc_desc *desc)
   251	{
   252		return (desc - sio->shmem_desc_base) * 4;
   253	}
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
