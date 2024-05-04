Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDE582485
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 19:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714849671; cv=none; b=YjZqgal1Q2zJ3EmanI86ZsaTPOkVimSJ5UfTDWahhBRyqXExIhHiZX2LPnbRNLITN0JiP8VfQZG4P2yZZtJxMk67rjplria8jxwy1Qv3Zn1ek2Zu4D3bRu8v14IAp9o0fVW6o5mJF+uj2KVJ/Wr8u6wIfwG9fPy3PXZjDIbjihQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714849671; c=relaxed/simple;
	bh=KbIDwpO9JF9w+L82r3GZnC8Iz2PHVzO8INj56ALYj6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=opqQIJc7m+RQnX96Sn3SqPa7qL8yt6iWOmjzpysxOITZnentG+6DRuogu3wPhZiad5kgk3CBf5gtWAD+2Vy5Wq9eD8NQRg+05SUMuuXYsgqBeGBqYRqNkMkKab7hvFAAy2p46mqHai+CO5ue9xNvImH4UxiYbY0EhK/7+LdlfoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igBvfA1K; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igBvfA1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714849669; x=1746385669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KbIDwpO9JF9w+L82r3GZnC8Iz2PHVzO8INj56ALYj6Y=;
  b=igBvfA1KZsSbA5FEDb0UiyCHPsSubcaC/DQMArVhS5odFTVr0cFauy73
   z/Jda/IJjRIV/wQc41AdgAK6yYn0sjFBuDfAwZm3Qr9lUMu+qQzcLf4iq
   IskyBLMvfK54WZXRiZT9K7WQ4oGs67SqVwDiRY8umWilVRB2ATH3UmtUM
   +Dduw2H8KeZD38YFrFxGrx4xxN2MjgSgT1z3YW83rfL0w8DX+fIBwmmkZ
   QnBJ0waLt7b8UNSqg/VJlbf7bPkifYqLRsp9WnI/DkVuROeOUncO6sGU4
   PFA6Epz87m0nR2c664QuCJfd2OF6diARDst7NRdrgFNiEmYI1kZSDEujQ
   A==;
X-CSE-ConnectionGUID: 7IZN4aIQQaGOKwEJ83d/eg==
X-CSE-MsgGUID: m0yyBlCYQsGqI+XeUuSoaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21792288"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="21792288"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 12:07:46 -0700
X-CSE-ConnectionGUID: FgxgfJDyQyuuYL/O1JzliQ==
X-CSE-MsgGUID: L8XuVqOuSySNY3YvtEhqPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="32229093"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 May 2024 12:07:45 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3KjW-000D6C-35;
	Sat, 04 May 2024 19:07:42 +0000
Date: Sun, 5 May 2024 03:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [agd5f:drm-next 340/362]
 drivers/gpu/drm/amd/amdgpu/../display/dc/hdcp/hdcp_msg.c:133:31: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202405050255.j2OlCXlL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   b0923d5d80facb205cc2b7f82994ab5c3eef3181
commit: fa71face755e27dc44bc296416ebdf2c67163316 [340/362] drm/amd/display: Check msg_id before processing transcation
config: x86_64-randconfig-123-20240504 (https://download.01.org/0day-ci/archive/20240505/202405050255.j2OlCXlL-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405050255.j2OlCXlL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405050255.j2OlCXlL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hdcp/hdcp_msg.c:133:31: sparse: sparse: Using plain integer as NULL pointer

vim +133 drivers/gpu/drm/amd/amdgpu/../display/dc/hdcp/hdcp_msg.c

   121	
   122	static bool hdmi_14_process_transaction(
   123		struct dc_link *link,
   124		struct hdcp_protection_message *message_info)
   125	{
   126		uint8_t *buff = NULL;
   127		bool result;
   128		const uint8_t hdcp_i2c_addr_link_primary = 0x3a; /* 0x74 >> 1*/
   129		const uint8_t hdcp_i2c_addr_link_secondary = 0x3b; /* 0x76 >> 1*/
   130		struct i2c_command i2c_command;
   131		uint8_t offset;
   132		struct i2c_payload i2c_payloads[] = {
 > 133			{ true, 0, 1, 0 },
   134			/* actual hdcp payload, will be filled later, zeroed for now*/
   135			{ 0 }
   136		};
   137	
   138		if (message_info->msg_id == HDCP_MESSAGE_ID_INVALID) {
   139			DC_LOG_ERROR("%s: Invalid message_info msg_id - %d\n", __func__, message_info->msg_id);
   140			return false;
   141		}
   142	
   143		offset = hdcp_i2c_offsets[message_info->msg_id];
   144		i2c_payloads[0].data = &offset;
   145	
   146		switch (message_info->link) {
   147		case HDCP_LINK_SECONDARY:
   148			i2c_payloads[0].address = hdcp_i2c_addr_link_secondary;
   149			i2c_payloads[1].address = hdcp_i2c_addr_link_secondary;
   150			break;
   151		case HDCP_LINK_PRIMARY:
   152		default:
   153			i2c_payloads[0].address = hdcp_i2c_addr_link_primary;
   154			i2c_payloads[1].address = hdcp_i2c_addr_link_primary;
   155			break;
   156		}
   157	
   158		if (hdcp_cmd_is_read[message_info->msg_id]) {
   159			i2c_payloads[1].write = false;
   160			i2c_command.number_of_payloads = ARRAY_SIZE(i2c_payloads);
   161			i2c_payloads[1].length = message_info->length;
   162			i2c_payloads[1].data = message_info->data;
   163		} else {
   164			i2c_command.number_of_payloads = 1;
   165			buff = kzalloc(message_info->length + 1, GFP_KERNEL);
   166	
   167			if (!buff)
   168				return false;
   169	
   170			buff[0] = offset;
   171			memmove(&buff[1], message_info->data, message_info->length);
   172			i2c_payloads[0].length = message_info->length + 1;
   173			i2c_payloads[0].data = buff;
   174		}
   175	
   176		i2c_command.payloads = i2c_payloads;
   177		i2c_command.engine = I2C_COMMAND_ENGINE_HW;//only HW
   178		i2c_command.speed = link->ddc->ctx->dc->caps.i2c_speed_in_khz;
   179	
   180		result = dm_helpers_submit_i2c(
   181				link->ctx,
   182				link,
   183				&i2c_command);
   184		kfree(buff);
   185	
   186		return result;
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
