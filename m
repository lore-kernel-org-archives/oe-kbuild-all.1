Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957B433A6F1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 17:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772128708; cv=none; b=Ts0vkG9aBqxQnOzoiXSHDNF5dHmJRZhzcppSyO2WcSm7AosDFdQhXz305+f/qVXLUiIgH/G1oKDikZiw1mdp/0j/cWo8AQmmLSPeitAcvMoYjG5qaeDscK4k9CJr4LPwPY+Ss9uvDl+UzQaZH6Z4PQl1vsoy7BYbo8lWq5O7Now=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772128708; c=relaxed/simple;
	bh=5vrQjAVLwWlwMbQ1kW/eQgvq5gxD70L5cYvRMGndSEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=p+NA+IO++aOPrR7rcqYrQE2N4tO+i2OX5HgneCgpUV7kApaJ8WdX3USJEoNvCowiozuEzck1eLtP5ulsHFrMe/IfyTmBwiNfVY19Nqv+FBWgC1uwi9IvGkWxAJl+Y1St6Ayf3jLToa0kvWVZ/z3DyicagauCTOuIcfrWosheACU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cCC5kiAw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cCC5kiAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772128706; x=1803664706;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5vrQjAVLwWlwMbQ1kW/eQgvq5gxD70L5cYvRMGndSEU=;
  b=cCC5kiAwhxUKVvgXnLEqrH5BYwyruuoGNfTR5Kqg/XtNFYygTEnOOQI+
   TwIUHqvfMMw+R9vV1TcgvrqnGKfpL3H5floCiDf0akA3c7bIUeWFnUN56
   h4BNP9uEawrTSVPHRy8gXtSFggdqIpmwhcp8rjIn3y4inzHDCVnfLGfZp
   4zr8pUNj54hufs+GP2U2+02CSYJbmQpGvdcs6FS3JMiQ9BokChfZxRUrr
   VwE97KOnVi/GEaElOYo4YmaLlouMgzVeOdd8LJXBisfWY5hw4+8m7e8Zp
   mfJwwM5TPln7nCdaFlujd/jsPrLhh39BMGBWv2T97fCjJ9dN5MHrgdVTs
   w==;
X-CSE-ConnectionGUID: 0O+yy2LNStWnPd15bIYqQw==
X-CSE-MsgGUID: CGXgmChLRfu9kfoaJ7eI8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72408014"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="72408014"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 09:58:26 -0800
X-CSE-ConnectionGUID: mj/HIVNxToqy7nVhDF5OjA==
X-CSE-MsgGUID: Jkn0zEi5RhCBd2CeAFytwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="254415333"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Feb 2026 09:58:24 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvfbw-000000009j5-10Hw;
	Thu, 26 Feb 2026 17:57:24 +0000
Date: Fri, 27 Feb 2026 01:56:21 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
Subject: [linux-next:master 2149/2633]
 drivers/gpu/drm/i915/display/icl_dsi.c:37:10: fatal error: i915_reg.h: No
 such file or directory
Message-ID: <202602270136.GBkgGRGZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7d6661873f6b54c75195780a40d66bad3d482d8f
commit: 4953d806a423087fcc49d4f8884fde85cd23ec1e [2149/2633] drm/xe/compat:=
 Remove unused i915_reg.h from compat header
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260227=
/202602270136.GBkgGRGZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260227/202602270136.GBkgGRGZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270136.GBkgGRGZ-lkp@i=
ntel.com/

Note: the linux-next/master HEAD 7d6661873f6b54c75195780a40d66bad3d482d8f b=
uilds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/icl_dsi.c:37:10: fatal error: i915_reg.h: N=
o such file or directory
      37 | #include "i915_reg.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
--
>> drivers/gpu/drm/i915/display/intel_backlight.c:15:10: fatal error: i915_=
reg.h: No such file or directory
      15 | #include "i915_reg.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
--
>> drivers/gpu/drm/i915/display/intel_bw.c:10:10: fatal error: i915_reg.h: =
No such file or directory
      10 | #include "i915_reg.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
--
>> drivers/gpu/drm/i915/display/intel_casf.c:6:10: fatal error: i915_reg.h:=
 No such file or directory
       6 | #include "i915_reg.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
--
>> drivers/gpu/drm/i915/display/intel_cdclk.c:32:10: fatal error: i915_reg.=
h: No such file or directory
      32 | #include "i915_reg.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
--
>> drivers/gpu/drm/i915/display/intel_ddi.c:37:10: fatal error: i915_reg.h:=
 No such file or directory
      37 | #include "i915_reg.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
--
>> drivers/gpu/drm/i915/display/intel_display.c:54:10: fatal error: i915_re=
g.h: No such file or directory
      54 | #include "i915_reg.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
--
>> drivers/gpu/drm/i915/display/intel_display_device.c:13:10: fatal error: =
i915_reg.h: No such file or directory
      13 | #include "i915_reg.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
--
>> drivers/gpu/drm/i915/display/intel_display_irq.c:9:10: fatal error: i915=
_reg.h: No such file or directory
       9 | #include "i915_reg.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
--
>> drivers/gpu/drm/i915/display/intel_display_power.c:12:10: fatal error: i=
915_reg.h: No such file or directory
      12 | #include "i915_reg.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
--
>> drivers/gpu/drm/i915/display/intel_display_power_well.c:10:10: fatal err=
or: i915_reg.h: No such file or directory
      10 | #include "i915_reg.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
..


vim +37 drivers/gpu/drm/i915/display/icl_dsi.c

fdc24cf30897d8 drivers/gpu/drm/i915/icl_dsi.c         Jani Nikula    2019-0=
4-05  36 =20
801543b2593b04 drivers/gpu/drm/i915/display/icl_dsi.c Jani Nikula    2022-1=
1-09 @37  #include "i915_reg.h"
617ed6c2f0365a drivers/gpu/drm/i915/display/icl_dsi.c Jani Nikula    2021-1=
1-22  38  #include "icl_dsi.h"
3c0deb1485c49f drivers/gpu/drm/i915/display/icl_dsi.c Jani Nikula    2022-0=
2-18  39  #include "icl_dsi_regs.h"
12392a74ff58ec drivers/gpu/drm/i915/icl_dsi.c         Jani Nikula    2019-0=
4-29  40  #include "intel_atomic.h"
6cc42fbeb150ff drivers/gpu/drm/i915/display/icl_dsi.c Jani Nikula    2021-0=
8-25  41  #include "intel_backlight.h"
a9b4c16d886cf6 drivers/gpu/drm/i915/display/icl_dsi.c Jani Nikula    2022-0=
8-15  42  #include "intel_backlight_regs.h"
bd60a562906b2d drivers/gpu/drm/i915/icl_dsi.c         Imre Deak      2019-0=
4-25  43  #include "intel_combo_phy.h"
d0864ee4f81fd8 drivers/gpu/drm/i915/display/icl_dsi.c Matt Roper     2022-0=
1-10  44  #include "intel_combo_phy_regs.h"
ec7f29ff0d144c drivers/gpu/drm/i915/icl_dsi.c         Jani Nikula    2019-0=
4-05  45  #include "intel_connector.h"
7c53e628344bf1 drivers/gpu/drm/i915/display/icl_dsi.c Jani Nikula    2021-0=
4-27  46  #include "intel_crtc.h"
fdc24cf30897d8 drivers/gpu/drm/i915/icl_dsi.c         Jani Nikula    2019-0=
4-05  47  #include "intel_ddi.h"
7785ae0b51a044 drivers/gpu/drm/i915/display/icl_dsi.c Ville Syrj=C3=A4l=C3=
=A4  2021-04-30  48  #include "intel_de.h"
188bdfb77615ab drivers/gpu/drm/i915/display/icl_dsi.c Jani Nikula    2025-0=
6-06  49  #include "intel_display_regs.h"
b062cf5456bfdf drivers/gpu/drm/i915/display/icl_dsi.c Jani Nikula    2025-1=
0-22  50  #include "intel_display_utils.h"
fcfe0bdcb1911a drivers/gpu/drm/i915/icl_dsi.c         Madhav Chauhan 2018-0=
7-05  51  #include "intel_dsi.h"
aebdd7428c65a8 drivers/gpu/drm/i915/display/icl_dsi.c Jani Nikula    2021-1=
1-22  52  #include "intel_dsi_vbt.h"
44c1220a441ca7 drivers/gpu/drm/i915/icl_dsi.c         Jani Nikula    2019-0=
4-05  53  #include "intel_panel.h"
0f16cd2aad7e3d drivers/gpu/drm/i915/display/icl_dsi.c Ville Syrj=C3=A4l=C3=
=A4  2024-10-16  54  #include "intel_pfit.h"
2b68392e638dfa drivers/gpu/drm/i915/display/icl_dsi.c Jani Nikula    2019-1=
2-10  55  #include "intel_vdsc.h"
c3f05948367142 drivers/gpu/drm/i915/display/icl_dsi.c Jani Nikula    2023-0=
3-01  56  #include "intel_vdsc_regs.h"
714b1cdb02ee67 drivers/gpu/drm/i915/display/icl_dsi.c Dave Airlie    2021-0=
2-05  57  #include "skl_scaler.h"
46d12f911821f7 drivers/gpu/drm/i915/display/icl_dsi.c Dave Airlie    2021-0=
2-05  58  #include "skl_universal_plane.h"
fcfe0bdcb1911a drivers/gpu/drm/i915/icl_dsi.c         Madhav Chauhan 2018-0=
7-05  59 =20

:::::: The code at line 37 was first introduced by commit
:::::: 801543b2593b04eef974a73d3ea03e7efbd5ffae drm/i915: stop including i9=
15_irq.h from i915_trace.h

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
