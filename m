Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1B0347FFA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 06:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772777165; cv=none; b=ry8BinX9bWnbSk/kLl6CE+D7NiFGQv3lqqdpPYyMb7jwYkMz5oE76ElR+zwhokffSvS/+EUstsduFbt/7V6LOKYaZuSRLFcmYsV3IW4j72N5DnDibLqyMvGHjJnPw0bE/nxNPoN9YJKw+mq1CFIqz8XF82mYbbhCV6FBdejus4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772777165; c=relaxed/simple;
	bh=UcW59RQZ7p692pLBlI0UEeIymuEmwViRpFyi5zwCxnk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kNF9vTDiiDmKPgLGSzxqOwXK5AmlntjCQpCzOiv//k0Rhndzgj06L4vRfQKhIBGjOiWf+W9nkWr30YqwUnzwW30vVj5SvxQaBiL0CGB8KXR0A+XXFLC6j0hWLkVvlZcVR8qnU7/9CD+3XLAWmUzXUATh7A5iBmteThVdj9VvvDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXuWRrS2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXuWRrS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772777163; x=1804313163;
  h=date:from:to:cc:subject:message-id;
  bh=UcW59RQZ7p692pLBlI0UEeIymuEmwViRpFyi5zwCxnk=;
  b=eXuWRrS2Z7cVLyw7kQ1+3Sjw56lBs1hN5gkdoGu3lOGuwtK7R4m9Pll1
   VAJO/wPFF47SdxgIsL/ckiPIjEvAZsgFPnGTnMY/zshhoVaFJXAEOwtf0
   L+ZIM05UqUqx4RzIvC3Ir48bk8JfIPdXB27ObAD7PX5cc3bME96RwJpuy
   dqWLsWcSzsj4Ag8N++QJP7ZiIdgbxBFv8c5VrpGnTCSWePIk+VdxO4nTq
   n1NdPpK2xxXrCKAA6abs4/hRXfq/jFpmw8QKkeFYNyjXZNnbi6dKifeN/
   ZW/sqbO8iiETxh86DRDFx6e+CuvpvOrsYQ9NglsXagz2VtBAqxsnG3sBg
   A==;
X-CSE-ConnectionGUID: uHhC9K9bRf+eBG1Myu+idQ==
X-CSE-MsgGUID: 6R9CtfykQrSy/YHoITWmGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73927844"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73927844"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 22:06:03 -0800
X-CSE-ConnectionGUID: +kv5BOomSn6enFZnrS4WdA==
X-CSE-MsgGUID: E4KcJ9TFQpSgWRQLRKuYbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="249390597"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2026 22:06:00 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyOJx-000000000Rd-2j1d;
	Fri, 06 Mar 2026 06:05:57 +0000
Date: Fri, 06 Mar 2026 14:05:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dominik Kaszewski <dominik.kaszewski@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Roman Li <roman.li@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_fused_io.c:103:56: error: invalid
 use of undefined type 'struct gpio'
Message-ID: <202603061343.CyA71vlH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5ee8dbf54602dc340d6235b1d6aa17c0f283f48c
commit: ce801e5d6c1bac228bf10f75e8bede4285c58282 drm/amd/display: HDCP Locality check using DMUB Fused IO
date:   11 months ago
config: mips-randconfig-r072-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061343.CyA71vlH-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061343.CyA71vlH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061343.CyA71vlH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_fused_io.c: In function 'dm_atomic_write_poll_read_i2c':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_fused_io.c:103:56: error: invalid use of undefined type 'struct gpio'
     103 |  const uint32_t ddc_line = link->ddc->ddc_pin->pin_data->en;
         |                                                        ^~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_fused_io.c: In function 'dm_atomic_write_poll_read_aux':
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_fused_io.c:130:56: error: invalid use of undefined type 'struct gpio'
     130 |  const uint32_t ddc_line = link->ddc->ddc_pin->pin_data->en;
         |                                                        ^~


vim +103 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_fused_io.c

    90	
    91	bool dm_atomic_write_poll_read_i2c(
    92			struct dc_link *link,
    93			const struct mod_hdcp_atomic_op_i2c *write,
    94			const struct mod_hdcp_atomic_op_i2c *poll,
    95			struct mod_hdcp_atomic_op_i2c *read,
    96			uint32_t poll_timeout_us,
    97			uint8_t poll_mask_msb
    98	)
    99	{
   100		if (!link)
   101			return false;
   102	
 > 103		const uint32_t ddc_line = link->ddc->ddc_pin->pin_data->en;
   104		union dmub_rb_cmd commands[3] = { 0 };
   105		const bool converted = op_i2c_convert(&commands[0], write, FUSED_REQUEST_WRITE, ddc_line)
   106				&& op_i2c_convert(&commands[1], poll, FUSED_REQUEST_POLL, ddc_line)
   107				&& op_i2c_convert(&commands[2], read, FUSED_REQUEST_READ, ddc_line);
   108	
   109		if (!converted)
   110			return false;
   111	
   112		const bool result = atomic_write_poll_read(link, commands, poll_timeout_us, poll_mask_msb);
   113	
   114		memcpy(read->data, commands[0].fused_io.request.buffer, read->size);
   115		return result;
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
