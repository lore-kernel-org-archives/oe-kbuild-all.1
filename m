Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6F13C27
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 23:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675035490; x=1706571490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QrtxKORZuZHnmEs7aIvhz70z77bpGWSKqnu6/DEntw0=;
  b=dk0WSnqEzX9CRK+cCZr16M8QyInuCiZVdtlMpDyWQ6dT8u1vzX1p555G
   ZlNQQczj2GqzbqUo+s5xnFL+3LNKyInkose/5lhAwdfGGriSFy4brIdVD
   PM1ud6bSqqwuYUk+AfyuM0Jg4AOaRAukj3dRJ8+7PChAcymqycaqVClRo
   bL6jK/oKBco0Z5sGwKh4ztiAudJJ1D6bSonfmQuuyCXomuS5JDlFdwtdk
   l0URbV37pwABb+X9qeKcM/CBPxHepQCtButWZ/9sSgZblKHGcAGtE5mY9
   OCFykHdnhtvRNods13dTHEhMRG9rzQmWNUeNK67cWTNmzUFPYcE/Ryugk
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="389822759"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="389822759"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 15:38:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="663906621"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="663906621"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 Jan 2023 15:38:07 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMHFO-0003Ay-2I;
	Sun, 29 Jan 2023 23:38:06 +0000
Date: Mon, 30 Jan 2023 07:37:43 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Palmer Dabbelt <palmer@rivosinc.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 4700/8766] htmldocs:
 Documentation/riscv/uabi.rst:24: WARNING: Enumerated list ends without a
 blank line; unexpected unindent.
Message-ID: <202301300743.bp7Dpazv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e2f86c02fdc96ca29ced53221a3cbf50aa6f8b49
commit: f07b2b3f9d47fea308af3ae05613b6b4801e68a3 [4700/8766] Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f07b2b3f9d47fea308af3ae05613b6b4801e68a3
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f07b2b3f9d47fea308af3ae05613b6b4801e68a3
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/riscv/uabi.rst:24: WARNING: Enumerated list ends without a blank line; unexpected unindent.

vim +24 Documentation/riscv/uabi.rst

    13	
    14	#. Single-letter extensions come first, in canonical order.
    15	   The canonical order is "IMAFDQLCBKJTPVH".
    16	
    17	#. All multi-letter extensions will be separated from other extensions by an
    18	   underscore.
    19	
    20	#. Additional standard extensions (starting with 'Z') will be sorted after
    21	   single-letter extensions and before any higher-privileged extensions.
    22	
    23	#. For additional standard extensions, the first letter following the 'Z'
  > 24	  conventionally indicates the most closely related alphabetical
    25	  extension category. If multiple 'Z' extensions are named, they will be ordered
    26	  first by category, in canonical order, as listed above, then alphabetically
    27	  within a category.
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
