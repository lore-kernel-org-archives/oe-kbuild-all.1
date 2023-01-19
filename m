Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477837471
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 14:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674137342; x=1705673342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ntnOGcLcgpCMoBZ+LpJI0yTPuVNOFCj1Ex/QqMY4tTI=;
  b=VbEBHj6vyziki4vhQ0OcPxSDscfS56mtAow8BHcA4o09yMjYJxyg0eP4
   RPTpY7P3PFcyVEzA428B2cnkYGrUj28BVasPrAu7S9ax1r9RkjYa7HXa6
   B9S08rHRpfEv0BVqre9pE6xuWQ95ErjGR5yVnd37T0LTo+ibWWXpF+TaO
   j4FbRbzKES1eHfA0VRwgNn/jBJELpXq/We8XuS5HIwDjyDP8t09XZn8Am
   Ele8rrh4Yn8Z8Oqsl0eQy3F+MdKwevkkgtNP43/kN4kKRS1EV+u0j0S8d
   ljyLDFLKDMDZI4CUjYpgSRP0CYO2ZqoBKbXZIeT8JkZqWUPhAj70dh7uj
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411529316"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="411529316"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 06:09:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="988998117"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="988998117"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jan 2023 06:09:00 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIVb4-0001Wq-1Z;
	Thu, 19 Jan 2023 14:08:54 +0000
Date: Thu, 19 Jan 2023 22:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Chao Peng <chao.p.peng@linux.intel.com>
Subject: [intel-tdx:kvm-upstream 68/190] <stdin>:1565:2: warning: #warning
 syscall memfd_restricted not implemented
Message-ID: <202301192206.bDLriJ8i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   6a57a45197c90b4d3fade588d2c49ab13ced5957
commit: b296c9b5826f652e55e263fb4ffa147ae32b07c0 [68/190] mm: Introduce memfd_restricted system call to create restricted user memory
config: microblaze-buildonly-randconfig-r003-20230119 (https://download.01.org/0day-ci/archive/20230119/202301192206.bDLriJ8i-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/b296c9b5826f652e55e263fb4ffa147ae32b07c0
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream
        git checkout b296c9b5826f652e55e263fb4ffa147ae32b07c0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> <stdin>:1565:2: warning: #warning syscall memfd_restricted not implemented [-Wcpp]
--
>> <stdin>:1565:2: warning: #warning syscall memfd_restricted not implemented [-Wcpp]
--
>> <stdin>:1565:2: warning: #warning syscall memfd_restricted not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
