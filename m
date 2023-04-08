Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7D515A4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 03:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680925768; x=1712461768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a51+jf5qStXH6tbqxZlSOM6G5EZWlhNYlUIoeK6Nwuo=;
  b=UoxAA+HCvv7rEeUvICda0tKEWhIWSzK7oEevVq1RLwpjskCyNdD9Nbfp
   ZT40z6iFy1rjfnPXHZNKQ1UaZt81BIfItwLRHaymxllKgmhun/nhuUda6
   m5Bant+GMh85mXHSmpCSQ7BH64K+VhnUEekrzAGrkJBSOP6fABEELI9gA
   jigcovCHOID3nARJKUdNvQpJLP1OExkf3EXqyCfwy0tjd5FXNsWrHQF+/
   6bzEMNqgSJYvOkKl5pWtdM7ht2ePoSenH9xfcofFy3L6jrLNafjX9X93S
   W1wHPGUdzwL61dXNAr2TU45JRAUeqLrl9+z1qqyl/POJrLUhqi1aaF21f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="429394826"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="429394826"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 20:49:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="690225478"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="690225478"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Apr 2023 20:49:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkzZu-000TGX-13;
	Sat, 08 Apr 2023 03:49:26 +0000
Date: Sat, 8 Apr 2023 11:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:lnl/add-ssp-support 15/15]
 sound/soc/sof/intel/hda-dai.c:535:24: error: use of undeclared identifier
 'ssp_dai_ops'
Message-ID: <202304081129.HQZBA9rc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound lnl/add-ssp-support
head:   bec40956f2741964f090bd0fbdd1446702485257
commit: bec40956f2741964f090bd0fbdd1446702485257 [15/15] ASoC: SOF: Intel: hda-dai: add ops for SSP
config: s390-randconfig-r044-20230408 (https://download.01.org/0day-ci/archive/20230408/202304081129.HQZBA9rc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/plbossart/sound/commit/bec40956f2741964f090bd0fbdd1446702485257
        git remote add plbossart-sound https://github.com/plbossart/sound
        git fetch --no-tags plbossart-sound lnl/add-ssp-support
        git checkout bec40956f2741964f090bd0fbdd1446702485257
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081129.HQZBA9rc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/sof/intel/hda-dai.c:12:
   In file included from include/sound/hdaudio_ext.h:5:
   In file included from include/linux/io-64-nonatomic-lo-hi.h:5:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from sound/soc/sof/intel/hda-dai.c:12:
   In file included from include/sound/hdaudio_ext.h:5:
   In file included from include/linux/io-64-nonatomic-lo-hi.h:5:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from sound/soc/sof/intel/hda-dai.c:12:
   In file included from include/sound/hdaudio_ext.h:5:
   In file included from include/linux/io-64-nonatomic-lo-hi.h:5:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> sound/soc/sof/intel/hda-dai.c:535:24: error: use of undeclared identifier 'ssp_dai_ops'
                                   ops->drv[i].ops = &ssp_dai_ops;
                                                      ^
   12 warnings and 1 error generated.


vim +/ssp_dai_ops +535 sound/soc/sof/intel/hda-dai.c

   515	
   516	void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
   517	{
   518		const struct sof_intel_dsp_desc *chip;
   519		int i;
   520	
   521		chip = get_chip_info(sdev->pdata);
   522	
   523		for (i = 0; i < ops->num_drv; i++) {
   524	#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
   525			if (strstr(ops->drv[i].name, "iDisp") ||
   526			    strstr(ops->drv[i].name, "Analog") ||
   527			    strstr(ops->drv[i].name, "Digital"))
   528				ops->drv[i].ops = &hda_dai_ops;
   529	#endif
   530		}
   531	
   532		if (chip->hw_ip_version >= SOF_INTEL_ACE_2_0) {
   533			for (i = 0; i < ops->num_drv; i++) {
   534				if (strstr(ops->drv[i].name, "SSP"))
 > 535					ops->drv[i].ops = &ssp_dai_ops;
   536			}
   537		}
   538	
   539		if (sdev->pdata->ipc_type == SOF_INTEL_IPC4 && !hda_use_tplg_nhlt) {
   540			struct sof_ipc4_fw_data *ipc4_data = sdev->private;
   541	
   542			ipc4_data->nhlt = intel_nhlt_init(sdev->dev);
   543		}
   544	}
   545	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
