Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87972CA6B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 19:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716924079; cv=none; b=NE2A/vHlWUEOjPDeT10IHMJe09sB95IML6diGFMK2j3XNljtc2WLk4TJ7hBd0L3UB9nf3o9e1DjPiSxnQquS0sVpxlXMO9gIC11YMQKD6CABUsoX2HJpEx1bd50G/lGrSrgLNozpp0G1tBfEjJyWcfkl0jU6xkvlxfij6djmCfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716924079; c=relaxed/simple;
	bh=1go40UN7lZSs0IgXdV4yzHYBmO0tby9ey+VyQUwrsx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OpwDNwMxojXUuDMT9gsBwxa3vR/cLIVZqhl8ZAPkjv49VPg53UTQngcq4vOlAGJgGvAW9bwPEA+4SWS1piDA4p5huF/8+/bKLEya34akZtxX20V8lAafwkJUKnFKWhu/6AIb0AaHNLWBo3LpUi5PYBgPYdZArrK9a+2VvzYtgIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDt/ik4e; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDt/ik4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716924077; x=1748460077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1go40UN7lZSs0IgXdV4yzHYBmO0tby9ey+VyQUwrsx8=;
  b=PDt/ik4eB7+2txxZDzOM0MhNuz6q+VDvqkz4xopTwMbAYy6D/GhzbRhq
   yL5p2t8kwvkl3dgqyZFK10A6yXJCk7pRDsWRwbYB8j6RXeYs+/MMqt/EL
   f2FXofqOM9ekwG7GOkxBzZ2T7VpnlfF2+WGF6IbaztNCk/ploP2pA8heV
   GH2oJ52N5AROexaSGJwU8t438kf0hQz27WdcyBHPGQ1SjJFEuCGYbmx1T
   9bOGb27nOpb/CniMt2+cxfgToLsCkkZaYIrBleLz5Ltv+QYNFEn8oghaR
   LT0VGvla79RLjYhJ7mOE5Kh3QPIWPqwMiwaE0T1Tg/GoJvhx9f5EkyKwe
   A==;
X-CSE-ConnectionGUID: U22xQgztR3unEGxnTiSwvA==
X-CSE-MsgGUID: iahC3YdaSLGAdfyvsBZYsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13424065"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="13424065"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 12:21:16 -0700
X-CSE-ConnectionGUID: d7Mm9nnqR+2Nae5lilu1dw==
X-CSE-MsgGUID: BE6EkL6rS5Wdp1/oJGeZMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="39996663"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 May 2024 12:21:15 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC2Nj-000Cfb-3D;
	Tue, 28 May 2024 19:21:11 +0000
Date: Wed, 29 May 2024 03:20:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 5/8]
 drivers/gpu/drm/mediatek/tlc_dp_hdcp.c:34: warning: Function parameter or
 member 'dp_tee_priv' not described in 'dp_tee_op_send'
Message-ID: <202405290324.pHimnXJw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   1e89f939625e2eb24758a511aafb0911d2f04e53
commit: f3d25943c1d4020b0ad7f3049b57cc70ba462af7 [5/8] FROMLIST: Subject: [PATCH] drm/mediatek/dp: Add tee client application for HDCP
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240529/202405290324.pHimnXJw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290324.pHimnXJw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290324.pHimnXJw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/tlc_dp_hdcp.c:34: warning: Function parameter or member 'dp_tee_priv' not described in 'dp_tee_op_send'
>> drivers/gpu/drm/mediatek/tlc_dp_hdcp.c:34: warning: Function parameter or member 'cmd_id' not described in 'dp_tee_op_send'


vim +34 drivers/gpu/drm/mediatek/tlc_dp_hdcp.c

    13	
    14	/*
    15	 * TA_FTPM_UUID: 99975014-3c7c-54ea-8487-a80d215ea92c
    16	 *
    17	 * Randomly generated, and must correspond to the GUID on the TA side.
    18	 * Defined here in the reference implementation:
    19	 * https://github.com/microsoft/ms-tpm-20-ref/blob/master/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/include/fTPM.h#L42
    20	 */
    21	static const uuid_t dp_ta_uuid =
    22		UUID_INIT(0x99975014, 0x3c7c, 0x54ea,
    23			  0x84, 0x87, 0xa8, 0x0d, 0x21, 0x5e, 0xa9, 0x2c);
    24	
    25	/**
    26	 * dp_tee_op_send() - send dp commands through the TEE shared memory.
    27	 * @len:	the number of bytes to send.
    28	 *
    29	 * Return:
    30	 *	In case of success, returns 0.
    31	 *	On failure, -errno
    32	 */
    33	static int dp_tee_op_send(struct dp_tee_private *dp_tee_priv, size_t len, u32 cmd_id)
  > 34	{
    35		int rc;
    36		u8 *temp_buf;
    37		struct tee_ioctl_invoke_arg transceive_args;
    38		struct tee_param command_params[4];
    39		struct tee_shm *shm = dp_tee_priv->shm;
    40	
    41		if (len > MAX_COMMAND_SIZE) {
    42			TLCERR("%s: len=%zd exceeds MAX_COMMAND_SIZE supported by dp TA\n", __func__, len);
    43			return -EIO;
    44		}
    45	
    46		memset(&transceive_args, 0, sizeof(transceive_args));
    47		memset(command_params, 0, sizeof(command_params));
    48		dp_tee_priv->resp_len = 0;
    49	
    50		/* Invoke FTPM_OPTEE_TA_SUBMIT_COMMAND function of dp TA */
    51		transceive_args = (struct tee_ioctl_invoke_arg) {
    52			.func = cmd_id,
    53			.session = dp_tee_priv->session,
    54			.num_params = 4,
    55		};
    56	
    57		/* Fill FTPM_OPTEE_TA_SUBMIT_COMMAND parameters */
    58		command_params[0] = (struct tee_param) {
    59			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
    60			.u.memref = {
    61				.shm = shm,
    62				.size = len,
    63				.shm_offs = 0,
    64			},
    65		};
    66	
    67		command_params[1] = (struct tee_param) {
    68			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
    69			.u.memref = {
    70				.shm = shm,
    71				.size = MAX_RESPONSE_SIZE,
    72				.shm_offs = MAX_COMMAND_SIZE,
    73			},
    74		};
    75	
    76		rc = tee_client_invoke_func(dp_tee_priv->ctx, &transceive_args, command_params);
    77		if (rc < 0 || transceive_args.ret != 0) {
    78			TLCERR("%s: invoke error: 0x%x\n", __func__, transceive_args.ret);
    79			return (rc < 0) ? rc : transceive_args.ret;
    80		}
    81	
    82		temp_buf = tee_shm_get_va(shm, command_params[1].u.memref.shm_offs);
    83		if (IS_ERR(temp_buf)) {
    84			TLCERR("%s: tee_shm_get_va failed for receive\n", __func__);
    85			return PTR_ERR(temp_buf);
    86		}
    87	
    88		/* Sanity checks look good, cache the response */
    89		memcpy(dp_tee_priv->resp_buf, temp_buf, MAX_RESPONSE_SIZE / 2);
    90		dp_tee_priv->resp_len = MAX_RESPONSE_SIZE / 2;
    91	
    92		return 0;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
