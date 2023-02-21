Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86BA1C07
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 09:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676972936; x=1708508936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X7dmeYUzPEIknyviM7q4fo2n14p3IgpHu1/UsJ51Ttk=;
  b=XFtU4ITc0n+i4nbemjAUmA+GiiLDmFMnZu5ruZOjwrqOTa0K8o551xRs
   +CD+Ay52dECUStL0M/8VHFon5glVm6RZeuHAF7MJ33UyjDUR8vmcMiH2+
   u4Q248wj0mcwMSc6l6ryK2I2qQMUy+NySrR8T/dStwXdhUcm5XkVpmwbu
   wOXrRHW2cS2iq6ilABq/ioQvhK3z2WwTeLSRJso/yfPFZV5qSN0Zq2C4s
   GDk6dMduvjKgscZqKeZgkYOUIfvzgVbj/kk8aqVuSlLZvXF7crwmGnp3h
   XlqwJf/UyhgyFEga5rqhPowbvpr+RXs5xZW3f8L4oOJQBllwZK4jkBU7U
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="333950218"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="333950218"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 01:48:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="649107701"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="649107701"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Feb 2023 01:48:55 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUPGZ-000Edt-0L;
	Tue, 21 Feb 2023 09:48:55 +0000
Date: Tue, 21 Feb 2023 17:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.2/zen-sauce 3/28] drivers/i2c/busses/i2c-nct6775.c:93:27:
 warning: 'nct6775_device_names' defined but not used
Message-ID: <202302211726.yGE3bqe1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.2/zen-sauce
head:   34ffdd85e0b24ac24ba0802b0cc365335e24bec0
commit: 0d4bd4032f3dcf0b7d5e4997fd56bf88ef1e1d15 [3/28] ZEN: Add OpenRGB patches
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230221/202302211726.yGE3bqe1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/zen-kernel/zen-kernel/commit/0d4bd4032f3dcf0b7d5e4997fd56bf88ef1e1d15
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.2/zen-sauce
        git checkout 0d4bd4032f3dcf0b7d5e4997fd56bf88ef1e1d15
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302211726.yGE3bqe1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-nct6775.c: In function 'nct6775_access':
   drivers/i2c/busses/i2c-nct6775.c:221:39: warning: this statement may fall through [-Wimplicit-fallthrough=]
     221 |                         tmp_data.byte = data->byte;
         |                         ~~~~~~~~~~~~~~^~~~~~~~~~~~
   drivers/i2c/busses/i2c-nct6775.c:222:17: note: here
     222 |                 case I2C_SMBUS_BYTE:
         |                 ^~~~
   At top level:
>> drivers/i2c/busses/i2c-nct6775.c:93:27: warning: 'nct6775_device_names' defined but not used [-Wunused-const-variable=]
      93 | static const char * const nct6775_device_names[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~


vim +/nct6775_device_names +93 drivers/i2c/busses/i2c-nct6775.c

    91	
    92	/* used to set data->name = nct6775_device_names[data->sio_kind] */
  > 93	static const char * const nct6775_device_names[] = {
    94		"nct6106",
    95		"nct6775",
    96		"nct6776",
    97		"nct6779",
    98		"nct6791",
    99		"nct6792",
   100		"nct6793",
   101		"nct6795",
   102		"nct6796",
   103		"nct6798",
   104	};
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
