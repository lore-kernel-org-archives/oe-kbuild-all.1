Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D2723D4C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 19:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683920397; x=1715456397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jG2r7+a7aCrFuGoCQCOcqi3erg1LH7rIc1GcO3FJqUg=;
  b=W/9RdUW4Q/BXlrynTJON8hYCrcjdmaNRwda+wjSRvDQmAOhXll4x5AHR
   wms3IesZxKyMabCkdz69qDc1vdXNot4DXW0WT+SZVkjocS7hRaTQUGdXK
   vuK2i3B+beq8IhpyFYCD28sdquR8UYiVVMLzVShkT9xqe+JaqYPXbE4Qf
   rdhZGcAze42vEmpbZaqmjj59yLdrKdnguziYim7Hg5/bNtPlVRRpyYvQc
   WDO8aFibdRnJizZseF+fN45V2O9IggZXah6plQYCcgUOFJIhgy7LZiDHj
   IQQfoRMnd48sYxWmgxln+DB0lSf1G8dxUbwNebQvwVJhJLImUGpl10h+Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="335394063"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="335394063"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 12:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="694351038"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="694351038"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 May 2023 12:39:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxYcM-00054Y-2T;
	Fri, 12 May 2023 19:39:54 +0000
Date: Sat, 13 May 2023 03:39:11 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 270/453] drivers/interconnect/qcom/icc-rpm.c:206:5: warning: no previous
 prototype for 'qcom_icc_rpm_set'
Message-ID: <202305130334.IRt1BrBf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
head:   255ec801b7a09e914735a942f27f3c74f5e8e810
commit: 03700a0718a15e85705af64b307f38576877597e [270/453] [HACK] Push DDR to FMAX frequency at boot
config: arm64-randconfig-r036-20230509 (https://download.01.org/0day-ci/archive/20230513/202305130334.IRt1BrBf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/03700a0718a15e85705af64b307f38576877597e
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout 03700a0718a15e85705af64b307f38576877597e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/interconnect/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130334.IRt1BrBf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/interconnect/qcom/icc-rpm.c:206:5: warning: no previous prototype for 'qcom_icc_rpm_set' [-Wmissing-prototypes]
     206 | int qcom_icc_rpm_set(int mas_rpm_id, int slv_rpm_id, u64 sum_bw)
         |     ^~~~~~~~~~~~~~~~


vim +/qcom_icc_rpm_set +206 drivers/interconnect/qcom/icc-rpm.c

   205	
 > 206	int qcom_icc_rpm_set(int mas_rpm_id, int slv_rpm_id, u64 sum_bw)
   207	{
   208		int ret = 0;
   209	
   210		if (mas_rpm_id != -1) {
   211			ret = qcom_icc_rpm_smd_send(QCOM_SMD_RPM_ACTIVE_STATE,
   212						    RPM_BUS_MASTER_REQ,
   213						    mas_rpm_id,
   214						    sum_bw);
   215			if (ret) {
   216				pr_err("qcom_icc_rpm_smd_send mas %d error %d\n",
   217				       mas_rpm_id, ret);
   218				return ret;
   219			}
   220		}
   221	
   222		if (slv_rpm_id != -1) {
   223			ret = qcom_icc_rpm_smd_send(QCOM_SMD_RPM_ACTIVE_STATE,
   224						    RPM_BUS_SLAVE_REQ,
   225						    slv_rpm_id,
   226						    sum_bw);
   227			if (ret) {
   228				pr_err("qcom_icc_rpm_smd_send slv %d error %d\n",
   229				       slv_rpm_id, ret);
   230				return ret;
   231			}
   232		}
   233	
   234		return ret;
   235	}
   236	EXPORT_SYMBOL_GPL(qcom_icc_rpm_set);
   237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
