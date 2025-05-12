Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EECB2566D3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 19:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747078735; cv=none; b=DxOO66GTfd9/El9AG37NM8GFquKOTMXbSuWKijVtbwVEmwrdWibeDlA0anDvFgIVdVgBXl68zSNicIcrinjytGcNXEPnD/etuK3h8fXolcvVtkOg4k+DzGFB4EzsFVQNV1fR6ecXz+iPcVk4s8UigKfU6h+ruouVRqKIVTmC+8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747078735; c=relaxed/simple;
	bh=uVCIiTx/UEcSBS+BpHcS4AnKvUJdOrbQ+rjtWTTqsNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ighST0lx6FhMsE1+Wv2E3t5mKQpGO/T9dlUsUv4QnrSUBN43b6orloCJBRl1dQFoPFLCl17vj+0SqOHQJMwv9vk7zYP4DXWeRSyEYFO251MROSEloMnrjxkUiDds0Ws8mleXD8ZrSQKp0U3s85EBkWwJmR2LzbbnxJhQ6X797bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTi8mdZS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTi8mdZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747078733; x=1778614733;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uVCIiTx/UEcSBS+BpHcS4AnKvUJdOrbQ+rjtWTTqsNM=;
  b=DTi8mdZS3FlTnrTxPvPKnJY/ewWxrTlM26ztq4VH6/Z50U7/2j59nVIJ
   Eb+wyySI5Qpb3LBThWbphO752+fL6a7YYqSvXdiTgGCtFR/dWCIshc6j6
   0H2QTIH+QahSYo2W+1Zr1WOSvWPh48DWdWxKCrxIdp1ILJMBzOvXPXnXW
   XwZR7j1zOejJqaKk7yCwT53fem4HPGpkkh4A0o0uUKAwc2VVjlBGym+Jf
   ZZ4dOEBA/0ac7V4UjjV+2FPb3tUl4A3Q8vEVORhqQudG+l5IDIzdDoBq1
   ZCoo7xWleyD82O9DS4nSmLQhPDZ70+j80NE+43i+ShMhlG5Txhu70bTfF
   A==;
X-CSE-ConnectionGUID: fglApXZyQHWVBqIkLycn9A==
X-CSE-MsgGUID: 693ywW0jRTG+biR65+GxBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49044479"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="49044479"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 12:38:52 -0700
X-CSE-ConnectionGUID: 5yYyhYIKQoCtNukkJ4RDqg==
X-CSE-MsgGUID: Hw0RB68XRO2RDTBNl0JdxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="168548592"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 May 2025 12:38:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEYzB-000FLr-0G;
	Mon, 12 May 2025 19:38:49 +0000
Date: Tue, 13 May 2025 03:38:34 +0800
From: kernel test robot <lkp@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Suraj Kandpal <suraj.kandpal@intel.com>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: [linux-next:master 9168/10491] drivers/gpu/drm/drm_plane.c:212:24:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202505130314.2p06umZj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
commit: 0d6dcd741c266389bbf0a8758f537b3a171ac32a [9168/10491] drm/plane: modify create_in_formats to acommodate async
config: hexagon-randconfig-r122-20250512 (https://download.01.org/0day-ci/archive/20250513/202505130314.2p06umZj-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250513/202505130314.2p06umZj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505130314.2p06umZj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_plane.c:212:24: sparse: sparse: Using plain integer as NULL pointer

vim +212 drivers/gpu/drm/drm_plane.c

db1689aa61bd1e Ben Widawsky  2017-07-23  195  
0d6dcd741c2663 Arun R Murthy 2025-04-07  196  static struct drm_property_blob *create_in_format_blob(struct drm_device *dev,
0d6dcd741c2663 Arun R Murthy 2025-04-07  197  						       struct drm_plane *plane,
0d6dcd741c2663 Arun R Murthy 2025-04-07  198  						       bool (*format_mod_supported)
0d6dcd741c2663 Arun R Murthy 2025-04-07  199  						       (struct drm_plane *plane,
0d6dcd741c2663 Arun R Murthy 2025-04-07  200  							u32 format,
0d6dcd741c2663 Arun R Murthy 2025-04-07  201  							u64 modifier))
db1689aa61bd1e Ben Widawsky  2017-07-23  202  {
db1689aa61bd1e Ben Widawsky  2017-07-23  203  	struct drm_property_blob *blob;
db1689aa61bd1e Ben Widawsky  2017-07-23  204  	struct drm_format_modifier *mod;
db1689aa61bd1e Ben Widawsky  2017-07-23  205  	size_t blob_size, formats_size, modifiers_size;
db1689aa61bd1e Ben Widawsky  2017-07-23  206  	struct drm_format_modifier_blob *blob_data;
db1689aa61bd1e Ben Widawsky  2017-07-23  207  	unsigned int i, j;
db1689aa61bd1e Ben Widawsky  2017-07-23  208  
db1689aa61bd1e Ben Widawsky  2017-07-23  209  	formats_size = sizeof(__u32) * plane->format_count;
db1689aa61bd1e Ben Widawsky  2017-07-23  210  	if (WARN_ON(!formats_size)) {
db1689aa61bd1e Ben Widawsky  2017-07-23  211  		/* 0 formats are never expected */
db1689aa61bd1e Ben Widawsky  2017-07-23 @212  		return 0;
db1689aa61bd1e Ben Widawsky  2017-07-23  213  	}
db1689aa61bd1e Ben Widawsky  2017-07-23  214  
db1689aa61bd1e Ben Widawsky  2017-07-23  215  	modifiers_size =
db1689aa61bd1e Ben Widawsky  2017-07-23  216  		sizeof(struct drm_format_modifier) * plane->modifier_count;
db1689aa61bd1e Ben Widawsky  2017-07-23  217  
db1689aa61bd1e Ben Widawsky  2017-07-23  218  	blob_size = sizeof(struct drm_format_modifier_blob);
db1689aa61bd1e Ben Widawsky  2017-07-23  219  	/* Modifiers offset is a pointer to a struct with a 64 bit field so it
db1689aa61bd1e Ben Widawsky  2017-07-23  220  	 * should be naturally aligned to 8B.
db1689aa61bd1e Ben Widawsky  2017-07-23  221  	 */
db1689aa61bd1e Ben Widawsky  2017-07-23  222  	BUILD_BUG_ON(sizeof(struct drm_format_modifier_blob) % 8);
db1689aa61bd1e Ben Widawsky  2017-07-23  223  	blob_size += ALIGN(formats_size, 8);
db1689aa61bd1e Ben Widawsky  2017-07-23  224  	blob_size += modifiers_size;
db1689aa61bd1e Ben Widawsky  2017-07-23  225  
db1689aa61bd1e Ben Widawsky  2017-07-23  226  	blob = drm_property_create_blob(dev, blob_size, NULL);
db1689aa61bd1e Ben Widawsky  2017-07-23  227  	if (IS_ERR(blob))
0d6dcd741c2663 Arun R Murthy 2025-04-07  228  		return NULL;
db1689aa61bd1e Ben Widawsky  2017-07-23  229  
11b83e3fbc4196 Ville Syrjälä 2018-02-23  230  	blob_data = blob->data;
db1689aa61bd1e Ben Widawsky  2017-07-23  231  	blob_data->version = FORMAT_BLOB_CURRENT;
db1689aa61bd1e Ben Widawsky  2017-07-23  232  	blob_data->count_formats = plane->format_count;
db1689aa61bd1e Ben Widawsky  2017-07-23  233  	blob_data->formats_offset = sizeof(struct drm_format_modifier_blob);
db1689aa61bd1e Ben Widawsky  2017-07-23  234  	blob_data->count_modifiers = plane->modifier_count;
db1689aa61bd1e Ben Widawsky  2017-07-23  235  
db1689aa61bd1e Ben Widawsky  2017-07-23  236  	blob_data->modifiers_offset =
db1689aa61bd1e Ben Widawsky  2017-07-23  237  		ALIGN(blob_data->formats_offset + formats_size, 8);
db1689aa61bd1e Ben Widawsky  2017-07-23  238  
db1689aa61bd1e Ben Widawsky  2017-07-23  239  	memcpy(formats_ptr(blob_data), plane->format_types, formats_size);
db1689aa61bd1e Ben Widawsky  2017-07-23  240  
db1689aa61bd1e Ben Widawsky  2017-07-23  241  	mod = modifiers_ptr(blob_data);
db1689aa61bd1e Ben Widawsky  2017-07-23  242  	for (i = 0; i < plane->modifier_count; i++) {
db1689aa61bd1e Ben Widawsky  2017-07-23  243  		for (j = 0; j < plane->format_count; j++) {
0d6dcd741c2663 Arun R Murthy 2025-04-07  244  			if (!format_mod_supported ||
0d6dcd741c2663 Arun R Murthy 2025-04-07  245  			    format_mod_supported(plane,
db1689aa61bd1e Ben Widawsky  2017-07-23  246  						 plane->format_types[j],
db1689aa61bd1e Ben Widawsky  2017-07-23  247  						 plane->modifiers[i])) {
aadd41485bb227 Dan Carpenter 2017-08-09  248  				mod->formats |= 1ULL << j;
db1689aa61bd1e Ben Widawsky  2017-07-23  249  			}
db1689aa61bd1e Ben Widawsky  2017-07-23  250  		}
db1689aa61bd1e Ben Widawsky  2017-07-23  251  
db1689aa61bd1e Ben Widawsky  2017-07-23  252  		mod->modifier = plane->modifiers[i];
db1689aa61bd1e Ben Widawsky  2017-07-23  253  		mod->offset = 0;
db1689aa61bd1e Ben Widawsky  2017-07-23  254  		mod->pad = 0;
db1689aa61bd1e Ben Widawsky  2017-07-23  255  		mod++;
db1689aa61bd1e Ben Widawsky  2017-07-23  256  	}
db1689aa61bd1e Ben Widawsky  2017-07-23  257  
0d6dcd741c2663 Arun R Murthy 2025-04-07  258  	return blob;
db1689aa61bd1e Ben Widawsky  2017-07-23  259  }
db1689aa61bd1e Ben Widawsky  2017-07-23  260  

:::::: The code at line 212 was first introduced by commit
:::::: db1689aa61bd1efb5ce9b896e7aa860a85b7f1b6 drm: Create a format/modifier blob

:::::: TO: Ben Widawsky <ben@bwidawsk.net>
:::::: CC: Daniel Stone <daniels@collabora.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
