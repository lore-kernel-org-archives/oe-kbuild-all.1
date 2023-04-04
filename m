Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB34380A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 07:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680593108; x=1712129108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ei50hfIkF1zS77KBFmLmrLxFntJlZb9TrLMVJsx9vlI=;
  b=ZN6BDtEog9GRFArHwGgq07/VmZehVnw9TS21+78ND+kQjXBKBjhD5+sj
   uAgg2u4J8Ybyl9rAfaDi7tPWzeoltJ/pxc1lJ0i3v8KuZxqnpORGYay5Z
   EnaTnxE1Z9vP/2Gg5gjYpuGa//cKl7WHwjaWM4Ew9moychm4PCMZsvAeH
   63I/r7Qr6LLhQLbvRWNZytsD0eU/h0baeA8fAyAVR6YZtKpl1lzJLWi4d
   WY8maHcWrc4DlDgoaRCJktSaqk3CkkYJvsnu0PJnc9xxwaED9Xd0/YFXH
   kj8rfgDhaLNgY9pPB1K0QLZlP/5D+V0/T/e2ZDD0jVH6XhhHePk00GAtC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322506093"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="322506093"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 00:25:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="718822808"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="718822808"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Apr 2023 00:25:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjb2K-000PMT-0y;
	Tue, 04 Apr 2023 07:25:00 +0000
Date: Tue, 4 Apr 2023 15:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-tpm-wip 7/7] drivers/char/tpm/tpm_tdx.c:432:9:
 warning: ISO C90 forbids mixed declarations and code
Message-ID: <202304041555.kHK7f6b1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-tpm-wip
head:   e2f91af6624fa658a8c4fea969584f50e46f0397
commit: e2f91af6624fa658a8c4fea969584f50e46f0397 [7/7] [REVERTME] tpm/tdx: Add local test support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230404/202304041555.kHK7f6b1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/e2f91af6624fa658a8c4fea969584f50e46f0397
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-tpm-wip
        git checkout e2f91af6624fa658a8c4fea969584f50e46f0397
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/char/tpm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041555.kHK7f6b1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/tpm/tpm_tdx.c: In function 'tdx_tpm_recv':
>> drivers/char/tpm/tpm_tdx.c:432:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     432 |         struct tpm_header *header = (struct tpm_header *)buf;
         |         ^~~~~~
   At top level:
   drivers/char/tpm/tpm_tdx.c:820:32: warning: 'tdx_guest_ids' defined but not used [-Wunused-const-variable=]
     820 | static const struct x86_cpu_id tdx_guest_ids[] = {
         |                                ^~~~~~~~~~~~~


vim +432 drivers/char/tpm/tpm_tdx.c

   389	
   390	static int tdx_tpm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
   391	{
   392		struct tdx_tpm_dev *tdev = dev_get_drvdata(&chip->dev);
   393		struct tdx_tpm_msg_req *req = tdev->recv_req;
   394		struct tdx_tpm_msg_resp *resp = tdev->recv_resp;
   395		struct tdx_tpm_crypto *crypto = &tdev->session.recv_crypto;
   396		struct tdx_tpm_recv_data *app_data;
   397		u8 *enc_data = (u8 *)&resp->app_data;
   398		u8 *aad = (u8 *)&resp->aad;
   399		u32 data_len;
   400		int ret;
   401	
   402		dev_dbg(tdev->dev, "%s:%d enter\n", __func__, __LINE__);
   403	
   404		if (len > tdev->msg_len - sizeof(*req))
   405			return -EINVAL;
   406	
   407		memset(req, 0, tdev->msg_len);
   408		memset(resp, 0, tdev->msg_len);
   409	
   410		/* Initialize TDVMCALL header */
   411		memcpy(req->guid, &tpm_guid, sizeof(tpm_guid));
   412		req->buf_len = sizeof(*req) - MSG_REQ_SIZE_FROM(rsvd2);
   413		req->service_ver = 0;
   414		req->service_cmd = TDVMCALL_TPM_RECV_MSG;
   415	
   416		/* Initialize resp buf */
   417		memcpy(resp->guid, &tpm_guid, sizeof(tpm_guid));
   418		resp->buf_len = tdev->msg_len;
   419		resp->service_ver = 0;
   420		resp->service_cmd = TDVMCALL_TPM_RECV_MSG;
   421		resp->service_cmd_status = 0;
   422		resp->tdvmcall_status = 0;
   423	
   424	#ifndef SELF_TEST
   425		ret = tdx_hcall_service((u8 *)req, (u8 *)resp,
   426					 TDVMCALL_TPM_CMD_TIMEOUT);
   427		if (ret) {
   428			dev_err(tdev->dev, "Send msg TDVMCALL failed");
   429			return ret;
   430		}
   431	#else
 > 432		struct tpm_header *header = (struct tpm_header *)buf;
   433		return be32_to_cpu(header->length);
   434	#endif
   435	
   436		if (resp->tdvmcall_status || resp->service_cmd_status) {
   437			dev_err(tdev->dev, "TDVMCALL status:%x Cmd buf status:%x\n",
   438				resp->tdvmcall_status, resp->service_cmd_status);
   439			return -EIO;
   440		}
   441	
   442		memset(crypto->new_iv, 0, crypto->iv_len);
   443		memset(crypto->new_iv, crypto->seq_no, sizeof(crypto->seq_no));
   444		bitwise_xor(crypto->init_iv, crypto->new_iv, crypto->new_iv,
   445			    crypto->iv_len);
   446		data_len = resp->dlen + crypto->atag_len;
   447	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
