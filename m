Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991085EE82
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Feb 2024 17:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707673688; cv=none; b=W8uXoLrvnEbEp1jYimvA7tB4l+DzYTqMtWyy5n/Q5y/JChFYNdqQlqlblEo9Y51zJMeFmUYdJpe2koTj9erVV+FXe5uDhLHec6IEVVEAdidQH9Q3mQpFu8UmKgnYzL6oXMZbl2o4lkjUf5SKeEKC4FM/RsB8rEDivLgZdK6fs3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707673688; c=relaxed/simple;
	bh=aPZ+Ipa2bKs3A7lckKvmYLBAc2RIHXl+5zTtqnbRbF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lluSNjcIClBd4ysNG/2AAmYNl13DWk/Aooe3o/LhV5pErRM5Y++TM9cRmGst7101M3NDQBEvNqJerWAJ3v+jC5iaYQ2hZNwqUhYDzIVJmPzDEFI59mvWBD2+lmB+/AOagXt4EfjrIh2uYHGQzPLSu8zUux1xAkALOa+fcpuhsLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+hJdgmW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+hJdgmW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707673686; x=1739209686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aPZ+Ipa2bKs3A7lckKvmYLBAc2RIHXl+5zTtqnbRbF8=;
  b=A+hJdgmWT5+HZK8e2Gvc8eD/4gEmBwoET+6mvRPcdzSEQnTzZfkr/Xza
   OUDDAVYJtHcAen3T4/JnAttZ5t4d6YAXaslKq/k5oPTsCYtRhZaYXQBX5
   EXTEglZtv4hMUGEFX+b5IQ4Fc70SOcVr7qx+y85nEwz87+cQPX7qTKFte
   KwD70mFFRg57ICUL3+SFCB7tMt0+U6jr6utiRWDIS2xqg8zIRQPtZMg4g
   8TlV82wrBsGk+Q+95ySv4QVQHSOWEpMiRWpd5N+lUfkTvzfR8qB7AekCQ
   m3WJC2YSf6jbD/Ubjafm3MSU2pc/Evda02qxG39+fiJDiKhZzey9zjzrs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="19147009"
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="19147009"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 09:48:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="825619722"
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="825619722"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Feb 2024 09:48:03 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZDvs-0006ha-2V;
	Sun, 11 Feb 2024 17:48:00 +0000
Date: Mon, 12 Feb 2024 01:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 1173/17898]
 drivers/gpu/imx/dpu/dpu-prv.h:365:27: warning: 'sig_ids' defined but not
 used
Message-ID: <202402120142.a2KbdeAj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   4e3fc5471376a15279ee5c99e791a7c7b065cbc1
commit: 1b15335072f1a39e1f282769d3793fd220913532 [1173/17898] MLK-21509-1 gpu: imx: dpu: common: Add signature unit support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240212/202402120142.a2KbdeAj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240212/202402120142.a2KbdeAj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402120142.a2KbdeAj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/imx/dpu/dpu-constframe.c:22:
   drivers/gpu/imx/dpu/dpu-prv.h:380:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     380 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:372:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     372 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:371:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     371 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:370:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     370 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:368:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     368 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:367:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     367 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:366:27: warning: 'st_ids' defined but not used [-Wunused-const-variable=]
     366 | static const unsigned int st_ids[] = {9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:365:27: warning: 'sig_ids' defined but not used [-Wunused-const-variable=]
     365 | static const unsigned int sig_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:364:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     364 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:363:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     363 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:362:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     362 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:361:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     361 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:360:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     360 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:359:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     359 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:358:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     358 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:357:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     357 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:356:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     356 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-disengcfg.c:21:
   drivers/gpu/imx/dpu/dpu-prv.h:380:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     380 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:372:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     372 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:371:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     371 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:370:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     370 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:368:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     368 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:367:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     367 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:366:27: warning: 'st_ids' defined but not used [-Wunused-const-variable=]
     366 | static const unsigned int st_ids[] = {9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:365:27: warning: 'sig_ids' defined but not used [-Wunused-const-variable=]
     365 | static const unsigned int sig_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:364:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     364 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:363:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     363 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:362:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     362 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:361:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     361 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:360:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     360 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:359:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     359 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:358:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     358 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:355:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     355 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-extdst.c:22:
   drivers/gpu/imx/dpu/dpu-prv.h:380:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     380 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:372:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     372 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:371:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     371 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:370:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     370 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:368:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     368 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:367:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     367 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:366:27: warning: 'st_ids' defined but not used [-Wunused-const-variable=]
     366 | static const unsigned int st_ids[] = {9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:365:27: warning: 'sig_ids' defined but not used [-Wunused-const-variable=]
     365 | static const unsigned int sig_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:364:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     364 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:363:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     363 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:362:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     362 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:361:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     361 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:360:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     360 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:359:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     359 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:358:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     358 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:356:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     356 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:355:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     355 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   drivers/gpu/imx/dpu/dpu-fetchdecode.c: In function 'fetchdecode_set_fmt':
   drivers/gpu/imx/dpu/dpu-fetchdecode.c:205:53: warning: this statement may fall through [-Wimplicit-fallthrough=]
     205 |                 is_yuv422upsamplingmode_interpolate = true;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/gpu/imx/dpu/dpu-fetchdecode.c:207:9: note: here
     207 |         case DRM_FORMAT_NV12:
         |         ^~~~
   In file included from drivers/gpu/imx/dpu/dpu-fetchdecode.c:23:
   drivers/gpu/imx/dpu/dpu-prv.h: At top level:
   drivers/gpu/imx/dpu/dpu-prv.h:372:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     372 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:371:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     371 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:370:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     370 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:368:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     368 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:367:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     367 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:366:27: warning: 'st_ids' defined but not used [-Wunused-const-variable=]
     366 | static const unsigned int st_ids[] = {9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:365:27: warning: 'sig_ids' defined but not used [-Wunused-const-variable=]
     365 | static const unsigned int sig_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:364:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     364 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:363:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     363 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:362:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     362 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:361:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     361 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:360:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     360 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:359:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     359 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:357:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     357 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:356:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     356 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:355:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     355 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-fetcheco.c:21:
   drivers/gpu/imx/dpu/dpu-prv.h:372:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     372 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:371:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     371 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:370:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     370 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:368:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     368 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:367:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     367 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:366:27: warning: 'st_ids' defined but not used [-Wunused-const-variable=]
     366 | static const unsigned int st_ids[] = {9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:365:27: warning: 'sig_ids' defined but not used [-Wunused-const-variable=]
     365 | static const unsigned int sig_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:364:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     364 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:363:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     363 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:362:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     362 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:361:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     361 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:360:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     360 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:358:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     358 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:357:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     357 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:356:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     356 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:355:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     355 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-fetchlayer.c:22:
   drivers/gpu/imx/dpu/dpu-prv.h:372:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     372 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:371:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     371 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:370:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     370 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:368:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     368 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:367:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     367 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:366:27: warning: 'st_ids' defined but not used [-Wunused-const-variable=]
     366 | static const unsigned int st_ids[] = {9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:365:27: warning: 'sig_ids' defined but not used [-Wunused-const-variable=]
     365 | static const unsigned int sig_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:364:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     364 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:363:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     363 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:362:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     362 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:360:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     360 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:359:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     359 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:358:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     358 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:357:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     357 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:356:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     356 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:355:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     355 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
..


vim +/sig_ids +365 drivers/gpu/imx/dpu/dpu-prv.h

   354	
   355	static const unsigned int cf_ids[] = {0, 1, 4, 5};
   356	static const unsigned int dec_ids[] = {0, 1};
   357	static const unsigned int ed_ids[] = {0, 1, 4, 5};
   358	static const unsigned int fd_ids[] = {0, 1};
   359	static const unsigned int fe_ids[] = {0, 1, 2, 9};
   360	static const unsigned int fg_ids[] = {0, 1};
   361	static const unsigned int fl_ids[] = {0};
   362	static const unsigned int fw_ids[] = {2};
   363	static const unsigned int hs_ids[] = {4, 5, 9};
   364	static const unsigned int lb_ids[] = {0, 1, 2, 3};
 > 365	static const unsigned int sig_ids[] = {0, 1};
   366	static const unsigned int st_ids[] = {9};
   367	static const unsigned int tcon_ids[] = {0, 1};
 > 368	static const unsigned int vs_ids[] = {4, 5, 9};
   369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
