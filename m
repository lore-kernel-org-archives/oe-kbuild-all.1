Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA57239E60
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 14:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765377385; cv=none; b=RDiXAe6X1pQ4Im1m55dadyqP+08lIDI9RIMn2FnRjy/Tq20OVVk/TzgrLiZeUaJUfnzO0ZOwfVsVvMAWlhE/73Z313NW7G0aGKXxv/t5CtPH3r8fujOeAqHBnn6U6r2AU3lYaUGSCwbQaIUGhL66T8twqImS7oFH7NFcKKPfoo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765377385; c=relaxed/simple;
	bh=M0BjJmnxrC/AzOz8YLqav12Bps9a1kwtgBN8XaM9ncA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pBoqObpWueXYX0aQHDUt8ogtQOYwWaFUmle3u8/EKTU3r8aH63gYGoaWh1qvAuOUxWyi7kWtTKBSpVIgNHVvbFKcKvNtQu3EkFZAtycGqu+fbmvQjwOTigrENkwMWOuul0NcRubRVcq945Mdwolt7Tijx69/8aRg7Kp/tDAWqkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BH7NmaoU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BH7NmaoU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765377383; x=1796913383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M0BjJmnxrC/AzOz8YLqav12Bps9a1kwtgBN8XaM9ncA=;
  b=BH7NmaoUIdnROc1bZQ01SpmeWMUgtTEJab6ToC05cDE7b/8zUlk670nC
   HIr3AEUzIcFHSetraHjRdGNrySfV4tZuPIYEkOD7TlelW8DhtZR2WuPCC
   k9S6H5F5/H36eCfIELH/OBOaouXeLebyxB2sadV+pN9m0bKNzhTaMFzBq
   Xei+VcyqcfdQdCFiSDs2igcJbP7bhOqxAuasBXFlhVzGDi/UsDBKbl2F/
   mbuBdJYEaPACmx4ym3weffTjUeXxDX6aKZBsJ6S8cFae8BbLL6bLfRTVG
   T4S+irVFMCcTW7pc0TeJ3wSjPjOn06CCKZJrD3Y46blcd7kk9yjtbtOnj
   Q==;
X-CSE-ConnectionGUID: r2shuaNNQxK7LcAhAkQhhw==
X-CSE-MsgGUID: C9Um2PsFQ+2figykAaWGuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78045824"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="78045824"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 06:36:22 -0800
X-CSE-ConnectionGUID: sAj0Ccf6SsON2ElZJeRjKA==
X-CSE-MsgGUID: ZYQt7GedRFK08+2eyyDPuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="196597767"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Dec 2025 06:36:21 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTLIg-000000003HF-2vww;
	Wed, 10 Dec 2025 14:36:18 +0000
Date: Wed, 10 Dec 2025 22:35:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 39/39]
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c:164:45-46: WARNING: Use
 ARRAY_SIZE
Message-ID: <202512102238.POSKrZkd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   3fe930d3788d26f7593523d883615b9eabe61f40
commit: f338f99f6a04d03c802087d82a83561cbd5bdc99 [39/39] drm/amd/display: Add array index check for hdcp ddc access
config: x86_64-randconfig-r064-20251210 (https://download.01.org/0day-ci/archive/20251210/202512102238.POSKrZkd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102238.POSKrZkd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c:164:45-46: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c:183:47-48: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c:237:45-46: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c:257:47-48: WARNING: Use ARRAY_SIZE

vim +164 drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c

   149	
   150	static enum mod_hdcp_status read(struct mod_hdcp *hdcp,
   151			enum mod_hdcp_ddc_message_id msg_id,
   152			uint8_t *buf,
   153			uint32_t buf_len)
   154	{
   155		bool success = true;
   156		uint32_t cur_size = 0;
   157		uint32_t data_offset = 0;
   158	
   159		if (msg_id == MOD_HDCP_MESSAGE_ID_INVALID ||
   160			msg_id >= MOD_HDCP_MESSAGE_ID_MAX)
   161			return MOD_HDCP_STATUS_DDC_FAILURE;
   162	
   163		if (is_dp_hdcp(hdcp)) {
 > 164			int num_dpcd_addrs = sizeof(hdcp_dpcd_addrs) /
   165				sizeof(hdcp_dpcd_addrs[0]);
   166			if (msg_id >= num_dpcd_addrs)
   167				return MOD_HDCP_STATUS_DDC_FAILURE;
   168	
   169			while (buf_len > 0) {
   170				cur_size = MIN(buf_len, HDCP_MAX_AUX_TRANSACTION_SIZE);
   171				success = hdcp->config.ddc.funcs.read_dpcd(hdcp->config.ddc.handle,
   172						hdcp_dpcd_addrs[msg_id] + data_offset,
   173						buf + data_offset,
   174						cur_size);
   175	
   176				if (!success)
   177					break;
   178	
   179				buf_len -= cur_size;
   180				data_offset += cur_size;
   181			}
   182		} else {
   183			int num_i2c_offsets = sizeof(hdcp_i2c_offsets) /
   184				sizeof(hdcp_i2c_offsets[0]);
   185			if (msg_id >= num_i2c_offsets)
   186				return MOD_HDCP_STATUS_DDC_FAILURE;
   187	
   188			success = hdcp->config.ddc.funcs.read_i2c(
   189					hdcp->config.ddc.handle,
   190					HDCP_I2C_ADDR,
   191					hdcp_i2c_offsets[msg_id],
   192					buf,
   193					(uint32_t)buf_len);
   194		}
   195	
   196		return success ? MOD_HDCP_STATUS_SUCCESS : MOD_HDCP_STATUS_DDC_FAILURE;
   197	}
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
