Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CC63624A3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 22:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772231273; cv=none; b=q8EJzWXzCDM0S+hOb6aZTHV/igT8XwZ1aAH284GFhGcEr2JTkpR+tBPv1Xw6rmwO7y69CJ07rr1OtOC2ho3ss2gR1Cu/e17JkrCisE+PD941ov+8GEl1DHhZMgZs+Ff9YejGmvSZqS2hhZ0rDUAOrbBui/mZCQ4NbGV5hPPw3VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772231273; c=relaxed/simple;
	bh=eRLoVnmvVKIVuaLa0zMtD/y2XDOAI00nZ5iJuPiNR6M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LHBaUEKTdvVzhChSZ3zExSbwro8jUpqDR1gL0tnzhtRTXnrIBo9QlId6ShxnfU9vahOg+8klOiiDGOhkZatL45pvRSeTsWeM6l9/QdfFipeGfQhwNWelA31Tt4a8cjQ+bokudoCB9q9n+Xj8PO+gnfVwBe5YkQA9muiorBR/xoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7a0hwZ/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7a0hwZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772231260; x=1803767260;
  h=date:from:to:cc:subject:message-id;
  bh=eRLoVnmvVKIVuaLa0zMtD/y2XDOAI00nZ5iJuPiNR6M=;
  b=X7a0hwZ/NCgaH0RO9+b+DkqL9PETxnFKeRPDHy7vNtngby4k1aKqmfgV
   SldPvcVgkruYVJamYPrsyISB4buYiHmSlt/UsJyG63BZ61OpTxeIVsWYf
   SDhg7HrERZnwQCqcRzHvJzcDxwtZ0ujnEMhJKpCYTswtgvqy04cFGgcVi
   IXTCw5NtdHjWPYPBN59WOdMrGkLnukVT6dI6tQWFYWtgCaTETKylUl225
   qi2zrb0I2e+nX4uOBV3JR9G98Q9XMy1Om83N+IESbmBOhxRipEi0X0JTr
   DLh4zgF3ht7a0umMeftdYMez5i2VhkdB+xi+avcxHS7bcFAr6E8SaaOgp
   g==;
X-CSE-ConnectionGUID: imJhil2jQAiHx2EATMrR4w==
X-CSE-MsgGUID: SZmyl5xeSDmPBKmt4TCPAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73289534"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="73289534"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 14:27:37 -0800
X-CSE-ConnectionGUID: ejl9kkcjTc6ZT3eMomH3Sw==
X-CSE-MsgGUID: Ew1Lfuh2STupSTDuvlw96Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="220237467"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 27 Feb 2026 14:27:35 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw6J2-000000000dN-3YCH;
	Fri, 27 Feb 2026 22:27:32 +0000
Date: Fri, 27 Feb 2026 23:26:40 +0100
From: kernel test robot <lkp@intel.com>
To: Kunal Rane <kunal.rane@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:master 476/590] htmldocs:
 include/uapi/linux/videodev2.h:1: WARNING: undefined label:
 'v4l2-pix-fmt-x423' [ref.ref]
Message-ID: <202602272351.AlHYG3ey-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: 9e44ece1722a0b6190779ba1201c5da722fe2146 [476/590] media: videodev2.h: Add YUV444 12 bit video format support
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260227/202602272351.AlHYG3ey-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602272351.AlHYG3ey-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/uapi/linux/videodev2.h:1: WARNING: undefined label: 'v4l2-pix-fmt-x016m' [ref.ref]
   include/uapi/linux/videodev2.h:1: WARNING: undefined label: 'v4l2-pix-fmt-x216m' [ref.ref]
   include/uapi/linux/videodev2.h:1: WARNING: undefined label: 'v4l2-pix-fmt-x416m' [ref.ref]
   include/uapi/linux/videodev2.h:1: WARNING: undefined label: 'v4l2-pix-fmt-yuv444p' [ref.ref]
   include/uapi/linux/videodev2.h:1: WARNING: undefined label: 'v4l2-pix-fmt-x403' [ref.ref]
>> include/uapi/linux/videodev2.h:1: WARNING: undefined label: 'v4l2-pix-fmt-x423' [ref.ref]
   include/uapi/linux/videodev2.h:1: WARNING: undefined label: 'v4l2-ctrl-type-hdr' [ref.ref]


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
