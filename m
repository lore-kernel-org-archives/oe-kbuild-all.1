Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2714D9EA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 15:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716217594; cv=none; b=TKBJW3WLuUMG8cz1sVh6TE8j/pX9zEoWTFxco/xpx7FrfyGvWvwt08haQf2Djz+MakLEWUs+aZOmQOcqai+jXgzkGlTx+bfqr8GqsNrhMt5bSGg05S7b6TUPebM+UtnYyz0vDtI8tu/YBOlpTfPKdK0i+2IspoGtAPfzdNhQhHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716217594; c=relaxed/simple;
	bh=ch2+6bFURdAPa6CBtjTQIo8k3FjayYf/LChfcsE9Opc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uAe1BJWZ9V8FgpTBP0bGFKYyxtZvc6GRL/A/T3hdB0SRPrHPmw0M68bpyljFi15MY5BXZfrGJkhU8FkRwUBVeRvGPyHfc4gj/+pDymHMXVF9Pz2eN9AZc1ntE2mOI1oFiUZZc3HDq5PQOq+o7tDZI1bA4xgD+/hJXoj9O9N3E8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtkJC7gJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtkJC7gJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716217592; x=1747753592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ch2+6bFURdAPa6CBtjTQIo8k3FjayYf/LChfcsE9Opc=;
  b=FtkJC7gJHMMtxNAPjwIFsETq+p+4CJqjXlimQ3tuda5EkV6oYXYH2EWV
   hxKBdZwURmf4QH+ewokckEEODKiEYPpBCbssKIe0SQ7IQ5j9sGl0+YG38
   vYL4vyAgTmhgEMaNNidzFviFMTra2lf1e5wqfry+XCysahodBw0PLUsum
   lEpgRdVbGklkOQ6NfJsGQqMD0bvib96ROU1VY0dvFawqqbDkHeCjMA2Y0
   fLdh5oCnhYwAAQsWLYBNra5m9iWZeAanJfpRUEBefTwhe96HJ6Nccj7ob
   ZcrQRhFsT+Q11YRrE3h10vLvpBqQ9+YnaTBM2Fo6wK/pEFg0zEVHNTxOd
   w==;
X-CSE-ConnectionGUID: V7ADGRL1RaWqXgA8Kn66pw==
X-CSE-MsgGUID: dGhwkQ7IT2a/EOoj5ym19g==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23762861"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="23762861"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 08:06:31 -0700
X-CSE-ConnectionGUID: NXqb9io6QqSJ+14Sl0FuFA==
X-CSE-MsgGUID: fTzbraMFQ7KRfXKFzyvvRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="33134303"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 20 May 2024 08:06:30 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s94ap-0004vA-19;
	Mon, 20 May 2024 15:06:27 +0000
Date: Mon, 20 May 2024 23:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Bitnun <etbitnun@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Alvin Lee <alvin.lee2@amd.com>
Subject: [linux-next:master 12471/13491]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:1006
 dc_stream_get_max_flickerless_instant_vtotal_delta() warn: always true
 condition '((stream->timing.v_total - safe_refresh_v_total) >= 0) =>
 (0-u32max >= 0)'
Message-ID: <202405202243.SHvS2otq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   632483ea8004edfadd035de36e1ab2c7c4f53158
commit: bd051aa2fcfb803b94708429970f71596a4748e4 [12471/13491] drm/amd/display: Find max flickerless instant vtotal delta
config: x86_64-randconfig-161-20240520 (https://download.01.org/0day-ci/archive/20240520/202405202243.SHvS2otq-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405202243.SHvS2otq-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:1006 dc_stream_get_max_flickerless_instant_vtotal_delta() warn: always true condition '((stream->timing.v_total - safe_refresh_v_total) >= 0) => (0-u32max >= 0)'
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:1008 dc_stream_get_max_flickerless_instant_vtotal_delta() warn: always true condition '((safe_refresh_v_total - stream->timing.v_total) >= 0) => (0-u32max >= 0)'

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:398 dc_stream_program_cursor_position() error: we previously assumed 'stream' could be null (see line 397)

vim +1006 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c

   985	
   986	/*
   987	 * Determines the max flickerless instant vtotal delta for a stream.
   988	 * Determines vtotal increase/decrease based on the bool "increase"
   989	 */
   990	static unsigned int dc_stream_get_max_flickerless_instant_vtotal_delta(struct dc_stream_state *stream, bool is_gaming, bool increase)
   991	{
   992		if (stream->timing.v_total * stream->timing.h_total == 0)
   993			return 0;
   994	
   995		int current_refresh_hz = (int)div64_s64((long long)stream->timing.pix_clk_100hz*100, stream->timing.v_total*stream->timing.h_total);
   996	
   997		int safe_refresh_hz = dc_stream_calculate_flickerless_refresh_rate(stream,
   998								 dc_stream_get_brightness_millinits_from_refresh(stream, current_refresh_hz),
   999								 current_refresh_hz,
  1000								 is_gaming,
  1001								 increase);
  1002	
  1003		int safe_refresh_v_total = (int)div64_s64((long long)stream->timing.pix_clk_100hz*100, safe_refresh_hz*stream->timing.h_total);
  1004	
  1005		if (increase)
> 1006			return ((stream->timing.v_total - safe_refresh_v_total) >= 0) ? (stream->timing.v_total - safe_refresh_v_total) : 0;
  1007	
> 1008		return ((safe_refresh_v_total - stream->timing.v_total) >= 0) ? (safe_refresh_v_total - stream->timing.v_total) : 0;
  1009	}
  1010	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
