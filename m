Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3485A210D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 05:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692164137; x=1723700137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lQCxRH9XNJlrJrpHWpxz+d3yI5sbEQiydzC5p6HPFMA=;
  b=QXnEtaTLoghpgmRhkJGA2PKm7/WlX1kXIZCUXRbMInbSjHNRgbHeg1iO
   n2kMxFxxlNgZi1g3N3ag0hRFmPzXfGtC/fkrHlYFhv0uKIf2RJZH37R5/
   Z3fPZNSxtiMr/6lZujpCzqmm6p8yGhC8AAyAB7CwU14gYr3gG3ZN+kzb6
   jkGSqfr+Qa3GJ3paiBGUbGuQcO0wgZRbUyJWPCxFhAvnxlGPC5r1jG72f
   mj2to28FK8T2snIoe+fO1t30gem5MKtqi00qHnmgUch9y1PlQxWe0e0eR
   JOR9OGARZLizglScGzwYfdzkTa4YQ6qjVK6EzNXMlIANEo3VTqqVbmEM/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="438790535"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="438790535"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 22:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="857684103"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="857684103"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Aug 2023 22:35:34 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW9Bu-00000z-0A;
	Wed, 16 Aug 2023 05:35:34 +0000
Date: Wed, 16 Aug 2023 13:35:32 +0800
From: kernel test robot <lkp@intel.com>
To: Huisong Li <lihuisong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] soc: kunpeng_hccs: fix some sparse warnings about
 incorrect type
Message-ID: <202308161305.yhPT7ksM-lkp@intel.com>
References: <20230815125233.65469-1-lihuisong@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815125233.65469-1-lihuisong@huawei.com>

Hi Huisong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on next-20230815]
[cannot apply to linus/master v6.5-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huisong-Li/soc-kunpeng_hccs-fix-some-sparse-warnings-about-incorrect-type/20230815-205824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20230815125233.65469-1-lihuisong%40huawei.com
patch subject: [PATCH] soc: kunpeng_hccs: fix some sparse warnings about incorrect type
config: arm64-randconfig-r092-20230816 (https://download.01.org/0day-ci/archive/20230816/202308161305.yhPT7ksM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161305.yhPT7ksM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161305.yhPT7ksM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/hisilicon/kunpeng_hccs.c:203:37: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/soc/hisilicon/kunpeng_hccs.c:203:65: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *comm_space @@     got unsigned char [usertype] * @@
   drivers/soc/hisilicon/kunpeng_hccs.c:203:65: sparse:     expected void [noderef] __iomem *comm_space
   drivers/soc/hisilicon/kunpeng_hccs.c:203:65: sparse:     got unsigned char [usertype] *

vim +/__iomem +203 drivers/soc/hisilicon/kunpeng_hccs.c

   198	
   199	static int hccs_pcc_cmd_send(struct hccs_dev *hdev, u8 cmd,
   200				     struct hccs_desc *desc)
   201	{
   202		struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
 > 203		void __iomem *comm_space = (u8 *)cl_info->pcc_comm_addr +
   204						sizeof(struct acpi_pcct_shared_memory);
   205		struct hccs_fw_inner_head *fw_inner_head;
   206		struct acpi_pcct_shared_memory tmp = {0};
   207		u16 comm_space_size;
   208		int ret;
   209	
   210		/* Write signature for this subspace */
   211		tmp.signature = HCCS_PCC_SIGNATURE_MASK | hdev->chan_id;
   212		/* Write to the shared command region */
   213		tmp.command = cmd;
   214		/* Clear cmd complete bit */
   215		tmp.status = 0;
   216		memcpy_toio(cl_info->pcc_comm_addr, (void *)&tmp,
   217				sizeof(struct acpi_pcct_shared_memory));
   218	
   219		/* Copy the message to the PCC comm space */
   220		comm_space_size = HCCS_PCC_SHARE_MEM_BYTES -
   221					sizeof(struct acpi_pcct_shared_memory);
   222		memcpy_toio(comm_space, (void *)desc, comm_space_size);
   223	
   224		/* Ring doorbell */
   225		ret = mbox_send_message(cl_info->mbox_chan, &cmd);
   226		if (ret < 0) {
   227			dev_err(hdev->dev, "Send PCC mbox message failed, ret = %d.\n",
   228				ret);
   229			goto end;
   230		}
   231	
   232		/* Wait for completion */
   233		ret = hccs_check_chan_cmd_complete(hdev);
   234		if (ret)
   235			goto end;
   236	
   237		/* Copy response data */
   238		memcpy_fromio((void *)desc, comm_space, comm_space_size);
   239		fw_inner_head = &desc->rsp.fw_inner_head;
   240		if (fw_inner_head->retStatus) {
   241			dev_err(hdev->dev, "Execute PCC command failed, error code = %u.\n",
   242				fw_inner_head->retStatus);
   243			ret = -EIO;
   244		}
   245	
   246	end:
   247		mbox_client_txdone(cl_info->mbox_chan, ret);
   248		return ret;
   249	}
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
