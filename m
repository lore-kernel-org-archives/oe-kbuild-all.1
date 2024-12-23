Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1163192D73
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Dec 2024 11:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734954503; cv=none; b=OgUwlC34CizXH0VsxIFgZl24fH8qLeFTp+4A6zqdcJB8Svc0Mq+v1duvMs461BcIxDIlsIu12jvr4FD1XKeU9EmcpPH5tWZmLwkyuY/lGUEFpdxdjI9BMMU+TeEPoMdjNs0qVoJkJlC2KpIgw+auCY9FuFe0ZQmq5cs3is3mF/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734954503; c=relaxed/simple;
	bh=sRt9YmXcBez5/KlJiYlvQVILUuuNcfTag2jp7DLiEFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8z/O2n4vGZb5UiP4OkAXaMj1JoZCmxxxCU/Rt8YFkQSrpG3iTcZFGFlmH2gu9dgCA6B7+r3j3QYz0Kbb4t4F8ajZALadSm60EF2EVyXdDG1gs0fF3q8Oy2sIhxnOvaF7PkD5S6cXjsRvPE9dgSdxcpI9R8iBqd/ivOyp0vGz6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxCHSnP8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxCHSnP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734954501; x=1766490501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sRt9YmXcBez5/KlJiYlvQVILUuuNcfTag2jp7DLiEFM=;
  b=nxCHSnP8yiDhG2pNnns0aon3gnNl9msKbBF1m+SjinXv0oqFScpMGVdU
   xeWgINGwB8Bq/LVr0LSd8JXliPI48m/aS1bPjxpcDXiRNxK0/wqW3wSTG
   T5amJjxpbZtsSI6fs0c5ehfmFSon6Sizqb4hVYJIdbgt8PVWsVQlLb+0W
   6mLBr4ZPzjiSg4jM8ybIgNsKIiv+s3mSevyQ+sZOWbjNHpFeNxr6LQCdP
   ADcDiqlcLdCK8vCLWJRl2Vc9E+jjFwTTRFEnbBgAqcpdwRWfhtIza8yNs
   Jxmm8ceJC0JMaCclGIAS5p8uI9hVI0TDmC5YKDgjnojd26GafB85mn/jV
   w==;
X-CSE-ConnectionGUID: WWWHGIPpQAOYrwF1XFUf5w==
X-CSE-MsgGUID: 3X4Z344BRSKQ9uPiGAmvjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="46017487"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="46017487"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 03:48:19 -0800
X-CSE-ConnectionGUID: A888sfXORkmhUHL0dykR5A==
X-CSE-MsgGUID: z+KzTawjRqOWhg1dSK6fGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103804455"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Dec 2024 03:48:16 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPgv0-0003ZD-1A;
	Mon, 23 Dec 2024 11:48:14 +0000
Date: Mon, 23 Dec 2024 19:47:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>, tzimmermann@suse.de,
	jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@redhat.com, airlied@gmail.com,
	daniel@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ast: Support timings, 1280x720/1280x960/1600x900
Message-ID: <202412231944.9FPgx42u-lkp@intel.com>
References: <20241223081044.4139167-1-jammy_huang@aspeedtech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223081044.4139167-1-jammy_huang@aspeedtech.com>

Hi Jammy,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4bbf9020becbfd8fc2c3da790855b7042fad455b]

url:    https://github.com/intel-lab-lkp/linux/commits/Jammy-Huang/drm-ast-Support-timings-1280x720-1280x960-1600x900/20241223-161735
base:   4bbf9020becbfd8fc2c3da790855b7042fad455b
patch link:    https://lore.kernel.org/r/20241223081044.4139167-1-jammy_huang%40aspeedtech.com
patch subject: [PATCH] drm/ast: Support timings, 1280x720/1280x960/1600x900
config: arm-randconfig-001-20241223 (https://download.01.org/0day-ci/archive/20241223/202412231944.9FPgx42u-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412231944.9FPgx42u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412231944.9FPgx42u-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/ast/ast_mode.c: In function 'ast_set_dclk_reg':
>> drivers/gpu/drm/ast/ast_mode.c:481:45: error: 'AST_IO_SEQ_PORT' undeclared (first use in this function)
     481 |                 ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x01, 0xff, 0x08);
         |                                             ^~~~~~~~~~~~~~~
   drivers/gpu/drm/ast/ast_mode.c:481:45: note: each undeclared identifier is reported only once for each function it appears in
   In file included from drivers/gpu/drm/ast/ast_mode.c:49:
   drivers/gpu/drm/ast/ast_tables.h: At top level:
>> drivers/gpu/drm/ast/ast_tables.h:290:40: warning: 'res_1280x720' defined but not used [-Wunused-const-variable=]
     290 | static const struct ast_vbios_enhtable res_1280x720[] = {
         |                                        ^~~~~~~~~~~~
   drivers/gpu/drm/ast/ast_tables.h:257:40: warning: 'res_1280x960' defined but not used [-Wunused-const-variable=]
     257 | static const struct ast_vbios_enhtable res_1280x960[] = {
         |                                        ^~~~~~~~~~~~


vim +/AST_IO_SEQ_PORT +481 drivers/gpu/drm/ast/ast_mode.c

   461	
   462	static void ast_set_dclk_reg(struct ast_device *ast,
   463				     struct drm_display_mode *mode,
   464				     struct ast_vbios_mode_info *vbios_mode)
   465	{
   466		const struct ast_vbios_dclk_info *clk_info;
   467	
   468		if (IS_AST_GEN6(ast) || IS_AST_GEN7(ast))
   469			clk_info = &dclk_table_ast2500[vbios_mode->enh_table->dclk_index];
   470		else
   471			clk_info = &dclk_table[vbios_mode->enh_table->dclk_index];
   472	
   473		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc0, 0x00, clk_info->param1);
   474		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc1, 0x00, clk_info->param2);
   475		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xbb, 0x0f,
   476				       (clk_info->param3 & 0xc0) |
   477				       ((clk_info->param3 & 0x3) << 4));
   478	
   479		/* Set SEQ; Half dclk for this timing */
   480		if (vbios_mode->enh_table->flags & HalfDCLK)
 > 481			ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x01, 0xff, 0x08);
   482		else
   483			ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x01, 0xf7, 0x00);
   484	}
   485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
