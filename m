Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83A07C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 01:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690334430; x=1721870430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fGbjBI6s5KuOH9UkbySeApHh99VCqJ4S+/Bira+83jM=;
  b=XEGbMKWo9PJVlUg9yZ7Hd3ol+cuMjip32xpU8v3D+zunXcLEPdy+B2fO
   m5VXRwkeMdhjVTVSZeY9w4XMIunUqfimu2187qXGXuCexFTK4w2UrsPuw
   TUNDZ0kStspU61+hIWfRV0LlDdN4LTNXH0MHII0m25VT3cPqRCSDmeOPA
   DGGfxLdteZOjtUD0o8C7SYIvngapYCBqaACgjsyxZrZI+KG7xKdwCLwmB
   i6ILsuKhz9jUeMBWbvTWh20nFWNvxdrWEWQ7sgnW+mhd3rOwfDXfzxvc6
   RWXOKXTxsWz46YZDP+r+ek4NEbG5nWvfcjX6S+z7oHz8hvEfcLjjTmJBZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398804935"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="398804935"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 18:20:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="816475911"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="816475911"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Jul 2023 18:20:29 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOTBq-0000Vn-31;
	Wed, 26 Jul 2023 01:20:01 +0000
Date: Wed, 26 Jul 2023 09:18:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 24047/28662]
 drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such
 file or directory
Message-ID: <202307260923.Pf8epvsM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   2ae44edfeecb009059f6aecb3c457d43310273e0
commit: d9a579535cd0f4623e627c3375781fb29c78692b [24047/28662] BACKPORT: arm/arm64: Probe for the presence of KVM hypervisor
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230726/202307260923.Pf8epvsM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260923.Pf8epvsM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260923.Pf8epvsM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such file or directory
      11 | #include <asm/archrandom.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +11 drivers/firmware/smccc/smccc.c

     7	
     8	#include <linux/init.h>
     9	#include <linux/arm-smccc.h>
    10	#include <linux/kernel.h>
  > 11	#include <asm/archrandom.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
