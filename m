Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03C079F1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 15:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692632172; x=1724168172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rLEGs7Zd4Ne7jWZs9yU50b3K9Dpi2ro7Mz8i6Ud4Uls=;
  b=IR23+wzuiUT9y1ygJXdghnKila8iexIHlPiZY1vponULG2hEGj4I7O77
   dG3hUFNsZKw9PNc+bX5Ny063dAYy2oB4WSInW19gODhd5ulLDVBsz6B2G
   kokN9v7ljVYxQc0sZO/zzOxU/JFR8+KXOT5a5YAnjlS0MNHI3oUPonnsO
   rMf+K7lJWY3FJsE/zBX2vWw1U5TXxo5re76UvqAoDsssypILr1eX7fq8P
   Nf9iD2cWVV5UaWDrroNPeSReS/X4YjIm+Yaslg08W7DS1+o7/Bj11xRAD
   rOxn2EeSOmudhMLrljkUQqGQ9l+81Xk2XRlnHXmAcaISGpimEozRRK5Dk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377361887"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="377361887"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 08:36:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="738929657"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="738929657"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Aug 2023 08:36:08 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY6wk-0000e0-0K;
	Mon, 21 Aug 2023 15:36:03 +0000
Date: Mon, 21 Aug 2023 23:35:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 391/23287]
 drivers/media/common/videobuf2/videobuf2-core.c:1999: undefined reference to
 `v4l_vb2q_enable_media_source'
Message-ID: <202308212329.TfighvIk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Todd,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   f0fefbe055362c9a8f29ddaadf584466477b8ea0
commit: 649238947d688eea17d27825fdc651d693e48a33 [391/23287] ANDROID: init: GKI: enable hidden configs for media
config: i386-randconfig-r053-20230821 (https://download.01.org/0day-ci/archive/20230821/202308212329.TfighvIk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308212329.TfighvIk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308212329.TfighvIk-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
>> drivers/media/common/videobuf2/videobuf2-core.c:1999: undefined reference to `v4l_vb2q_enable_media_source'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +1999 drivers/media/common/videobuf2/videobuf2-core.c

bd323e28bd82df drivers/media/video/videobuf2-core.c            Marek Szyprowski        2011-08-29  1968  
3c5be988e0b6a2 drivers/media/v4l2-core/videobuf2-core.c        Junghak Sung            2015-10-06  1969  int vb2_core_streamon(struct vb2_queue *q, unsigned int type)
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak            2010-10-11  1970  {
5db2c3ba4de848 drivers/media/video/videobuf2-core.c            Pawel Osciak            2011-03-20  1971  	int ret;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak            2010-10-11  1972  
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak            2010-10-11  1973  	if (type != q->type) {
fd4354cf528ab2 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil            2014-04-07  1974  		dprintk(1, "invalid stream type\n");
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak            2010-10-11  1975  		return -EINVAL;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak            2010-10-11  1976  	}
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak            2010-10-11  1977  
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak            2010-10-11  1978  	if (q->streaming) {
fd4354cf528ab2 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil            2014-04-07  1979  		dprintk(3, "already streaming\n");
f956035ce70b8d drivers/media/v4l2-core/videobuf2-core.c        Ricardo Ribalda Delgado 2013-11-08  1980  		return 0;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak            2010-10-11  1981  	}
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak            2010-10-11  1982  
548df7831adc34 drivers/media/v4l2-core/videobuf2-core.c        Ricardo Ribalda Delgado 2014-01-08  1983  	if (!q->num_buffers) {
fd4354cf528ab2 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil            2014-04-07  1984  		dprintk(1, "no buffers have been allocated\n");
548df7831adc34 drivers/media/v4l2-core/videobuf2-core.c        Ricardo Ribalda Delgado 2014-01-08  1985  		return -EINVAL;
548df7831adc34 drivers/media/v4l2-core/videobuf2-core.c        Ricardo Ribalda Delgado 2014-01-08  1986  	}
548df7831adc34 drivers/media/v4l2-core/videobuf2-core.c        Ricardo Ribalda Delgado 2014-01-08  1987  
b3379c6201bb35 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil            2014-02-24  1988  	if (q->num_buffers < q->min_buffers_needed) {
fd4354cf528ab2 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil            2014-04-07  1989  		dprintk(1, "need at least %u allocated buffers\n",
b3379c6201bb35 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil            2014-02-24  1990  				q->min_buffers_needed);
b3379c6201bb35 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil            2014-02-24  1991  		return -EINVAL;
b3379c6201bb35 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil            2014-02-24  1992  	}
249f5a58bc8445 drivers/media/v4l2-core/videobuf2-core.c        Ricardo Ribalda Delgado 2014-01-08  1993  
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak            2010-10-11  1994  	/*
b3379c6201bb35 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil            2014-02-24  1995  	 * Tell driver to start streaming provided sufficient buffers
b3379c6201bb35 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil            2014-02-24  1996  	 * are available.
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak            2010-10-11  1997  	 */
b3379c6201bb35 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil            2014-02-24  1998  	if (q->queued_count >= q->min_buffers_needed) {
77fa4e07299870 drivers/media/v4l2-core/videobuf2-core.c        Shuah Khan              2016-02-11 @1999  		ret = v4l_vb2q_enable_media_source(q);
77fa4e07299870 drivers/media/v4l2-core/videobuf2-core.c        Shuah Khan              2016-02-11  2000  		if (ret)
77fa4e07299870 drivers/media/v4l2-core/videobuf2-core.c        Shuah Khan              2016-02-11  2001  			return ret;
02f142ecd24aaf drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil            2013-12-13  2002  		ret = vb2_start_streaming(q);
04990215dec43c drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil            2018-11-28  2003  		if (ret)
5db2c3ba4de848 drivers/media/video/videobuf2-core.c            Pawel Osciak            2011-03-20  2004  			return ret;
5db2c3ba4de848 drivers/media/video/videobuf2-core.c            Pawel Osciak            2011-03-20  2005  	}
5db2c3ba4de848 drivers/media/video/videobuf2-core.c            Pawel Osciak            2011-03-20  2006  
5db2c3ba4de848 drivers/media/video/videobuf2-core.c            Pawel Osciak            2011-03-20  2007  	q->streaming = 1;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak            2010-10-11  2008  
fd4354cf528ab2 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil            2014-04-07  2009  	dprintk(3, "successful\n");
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak            2010-10-11  2010  	return 0;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak            2010-10-11  2011  }
3c5be988e0b6a2 drivers/media/v4l2-core/videobuf2-core.c        Junghak Sung            2015-10-06  2012  EXPORT_SYMBOL_GPL(vb2_core_streamon);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak            2010-10-11  2013  

:::::: The code at line 1999 was first introduced by commit
:::::: 77fa4e072998705883c4dc672963b4bf7483cea9 [media] media: Change v4l-core to check if source is free

:::::: TO: Shuah Khan <shuahkh@osg.samsung.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
