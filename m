Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76407F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 00:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689812150; x=1721348150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9tqz7ofCLD+mEhhZUypLTCqJoeHi+tkYRfpe4zsUJOM=;
  b=MZiCL+aLIBAiCq7yUclIw10KJ8Ryo5nxW9vscCYOTs84Q/skhPrqZ8+Z
   7IrhIX1Q4dyKa4J3OC9p9a0c51gh/JcMsPaalS+tffYo/IF88nGB7Thkv
   jiC7GCFo/uLo6OcFrEwW8TOvPZ5C9FRgwl4m9lRu13TjDcRikMVpdiQJp
   BkXWSJ5SQztya6SJTz0C1ObYY0Giw75pUtGEpoHfq12LgG7TlucWyitp+
   3TML+tycWGaqYOqzjm9rzgGzTDy0h6XmerXYWjKVUukqvNRLUBcFg1vVu
   YTNrztq7L/vpJbtegdD8SrodgOcNIogw1zLzohmj+zqpquoXEDNwbjggr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="346192738"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="346192738"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 17:15:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="1054945663"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="1054945663"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jul 2023 17:15:48 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMHKX-0005bx-1y;
	Thu, 20 Jul 2023 00:15:44 +0000
Date: Thu, 20 Jul 2023 08:15:15 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/638 3332/12469]
 ./usr/include/linux/imx_vpu.h:22:1: warning: // comments are not allowed in
 this language
Message-ID: <202307200833.eL6G3G3K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/638
head:   3f1f2ea7295505de340ba4089817ae1021920928
commit: b82c78d77f16b30cffdd304eb2c6c1a3ab4f68ba [3332/12469] arm64: imx8mx: vpu: add vsi v4l2 decoder and encoder
config: i386-randconfig-r026-20230718 (https://download.01.org/0day-ci/archive/20230720/202307200833.eL6G3G3K-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200833.eL6G3G3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200833.eL6G3G3K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/imx_vpu.h:17:
   usr/include/linux/videodev2.h:2437:20: error: field has incomplete type 'struct timespec'
           struct timespec                 timestamp;
                                           ^
   usr/include/linux/videodev2.h:2437:9: note: forward declaration of 'struct timespec'
           struct timespec                 timestamp;
                  ^
   In file included from <built-in>:1:
>> ./usr/include/linux/imx_vpu.h:22:1: warning: // comments are not allowed in this language [-Wcomment]
   //ctrls & extension ctrls definitions
   ^
   1 warning and 1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
