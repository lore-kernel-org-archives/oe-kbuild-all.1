Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9967BD506
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 23:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677626580; x=1709162580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H3NtiTL57k3QRMzsEg5CLuDxysALqPEoOP7/lIquUZ0=;
  b=brJjYVvJs/uNfTKYa1jqRuDoHRgWFaIYGUsiKcu00KJOjWmQMNYjkYAk
   KzN2Xi2svCKwieKLCIe6t2uNN7CWGezOuERmKLcpdlvUCwf5NONj7r/wD
   NWGRowLGEhIKgJA9b/rDtOSOnsK4v/g0utPWNhb0ysl5t9X/Rqb0cq+Y4
   c5YpjE/c+lq9XRy++x4/zC0wVhtB/ZNlkbViZsIU4UrH+hc2mH+K4Udzv
   SVbDwLeheJHY5+/EWDFTRhtEJlqOroBT08UKCF4dqtioy/CdILPo9Afo3
   5Byh7hwn99cT6aZEC9UuN3acOPe4GJnBRLBtHbnIMYYuhbr3QuzAztXeu
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="335763425"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="335763425"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 15:22:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="798216216"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="798216216"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Feb 2023 15:22:55 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pX9J8-0005iH-1N;
	Tue, 28 Feb 2023 23:22:54 +0000
Date: Wed, 1 Mar 2023 07:22:16 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghong Song <yhs@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko]
 undefined!
Message-ID: <202303010701.KWYce0Mt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yonghong,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e492250d5252635b6c97d52eddf2792ec26f1ec1
commit: dffbbdc2d9889670c30e07d05fc0dd712e8ad430 libbpf: Add enum64 parsing and new enum64 public API
date:   9 months ago
config: s390-randconfig-r021-20230227 (https://download.01.org/0day-ci/archive/20230301/202303010701.KWYce0Mt-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dffbbdc2d9889670c30e07d05fc0dd712e8ad430
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout dffbbdc2d9889670c30e07d05fc0dd712e8ad430
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303010701.KWYce0Mt-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
>> ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "ioremap" [drivers/net/arcnet/com90xx.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/arcnet/com90xx.ko] undefined!
>> ERROR: modpost: "iounmap" [drivers/pcmcia/pcmcia.ko] undefined!
>> ERROR: modpost: "ioremap" [drivers/pcmcia/pcmcia.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
