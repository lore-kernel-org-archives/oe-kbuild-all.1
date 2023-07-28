Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8ACC2C0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 07:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690528581; x=1722064581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RqAKBI2brZz0iglwT4+ws3oysl4sVcuHnFYFiwjZ04w=;
  b=Y0d3uqxBg2XDrOUYZ4PQuRqn11q7dX2gSZ27iKOS1sstTANWfD68u4Ks
   oCASQI7WrSnEuO7LIshlQ7IgERwelVaaVU7SrGcbgg0BblF2ekKxbfBCg
   Uzj5iLfrLO8ntVnZsW3NRMfm4L/iG8axU7JfGGJIXA0Dbx8MSgSle5ZbP
   Cya18Ah2M/EKtAX3AJu7yMQF+l2FoxrAJWR3STOaCdH5JSVBFqMv5tgcC
   iHCNxzYLPe2v24jQOs3M3fayUJUxfi7Vl5ld1sCeUSGdZv3UydnhwnCls
   jRq1GmotTlyDebEXQicHx48zBorD2wPt6m6mXYFMaCxun7lbiqmCTf5b8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="432340439"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="432340439"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 00:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="870759216"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2023 00:15:56 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPHha-0002yB-14;
	Fri, 28 Jul 2023 07:15:54 +0000
Date: Fri, 28 Jul 2023 15:15:42 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <David.Laight@aculab.com>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
	'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
	'Andrew Morton' <akpm@linux-foundation.org>,
	"'Matthew Wilcox (Oracle)'" <willy@infradead.org>,
	'Christoph Hellwig' <hch@infradead.org>,
	"'Jason A. Donenfeld'" <Jason@zx2c4.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH next resend 5/5] minmax: Relax check to allow comparison
 between int and small unsigned constants.
Message-ID: <202307281520.WNoM3bxU-lkp@intel.com>
References: <48c2cd0407f14859919d4fcbe526234a@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48c2cd0407f14859919d4fcbe526234a@AcuMS.aculab.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.5-rc3 next-20230727]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/48c2cd0407f14859919d4fcbe526234a%40AcuMS.aculab.com
patch subject: [PATCH next resend 5/5] minmax: Relax check to allow comparison between int and small unsigned constants.
config: microblaze-randconfig-r092-20230725 (https://download.01.org/0day-ci/archive/20230728/202307281520.WNoM3bxU-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281520.WNoM3bxU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281520.WNoM3bxU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> crypto/skcipher.c:80:16: sparse: sparse: incompatible types for operation (>=):
>> crypto/skcipher.c:80:16: sparse:    unsigned char [usertype] *start
>> crypto/skcipher.c:80:16: sparse:    int
>> crypto/skcipher.c:80:16: sparse: sparse: bad constant expression type
>> crypto/skcipher.c:80:16: sparse: sparse: incompatible types for operation (>=):
>> crypto/skcipher.c:80:16: sparse:    unsigned char [usertype] *start
>> crypto/skcipher.c:80:16: sparse:    int
>> crypto/skcipher.c:80:16: sparse: sparse: incompatible types for operation (>=):
>> crypto/skcipher.c:80:16: sparse:    unsigned char [usertype] *end_page
>> crypto/skcipher.c:80:16: sparse:    int
>> crypto/skcipher.c:80:16: sparse: sparse: incompatible types for operation (>=):
>> crypto/skcipher.c:80:16: sparse:    unsigned char [usertype] *start
>> crypto/skcipher.c:80:16: sparse:    int
>> crypto/skcipher.c:80:16: sparse: sparse: incompatible types for operation (>=):
>> crypto/skcipher.c:80:16: sparse:    unsigned char [usertype] *end_page
>> crypto/skcipher.c:80:16: sparse:    int
   crypto/skcipher.c:80:16: sparse: sparse: incompatible types for operation (>):
   crypto/skcipher.c:80:16: sparse:    bad type __UNIQUE_ID___x297
   crypto/skcipher.c:80:16: sparse:    bad type __UNIQUE_ID___y298
>> crypto/skcipher.c:80:16: sparse: sparse: incompatible types for operation (>=):
>> crypto/skcipher.c:80:16: sparse:    unsigned char [usertype] *start
>> crypto/skcipher.c:80:16: sparse:    int
>> crypto/skcipher.c:80:16: sparse: sparse: incompatible types for operation (>=):
>> crypto/skcipher.c:80:16: sparse:    unsigned char [usertype] *end_page
>> crypto/skcipher.c:80:16: sparse:    int
   crypto/skcipher.c:80:16: sparse: sparse: incompatible types for operation (>):
   crypto/skcipher.c:80:16: sparse:    bad type __UNIQUE_ID___x297
   crypto/skcipher.c:80:16: sparse:    bad type __UNIQUE_ID___y298
>> crypto/skcipher.c:80:16: sparse: sparse: incompatible types for operation (>=):
>> crypto/skcipher.c:80:16: sparse:    unsigned char [usertype] *start
>> crypto/skcipher.c:80:16: sparse:    int
>> crypto/skcipher.c:80:16: sparse: sparse: incompatible types for operation (>=):
>> crypto/skcipher.c:80:16: sparse:    unsigned char [usertype] *end_page
>> crypto/skcipher.c:80:16: sparse:    int
   crypto/skcipher.c:80:16: sparse: sparse: incompatible types for operation (>):
   crypto/skcipher.c:80:16: sparse:    bad type __UNIQUE_ID___x297
   crypto/skcipher.c:80:16: sparse:    bad type __UNIQUE_ID___y298
>> crypto/skcipher.c:80:16: sparse: sparse: incompatible types for operation (>=):
>> crypto/skcipher.c:80:16: sparse:    unsigned char [usertype] *start
>> crypto/skcipher.c:80:16: sparse:    int
>> crypto/skcipher.c:80:16: sparse: sparse: incompatible types for operation (>=):
>> crypto/skcipher.c:80:16: sparse:    unsigned char [usertype] *end_page
>> crypto/skcipher.c:80:16: sparse:    int
   crypto/skcipher.c:80:16: sparse: sparse: incompatible types for operation (>):
   crypto/skcipher.c:80:16: sparse:    bad type __UNIQUE_ID___x297
   crypto/skcipher.c:80:16: sparse:    bad type __UNIQUE_ID___y298
--
   drivers/gpu/drm/drm_modes.c: note: in included file (through include/drm/drm_plane.h, include/drm/drm_crtc.h):
   include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant expression
   include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(max)"
>> drivers/gpu/drm/drm_modes.c:2474:29: sparse: sparse: incompatible types for operation (>=):
>> drivers/gpu/drm/drm_modes.c:2474:29: sparse:    char *bpp_end_ptr
>> drivers/gpu/drm/drm_modes.c:2474:29: sparse:    int
>> drivers/gpu/drm/drm_modes.c:2474:29: sparse: sparse: bad constant expression type
>> drivers/gpu/drm/drm_modes.c:2474:29: sparse: sparse: incompatible types for operation (>=):
>> drivers/gpu/drm/drm_modes.c:2474:29: sparse:    char *[addressable] bpp_end_ptr
>> drivers/gpu/drm/drm_modes.c:2474:29: sparse:    int
>> drivers/gpu/drm/drm_modes.c:2474:29: sparse: sparse: incompatible types for operation (>=):
>> drivers/gpu/drm/drm_modes.c:2474:29: sparse:    char *[addressable] refresh_end_ptr
>> drivers/gpu/drm/drm_modes.c:2474:29: sparse:    int
>> drivers/gpu/drm/drm_modes.c:2474:29: sparse: sparse: incompatible types for operation (>=):
>> drivers/gpu/drm/drm_modes.c:2474:29: sparse:    char *[addressable] bpp_end_ptr
>> drivers/gpu/drm/drm_modes.c:2474:29: sparse:    int
>> drivers/gpu/drm/drm_modes.c:2474:29: sparse: sparse: incompatible types for operation (>=):
>> drivers/gpu/drm/drm_modes.c:2474:29: sparse:    char *[addressable] refresh_end_ptr
>> drivers/gpu/drm/drm_modes.c:2474:29: sparse:    int
   drivers/gpu/drm/drm_modes.c:2474:29: sparse: sparse: incompatible types for operation (>):
   drivers/gpu/drm/drm_modes.c:2474:29: sparse:    bad type __UNIQUE_ID___x334
   drivers/gpu/drm/drm_modes.c:2474:29: sparse:    bad type __UNIQUE_ID___y335
--
>> net/ceph/osdmap.c:1773:54: sparse: sparse: incompatible types for operation (>=):
>> net/ceph/osdmap.c:1773:54: sparse:    void *
>> net/ceph/osdmap.c:1773:54: sparse:    int
>> net/ceph/osdmap.c:1773:54: sparse: sparse: bad constant expression type
   net/ceph/osdmap.c:2000:46: sparse: sparse: incompatible types for operation (>=):
   net/ceph/osdmap.c:2000:46: sparse:    void *
   net/ceph/osdmap.c:2000:46: sparse:    int
   net/ceph/osdmap.c:2000:46: sparse: sparse: bad constant expression type
   net/ceph/osdmap.c:2007:57: sparse: sparse: incompatible types for operation (>=):
   net/ceph/osdmap.c:2007:57: sparse:    void *
   net/ceph/osdmap.c:2007:57: sparse:    int
   net/ceph/osdmap.c:2007:57: sparse: sparse: bad constant expression type
>> net/ceph/osdmap.c:1773:54: sparse: sparse: incompatible types for operation (>=):
>> net/ceph/osdmap.c:1773:54: sparse:    void *
>> net/ceph/osdmap.c:1773:54: sparse:    int
>> net/ceph/osdmap.c:1773:54: sparse: sparse: incompatible types for operation (>=):
>> net/ceph/osdmap.c:1773:54: sparse:    void *end
>> net/ceph/osdmap.c:1773:54: sparse:    int
>> net/ceph/osdmap.c:1773:54: sparse: sparse: incompatible types for operation (>=):
>> net/ceph/osdmap.c:1773:54: sparse:    void *
>> net/ceph/osdmap.c:1773:54: sparse:    int
>> net/ceph/osdmap.c:1773:54: sparse: sparse: incompatible types for operation (>=):
>> net/ceph/osdmap.c:1773:54: sparse:    void *end
>> net/ceph/osdmap.c:1773:54: sparse:    int
   net/ceph/osdmap.c:1773:54: sparse: sparse: incompatible types for operation (<):
   net/ceph/osdmap.c:1773:54: sparse:    bad type __UNIQUE_ID___x318
   net/ceph/osdmap.c:1773:54: sparse:    bad type __UNIQUE_ID___y319
   net/ceph/osdmap.c:2000:46: sparse: sparse: incompatible types for operation (>=):
   net/ceph/osdmap.c:2000:46: sparse:    void *
   net/ceph/osdmap.c:2000:46: sparse:    int
   net/ceph/osdmap.c:2000:46: sparse: sparse: incompatible types for operation (>=):
   net/ceph/osdmap.c:2000:46: sparse:    void *end
   net/ceph/osdmap.c:2000:46: sparse:    int
   net/ceph/osdmap.c:2000:46: sparse: sparse: incompatible types for operation (>=):
   net/ceph/osdmap.c:2000:46: sparse:    void *
   net/ceph/osdmap.c:2000:46: sparse:    int
   net/ceph/osdmap.c:2000:46: sparse: sparse: incompatible types for operation (>=):
   net/ceph/osdmap.c:2000:46: sparse:    void *end
   net/ceph/osdmap.c:2000:46: sparse:    int
   net/ceph/osdmap.c:2000:46: sparse: sparse: incompatible types for operation (<):
   net/ceph/osdmap.c:2000:46: sparse:    bad type __UNIQUE_ID___x322
   net/ceph/osdmap.c:2000:46: sparse:    bad type __UNIQUE_ID___y323
   net/ceph/osdmap.c:2007:57: sparse: sparse: incompatible types for operation (>=):
   net/ceph/osdmap.c:2007:57: sparse:    void *
   net/ceph/osdmap.c:2007:57: sparse:    int
   net/ceph/osdmap.c:2007:57: sparse: sparse: incompatible types for operation (>=):
   net/ceph/osdmap.c:2007:57: sparse:    void *end
   net/ceph/osdmap.c:2007:57: sparse:    int
   net/ceph/osdmap.c:2007:57: sparse: sparse: incompatible types for operation (>=):
   net/ceph/osdmap.c:2007:57: sparse:    void *
   net/ceph/osdmap.c:2007:57: sparse:    int
   net/ceph/osdmap.c:2007:57: sparse: sparse: incompatible types for operation (>=):
   net/ceph/osdmap.c:2007:57: sparse:    void *end
   net/ceph/osdmap.c:2007:57: sparse:    int
   net/ceph/osdmap.c:2007:57: sparse: sparse: incompatible types for operation (<):
   net/ceph/osdmap.c:2007:57: sparse:    bad type __UNIQUE_ID___x324
   net/ceph/osdmap.c:2007:57: sparse:    bad type __UNIQUE_ID___y325
--
>> lib/lzo/lzo1x_compress.c:53:54: sparse: sparse: incompatible types for operation (>=):
>> lib/lzo/lzo1x_compress.c:53:54: sparse:    unsigned char const *const ip_end
>> lib/lzo/lzo1x_compress.c:53:54: sparse:    int
>> lib/lzo/lzo1x_compress.c:53:54: sparse: sparse: bad constant expression type
>> lib/lzo/lzo1x_compress.c:53:54: sparse: sparse: incompatible types for operation (>=):
>> lib/lzo/lzo1x_compress.c:53:54: sparse:    unsigned char const *const ip_end
>> lib/lzo/lzo1x_compress.c:53:54: sparse:    int
>> lib/lzo/lzo1x_compress.c:53:54: sparse: sparse: incompatible types for operation (>=):
>> lib/lzo/lzo1x_compress.c:53:54: sparse:    unsigned char const *
>> lib/lzo/lzo1x_compress.c:53:54: sparse:    int
>> lib/lzo/lzo1x_compress.c:53:54: sparse: sparse: incompatible types for operation (>=):
>> lib/lzo/lzo1x_compress.c:53:54: sparse:    unsigned char const *const ip_end
>> lib/lzo/lzo1x_compress.c:53:54: sparse:    int
>> lib/lzo/lzo1x_compress.c:53:54: sparse: sparse: incompatible types for operation (>=):
>> lib/lzo/lzo1x_compress.c:53:54: sparse:    unsigned char const *
>> lib/lzo/lzo1x_compress.c:53:54: sparse:    int
   lib/lzo/lzo1x_compress.c:53:54: sparse: sparse: incompatible types for operation (<):
   lib/lzo/lzo1x_compress.c:53:54: sparse:    bad type __UNIQUE_ID___x182
   lib/lzo/lzo1x_compress.c:53:54: sparse:    bad type __UNIQUE_ID___y183

vim +80 crypto/skcipher.c

b286d8b1a69066 Herbert Xu 2016-11-22  72  
b286d8b1a69066 Herbert Xu 2016-11-22  73  /* Get a spot of the specified length that does not straddle a page.
b286d8b1a69066 Herbert Xu 2016-11-22  74   * The caller needs to ensure that there is enough space for this operation.
b286d8b1a69066 Herbert Xu 2016-11-22  75   */
b286d8b1a69066 Herbert Xu 2016-11-22  76  static inline u8 *skcipher_get_spot(u8 *start, unsigned int len)
b286d8b1a69066 Herbert Xu 2016-11-22  77  {
b286d8b1a69066 Herbert Xu 2016-11-22  78  	u8 *end_page = (u8 *)(((unsigned long)(start + len - 1)) & PAGE_MASK);
b286d8b1a69066 Herbert Xu 2016-11-22  79  
b286d8b1a69066 Herbert Xu 2016-11-22 @80  	return max(start, end_page);
b286d8b1a69066 Herbert Xu 2016-11-22  81  }
b286d8b1a69066 Herbert Xu 2016-11-22  82  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
