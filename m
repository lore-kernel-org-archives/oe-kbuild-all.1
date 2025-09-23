Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA1A326D44
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758633013; cv=none; b=bLOuTjzQgrVuIVdEYPucUfrFwWbcuzlEp0E5cWlTY7KVpNKOmYVTlRH5r79xP+QVpjTXJP7iyGB51DrePS7lpqDuYagqbWnuRcA2BbYEqN96gfkU6myRlPZFH7dIZl5q/l03vVKpcgquNPF2n6HmMt++XaA5Un6EVqpRpRcRHZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758633013; c=relaxed/simple;
	bh=9XmFaKypdiMQtjlr5zVmSDLMZJaXq6GswATukcddG2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Paa3FMOuE2ZDzQfyq2HuceP/iYTltk+Q1z6FLwSPbdmF8tCOFNI28ri9oLRhVFzO5oxbitUwWFSonQyMy93fgDvOFE55mcAJtc0Ikhf1eUXEwpdXtcn5jP03a71WSW9+SM1MAOXSPXyx38ruCAXy9aETRAz1cn8VYHsnegXV/HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FyIMENqo; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FyIMENqo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758633012; x=1790169012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9XmFaKypdiMQtjlr5zVmSDLMZJaXq6GswATukcddG2U=;
  b=FyIMENqoefUb3cQH50WsfEeD1SLwG6EifvDCWBASlxpcBqGiHQpDHtmT
   3SGaZMvjTHSXdxt5HYORSccxW01SO8dzH1XxjKjbs0vEYUXySDV/IA+Xj
   KD9wTIBxFT6ejFwnrzIPmWHjYJOAMipP3yLXrQ5mtvGbJTnrrPMM7S8XO
   KT4wLCJ10sH5XYzfP/EeqIRexnDfkT33/ZSw4Tux7mjFOKepO7VTTs7sT
   4LZfL45/Z6F0RxvEhcZ8TmRQqHzvvEhmgnEY4/wCcBwCczc9N0BgjGcbP
   HUXWfpp2Aooo2S88e0nG1ZlJUFmWPteBwG/xXcZpAeDcJRLtWvY3OPyeJ
   g==;
X-CSE-ConnectionGUID: VgFMc7m5S0KWmOIAQ5G8CQ==
X-CSE-MsgGUID: Rag0yIiBQ/6uyfxmoFC7lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71155848"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="71155848"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 06:10:11 -0700
X-CSE-ConnectionGUID: POBu4UPJTBm4QiJ5ru87Yw==
X-CSE-MsgGUID: 18W9165jRBelYLBClQOhvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="176050076"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 23 Sep 2025 06:10:10 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v12mV-000000004C5-1Tsi;
	Tue, 23 Sep 2025 13:10:07 +0000
Date: Tue, 23 Sep 2025 15:09:41 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 24/24] htmldocs:
 Documentation/gpu/rfc/color_pipeline.rst:347: ERROR: Unexpected indentation.
 [docutils]
Message-ID: <202509231528.QV9OPrWl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   a390416d0d0f981d5b15a7358987dd2bcace14f7
commit: acfa087c53ea775bb262d9430896dc5a1889e2dd [24/24] FROMLIST: drm/doc/rfc: Add documentation for multi-segmented 1D LUT
reproduce: (https://download.01.org/0day-ci/archive/20250923/202509231528.QV9OPrWl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231528.QV9OPrWl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   Documentation/gpu/drm-kms:491: ./drivers/gpu/drm/drm_modeset_lock.c:392: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:49.
   Declaration is '.. c:function:: int drm_modeset_lock (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'. [duplicate_declaration.c]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/hdmi.h' failed with return code 2
   Documentation/gpu/drm-uapi:434: ./drivers/gpu/drm/drm_ioctl.c:882: WARNING: Duplicate C declaration, also defined at gpu/drm-uapi:70.
   Declaration is '.. c:function:: bool drm_ioctl_flags (unsigned int nr, unsigned int *flags)'. [duplicate_declaration.c]
>> Documentation/gpu/rfc/color_pipeline.rst:300: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:301: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>> Documentation/gpu/rfc/color_pipeline.rst:347: ERROR: Unexpected indentation. [docutils]
>> Documentation/gpu/rfc/color_pipeline.rst:349: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:350: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:378: ERROR: Unexpected indentation. [docutils]
>> Documentation/gpu/rfc/color_pipeline.rst:376: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:382: ERROR: Unexpected indentation. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:384: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:385: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:388: ERROR: Unexpected indentation. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:385: WARNING: Inline emphasis start-string without end-string. [docutils]
--
   Documentation/gpu/rfc/color_pipeline.rst:395: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:396: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:456: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:459: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:460: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>> Documentation/gpu/rfc/color_pipeline.rst:328: ERROR: Undefined substitution referenced: "---". [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:328: ERROR: Undefined substitution referenced: "------------------------------------". [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:354: ERROR: Undefined substitution referenced: "---". [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:354: ERROR: Undefined substitution referenced: "------------------------------------". [docutils]
   Documentation/gpu/rfc/color_pipeline.rst:354: ERROR: Undefined substitution referenced: "---". [docutils]
>> Documentation/gpu/rfc/color_pipeline.rst:354: ERROR: Undefined substitution referenced: "--...-------". [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/host1x.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function vga_switcheroo_handler ./include/linux/vga_switcheroo.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function vga_switcheroo_client_ops ./include/linux/vga_switcheroo.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function vga_switcheroo_handler_flags_t ./include/linux/vga_switcheroo.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function vga_switcheroo_client_id ./include/linux/vga_switcheroo.h' failed with return code 1


vim +347 Documentation/gpu/rfc/color_pipeline.rst

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
 > 328			|---|---|------------------------------------|
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
 > 347					.int_comp = 0;
   348					.fractional_comp = 10;
 > 349				}
   350			}
   351	
   352	2. Piece Wise Linear 1D LUT
   353	
 > 354		        |---|---|------------------------------------|
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
 > 388					.count = 30,
   389					.start = 8*2, .end = 8*32,
   390					.norm_factor = 8*32,
   391					.precision = {
   392						.intp = 0,
   393						.fracp = 24,
   394					},
   395			        },
 > 396			}
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
