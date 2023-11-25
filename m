Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1A9ECE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 00:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSS08Gjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700871589; x=1732407589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lIvK6bpyIC2HPEy0+1B/d8pb05fvFfndn2f/9wmSc/8=;
  b=nSS08Gjf3Wdt2UmL9Bra8//qvx0SLzw8njKpDbRXeTdP1J7QpOw0GgXw
   6rH91++XqLd6i0lgERArNZCB15abFxr0LNPDUW2hSMRAOUL3e2GY0EeDa
   uIQBvd4+GHwfNoFxAthutcf0jH54qo+VZDzR+3CtxE5Rqm3WbNLlNwm1Q
   fTXZzWRHUrhP+1Ky3cNSBLoxK90fPaygm3fEFdr2oUukxx/ZrXzV3Q9o2
   yoxbOXjqo25gG7qExvCEO/64z7yjR5FDenS/wkYXLAOfFog1BmkswBeIk
   JP6IYm71zr30QopaOkmQh/Y2900iWqu9L14XIWedwMwUp2hYuQ27aOa0T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="391350888"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="391350888"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 16:19:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="858483142"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="858483142"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Nov 2023 16:19:39 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6gOX-0003Qt-0C;
	Sat, 25 Nov 2023 00:19:37 +0000
Date: Sat, 25 Nov 2023 08:18:39 +0800
From: kernel test robot <lkp@intel.com>
To: "sw.multimedia" <sw.multimedia@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	"jack.zhu" <jack.zhu@starfivetech.com>,
	"keith.zhao" <keith.zhao@starfivetech.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: [esmil:visionfive 41/47]
 drivers/gpu/drm/starfive/starfive_drm_vpp.c:500:14: warning: variable
 'y_rgb_ofst' is used uninitialized whenever 'if' condition is false
Message-ID: <202311250623.bVtP4yYR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   f7c19b2d41e07d930d09b40751161839e067fda2
commit: 1bd93e8cf65fe2dffd2146681cc09d6752b631cc [41/47] drm/starfive: Add StarFive drm driver
config: riscv-randconfig-r071-20231125 (https://download.01.org/0day-ci/archive/20231125/202311250623.bVtP4yYR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311250623.bVtP4yYR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250623.bVtP4yYR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/starfive/starfive_drm_vpp.c:500:14: warning: variable 'y_rgb_ofst' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     500 |                 } else if (src->format == COLOR_YUV422_UYVY) {  //ok
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/starfive/starfive_drm_vpp.c:510:37: note: uninitialized use occurs here
     510 |         pp_src_offset_cfg(sf_crtc, pp_num, y_rgb_ofst, uofst, v_uvofst);
         |                                            ^~~~~~~~~~
   drivers/gpu/drm/starfive/starfive_drm_vpp.c:500:10: note: remove the 'if' if its condition is always true
     500 |                 } else if (src->format == COLOR_YUV422_UYVY) {  //ok
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/starfive/starfive_drm_vpp.c:436:31: note: initialize the variable 'y_rgb_ofst' to silence this warning
     436 |         unsigned int size, y_rgb_ofst, uofst;
         |                                      ^
         |                                       = 0
>> drivers/gpu/drm/starfive/starfive_drm_vpp.c:500:14: warning: variable 'uofst' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     500 |                 } else if (src->format == COLOR_YUV422_UYVY) {  //ok
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/starfive/starfive_drm_vpp.c:510:49: note: uninitialized use occurs here
     510 |         pp_src_offset_cfg(sf_crtc, pp_num, y_rgb_ofst, uofst, v_uvofst);
         |                                                        ^~~~~
   drivers/gpu/drm/starfive/starfive_drm_vpp.c:500:10: note: remove the 'if' if its condition is always true
     500 |                 } else if (src->format == COLOR_YUV422_UYVY) {  //ok
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/starfive/starfive_drm_vpp.c:436:38: note: initialize the variable 'uofst' to silence this warning
     436 |         unsigned int size, y_rgb_ofst, uofst;
         |                                             ^
         |                                              = 0
   2 warnings generated.


vim +500 drivers/gpu/drm/starfive/starfive_drm_vpp.c

   431	
   432	static void pp_size_set(struct starfive_crtc *sf_crtc, int pp_num,
   433				struct pp_video_mode *src, struct pp_video_mode *dst)
   434	{
   435		u32 src_addr, dstaddr;
   436		unsigned int size, y_rgb_ofst, uofst;
   437		unsigned int v_uvofst = 0, next_y_rgb_addr = 0, next_u_addr = 0, next_v_addr = 0;
   438		unsigned int i = 0;
   439	
   440		pp_src_size_cfg(sf_crtc, pp_num, src->width - 1, src->height - 1);
   441		pp_drop_cfg(sf_crtc, pp_num, 0x0, 0x0);///0:no drop
   442		pp_des_size_cfg(sf_crtc, pp_num, dst->width - 1, dst->height - 1);
   443	
   444		src_addr = src->addr + (i << 30); //PP_SRC_BASE_ADDR + (i << 30);
   445		size = src->width * src->height;
   446	
   447		if (src->format >= COLOR_RGB888_ARGB) {
   448			next_y_rgb_addr = src_addr;
   449			next_u_addr = 0;
   450			next_v_addr = 0;
   451	
   452			y_rgb_ofst = 0;
   453			uofst = 0;
   454			v_uvofst = 0;
   455			//pp_src_addr_next(pp_num, src_addr, 0, 0);
   456			//pp_src_offset_cfg(pp_num, 0x0, 0x0, 0x0);
   457		} else {
   458			if (src->format == COLOR_YUV420_NV21) {    //ok
   459				next_y_rgb_addr = src_addr;
   460				next_u_addr = src_addr + size + 1;
   461				next_v_addr = src_addr + size;
   462				y_rgb_ofst = 0;
   463				uofst = 0;
   464				v_uvofst = size;
   465			} else if (src->format == COLOR_YUV420_NV12) {
   466				next_y_rgb_addr = src_addr;
   467				next_u_addr = src_addr + size;
   468				next_v_addr = src_addr + size + 1;
   469				y_rgb_ofst = 0;
   470				uofst = 0;
   471				v_uvofst = size;
   472			} else if (src->format == COLOR_YUV420P) {
   473				next_y_rgb_addr = src_addr;
   474				next_u_addr = src_addr + size;
   475				next_v_addr = src_addr + size * 5 / 4;
   476				y_rgb_ofst = 0;
   477				uofst = 0;
   478				v_uvofst = 0;
   479			} else if (src->format == COLOR_YUV422_YVYU) {   //ok
   480				next_y_rgb_addr = src_addr;
   481				next_u_addr = src_addr + 1;
   482				next_v_addr = src_addr + 3;
   483				y_rgb_ofst = 0;
   484				uofst = 0;
   485				v_uvofst = 0;
   486			} else if (src->format == COLOR_YUV422_VYUY) {   //ok
   487				next_y_rgb_addr = src_addr + 1;
   488				next_u_addr = src_addr + 2;
   489				next_v_addr = src_addr;
   490				y_rgb_ofst = 0;
   491				uofst = 0;
   492				v_uvofst = 0;
   493			} else if (src->format == COLOR_YUV422_YUYV) {   //ok
   494				next_y_rgb_addr = src_addr;
   495				next_u_addr = src_addr + 1;
   496				next_v_addr = src_addr + 2;
   497				y_rgb_ofst = 0;
   498				uofst = 0;
   499				v_uvofst = 0;
 > 500			} else if (src->format == COLOR_YUV422_UYVY) {  //ok
   501				next_y_rgb_addr = src_addr + 1;
   502				next_u_addr = src_addr;
   503				next_v_addr = src_addr + 2;
   504				y_rgb_ofst = 0;
   505				uofst = 0;
   506				v_uvofst = 0;
   507			}
   508		}
   509		pp_src_addr_next(sf_crtc, pp_num, next_y_rgb_addr, next_u_addr, next_v_addr);
   510		pp_src_offset_cfg(sf_crtc, pp_num, y_rgb_ofst, uofst, v_uvofst);
   511		/* source addr not change */
   512		pp_nxt_addr_load(sf_crtc, pp_num, 0x1, (i & 0x1));
   513	
   514		if (dst->addr) {
   515			dstaddr = dst->addr;
   516			size = dst->height * dst->width;
   517			if (dst->format >= COLOR_RGB888_ARGB) {
   518				next_y_rgb_addr = dstaddr;
   519				next_u_addr = 0;
   520				next_v_addr = 0;
   521				y_rgb_ofst = 0;
   522				uofst = 0;
   523				v_uvofst = 0;
   524			} else {
   525				if (dst->format == COLOR_YUV420_NV21) {
   526					/* yyyyvuvuvu */
   527					next_y_rgb_addr = dstaddr;
   528					next_u_addr = dstaddr + size;
   529					next_v_addr = 0;//dstaddr + size;
   530					y_rgb_ofst = 0;
   531					uofst = 0;
   532					v_uvofst = 0;
   533				} else if (dst->format == COLOR_YUV420_NV12) {
   534					/* yyyyuvuvuv */
   535					next_y_rgb_addr = dstaddr;
   536					next_u_addr = dstaddr + size;
   537					next_v_addr = dstaddr + size + 1;
   538					y_rgb_ofst = 0;
   539					uofst = size;
   540					v_uvofst = 0;
   541				} else if (dst->format == COLOR_YUV420P) {
   542					next_y_rgb_addr = dstaddr;
   543					next_u_addr = dstaddr + size;
   544					next_v_addr = dstaddr + size * 5 / 4;
   545					y_rgb_ofst = 0;
   546					uofst = 0;
   547					v_uvofst = 0;
   548				} else if (dst->format == COLOR_YUV422_YVYU) {
   549					next_y_rgb_addr = dstaddr;
   550					next_u_addr = dstaddr + 1;
   551					next_v_addr = dstaddr + 3;
   552					y_rgb_ofst = 0;
   553					uofst = 0;
   554					v_uvofst = 0;
   555				} else if (dst->format == COLOR_YUV422_VYUY) {
   556					next_y_rgb_addr = dstaddr + 1;
   557					next_u_addr = dstaddr + 2;
   558					next_v_addr = dstaddr;
   559					y_rgb_ofst = 0;
   560					uofst = 0;
   561					v_uvofst = 0;
   562				} else if (dst->format == COLOR_YUV422_YUYV) {
   563					next_y_rgb_addr = dstaddr;
   564					next_u_addr = dstaddr + 1;
   565					next_v_addr = dstaddr + 2;
   566					y_rgb_ofst = 0;
   567					uofst = 0;
   568					v_uvofst = 0;
   569				} else if (dst->format == COLOR_YUV422_UYVY) {
   570					next_y_rgb_addr = dstaddr + 1;
   571					next_u_addr = dstaddr;
   572					next_v_addr = dstaddr + 2;
   573					y_rgb_ofst = 0;
   574					uofst = 0;
   575					v_uvofst = 0;
   576				}
   577			}
   578			pp_des_addr_cfg(sf_crtc, pp_num, next_y_rgb_addr, next_u_addr, next_v_addr);
   579			pp_des_offset_cfg(sf_crtc, pp_num, y_rgb_ofst, uofst, v_uvofst);
   580		}
   581	}
   582	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
