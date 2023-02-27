Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E816FDC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677510119; x=1709046119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tvv4DpED1bwiqi1hsB+Ts9MALnVAMmhHDqLUMWYOrIg=;
  b=gCYIZ4Ihc9vWI0r03JAG/VxZoJcgB+aX7B7e1VMz+CZU56cy4z7L0PKe
   sR8nDfN94XGLLH14QZrLcXE9C2OynV9+6z63KUmAJuFfLAbnh4DD+7gTn
   hZGSqg4IZg2CGnbc1/CblHjqpXki3GoFZIQbVUMMQFhY0wcDp4BKH2gd3
   YKrVvxYaYt7CzICzL1Ioo/qORempr279Yam/lfjTurvn/ujmllH4jzddC
   kdRaxTlOAIlCaGP1lUZNqVYLioFkV+L6J2/RKPW3k58PE+kVe+4OWs+4j
   IychXMgA5yXCrhBoWqFdgGM2DuE0+XJ1/JHgl/VIm4obne4i6wQfmSOUS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="332597900"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="332597900"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 07:01:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="847883165"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="847883165"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Feb 2023 07:01:46 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWf0b-0004W1-2E;
	Mon, 27 Feb 2023 15:01:45 +0000
Date: Mon, 27 Feb 2023 23:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 315/583]
 drivers/char/broadcom/bcm2835-gpiomem.c:2: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202302272234.cVhFh7wE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: d1d5f68880b390d41b4116a4187a4d52fbb94b0a [315/583] char: Add broadcom char drivers back to build files
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230227/202302272234.cVhFh7wE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/l1k/linux/commit/d1d5f68880b390d41b4116a4187a4d52fbb94b0a
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout d1d5f68880b390d41b4116a4187a4d52fbb94b0a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/char/broadcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272234.cVhFh7wE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/broadcom/bcm2835-gpiomem.c:2: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * GPIO memory device driver
--
>> drivers/char/broadcom/rpivid-mem.c:52: warning: expecting prototype for rpivid(). Prototype was for DRIVER_NAME() instead


vim +2 drivers/char/broadcom/bcm2835-gpiomem.c

b571183670210c Luke Wren 2015-08-21  @2   * GPIO memory device driver
b571183670210c Luke Wren 2015-08-21   3   *
b571183670210c Luke Wren 2015-08-21   4   * Creates a chardev /dev/gpiomem which will provide user access to
b571183670210c Luke Wren 2015-08-21   5   * the BCM2835's GPIO registers when it is mmap()'d.
b571183670210c Luke Wren 2015-08-21   6   * No longer need root for user GPIO access, but without relaxing permissions
b571183670210c Luke Wren 2015-08-21   7   * on /dev/mem.
b571183670210c Luke Wren 2015-08-21   8   *
b571183670210c Luke Wren 2015-08-21   9   * Written by Luke Wren <luke@raspberrypi.org>
b571183670210c Luke Wren 2015-08-21  10   * Copyright (c) 2015, Raspberry Pi (Trading) Ltd.
b571183670210c Luke Wren 2015-08-21  11   *
b571183670210c Luke Wren 2015-08-21  12   * Redistribution and use in source and binary forms, with or without
b571183670210c Luke Wren 2015-08-21  13   * modification, are permitted provided that the following conditions
b571183670210c Luke Wren 2015-08-21  14   * are met:
b571183670210c Luke Wren 2015-08-21  15   * 1. Redistributions of source code must retain the above copyright
b571183670210c Luke Wren 2015-08-21  16   *    notice, this list of conditions, and the following disclaimer,
b571183670210c Luke Wren 2015-08-21  17   *    without modification.
b571183670210c Luke Wren 2015-08-21  18   * 2. Redistributions in binary form must reproduce the above copyright
b571183670210c Luke Wren 2015-08-21  19   *    notice, this list of conditions and the following disclaimer in the
b571183670210c Luke Wren 2015-08-21  20   *    documentation and/or other materials provided with the distribution.
b571183670210c Luke Wren 2015-08-21  21   * 3. The names of the above-listed copyright holders may not be used
b571183670210c Luke Wren 2015-08-21  22   *    to endorse or promote products derived from this software without
b571183670210c Luke Wren 2015-08-21  23   *    specific prior written permission.
b571183670210c Luke Wren 2015-08-21  24   *
b571183670210c Luke Wren 2015-08-21  25   * ALTERNATIVELY, this software may be distributed under the terms of the
b571183670210c Luke Wren 2015-08-21  26   * GNU General Public License ("GPL") version 2, as published by the Free
b571183670210c Luke Wren 2015-08-21  27   * Software Foundation.
b571183670210c Luke Wren 2015-08-21  28   *
b571183670210c Luke Wren 2015-08-21  29   * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
b571183670210c Luke Wren 2015-08-21  30   * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
b571183670210c Luke Wren 2015-08-21  31   * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
b571183670210c Luke Wren 2015-08-21  32   * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
b571183670210c Luke Wren 2015-08-21  33   * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
b571183670210c Luke Wren 2015-08-21  34   * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
b571183670210c Luke Wren 2015-08-21  35   * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
b571183670210c Luke Wren 2015-08-21  36   * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
b571183670210c Luke Wren 2015-08-21  37   * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
b571183670210c Luke Wren 2015-08-21  38   * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
b571183670210c Luke Wren 2015-08-21  39   * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
b571183670210c Luke Wren 2015-08-21  40   */
b571183670210c Luke Wren 2015-08-21  41  

:::::: The code at line 2 was first introduced by commit
:::::: b571183670210c9b2901c27e49855daa267deee7 Add /dev/gpiomem device for rootless user GPIO access

:::::: TO: Luke Wren <luke@raspberrypi.org>
:::::: CC: Dom Cobley <popcornmix@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
