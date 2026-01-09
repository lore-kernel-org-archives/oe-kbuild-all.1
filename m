Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D252329E73
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949405; cv=none; b=J6yhvFJWlh+L5AwtvOeVq57spJYB6nnYoyWtvuSRi+su3jEJOp536/e8YxkSDz+qhnCwAT3GxfzK8N0L2e0r3YqZW9NQZzAmpbITRkHlS/RuLMXoPdLz9dAhttNtvKbuZAokw77Q0k63lMW9AvlKbPNCf4jvFVOo82X5aTnwc/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949405; c=relaxed/simple;
	bh=SCJTmQMDIObP9wvvSTD0LQOD0jhq8mukwbbebz4X98w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O8AnJc/V2F9X49LmSPzkXT17V91dFHf1netn6e5phpqum/yFcv3T9YkOoycMKQbQ8fsm35oVOrm1qpufWyrzYjQ7Zt8lSpuFTAbvXki5iqt1vfDlfmIoGsoyIv2yCs84NYtTqTlPTPt0K6CZVaYRq6hLVEv0IApdLX7TzUDzBYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QuB1kldb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QuB1kldb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767949404; x=1799485404;
  h=date:from:to:cc:subject:message-id;
  bh=SCJTmQMDIObP9wvvSTD0LQOD0jhq8mukwbbebz4X98w=;
  b=QuB1kldbrKixMvKYzfw8W9jRdsY5uJ4KUZR4SrTrfETjiNx72SWtIdPj
   G+yoEsyB8a1sb6n8grjgjHagV3j9F0ojziaEI3fWkRftBdgT//3tZsAlB
   xxAYBMSDAwIg9zG6+F/hQnWVV4L3aM4l5DkLwxZSUdrKlxVMD5i5Jqkwh
   7AO98rGc7Qf/r42Zih7cowkt+548lNAyIpFE1VmoHI313io4mLzUktGHC
   zxKck9v64fbHUKvXzdzOeDgsQIRQqHdIdD1O3Au98RVNkTk9ddHaZp3kH
   Y/5aOHs9BsyikXRcGYB2HgF6eyczRPmTDHAjmDet+o0M4OZag1l2mk8oq
   A==;
X-CSE-ConnectionGUID: aSSzg+eBRwe/bDcwCEEVoA==
X-CSE-MsgGUID: S7arco9/SJKBzWMvZhjfaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69068840"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="69068840"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 01:03:23 -0800
X-CSE-ConnectionGUID: Odzc50hjTdOmLOMBYxLOiw==
X-CSE-MsgGUID: CDtJdgyWTh2aawsocIykdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203202788"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 09 Jan 2026 01:03:21 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve8Ot-0000000022S-0S1N;
	Fri, 09 Jan 2026 09:03:19 +0000
Date: Fri, 09 Jan 2026 10:02:45 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1] htmldocs:
 Documentation/gpu/rfc/color_pipeline.rst:300: WARNING: Definition list ends
 without a blank line; unexpected unindent. [docutils]
Message-ID: <202601091018.DKbNfcnT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Uma,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   343ae88aa8b1ab4bc0df083d2d5c8c58d3b560d2
commit: acfa087c53ea775bb262d9430896dc5a1889e2dd [1/1] FROMLIST: drm/doc/rfc: Add documentation for multi-segmented 1D LUT
reproduce: (https://download.01.org/0day-ci/archive/20260109/202601091018.DKbNfcnT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091018.DKbNfcnT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/gpu/drm-kms:491: ./drivers/gpu/drm/drm_modeset_lock.c:392: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:49.
   Declaration is '.. c:function:: int drm_modeset_lock (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'. [duplicate_declaration.c]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/hdmi.h' failed with return code 2
   Documentation/gpu/drm-uapi:434: ./drivers/gpu/drm/drm_ioctl.c:882: WARNING: Duplicate C declaration, also defined at gpu/drm-uapi:70.
   Declaration is '.. c:function:: bool drm_ioctl_flags (unsigned int nr, unsigned int *flags)'. [duplicate_declaration.c]
>> Documentation/gpu/rfc/color_pipeline.rst:300: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:301: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:347: ERROR: Unexpected indentation. [docutils]
>> Documentation/gpu/rfc/color_pipeline.rst:349: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:350: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:378: ERROR: Unexpected indentation. [docutils]
>> Documentation/gpu/rfc/color_pipeline.rst:376: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:382: ERROR: Unexpected indentation. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:384: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:385: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:388: ERROR: Unexpected indentation. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:385: WARNING: Inline emphasis start-string without end-string. [docutils]


vim +300 Documentation/gpu/rfc/color_pipeline.rst

   290	
   291		struct drm_color_lut_range {
   292		       __u32 flags;
   293		       __u16 count;
   294		       __s32 start, end;
   295		       __u32 norm_factor;
   296	
   297		       struct {
   298		               __u16 intp;
   299		               __u16 fracp;
 > 300		       } precision;
   301		};
   302	
   303	If a hardware has multiple segments in 1D LUT, each segment will be represented
   304	by one instance of the above structure and the whole 1D LUT block will be represented
   305	by an array of drm_color_lut_range.
   306	
   307	Here,
   308	
   309	flags : This indicates LUT characteristics like linearly increasing, negative
   310		reflect or any other property of the LUT.
   311	
   312	count : Number of samples in the respective segments.
   313	
   314	start, end : It indicates the starting point and ending point of the segment respectively.
   315		This represent a point in 0 to 1.0 color space curve and the value depends on
   316		the normalization factor chosen.
   317	
   318	norm_factor : This factor helps define a scale to represent LUT sample with the smallest step size
   319		      in case of uniform or non-uniform LUT sample distribution.
   320	
   321	precision: It indicates the fixed point precision of HW LUT including integer and fractional component.
   322	
   323	To explain the usage with some real life example
   324	------------------------------------------------
   325	
   326	1. Conventional 1D LUT with just one segment
   327	
   328			|---|---|------------------------------------|
   329			0   1   2                                   1024
   330	
   331	
   332		- Hardware Description: A color block with a LUT linearly interpolating and
   333					covering range from 0 to 1.0
   334						- Number of segments - 1
   335						- Number of samples in LUT 1024
   336						- Precision of LUT samples in HW 0.10
   337						- Normalization Factor - Max value to represent 1.0
   338							 in terms of smallest step size which is 1024.
   339	
   340		In this case, it will be represented by the following structure.
   341	
   342		struct drm_color_lut_range lut_1024[] = {
   343				.start = 0 .end = (1 << 10);
   344				.normalization_factor = 1024;
   345				.count = 1024;
   346				.precision {
   347					.int_comp = 0;
   348					.fractional_comp = 10;
 > 349				}
   350			}
   351	
   352	2. Piece Wise Linear 1D LUT
   353	
   354		        |---|---|------------------------------------|
   355			0   1   2                                   32
   356			|    \
   357	                |       \
   358	                |          \
   359	                |             \
   360	                |                \
   361			0                   \
   362	                |---|---|--...-------|
   363			0   1   2            8
   364	
   365		- Hardware Description: A color block with a LUT linearly interpolating and
   366					covering range from 0 to 1.0
   367						- Number of segments 2
   368						- Number of samples
   369							- segment 1 - 9 (covers range from 0 to 1/32)
   370							- segment 2 - 30 (covers range from 2/32 to 1.0)
   371						- Precision of LUT samples in HW 0.24
   372						- Normalization Factor - Max value to represent 1.0
   373							 in terms of smallest step size which is 8*32.
   374	
   375			struct drm_color_lut_range lut_pwl[] = {
 > 376			        /* segment 1 */
   377			        {
   378					.count = 9,
   379					.start = 0, .end = 8,
   380					.norm_factor = 8*32,
   381					.precision = {
   382						.intp = 0,
   383						.fracp = 24,
   384					},
   385				},
   386			        /* segment 2 */
   387				{
   388					.count = 30,
   389					.start = 8*2, .end = 8*32,
   390					.norm_factor = 8*32,
   391					.precision = {
   392						.intp = 0,
   393						.fracp = 24,
   394					},
   395			        },
   396			}
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
