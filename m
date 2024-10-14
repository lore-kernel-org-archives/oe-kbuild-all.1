Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D375214EC5D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 08:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728893998; cv=none; b=aT2QqiEckX4ydC6i6IloAn1PUH8SG1qp9klwXEZlCn1q/XNOYQDdMjlYjq+EzFat/XqsMqQC+o+ss9g+VYIGEUYer0hZAGSqLyJOrwJCIG+wL/UQbXSkTDhmhs717+kmqlwukWhcZyHN1aHtzfnXlYHGZscB9d+hmvhqytE9Pfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728893998; c=relaxed/simple;
	bh=m4wjuelNGVU7/GYzTp6MPQei6kGtMTvUYADpOlmjdqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XCaMa/P7vsCfGcaclyT5WEdWOGaw6b4GiucQdpmGkh2Mc3OotgyW41wN9O/DVjOKzAGpcWPiTyNig2kZA3m9yOt6P3/D2TqJFUOueBxw8rG8NxiA/q3rqNyz4R6poDeA64VcyjcCH7X1VEyJha4YSNANhz8HIfEs3TZ8M/nMV70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzMwzrp+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzMwzrp+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728893997; x=1760429997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m4wjuelNGVU7/GYzTp6MPQei6kGtMTvUYADpOlmjdqI=;
  b=RzMwzrp+XMPV6AVim4Hu6cKQnQoM2HFfE2axhZhXknNlYdd7K3MCF3ap
   zrio/euawszpQ3KPA1EjkQ6gxl8jaf3xELPXGalJO9hEWbTJ8PPaMW+Si
   qNz8KD3i2kWwrlJAnXvjkzEro6z3Ohryp4FmG9EgSCiEqX4hi+OgKsl7c
   wICCHUOF49OW1hM1V7pw9NMK2+OeXmRSzIuZN234P4WwZqmg5Qv2A/NlP
   8C3Tt9vnfpnW69EEpJ43mpdnK9FZdateAryjNcYLtWWf1pXdlb8t+yTzb
   DHTS+lPffvu5PkvzXzDN6fndNpAoOlMGlOTsijOoWbmitgK29tOWyhLlX
   g==;
X-CSE-ConnectionGUID: UGvldxu2R6GMf5Di+7Cdaw==
X-CSE-MsgGUID: dRTPpFSZQCO6Kwh7sY9EyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="50758499"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="50758499"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 01:19:57 -0700
X-CSE-ConnectionGUID: UVjNfHtpRH2YqvF6fXz4kQ==
X-CSE-MsgGUID: oIyRvCokQYGLmwKiIDMtxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="114953754"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Oct 2024 01:19:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0GIy-000F4l-1d;
	Mon, 14 Oct 2024 08:19:52 +0000
Date: Mon, 14 Oct 2024 16:19:32 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [tobetter:odroid-6.6.y 42/88] drivers/char/rk3568-gpiomem.c:2:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202410141608.rULXgNM1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steve,

FYI, the error/warning still remains.

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   506d08468b830f4f71052cf0f23e9f1053f9c9b6
commit: 905d94c26ec85e35bcc9d727a5c49130603afbb9 [42/88] ODROID-M1: Add /dev/gpiomem device
config: arm-randconfig-002-20241014 (https://download.01.org/0day-ci/archive/20241014/202410141608.rULXgNM1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410141608.rULXgNM1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141608.rULXgNM1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/rk3568-gpiomem.c:2: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * GPIO memory device driver


vim +2 drivers/char/rk3568-gpiomem.c

   > 2	 * GPIO memory device driver
     3	 *
     4	 * Creates a chardev /dev/gpiomem which will provide user access to
     5	 * the rk3568's GPIO registers when it is mmap()'d.
     6	 * No longer need root for user GPIO access, but without relaxing permissions
     7	 * on /dev/mem.
     8	 *
     9	 * Written by Luke Wren <luke@raspberrypi.org>
    10	 * Copyright (c) 2015, Raspberry Pi (Trading) Ltd.
    11	 *
    12	 * Redistribution and use in source and binary forms, with or without
    13	 * modification, are permitted provided that the following conditions
    14	 * are met:
    15	 * 1. Redistributions of source code must retain the above copyright
    16	 *    notice, this list of conditions, and the following disclaimer,
    17	 *    without modification.
    18	 * 2. Redistributions in binary form must reproduce the above copyright
    19	 *    notice, this list of conditions and the following disclaimer in the
    20	 *    documentation and/or other materials provided with the distribution.
    21	 * 3. The names of the above-listed copyright holders may not be used
    22	 *    to endorse or promote products derived from this software without
    23	 *    specific prior written permission.
    24	 *
    25	 * ALTERNATIVELY, this software may be distributed under the terms of the
    26	 * GNU General Public License ("GPL") version 2, as published by the Free
    27	 * Software Foundation.
    28	 *
    29	 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
    30	 * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
    31	 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
    32	 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
    33	 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
    34	 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
    35	 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
    36	 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
    37	 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
    38	 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    39	 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
    40	 */
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
