Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F97A27721
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 12:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676379432; x=1707915432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tU7Du5T6X9aa/S+Qq9ta8ArFzWuhLJaZxqOwxiii2Jk=;
  b=Uu2hvncxW8///YEMGxlnfjBImyGp8CYnEDAgv5m+ShCUs35KRT1vdIrB
   oQQegO3Khbzaw+D7EAHzm20kxSLO2C73bXnfAepWXgS7tcuCPNmtUT6uo
   YwhLHUgDW/xNDp+UzWMUzwBvr03oj//AF+vrs6jKYQtxaV/g9wH2WraJt
   lYMQITArqnBFLOL8Sp3eHzhWOmjkgVHkAlu0AXknd8phZtzG9+3eYIWSi
   684nYG3quPzii5wlPdLFndod0aWeBwThBSyf7EGVWSZL2uL9y7qct48vV
   yc6tDDN4ozv1+76lJeiEQFYECZoAn+FoIuuiIQYIOJ9PoZ0htZxHMYLpv
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="310784993"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="310784993"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 04:57:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="699531455"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="699531455"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Feb 2023 04:57:09 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRurs-0008Vx-3C;
	Tue, 14 Feb 2023 12:57:08 +0000
Date: Tue, 14 Feb 2023 20:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kamlesh Gurudasani <kamlesh@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>, Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-5.10.y-cicd 21413/21416]
 drivers/crypto/ti/mcrc.c:124:13: warning: variable 'signature' set but not
 used
Message-ID: <202302142031.0j2qoadA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y-cicd
head:   4a7db47d71b74437702af44195a198c322fd41d5
commit: fc4bdbf200506631decc9000f9466af382ff2bc7 [21413/21416] crypto: Add driver for MCRC engine
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230214/202302142031.0j2qoadA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y-cicd
        git checkout fc4bdbf200506631decc9000f9466af382ff2bc7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302142031.0j2qoadA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ti/mcrc.c: In function 'mcrc_calculate_crc':
>> drivers/crypto/ti/mcrc.c:124:13: warning: variable 'signature' set but not used [-Wunused-but-set-variable]
     124 |         u64 signature;
         |             ^~~~~~~~~


vim +/signature +124 drivers/crypto/ti/mcrc.c

   119	
   120	static int mcrc_calculate_crc(void __iomem *regs, u32 channel,
   121				      u32 pattern, const u8 *d8, size_t length)
   122	{
   123		void __iomem *psa_reg;
 > 124		u64 signature;
   125	
   126		if (channel <= 0 || channel >= MCRC_CHANNEL_INVALID)
   127			return -EINVAL;
   128	
   129		psa_reg = regs + PSA_SIGREGL(channel);
   130	
   131		for (; length >= sizeof(u64); d8 += sizeof(u64), length -= sizeof(u64)) {
   132			writeq_relaxed(*((u64 *)d8), psa_reg);
   133			signature = readq_relaxed(psa_reg);
   134		}
   135	
   136		if (length) {
   137			u64 leftover = 0;
   138	
   139			while (length--)
   140				leftover =  (*d8++) << 8  | leftover;
   141			writeq_relaxed(leftover, psa_reg);
   142			signature = readq_relaxed(psa_reg);
   143		}
   144	
   145		return 0;
   146	}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
