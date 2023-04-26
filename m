Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAB0C2D9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 06:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682491719; x=1714027719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=saoril1ufjUEoRA+NhOrUTSuLFbflLDGejb6X6drbXM=;
  b=f4udG0FY3OkEMKsE/OvGuoG5jSmfPwCwHQsle4BfvtGPe2bKsVl2lJdr
   Ll8mJsgoW8uZ88FynXRiRLf8B13pVXVT+cF3zZuAUXLaBMPwGolx35C59
   EdASdmlnE97Cxlsxq354E6Y1NHCK28m8PwPZdFfcKJciUrI+b2Dtlquoe
   faj10QOJGIzePZjHVfbhoKKgSH3EZiFOfmn6OlGtzS8HFEss/1mneTGO2
   FSO/0INRJLPnqiyTGS5dPB5tyL4nXP+7QfOfyvmZdXyDGEGCSipULxMBY
   jMzXoZDmh9Vu5ARNE+iFzNJ92H9H3HCzd5eaWSycC6S9r1YTDIbymritC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="344472626"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="344472626"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 23:48:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="1023477556"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="1023477556"
Received: from lkp-server01.sh.intel.com (HELO 98ee5a99fc83) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Apr 2023 23:48:37 -0700
Received: from kbuild by 98ee5a99fc83 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prYxA-0000Du-10;
	Wed, 26 Apr 2023 06:48:36 +0000
Date: Wed, 26 Apr 2023 14:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jes Sorensen <Jes.Sorensen@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>
Subject: Re: [PATCH] wifi: rtl8xxxu: Support new chip RTL8192FU
Message-ID: <202304261446.bpmc14h4-lkp@intel.com>
References: <90102fa5-5065-9598-d21f-3624629a0cb5@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90102fa5-5065-9598-d21f-3624629a0cb5@gmail.com>

Hi Bitterblue,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on next-20230425]
[cannot apply to wireless/main linus/master v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bitterblue-Smith/wifi-rtl8xxxu-Support-new-chip-RTL8192FU/20230426-012956
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/90102fa5-5065-9598-d21f-3624629a0cb5%40gmail.com
patch subject: [PATCH] wifi: rtl8xxxu: Support new chip RTL8192FU
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230426/202304261446.bpmc14h4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c6f497a5e6a511da963b0d2f92a13031cc9788c3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bitterblue-Smith/wifi-rtl8xxxu-Support-new-chip-RTL8192FU/20230426-012956
        git checkout c6f497a5e6a511da963b0d2f92a13031cc9788c3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304261446.bpmc14h4-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rtl8192fu_fops" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
