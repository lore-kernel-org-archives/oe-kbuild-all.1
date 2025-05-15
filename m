Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B120E19CC27
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 14:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317955; cv=none; b=LM8MmkW44daXIFNi4Q6R8dfPBfxoupqyjeUWxGhM9cKSO2GonCq17R02evvLgXMkM6Wi0AXaS18d/KU/1mr6HHFMss5WKfLf0c8CKbRyvDwW8qMFmSgShcWQRJHvP+SuyFxNjqc3bxDXF5m+1oH1ow0nQwmyiXFhTMuXcpcqKh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317955; c=relaxed/simple;
	bh=I6k6t3N60crA3zHNGTgvB9Zgo20sZYHHLrZLMKvxQFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gB+Smqev8h+DoN5cnmMfc7GAgG5CFOMYzaO0/S+AfisvA3dqqZAcVoQb8+ILVFpKbddlIq4eI4DsPQ5iuPkT+JlyC9pXPPyG2WjZpHK5wPqfSGczuVtLaKWy+FSBw+Vl5fyUlS9ujqOC5fza+LztN0KGcOR3LPA20hQlFARRlXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjwVKEMv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjwVKEMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317954; x=1778853954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I6k6t3N60crA3zHNGTgvB9Zgo20sZYHHLrZLMKvxQFY=;
  b=CjwVKEMvqp6kRNkwdT7uHYUc3Qc05cIDEJjyQunCNFvf8L89QUeYqKSi
   R0VCWgUcn6Z8Mz81BZJYWwgU9JjoZWIfkB/JjWo86IxvULBcAgdPFzKAy
   t575cfJvnP+vTmm76uVVx1wSOgGQxy8mbXhnXQPrEtQMtwno94uro/Fu1
   ZCb0vzvu0axAAeegETNqIX/oYJfHDl+tO3e8b0xnKjrw02GNwd0t35l4f
   lGXxhj371azKZRzE4ytKAsm8JSZ0UoveC5FEaLjxCwhG8ZA1CknGJeHS0
   nNvLVajNh25egGuwpjNUafFYVt+0QHcTNCY325N/5TvJ+ymijPaFjoLLx
   A==;
X-CSE-ConnectionGUID: Gfc/MS/tTtSbglmVfMZhqQ==
X-CSE-MsgGUID: pYA22fCLRNyCs764GoLwvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="59889272"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="59889272"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:05:51 -0700
X-CSE-ConnectionGUID: EZ24lvPbSM6X2fZNsk1Hjg==
X-CSE-MsgGUID: VYEJLAEuSeui/CEFXjjDqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="169453512"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 May 2025 07:05:50 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZDY-0000FX-29;
	Thu, 15 May 2025 14:05:48 +0000
Date: Thu, 15 May 2025 22:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>
Subject: [linux-next:master 8991/11093]
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-imx219.dtb:
 camera@10 (sony,imx219): 'orientation', 'rotation' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202505151412.lkZyg8yI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bdd609656ff5573db9ba1d26496a528bdd297cf2
commit: 6c2df49628c15ea8bca9d04b84fdf70549152da1 [8991/11093] arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: Add Raspberry Pi Camera V2 overlay
config: arm64-randconfig-2052-20250513 (https://download.01.org/0day-ci/archive/20250515/202505151412.lkZyg8yI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151412.lkZyg8yI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151412.lkZyg8yI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-imx219.dtb: camera@10 (sony,imx219): 'orientation', 'rotation' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: camera@10 (sony,imx219): 'orientation', 'rotation' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
