Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527A42E974D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 17:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772214877; cv=none; b=eti1qgIBMiSXXRme+CbzmtqBd0lt9R8MRARgdENDEFTsMu3yg+lGL/LkYuBRcsp1DmoS6oVw75On6Tbr6r55GNYUVJtD/h9JZkHQASLLYjfHHj+N1NyJ2Ib6D6TyOT45UnJD4J902WhvYIRflChdLVHGziNeUe8RB+tvhVmxhFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772214877; c=relaxed/simple;
	bh=05h9cberPuPw57z2Yk9wouQDqyY+bRl2rVJ4h6jefpA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=At+VmTDW7OlCvQ8TOAAC44l+SWKGstUCyNN5mKjntmEpSiz93TsKnBmAnEySy7tBm52AI5YETlgdUa6x7LesXYeBWEgYy/zXcuo8PAs37pKiypbqfmAbo1nYWLzinkLIQ2jJM+9ugmrC6V0tDClUwsJ6F/T8m+1hkTW3cToxnrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+5586y0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+5586y0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772214875; x=1803750875;
  h=date:from:to:cc:subject:message-id;
  bh=05h9cberPuPw57z2Yk9wouQDqyY+bRl2rVJ4h6jefpA=;
  b=b+5586y0afSIBhoPyvGF0/pESIq+kbVjWBDyB5XfUn+7fIXfprVhWm/x
   Jyo7BKIONqO3ysUfIqfg4+3ArJnNCmpF9h5V6NHVB1zTg/673yQyN/QEB
   aDnxdwX2qZ+O83SbhkgfIw6AvGghZkSYP5GKsRuNccO+rnrRTG+zWVRRR
   J0DDlSM4zfOF463Pt4qipieB63pZ5eQla/i+3EAiltdSw7vHFISXFbpS0
   97ZvI2/4iJelKlthFArYA1aMs8tawgkgR6fDQPawjMNMuWvipSzuqyu/v
   eDnlRw5BCq2YYg5Xsd0N3Uzic3zWSkXoccYttgKYu8EnNi4s6zci79vP3
   g==;
X-CSE-ConnectionGUID: j2qcjqm+Q2idPBCW0+mpAw==
X-CSE-MsgGUID: F5lNPepFT5yh2Tgevqu4+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73208438"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="73208438"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 09:54:35 -0800
X-CSE-ConnectionGUID: JalN6a70S56CjeG5+eUqFA==
X-CSE-MsgGUID: Ssz+NSodRK6+fDFGS2Go1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="254764530"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 27 Feb 2026 09:54:33 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw22o-000000000b7-3DJg;
	Fri, 27 Feb 2026 17:54:30 +0000
Date: Fri, 27 Feb 2026 18:53:33 +0100
From: kernel test robot <lkp@intel.com>
To: Dylan Yip <dylan.yip@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:master 231/590] htmldocs:
 include/uapi/linux/videodev2.h:1: WARNING: undefined label:
 'v4l2-ctrl-type-hdr' [ref.ref]
Message-ID: <202602271808.Cc4lpEAC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: 65e0932bf145b76e3b3563346abc354c4b2158ab [231/590] media: videodev2.h: Add control type for HDR
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260227/202602271808.Cc4lpEAC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602271808.Cc4lpEAC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/uapi/linux/videodev2.h:1: WARNING: undefined label: 'v4l2-pix-fmt-x016m' [ref.ref]
   include/uapi/linux/videodev2.h:1: WARNING: undefined label: 'v4l2-pix-fmt-x216m' [ref.ref]
   include/uapi/linux/videodev2.h:1: WARNING: undefined label: 'v4l2-pix-fmt-x416m' [ref.ref]
   include/uapi/linux/videodev2.h:1: WARNING: undefined label: 'v4l2-pix-fmt-yuv444p' [ref.ref]
   include/uapi/linux/videodev2.h:1: WARNING: undefined label: 'v4l2-pix-fmt-x403' [ref.ref]
>> include/uapi/linux/videodev2.h:1: WARNING: undefined label: 'v4l2-ctrl-type-hdr' [ref.ref]


vim +1 include/uapi/linux/videodev2.h

e2be04c7f9958d Greg Kroah-Hartman    2017-11-01  @1  /* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR BSD-3-Clause) */
607ca46e97a1b6 David Howells         2012-10-13   2  /*
607ca46e97a1b6 David Howells         2012-10-13   3   *  Video for Linux Two header file
607ca46e97a1b6 David Howells         2012-10-13   4   *
607ca46e97a1b6 David Howells         2012-10-13   5   *  Copyright (C) 1999-2012 the contributors
607ca46e97a1b6 David Howells         2012-10-13   6   *
607ca46e97a1b6 David Howells         2012-10-13   7   *  This program is free software; you can redistribute it and/or modify
607ca46e97a1b6 David Howells         2012-10-13   8   *  it under the terms of the GNU General Public License as published by
607ca46e97a1b6 David Howells         2012-10-13   9   *  the Free Software Foundation; either version 2 of the License, or
607ca46e97a1b6 David Howells         2012-10-13  10   *  (at your option) any later version.
607ca46e97a1b6 David Howells         2012-10-13  11   *
607ca46e97a1b6 David Howells         2012-10-13  12   *  This program is distributed in the hope that it will be useful,
607ca46e97a1b6 David Howells         2012-10-13  13   *  but WITHOUT ANY WARRANTY; without even the implied warranty of
607ca46e97a1b6 David Howells         2012-10-13  14   *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
607ca46e97a1b6 David Howells         2012-10-13  15   *  GNU General Public License for more details.
607ca46e97a1b6 David Howells         2012-10-13  16   *
607ca46e97a1b6 David Howells         2012-10-13  17   *  Alternatively you can redistribute this file under the terms of the
607ca46e97a1b6 David Howells         2012-10-13  18   *  BSD license as stated below:
607ca46e97a1b6 David Howells         2012-10-13  19   *
607ca46e97a1b6 David Howells         2012-10-13  20   *  Redistribution and use in source and binary forms, with or without
607ca46e97a1b6 David Howells         2012-10-13  21   *  modification, are permitted provided that the following conditions
607ca46e97a1b6 David Howells         2012-10-13  22   *  are met:
607ca46e97a1b6 David Howells         2012-10-13  23   *  1. Redistributions of source code must retain the above copyright
607ca46e97a1b6 David Howells         2012-10-13  24   *     notice, this list of conditions and the following disclaimer.
607ca46e97a1b6 David Howells         2012-10-13  25   *  2. Redistributions in binary form must reproduce the above copyright
607ca46e97a1b6 David Howells         2012-10-13  26   *     notice, this list of conditions and the following disclaimer in
607ca46e97a1b6 David Howells         2012-10-13  27   *     the documentation and/or other materials provided with the
607ca46e97a1b6 David Howells         2012-10-13  28   *     distribution.
607ca46e97a1b6 David Howells         2012-10-13  29   *  3. The names of its contributors may not be used to endorse or promote
607ca46e97a1b6 David Howells         2012-10-13  30   *     products derived from this software without specific prior written
607ca46e97a1b6 David Howells         2012-10-13  31   *     permission.
607ca46e97a1b6 David Howells         2012-10-13  32   *
607ca46e97a1b6 David Howells         2012-10-13  33   *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
607ca46e97a1b6 David Howells         2012-10-13  34   *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
607ca46e97a1b6 David Howells         2012-10-13  35   *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
607ca46e97a1b6 David Howells         2012-10-13  36   *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
607ca46e97a1b6 David Howells         2012-10-13  37   *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
607ca46e97a1b6 David Howells         2012-10-13  38   *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
607ca46e97a1b6 David Howells         2012-10-13  39   *  TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
607ca46e97a1b6 David Howells         2012-10-13  40   *  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
607ca46e97a1b6 David Howells         2012-10-13  41   *  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
607ca46e97a1b6 David Howells         2012-10-13  42   *  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
607ca46e97a1b6 David Howells         2012-10-13  43   *  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
607ca46e97a1b6 David Howells         2012-10-13  44   *
607ca46e97a1b6 David Howells         2012-10-13  45   *	Header file for v4l or V4L2 drivers and applications
607ca46e97a1b6 David Howells         2012-10-13  46   * with public API.
607ca46e97a1b6 David Howells         2012-10-13  47   * All kernel-specific stuff were moved to media/v4l2-dev.h, so
607ca46e97a1b6 David Howells         2012-10-13  48   * no #if __KERNEL tests are allowed here
607ca46e97a1b6 David Howells         2012-10-13  49   *
991ce92f8de24c Mauro Carvalho Chehab 2015-12-04  50   *	See https://linuxtv.org for more info
607ca46e97a1b6 David Howells         2012-10-13  51   *
607ca46e97a1b6 David Howells         2012-10-13  52   *	Author: Bill Dirks <bill@thedirks.org>
607ca46e97a1b6 David Howells         2012-10-13  53   *		Justin Schoeman
e8c8d961d8ad53 Hans Verkuil          2025-06-24  54   *              Hans Verkuil <hverkuil@kernel.org>
607ca46e97a1b6 David Howells         2012-10-13  55   *		et al.
607ca46e97a1b6 David Howells         2012-10-13  56   */
607ca46e97a1b6 David Howells         2012-10-13  57  #ifndef _UAPI__LINUX_VIDEODEV2_H
607ca46e97a1b6 David Howells         2012-10-13  58  #define _UAPI__LINUX_VIDEODEV2_H
607ca46e97a1b6 David Howells         2012-10-13  59  

:::::: The code at line 1 was first introduced by commit
:::::: e2be04c7f9958dde770eeb8b30e829ca969b37bb License cleanup: add SPDX license identifier to uapi header files with a license

:::::: TO: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
