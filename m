Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700FC191
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 04:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685162214; x=1716698214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iR+1sKAmzwVrp1vT02wUQWsl+tPbfYlhxGVZJKhEtoM=;
  b=euxuiunUr5wTVEEf5gxOIM1IG6eLeLSY1uL9VFLKtQ2LUxpYL9T5We5r
   jIzjqisTDdfy3Lg8eSSt+VCg8FhJhAbF60jSdRQ3dtLQOJfPoaU897mma
   shGHhUxzTKXS5qE5DER0x+DmBheoCnUTD2Qxp/BUBCCaBbzh4cwvt2MBg
   6wkbciJtMApIurrc2KVZjB51M+pS90BIpS41p+5cA+H44wUUXiJI0dQsk
   Tjn6Bq69wYLQXglgb2qGe1Kc2GVdNy+e1weDHO1ynjs6u9JUCx+W2N2RE
   yHFBUd+1jBXZ8dt6HOKB01Ry7eh1EGP28GEXmAZXzkBrjPBL1B+Za4r7J
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="353207072"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="353207072"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 21:36:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879742289"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="879742289"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 May 2023 21:36:52 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2lff-000Jlm-1j;
	Sat, 27 May 2023 04:36:51 +0000
Date: Sat, 27 May 2023 12:36:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:unmapped-alloc/rfc-v2 1/3] mm/unmapped-alloc.c:150:13: sparse:
 sparse: symbol 'unmapped_pages_alloc' was not declared. Should it be static?
Message-ID: <202305271252.DO3CJ6zw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git unmapped-alloc/rfc-v2
head:   e55ecf7bdeeb7ef51b93089d7926303e8259641a
commit: c4d7927daa7a7ecd012b341e96b4d22b415c7189 [1/3] mm: intorduce unmapped_alloc()
config: x86_64-randconfig-s021-20230526 (https://download.01.org/0day-ci/archive/20230527/202305271252.DO3CJ6zw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=c4d7927daa7a7ecd012b341e96b4d22b415c7189
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt unmapped-alloc/rfc-v2
        git checkout c4d7927daa7a7ecd012b341e96b4d22b415c7189
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305271252.DO3CJ6zw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/unmapped-alloc.c:150:13: sparse: sparse: symbol 'unmapped_pages_alloc' was not declared. Should it be static?
>> mm/unmapped-alloc.c:198:6: sparse: sparse: symbol 'unmapped_pages_free' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
