Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A88EA1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 01:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677720673; x=1709256673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sTvS644iMo3UfhKwIw3afKuiZ3j7XtmYbMmyJEdLRj4=;
  b=MPYEO0VdcesLC1vFBeqg5tkBhYlYXsG0PA2f2X/VuPIzMTuD4uJusXQ8
   4wLZXpnH0OJzksd7z556jSQkG6R2p41fOpDa/27Q6e7Ab9xoU06BMYhBb
   XQoarnPH7VVnfrSXdh5rVDwk9XppALpYyyn9DlkK6uY1QXwYAnRzIg3lD
   CFNAocyF5YT53s3TLpCya5aNBhloWNZy3sl9gmOSduQQFpyFxU3CsOVWL
   KwaikkUU+xr9+3IdO9AbgbGVkZi7BkbkYT1UANldxn85TRTbHqDbtviTF
   R7KizuTA7sSb/0FaclRf23bE11nnaStEJFYEmcGYmjjXKBbl1NGZ/5Izn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="322853766"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="322853766"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 17:30:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="784593495"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="784593495"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Mar 2023 17:30:54 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXXmX-00002u-2N;
	Thu, 02 Mar 2023 01:30:53 +0000
Date: Thu, 2 Mar 2023 09:30:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 304/689]
 drivers/gpu/drm/vc4/vc4_kms.c:780:29: warning: passing argument 1 of
 'to_vc4_crtc' discards 'const' qualifier from pointer target type
Message-ID: <202303020944.NUQjA6NS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   80441c75a39f1387a818b01ddfbda89ec92c01e0
commit: d06ba5ff631cc9efeb4bf3486fad8ef080ceeb56 [304/689] drm/vc4: kms: Sort the CRTCs by output before assigning them
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230302/202303020944.NUQjA6NS-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=d06ba5ff631cc9efeb4bf3486fad8ef080ceeb56
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-6.1
        git checkout d06ba5ff631cc9efeb4bf3486fad8ef080ceeb56
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/vc4/ drivers/scsi/qla2xxx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303020944.NUQjA6NS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vc4/vc4_kms.c: In function 'cmp_vc4_crtc_hvs_output':
>> drivers/gpu/drm/vc4/vc4_kms.c:780:29: warning: passing argument 1 of 'to_vc4_crtc' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     780 |                 to_vc4_crtc(*(const struct drm_crtc **)a);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/vc4/vc4_kms.c:25:
   drivers/gpu/drm/vc4/vc4_drv.h:526:30: note: expected 'struct drm_crtc *' but argument is of type 'const struct drm_crtc *'
     526 | to_vc4_crtc(struct drm_crtc *crtc)
         |             ~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/vc4/vc4_kms.c:784:29: warning: passing argument 1 of 'to_vc4_crtc' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     784 |                 to_vc4_crtc(*(const struct drm_crtc **)b);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vc4/vc4_drv.h:526:30: note: expected 'struct drm_crtc *' but argument is of type 'const struct drm_crtc *'
     526 | to_vc4_crtc(struct drm_crtc *crtc)
         |             ~~~~~~~~~~~~~~~~~^~~~


vim +780 drivers/gpu/drm/vc4/vc4_kms.c

   776	
   777	static int cmp_vc4_crtc_hvs_output(const void *a, const void *b)
   778	{
   779		const struct vc4_crtc *crtc_a =
 > 780			to_vc4_crtc(*(const struct drm_crtc **)a);
   781		const struct vc4_crtc_data *data_a =
   782			vc4_crtc_to_vc4_crtc_data(crtc_a);
   783		const struct vc4_crtc *crtc_b =
   784			to_vc4_crtc(*(const struct drm_crtc **)b);
   785		const struct vc4_crtc_data *data_b =
   786			vc4_crtc_to_vc4_crtc_data(crtc_b);
   787	
   788		return data_a->hvs_output - data_b->hvs_output;
   789	}
   790	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
