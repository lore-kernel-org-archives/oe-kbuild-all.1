Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8093916437
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 19:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691522174; x=1723058174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B3ZaKRRBOywOyoHMu3uvVVSvIQjqHCOSwxZdQ9pfIIk=;
  b=eFfd5EiC1SGrFsXuNPei2NJ0FUyJhllU9hBnCvpTCKiFTeb2yEn0HRXY
   ZM7nY8gbN+OIGPH+Q2q5D3MvBAp3s9mJJfcVbgN35T2WXTqFSjLOTtZcJ
   6Nlb+wlj4+sn7LyfQ65YwAMuHZ6pGiMe0BHqBedRvszlBCopaaQb/zWTI
   ZzsOMmWgxPzY2D3h2vRgVxy1aA11O19q4F18nXVVPngWa76WaQb1taAaO
   cEbwvh9jwGnhF7cJzv3sc7T0bPgJx5Sy04PpHE3o6yTO4Y3Z+Zgkpo6ft
   7uUY2XbzA6oQuT98v+8+wIKTL98H1JrvrZARhXsufxPesaorG178lKPUi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373710771"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="373710771"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 12:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="801445417"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="801445417"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2023 12:16:10 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTSBe-0005Yn-01;
	Tue, 08 Aug 2023 19:16:10 +0000
Date: Wed, 9 Aug 2023 03:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 54/67] ERROR: modpost:
 "__register_sysctl_table" [net/llc/llc2.ko] undefined!
Message-ID: <202308090318.U9zCGvJs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   8958c484809b25f8d552560d679fcb6bdd441c88
commit: 8ab9c9bf315ce95177e9a7cac46d7aa95d3fec7b [54/67] networking: rm sentinel element from ctl_table array
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230809/202308090318.U9zCGvJs-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090318.U9zCGvJs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090318.U9zCGvJs-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs_common/grace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_misc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfsd/nfsd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_arc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_md4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/cast_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/xor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libsha256.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_decoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/matrox/matroxfb_accel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/matrox/matroxfb_DAC1064.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/matrox/matroxfb_Ti3026.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/macmodes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/lp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ppdev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/udl/udl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/dummy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ppp/ppp_generic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ppp/bsd_comp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ppp/ppp_deflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/slip/slhc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech-dj.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech-hidpp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/yenta_socket.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/p8022.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/psnap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ah4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/esp4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/inet_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tcp_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_algo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_user.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/key/af_key.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/sunrpc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/auth_gss/auth_rpcgss.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/auth_gss/rpcsec_gss_krb5.o
>> ERROR: modpost: "__register_sysctl_table" [net/llc/llc2.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
