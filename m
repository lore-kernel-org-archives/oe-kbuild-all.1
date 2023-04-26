Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD66C2D7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 06:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682489261; x=1714025261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=61rcuQojzawqY3VT1NZUTOHb6tPHTiO+dnB8VHoY9UQ=;
  b=he8VV0iaDNj9kOp7Dk0EElFakH/OyImkVqZmAOhoEXyu21CAncg96S6R
   kSOS+YT/8eLas3Fsm0zpCJnUD+UNPUwdz3jgaPaOVLCCsP9nkcYmggRnh
   Re+97/h0YF1ui/gdXT4A5orIv8WMteAsEc5GUDTUXnJdUDtyL/7fS78no
   BXNQePEE1/fOH8Dg6sfWYpi8n9OQH9TXUSXGqkfUHjktSKogRUlHOCpLK
   XpQC9p/Y4hq2KWa2grqVfNm0FZKSOxawurwY/26JMsaavNEcmLlMuIiCS
   CtjSGLC2KTOBtdBPgVYJZpFkoBG7uFhqT7OASAyBG9rTT+5LCLFllQT8e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="348943228"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="348943228"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 23:07:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="758467967"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="758467967"
Received: from lkp-server01.sh.intel.com (HELO 98ee5a99fc83) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Apr 2023 23:07:35 -0700
Received: from kbuild by 98ee5a99fc83 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prYJS-0000C4-1P;
	Wed, 26 Apr 2023 06:07:34 +0000
Date: Wed, 26 Apr 2023 14:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com,
	deller@gmx.de, geert@linux-m68k.org, sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: oe-kbuild-all@lists.linux.dev, linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/6] fbdev: Move CFB read and write code into helper
 functions
Message-ID: <202304261333.9giYEbEl-lkp@intel.com>
References: <20230425142846.730-6-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425142846.730-6-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master next-20230425]
[cannot apply to v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-Return-number-of-bytes-read-or-written/20230425-223011
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230425142846.730-6-tzimmermann%40suse.de
patch subject: [PATCH 5/6] fbdev: Move CFB read and write code into helper functions
config: nios2-randconfig-s031-20230423 (https://download.01.org/0day-ci/archive/20230426/202304261333.9giYEbEl-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/d4a150f3dfa8e73f2e92f1c7efc9271e17632cc2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/fbdev-Return-number-of-bytes-read-or-written/20230425-223011
        git checkout d4a150f3dfa8e73f2e92f1c7efc9271e17632cc2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/video/fbdev/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304261333.9giYEbEl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/core/fb_cfb_fops.c:44:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *s @@     got unsigned char [noderef] [usertype] __iomem *[assigned] src @@
   drivers/video/fbdev/core/fb_cfb_fops.c:44:39: sparse:     expected void const *s
   drivers/video/fbdev/core/fb_cfb_fops.c:44:39: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] src
>> drivers/video/fbdev/core/fb_cfb_fops.c:113:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *d @@     got unsigned char [noderef] [usertype] __iomem *[assigned] dst @@
   drivers/video/fbdev/core/fb_cfb_fops.c:113:32: sparse:     expected void *d
   drivers/video/fbdev/core/fb_cfb_fops.c:113:32: sparse:     got unsigned char [noderef] [usertype] __iomem *[assigned] dst

vim +44 drivers/video/fbdev/core/fb_cfb_fops.c

     6	
     7	ssize_t fb_cfb_read(struct fb_info *info, char __user *buf, size_t count, loff_t *ppos)
     8	{
     9		unsigned long p = *ppos;
    10		u8 *buffer, *dst;
    11		u8 __iomem *src;
    12		int c, cnt = 0, err = 0;
    13		unsigned long total_size;
    14	
    15		if (!info->screen_base)
    16			return -ENODEV;
    17	
    18		total_size = info->screen_size;
    19	
    20		if (total_size == 0)
    21			total_size = info->fix.smem_len;
    22	
    23		if (p >= total_size)
    24			return 0;
    25	
    26		if (count >= total_size)
    27			count = total_size;
    28	
    29		if (count + p > total_size)
    30			count = total_size - p;
    31	
    32		buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count, GFP_KERNEL);
    33		if (!buffer)
    34			return -ENOMEM;
    35	
    36		src = (u8 __iomem *)(info->screen_base + p);
    37	
    38		if (info->fbops->fb_sync)
    39			info->fbops->fb_sync(info);
    40	
    41		while (count) {
    42			c  = (count > PAGE_SIZE) ? PAGE_SIZE : count;
    43			dst = buffer;
  > 44			fb_memcpy_fromfb(dst, src, c);
    45			dst += c;
    46			src += c;
    47	
    48			if (copy_to_user(buf, buffer, c)) {
    49				err = -EFAULT;
    50				break;
    51			}
    52			*ppos += c;
    53			buf += c;
    54			cnt += c;
    55			count -= c;
    56		}
    57	
    58		kfree(buffer);
    59	
    60		return cnt ? cnt : err;
    61	}
    62	EXPORT_SYMBOL(fb_cfb_read);
    63	
    64	ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf, size_t count, loff_t *ppos)
    65	{
    66		unsigned long p = *ppos;
    67		u8 *buffer, *src;
    68		u8 __iomem *dst;
    69		int c, cnt = 0, err = 0;
    70		unsigned long total_size;
    71	
    72		if (!info->screen_base)
    73			return -ENODEV;
    74	
    75		total_size = info->screen_size;
    76	
    77		if (total_size == 0)
    78			total_size = info->fix.smem_len;
    79	
    80		if (p > total_size)
    81			return -EFBIG;
    82	
    83		if (count > total_size) {
    84			err = -EFBIG;
    85			count = total_size;
    86		}
    87	
    88		if (count + p > total_size) {
    89			if (!err)
    90				err = -ENOSPC;
    91	
    92			count = total_size - p;
    93		}
    94	
    95		buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count, GFP_KERNEL);
    96		if (!buffer)
    97			return -ENOMEM;
    98	
    99		dst = (u8 __iomem *)(info->screen_base + p);
   100	
   101		if (info->fbops->fb_sync)
   102			info->fbops->fb_sync(info);
   103	
   104		while (count) {
   105			c = (count > PAGE_SIZE) ? PAGE_SIZE : count;
   106			src = buffer;
   107	
   108			if (copy_from_user(src, buf, c)) {
   109				err = -EFAULT;
   110				break;
   111			}
   112	
 > 113			fb_memcpy_tofb(dst, src, c);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
