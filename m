Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87778367
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 00:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677544390; x=1709080390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N7RlU8th0pn7CQTqJOqofFFbJ2BRxllyRsO+HBq5Y94=;
  b=n90A1cWpVLrMfICDe7qwelBHP156gJUIfww+QVYOx+fbJSf+GvK2romr
   cphycMuGo7Bg1ZW1YiOv6jAflEvKlcw9w/lmBx/NGcPdxSXJ2fUhSWSBM
   skJavdnZKhrcYMlrNvG6SjX+KmHlo/nVPsH5Kvh1k1wF4VTCvIbaYXfmF
   eDzoQJqsVwOYFouij4HOkog8ZN9fVLdcgeBaMgzpGdEqfWv0F6bAdsHbw
   v6wyC6bx9ZMdgDusijQifVvgAdwAEsf4yrTmHDoc9ia8bIZt4HHGatisj
   B8k4Jc/YT09Q8FZ1xMPrsPxlmN1KCRFWiBm6vX+BozW1VaTLPnyVAeUuh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="335498989"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="335498989"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 16:33:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="737956908"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="737956908"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Feb 2023 16:33:08 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWnvY-0004vN-0i;
	Tue, 28 Feb 2023 00:33:08 +0000
Date: Tue, 28 Feb 2023 08:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 154/583]
 drivers/misc/bcm2835_smi.c:2: warning: This comment starts with '/**', but
 isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202302280810.fthQu07N-lkp@intel.com>
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
commit: 5d7ca2279e0ef9d45c34f58ae7870754370cdc5f [154/583] Add SMI driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230228/202302280810.fthQu07N-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/5d7ca2279e0ef9d45c34f58ae7870754370cdc5f
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout 5d7ca2279e0ef9d45c34f58ae7870754370cdc5f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/char/broadcom/ drivers/dma/ drivers/gpio/ drivers/irqchip/ drivers/misc/ drivers/perf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280810.fthQu07N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/bcm2835_smi.c:2: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Broadcom Secondary Memory Interface driver


vim +2 drivers/misc/bcm2835_smi.c

   > 2	 * Broadcom Secondary Memory Interface driver
     3	 *
     4	 * Written by Luke Wren <luke@raspberrypi.org>
     5	 * Copyright (c) 2015, Raspberry Pi (Trading) Ltd.
     6	 *
     7	 * Redistribution and use in source and binary forms, with or without
     8	 * modification, are permitted provided that the following conditions
     9	 * are met:
    10	 * 1. Redistributions of source code must retain the above copyright
    11	 *    notice, this list of conditions, and the following disclaimer,
    12	 *    without modification.
    13	 * 2. Redistributions in binary form must reproduce the above copyright
    14	 *    notice, this list of conditions and the following disclaimer in the
    15	 *    documentation and/or other materials provided with the distribution.
    16	 * 3. The names of the above-listed copyright holders may not be used
    17	 *    to endorse or promote products derived from this software without
    18	 *    specific prior written permission.
    19	 *
    20	 * ALTERNATIVELY, this software may be distributed under the terms of the
    21	 * GNU General Public License ("GPL") version 2, as published by the Free
    22	 * Software Foundation.
    23	 *
    24	 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
    25	 * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
    26	 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
    27	 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
    28	 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
    29	 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
    30	 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
    31	 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
    32	 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
    33	 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    34	 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
    35	 */
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
