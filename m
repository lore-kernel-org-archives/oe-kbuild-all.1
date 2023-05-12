Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4689F261E8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 22:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683929459; x=1715465459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=001R7TyAwDdwO8/DUKYhckXvH057xO+F7se9cKhgtas=;
  b=GmyJtlw9fWfAE2lNURwMdpoRVJZ6EfF+ymCvI4Y7WJceuwCmrg0nZoRQ
   djBpEra1G87At5rxkVA6qA5MygMPaMYUCicXmXrO4MYlu3iqDNX9Gq2oZ
   URsnoDIKzMlrnqmbk4+XklDx5VKs1lcaLgMASLhQXAWXq1m6DGzzWn1WD
   9xmel6dQiuhVLc10WVXsujB4A4HqAQe5OCkuyeoFF7qVg8qCqldgfKgu2
   w6HjZyzaIrJKofgIwel6M5zz52Xnj3o17AtF1uP9nDhnbgtFNuZQKUIYK
   ZY7IDoJU/fcG+XX65hoLn2an4s4XjJSCFou+VdiiBdByXoaGf3E4Bvi2m
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="354033044"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="354033044"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 15:10:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="765296745"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="765296745"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 May 2023 15:10:57 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxayX-00058S-0D;
	Fri, 12 May 2023 22:10:57 +0000
Date: Sat, 13 May 2023 06:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [intel-tdx:kvm-upstream-workaround 183/341] htmldocs:
 Documentation/ABI/testing/sysfs-firmware-tdx:2: WARNING: Unexpected
 indentation.
Message-ID: <202305130617.aQj5WmAq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   a8ba58bfbd61bb49f204238176ff563405f400a7
commit: fdb8cd476e3e17f7d744d93e9699d91d1a2caa10 [183/341] x86/virt/tdx: Export TD config params of TDX module via sysfs
reproduce:
        # https://github.com/intel/tdx/commit/fdb8cd476e3e17f7d744d93e9699d91d1a2caa10
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout fdb8cd476e3e17f7d744d93e9699d91d1a2caa10
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130617.aQj5WmAq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-firmware-tdx:2: WARNING: Unexpected indentation.

vim +2 Documentation/ABI/testing/sysfs-firmware-tdx

   > 2	Date:           March 2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
