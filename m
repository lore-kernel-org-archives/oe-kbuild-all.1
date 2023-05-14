Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C4C10E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 May 2023 02:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684029981; x=1715565981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6QvfCpJxraG8zvPlLdUVWu990HVGxasOliQ40SbOGts=;
  b=gN2AotU8kVUkwqWV9nEX5Po/9OfDJSlvYRUYmgEMTBNnDmAIxOVnuFKf
   oHrqxuanPAexESwQwVwX5BJmiyfuuSgQJ/Nz4vghZ0mJFvN2wFeefUv0q
   YdXsBVvom+nT+sU3hz0sUhoa8+GR/fXeJlo8o5neoRLFMlNs27IVBgTcm
   g+WAYGujlYnL290qGXYLUtyCi4ZZICp8XDCaw9zFAZUxOjTF8YI+GKNIn
   cE5zyi2UtUQG4O3pQcChzoMZimDfaJxiTSjJi1RemFfH1hw+0VYe4Gfa3
   fE4fFqDbfD2G9lsHSGzpwMcs+XZ4uNIu1R1DWlWOnd7uKIetNy7A/RIGp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="349845296"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="349845296"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 19:06:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="694637815"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="694637815"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 May 2023 19:06:19 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1py17q-0005mO-31;
	Sun, 14 May 2023 02:06:18 +0000
Date: Sun, 14 May 2023 10:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 48/95] htmldocs:
 Documentation/virt/kvm/arm/util_hint.rst:21: WARNING: Malformed table.
Message-ID: <202305141042.Ox56C69x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   89d010b0a9df01990fffda97770fecd4e69e0f86
commit: fa0dff38f560ea351d5e3e335e8528b5b94f1f7f [48/95] CHROMIUM: BACKPORT: FROMLIST: kvm: arm64: Add support for util_hint service
reproduce:
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout fa0dff38f560ea351d5e3e335e8528b5b94f1f7f
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305141042.Ox56C69x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/virt/kvm/arm/util_hint.rst:21: WARNING: Malformed table.

vim +21 Documentation/virt/kvm/arm/util_hint.rst

    12	
    13	ARM_SMCCC_HYP_KVM_UTIL_HINT_FUNC_ID
    14	    ==============    =========   ============================
    15	    Function ID:      (uint32)    0x86000042
    16	    Arguments:        (uint32)    util value(0-1024) where 1024 represents
    17	                                  the highest performance point normalized
    18	                                  across all CPUs
    19	    Return values:    (int32)     NOT_SUPPORTED(-1) on error.
    20	    Endianness:                   Must be the same endianness
  > 21	                                  as the host.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
