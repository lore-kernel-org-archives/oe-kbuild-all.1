Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A4EBA27
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 15:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689606302; x=1721142302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pHa0ImfmO4vhtsILkTaXtFFxU7FhzXbs8vbUQGHIOD4=;
  b=njcONW6PIynEYxwgotWH2j0fDS6tYYB+Wx+bIbxBLKv60IXmtSMd3SKF
   Y6Q/6LdO0SjIfltaGDEq2vHVMrIc1mzJaZNqrUJOeAT1j9Jg+By/fR+3Z
   OK6g3WaGhp031KJyVJWnZgSl+i9TBnasCPQflZ0Q5sdObECfOCgxXY/Uk
   Z3f5OTPdhDEcz+Veui/Z2bhd8gqgORCT8S6vuN4lKF5gzihgFYLhGOJ3q
   W/Ska77qIzOKkZX8dv2mE1Xyu6lRTWN48ef2J5aKIB3r5ikSl76n/MPrp
   O07yE/SfgsuSu9BBH40l+jZAMrLAAtYH9U7WjI+7pf01UQCfXEIfiA0B1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="368593810"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="368593810"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 08:05:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="673560781"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="673560781"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Jul 2023 08:05:00 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLPmV-0009eO-1X;
	Mon, 17 Jul 2023 15:04:59 +0000
Date: Mon, 17 Jul 2023 23:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 107/115]
 drivers/media/platform/camx/cam_cdm/cam_cdm_virtual_core.c:92:27: warning:
 assignment to 'uintptr_t *' {aka 'long unsigned int *'} from 'uintptr_t'
 {aka 'long unsigned int'} makes pointer from integer without a cast
Message-ID: <202307172207.l6uHgSjh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   13ca69353e64ca08e39c762ce8c09842abe9e0aa
commit: 8bb63b31d520570b6b50d77261d221b4c2ca17da [107/115] CHROMIUM: media: camx: properly put mapped buffer
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230717/202307172207.l6uHgSjh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307172207.l6uHgSjh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307172207.l6uHgSjh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/camx/cam_cdm/cam_cdm_virtual_core.c: In function 'cam_cdm_get_buffer':
>> drivers/media/platform/camx/cam_cdm/cam_cdm_virtual_core.c:92:27: warning: assignment to 'uintptr_t *' {aka 'long unsigned int *'} from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
      92 |                 vaddr_ptr = cdm_cmd->cmd[idx].bl_addr.kernel_iova;
         |                           ^
>> drivers/media/platform/camx/cam_cdm/cam_cdm_virtual_core.c:93:21: warning: assignment to 'size_t *' {aka 'long unsigned int *'} from 'uint32_t' {aka 'unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
      93 |                 len = cdm_cmd->cmd[idx].offset + cdm_cmd->cmd[idx].len;
         |                     ^


vim +92 drivers/media/platform/camx/cam_cdm/cam_cdm_virtual_core.c

    79	
    80	static int cam_cdm_get_buffer(struct cam_cdm_hw_intf_cmd_submit_bl *req,
    81				      struct cam_cdm_bl_request *cdm_cmd,
    82				      int idx,
    83				      uintptr_t *vaddr_ptr,
    84				      size_t *len)
    85	{
    86		if (req->data->type == CAM_CDM_BL_CMD_TYPE_MEM_HANDLE)
    87			return cam_mem_get_cpu_buf(cdm_cmd->cmd[idx].bl_addr.mem_handle,
    88						   vaddr_ptr,
    89						   len);
    90	
    91		if (req->data->type == CAM_CDM_BL_CMD_TYPE_KERNEL_IOVA) {
  > 92			vaddr_ptr = cdm_cmd->cmd[idx].bl_addr.kernel_iova;
  > 93			len = cdm_cmd->cmd[idx].offset + cdm_cmd->cmd[idx].len;
    94			return 0;
    95		}
    96	
    97		CAM_ERR(CAM_CDM, "Only mem hdl/Kernel va type is supported %d",
    98			req->data->type);
    99		return -EINVAL;
   100	}
   101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
