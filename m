Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D9647
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 06:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686120289; x=1717656289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4tki/V8b+YyMtWB/3hCmjlsI9h+GFezHEZ6clq56P3o=;
  b=WjxIdAi+HCTiJXDcAA5z9WnuNk/EAwmU2gaCYaEwHA4Xxhd02yjmD+OW
   K6eddebgZaFruUV46NEPhTONllJ9zXY06SV2yFBI6/1EzEUGvlQBjV+Dg
   StH0v1Z3TPPICIdTGdmi0ySH9CYwwx2mZdGLt1o4jEDn+b7YXLLgTMSGN
   vSefKzIWrq9+7ril4QvLwIAmqsD1Yrq9J+/AgZsd+pG1u8vTn5qrefefE
   jrm86lODr7oUHoFj1q42kYA8qNzAnA497Da4nl1OKqd1GqxLDBsR0O5XI
   3UhdML7t9MFY212Q5uswbXQg9SBg7lx700OaemW1PyCO5vYmyq7PUW2iy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="354395966"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="354395966"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 23:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="956089496"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="956089496"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Jun 2023 23:44:45 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6muS-0006Gr-0t;
	Wed, 07 Jun 2023 06:44:44 +0000
Date: Wed, 7 Jun 2023 14:43:45 +0800
From: kernel test robot <lkp@intel.com>
To: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Nico Boehr <nrb@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>
Subject: Re: [PATCH v4 6/6] s390/uv: Update query for secret-UVCs
Message-ID: <202306071439.xUNkOsqy-lkp@intel.com>
References: <20230606180817.3019077-7-seiden@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606180817.3019077-7-seiden@linux.ibm.com>

Hi Steffen,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvms390/next]
[also build test ERROR on s390/features mst-vhost/linux-next linus/master v6.4-rc5 next-20230607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steffen-Eiden/s390-uvdevice-Add-info-IOCTL/20230607-021159
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git next
patch link:    https://lore.kernel.org/r/20230606180817.3019077-7-seiden%40linux.ibm.com
patch subject: [PATCH v4 6/6] s390/uv: Update query for secret-UVCs
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230607/202306071439.xUNkOsqy-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add kvms390 https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git
        git fetch kvms390 next
        git checkout kvms390/next
        b4 shazam https://lore.kernel.org/r/20230606180817.3019077-7-seiden@linux.ibm.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306071439.xUNkOsqy-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/boot/uv.c: In function 'uv_query_info':
>> arch/s390/boot/uv.c:53:55: error: expected ';' before '}' token
      53 |                 uv_info.max_secrets = uvcb.max_secrets
         |                                                       ^
         |                                                       ;
      54 |         }
         |         ~                                              


vim +53 arch/s390/boot/uv.c

    18	
    19	void uv_query_info(void)
    20	{
    21		struct uv_cb_qui uvcb = {
    22			.header.cmd = UVC_CMD_QUI,
    23			.header.len = sizeof(uvcb)
    24		};
    25	
    26		if (!test_facility(158))
    27			return;
    28	
    29		/* rc==0x100 means that there is additional data we do not process */
    30		if (uv_call(0, (uint64_t)&uvcb) && uvcb.header.rc != 0x100)
    31			return;
    32	
    33		if (IS_ENABLED(CONFIG_KVM)) {
    34			memcpy(uv_info.inst_calls_list, uvcb.inst_calls_list, sizeof(uv_info.inst_calls_list));
    35			uv_info.uv_base_stor_len = uvcb.uv_base_stor_len;
    36			uv_info.guest_base_stor_len = uvcb.conf_base_phys_stor_len;
    37			uv_info.guest_virt_base_stor_len = uvcb.conf_base_virt_stor_len;
    38			uv_info.guest_virt_var_stor_len = uvcb.conf_virt_var_stor_len;
    39			uv_info.guest_cpu_stor_len = uvcb.cpu_stor_len;
    40			uv_info.max_sec_stor_addr = ALIGN(uvcb.max_guest_stor_addr, PAGE_SIZE);
    41			uv_info.max_num_sec_conf = uvcb.max_num_sec_conf;
    42			uv_info.max_guest_cpu_id = uvcb.max_guest_cpu_id;
    43			uv_info.uv_feature_indications = uvcb.uv_feature_indications;
    44			uv_info.supp_se_hdr_ver = uvcb.supp_se_hdr_versions;
    45			uv_info.supp_se_hdr_pcf = uvcb.supp_se_hdr_pcf;
    46			uv_info.conf_dump_storage_state_len = uvcb.conf_dump_storage_state_len;
    47			uv_info.conf_dump_finalize_len = uvcb.conf_dump_finalize_len;
    48			uv_info.supp_att_req_hdr_ver = uvcb.supp_att_req_hdr_ver;
    49			uv_info.supp_att_pflags = uvcb.supp_att_pflags;
    50			uv_info.supp_add_secret_req_ver = uvcb.supp_add_secret_req_ver;
    51			uv_info.supp_add_secret_pcf = uvcb.supp_add_secret_pcf;
    52			uv_info.supp_secret_types = uvcb.supp_secret_types;
  > 53			uv_info.max_secrets = uvcb.max_secrets
    54		}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
