Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC207491
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 15:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678288381; x=1709824381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ItJKU6sT8VzUCA3V32CI4JgV+qS+qwohLMahmyyo+bU=;
  b=hwo8B8qiFL6uQT1nNfxHn+VrLNEDxLa1b90lWPGT9XHytALzqfF3XUd0
   u2EvQZeGqJP/oxlcJ3dFq9Dm3dJW9OnYWZbXGKCkt5aIf6YHSH2mIr5JD
   Z/Fxe3YRCebltlpDV1E8JdNPv8Am7EipsGIw3kY8rh57mkDolSI7eP5cx
   AbQM3zHO71s5uyEzmsfHi2FvAUF6ElXVQFp9h1CoY9eu95EjVnNaWQTBd
   iH7IX0FLiP2N+tztiEQKLGHp+9qMbnQ0gOMGmkUIoBL8q1c2hAwzLNnRG
   3Zcs6cUJ1NPPg2y3+PMiZ1ju7CXbhqLcUPiuspivPGAXqtrumlmQCwRmQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400997190"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="400997190"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 07:12:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="707204793"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="707204793"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Mar 2023 07:12:48 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZvTD-0002Cn-2B;
	Wed, 08 Mar 2023 15:12:47 +0000
Date: Wed, 8 Mar 2023 23:11:50 +0800
From: kernel test robot <lkp@intel.com>
To: Evgeniy Baskov <baskov@ispras.ru>
Cc: oe-kbuild-all@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Subject: [ardb:efi-x86-nx 22/24] drivers/firmware/efi/libstub/mem.c:9:33:
 sparse: sparse: symbol 'efi_mem_attrib_proto' was not declared. Should it be
 static?
Message-ID: <202303082354.HASSqGS8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-x86-nx
head:   8171142f3e4c96f6be75a6195de59d1607f1bd4b
commit: 199a8389ba89461b0013bfd57dfa70822343af2b [22/24] efi/libstub: Use memory attribute protocol
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/20230308/202303082354.HASSqGS8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=199a8389ba89461b0013bfd57dfa70822343af2b
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb efi-x86-nx
        git checkout 199a8389ba89461b0013bfd57dfa70822343af2b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/boot/compressed/ drivers/firmware/efi/libstub/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303082354.HASSqGS8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/efi/libstub/mem.c:9:33: sparse: sparse: symbol 'efi_mem_attrib_proto' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
