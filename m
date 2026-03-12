Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D4C3264CF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 00:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773276694; cv=none; b=FHGt/srzjqnxIt8kzxlxL7XLmFqnPoAWi9EcFhVjq3ddVJFPVsOOpwMvkfnVcqgQX/Kfq6HaPEC55Ij8I9/wf1i4PFaSZIgob0Kf+zSV0Cj2klc/Ks+009lfXK0RAPOnVp3/SCbxgR6Bh2KjVvNzaC+OxsQfdaspzuKU2JjE+sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773276694; c=relaxed/simple;
	bh=HF89qLPJ0RIClxmSjonbxegiJ86HYxEgZ8r/DXKd2DU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h6qzowJCIMXmjpiGhXNO09ZkRF+LV3J+636m4S2/kTKybDZGztsOJBmP6Jla+ZOMNoKJD8yex48mHd/KRcJxvLvA3lbWUd+zhzv7tI+VEqZfdOsz1XPbIbY0gyysrzOgh2NO6CsVU5zPnPghaUi/YFL3qdmJjIhTX9/KB7faKrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5igHC+y; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5igHC+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773276693; x=1804812693;
  h=date:from:to:cc:subject:message-id;
  bh=HF89qLPJ0RIClxmSjonbxegiJ86HYxEgZ8r/DXKd2DU=;
  b=M5igHC+y1VcugwH5bgQCDDKVv+fF6n+VeQj6IIyC0SRCxoN9sXXDmRMx
   xD3hBIZJwqT5k/5ge0InjRm+XkInt+RueuiJIEmyyQXMbC/cUshlgRWt/
   wVQOzHVbCFOBDbqj5OHToRdA51iqPRvQT9nsavUYe0gheNZz7aTtyHjj3
   +ziKtBsXtOJpI11aZRYECjvRNcOTxHGlMjf9Mj4CVfOZ1jZn1XpaoRwTF
   sKkADKcjlIYbUi+ByEXCJsuh5kBiUvUuktlg1WN83/r1OR8K0dfzd1+sg
   VZh+bf5hP6Haflxvrmvpj8N/dUhowlNQSTFZuI+qecg+F3TZme10GVLyZ
   Q==;
X-CSE-ConnectionGUID: EeAkRkC2S4uAHnMuju/lPw==
X-CSE-MsgGUID: N8Q/+ZXtTJK9UbtW1RjC9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="76970260"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="76970260"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 17:51:29 -0700
X-CSE-ConnectionGUID: DxtcG0OyTrWZuE8QZuajug==
X-CSE-MsgGUID: l66f4Xd0QpK8pS1EmDHVHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="224786138"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Mar 2026 17:51:28 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0UGr-000000001s1-2hHZ;
	Thu, 12 Mar 2026 00:51:25 +0000
Date: Thu, 12 Mar 2026 08:50:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-6.12.y 957/957]
 drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_hwseq.c:1687
 dcn401_wait_for_det_buffer_update() warn: inconsistent indenting
Message-ID: <202603120840.XTG64St9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.12.y
head:   39b686f8d57d7506af7789e915fe7fd103b0fe57
commit: 4af0d8ebf74ccbb60d33fdd410891283dd6cb109 [957/957] drm/amd/display: Unlock Pipes Based On DET Allocation
config: i386-randconfig-141-20260306 (https://download.01.org/0day-ci/archive/20260312/202603120840.XTG64St9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603120840.XTG64St9-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_hwseq.c:1687 dcn401_wait_for_det_buffer_update() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_hwseq.c:444 dcn401_init_hw() error: we previously assumed 'dc->res_pool->funcs->update_bw_bounding_box' could be null (see line 439)

vim +1687 drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_hwseq.c

  1665	
  1666	void dcn401_wait_for_det_buffer_update(struct dc *dc, struct dc_state *context, struct pipe_ctx *otg_master)
  1667	{
  1668		struct pipe_ctx *opp_heads[MAX_PIPES];
  1669		struct pipe_ctx *dpp_pipes[MAX_PIPES];
  1670		struct hubbub *hubbub = dc->res_pool->hubbub;
  1671		int dpp_count = 0;
  1672	
  1673		if (!otg_master->stream)
  1674			return;
  1675	
  1676		int slice_count = resource_get_opp_heads_for_otg_master(otg_master,
  1677				&context->res_ctx, opp_heads);
  1678	
  1679		for (int slice_idx = 0; slice_idx < slice_count; slice_idx++) {
  1680			if (opp_heads[slice_idx]->plane_state) {
  1681				dpp_count = resource_get_dpp_pipes_for_opp_head(
  1682						opp_heads[slice_idx],
  1683						&context->res_ctx,
  1684						dpp_pipes);
  1685				for (int dpp_idx = 0; dpp_idx < dpp_count; dpp_idx++) {
  1686					struct pipe_ctx *dpp_pipe = dpp_pipes[dpp_idx];
> 1687						if (dpp_pipe && hubbub &&
  1688							dpp_pipe->plane_res.hubp &&
  1689							hubbub->funcs->wait_for_det_update)
  1690							hubbub->funcs->wait_for_det_update(hubbub, dpp_pipe->plane_res.hubp->inst);
  1691				}
  1692			}
  1693		}
  1694	}
  1695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
