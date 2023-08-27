Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9D8111A3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 20:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693166752; x=1724702752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NowYhPGpjyh63CT3sgXVEUCIdMOyJ1I1AJXc14Otp3U=;
  b=VZSG9uJ97mAQx9sR+6622qilbn2u1sKo+C/Vmf5xtfD3lwCR+LVKI8a7
   XMoig0UUjaO2L/vA3VjzZikeZf30wVuNhm8QLvi2SpFr0Bax5MnxDEeOi
   QbYHd0Vs9u7BeLwv950OEIs3umrKYv7ACSRmIMEpTRpAETVabolg8lOAB
   7NH8vPCyEHvtiZcXsiEL2SlxiUYk/4PTeu52H1Xy0MeNhHWNArCf5KtQm
   VMPvxVarMCRXuA/lbpGOuMxuT90YCUoM64oNRbYMtfs9Xxi/5JqKZC3xm
   C4AfZh6abhode+PmO1BADk9aSSqXz+hBmPZq8o8yyheqM5LWBuGJJ1ZtN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="372371036"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="372371036"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 13:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="1068812851"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="1068812851"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 27 Aug 2023 13:05:43 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaM10-000699-35;
	Sun, 27 Aug 2023 20:05:42 +0000
Date: Mon, 28 Aug 2023 04:05:31 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:aass 20/28] lib/test_bitmap.c:381:1: warning: 'inline' is not
 at beginning of declaration
Message-ID: <202308280412.LQt3JTYB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux aass
head:   8386ab615ebe5a903dba203bea05929a997d7ea4
commit: 6c6a992b79376ff426f49fc0646db751cbb79967 [20/28] bitmap: add test for bitmap_bitremap()
config: arc-randconfig-001-20230828 (https://download.01.org/0day-ci/archive/20230828/202308280412.LQt3JTYB-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280412.LQt3JTYB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308280412.LQt3JTYB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/test_bitmap.c:381:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
     381 | static void __always_inline __init __test_bitremap(unsigned long *dst, unsigned long *src,
         | ^~~~~~


vim +/inline +381 lib/test_bitmap.c

   380	
 > 381	static void __always_inline __init __test_bitremap(unsigned long *dst, unsigned long *src,
   382					unsigned long *old, unsigned long *new, unsigned long nbits)
   383	{
   384		unsigned long oldbit, newbit;
   385	
   386		bitmap_zero(dst, nbits);
   387	
   388		for_each_set_bit(oldbit, src, nbits) {
   389			newbit = bitmap_bitremap(oldbit, old, new, nbits);
   390			__set_bit(newbit, dst);
   391		}
   392	}
   393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
