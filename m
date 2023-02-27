Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422E02F3A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 17:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677518394; x=1709054394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=We5nlYsM7EMJPlZrLQEZ3wcmxmouvhCiQbeGzsya0HQ=;
  b=fgJYdy2SIKl4V7rk/cS5ramNrLVvidwK8Csjwa9JgZ3lqOi8noP9lLNW
   0vT3H/vXj2/S3qhO4ZJ1GRxZrQ7IQ/dtdW5hiPhXM2GQivKzJb5DUrPjG
   +pKXDXWyZBSyMeUKHxHhJKpJE8TYp/vE/9ma9joZa6XzFd9gCuLI/73+6
   YtnvNW4ruBDmeHi7p0W39LC84xdNLi5mMVF2ZOuBN1eIpf9iO2CPz8Imi
   RfGftqf6IMuW5T5rwO00aXIQ7IhRusPDyfpxgYgr1o7RfkEGNyMiTFVcI
   uAhNb3SfM3vJMk0aAeoNC77fuDRQf3vwtXG5p5+WTHUT7Ol2Q6oinyI0F
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="361471851"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="361471851"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 09:19:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="797723289"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="797723289"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Feb 2023 09:19:52 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWhAF-0004cN-1X;
	Mon, 27 Feb 2023 17:19:51 +0000
Date: Tue, 28 Feb 2023 01:19:24 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 6/6] pci: hotplug: move cardbus code from drivers/pcmcia
Message-ID: <202302280148.nGOqubuW-lkp@intel.com>
References: <20230227133457.431729-7-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227133457.431729-7-arnd@kernel.org>

Hi Arnd,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus soc/for-next linus/master v6.2 next-20230227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/pccard-remove-bcm63xx-socket-driver/20230227-213913
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20230227133457.431729-7-arnd%40kernel.org
patch subject: [RFC 6/6] pci: hotplug: move cardbus code from drivers/pcmcia
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230228/202302280148.nGOqubuW-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ee29671804f97a3f4ccc122dd9c2e6fa6555aa5d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Arnd-Bergmann/pccard-remove-bcm63xx-socket-driver/20230227-213913
        git checkout ee29671804f97a3f4ccc122dd9c2e6fa6555aa5d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/pci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280148.nGOqubuW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/hotplug/yenta_socket.c:2816: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * EnE specific part. EnE bridges are register compatible with TI bridges but


vim +2816 drivers/pci/hotplug/yenta_socket.c

eb0a90b4970d66 drivers/pcmcia/yenta_socket.c Dominik Brodowski 2005-07-12  2813  
eb0a90b4970d66 drivers/pcmcia/yenta_socket.c Dominik Brodowski 2005-07-12  2814  
34b7367024292e drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-27  2815  /**
34b7367024292e drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-27 @2816   * EnE specific part. EnE bridges are register compatible with TI bridges but
34b7367024292e drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-27  2817   * have their own test registers and more important their own little problems.
34b7367024292e drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-27  2818   * Some fixup code to make everybody happy (TM).
34b7367024292e drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-27  2819   */
34b7367024292e drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-27  2820  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
