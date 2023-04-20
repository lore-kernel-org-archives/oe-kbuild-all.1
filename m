Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A618C15
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 15:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682005008; x=1713541008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iO/i2tt5DEzt8gruW8+zs93sVMgkJU4X3e0uYovtxx8=;
  b=kMOhi+EkIADLuD5GNrevlmlokTPPQrq8CFdCto7twFOyBJQ+kxnUKHsI
   BhqCbKPcFMjigux4yNxqG3DevUMp+4FaPUoFKS9kI8Gsf4FaAX+mK+AaD
   KIhmeq8L84gMOPAooEk4vKcTn4QJD70/GfMPCrI1ExGLcWHX7VTm/b6F5
   zd3ooHDGdvxotHMfmsvKTgelUrv8Mpf85abWl9AERPnSAt6P0nnOtncP9
   qbehCwM9CzUgXUmRKIV0Cz1W2Qyu/XHT0Y3AbsTEghEO5SJEENUomKE6D
   8G+WXMP/k67ZX36XbBaqLTM66dhjUhrDn9DgSP89xJBDEhxezUXueA9xU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="348533245"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="348533245"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 08:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756537428"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="756537428"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Apr 2023 08:36:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppWKx-000fuA-2b;
	Thu, 20 Apr 2023 15:36:43 +0000
Date: Thu, 20 Apr 2023 23:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>, Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Daniil Tatianin <d-tatianin@yandex-team.ru>,
	linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] md/md-multipath: guard against a possible NULL
 dereference
Message-ID: <202304202346.fddWOoq1-lkp@intel.com>
References: <20230420071851.326726-1-d-tatianin@yandex-team.ru>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420071851.326726-1-d-tatianin@yandex-team.ru>

Hi Daniil,

kernel test robot noticed the following build errors:

[auto build test ERROR on song-md/md-next]
[also build test ERROR on linus/master v6.3-rc7 next-20230419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniil-Tatianin/md-md-multipath-guard-against-a-possible-NULL-dereference/20230420-152235
base:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git md-next
patch link:    https://lore.kernel.org/r/20230420071851.326726-1-d-tatianin%40yandex-team.ru
patch subject: [PATCH] md/md-multipath: guard against a possible NULL dereference
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230420/202304202346.fddWOoq1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3b0e378bb2e165f35044ecb535fb1ed973ea392e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniil-Tatianin/md-md-multipath-guard-against-a-possible-NULL-dereference/20230420-152235
        git checkout 3b0e378bb2e165f35044ecb535fb1ed973ea392e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304202346.fddWOoq1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/md/md-multipath.c: In function 'multipath_make_request':
>> drivers/md/md-multipath.c:111:14: error: 'map_bh' undeclared (first use in this function); did you mean 'mp_bh'?
     111 |         if (!map_bh)
         |              ^~~~~~
         |              mp_bh
   drivers/md/md-multipath.c:111:14: note: each undeclared identifier is reported only once for each function it appears in


vim +111 drivers/md/md-multipath.c

    99	
   100	static bool multipath_make_request(struct mddev *mddev, struct bio * bio)
   101	{
   102		struct mpconf *conf = mddev->private;
   103		struct multipath_bh * mp_bh;
   104		struct multipath_info *multipath;
   105	
   106		if (unlikely(bio->bi_opf & REQ_PREFLUSH)
   107		    && md_flush_request(mddev, bio))
   108			return true;
   109	
   110		mp_bh = mempool_alloc(&conf->pool, GFP_NOIO);
 > 111		if (!map_bh)
   112			return false;
   113	
   114		mp_bh->master_bio = bio;
   115		mp_bh->mddev = mddev;
   116	
   117		mp_bh->path = multipath_map(conf);
   118		if (mp_bh->path < 0) {
   119			bio_io_error(bio);
   120			mempool_free(mp_bh, &conf->pool);
   121			return true;
   122		}
   123		multipath = conf->multipaths + mp_bh->path;
   124	
   125		bio_init_clone(multipath->rdev->bdev, &mp_bh->bio, bio, GFP_NOIO);
   126	
   127		mp_bh->bio.bi_iter.bi_sector += multipath->rdev->data_offset;
   128		mp_bh->bio.bi_opf |= REQ_FAILFAST_TRANSPORT;
   129		mp_bh->bio.bi_end_io = multipath_end_request;
   130		mp_bh->bio.bi_private = mp_bh;
   131		mddev_check_write_zeroes(mddev, &mp_bh->bio);
   132		submit_bio_noacct(&mp_bh->bio);
   133		return true;
   134	}
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
