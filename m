Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2144EC8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 07:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677654430; x=1709190430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y2Q9cUMCEwLXxObnzt8MLwbTxL68xlJ77sD+t6abUGw=;
  b=GfG4wa3izC5REQ5SQPTqGJiJUoNO8rmmwkdJuZ4TBRqBga1xxUf849E/
   Y+R1crYcpygLca8agsann7Wqz73gO+aldKFhXnVF9EI+DFGWkD38HXh6H
   AM18XBsABpAzAVxaYxhEE2j7yg4clyeg6YOQp5SeKlL5dmwV0ZXq8Hc+8
   8Hu5prOuDgfF5/NWjyrPM+Eud6h/BCg3WoW5pW6qpmw59ILr9xak+MdcQ
   DojuMhKqjxLU+N+2JXja7i6NvP20JldPbNy57sVx7lbTOgM9sRjSPK5Us
   BnWKpefocpKkJhg/e6rFddEK28WrpmLr35JOaHpX271jBs9h9lvXldicO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="314009006"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="314009006"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 23:07:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="743298361"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="743298361"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Feb 2023 23:07:08 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXGYO-0005yZ-0Q;
	Wed, 01 Mar 2023 07:07:08 +0000
Date: Wed, 1 Mar 2023 15:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <tangyouling@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Huacai Chen <chenhuacai@kernel.org>, Xi Ruoyao <xry111@xry111.site>
Subject: [linux-next:master 13813/14297]
 arch/loongarch/kernel/relocate.c:166:38: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202303011456.WEPeM0ZN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1716a175592aff9549a0c07aac8f9cadd03003f5
commit: e5f02b51fa0cb785e352e77271a65e96051b789b [13813/14297] LoongArch: Add support for kernel address space layout randomization (KASLR)
config: loongarch-randconfig-s053-20230226 (https://download.01.org/0day-ci/archive/20230301/202303011456.WEPeM0ZN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e5f02b51fa0cb785e352e77271a65e96051b789b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e5f02b51fa0cb785e352e77271a65e96051b789b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303011456.WEPeM0ZN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/relocate.c:166:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *cmdline @@     got void [noderef] __iomem * @@
   arch/loongarch/kernel/relocate.c:166:38: sparse:     expected char *cmdline
   arch/loongarch/kernel/relocate.c:166:38: sparse:     got void [noderef] __iomem *

vim +166 arch/loongarch/kernel/relocate.c

   159	
   160	void * __init relocate_kernel(void)
   161	{
   162		unsigned long kernel_length;
   163		unsigned long random_offset = 0;
   164		void *location_new = _text; /* Default to original kernel start */
   165		void *kernel_entry = start_kernel; /* Default to original kernel entry point */
 > 166		char *cmdline = early_ioremap(fw_arg1, COMMAND_LINE_SIZE); /* Boot command line is passed in fw_arg1 */
   167	
   168		strscpy(boot_command_line, cmdline, COMMAND_LINE_SIZE);
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
