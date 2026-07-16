Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8DD4014A5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197593; cv=none; b=k1xy5V6mLi4PTg8Vk1SVnNWFaoqNrOPASekON9FhxP7t1qj+YZKoeeW/s4e5YGXrirp/BXFaWPNMq/Vkg21RFneSKaXFy8yaR43pfxnEG+MumQMwGlk3TPRWo1mAQro8HwyVnFfJnJs7M6maVsAJNjGmT6j7jdRVxrvlEYOx1Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197593; c=relaxed/simple;
	bh=It3fRI00yqC5tBIFWXRYw2jHDUuNUhRNx6rBwSsXWbw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hRFhsa0/VYjVaOp1v5nhOwaXG0NWlG1n+U+BX4kjpjl5VUaakJPgSJfc0h+AnQxBN6fE1ixoLzOLWDa9Ogw1ap7+eeVTnZVLx0/G49xgfk4764636OjlnPkeDm/svKPhqe5Y08Ap5Ln73pck1b5Ja8kQEKF36n+5j01uANKfhN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMjw/uGN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMjw/uGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784197593; x=1815733593;
  h=date:from:to:cc:subject:message-id;
  bh=It3fRI00yqC5tBIFWXRYw2jHDUuNUhRNx6rBwSsXWbw=;
  b=fMjw/uGNg/B1e4hVfWSnchwnv19yeMecTXoxCbdmQnsW4Vel9dT3w4Ek
   NPFCW8GpyXretUViQu8fB5Vn+P5HccrRNiPcUgKax9xntz5sFPdkp8Hsm
   oKoagG22zgO9PZx6YnN77WZXEhdzHcAYrWoXMkY3hwUorg5AwaS1vP93g
   pkifiEAIkUmzmD7NdhT+HXGnJkn64jMmfjMwLK4biae+UDhNyPkngD9+H
   vlOqA9hIzusugKthfn4odX7HfoaZOX3ajh1s+H/ygggLR7ILOIrC/DTMh
   9V4QewJk4mMuWc4wEe6alJUBFwOosXCetM8jrxQN21li5y0FZgh2OidwH
   g==;
X-CSE-ConnectionGUID: wxfLe6ZJQ66IROLxjbNlgw==
X-CSE-MsgGUID: NXVU1FSZT1uFcK3Hk/Q7Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="85052694"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="85052694"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 03:26:32 -0700
X-CSE-ConnectionGUID: WZcBg/O+TjakH+61BcaiIw==
X-CSE-MsgGUID: I2vcIsIHRZmkygQIMXTMgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="258433173"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jul 2026 03:26:30 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkJIS-000000004az-1DQe;
	Thu, 16 Jul 2026 10:26:28 +0000
Date: Thu, 16 Jul 2026 12:26:12 +0200
From: kernel test robot <lkp@intel.com>
To: Prike Liang <Prike.Liang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [agd5f:drm-next-7.3 130/155] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202607161204.E9jg2GVf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-7.3
head:   5ab89b491f215f69b750130ead2ff6bbde6c0e2e
commit: 4ae2e536c6438f2eae684a9485d4e76c5ba6f9c5 [130/155] drm/amdgpu/mes11: get MES process/gang contex size
reproduce: (https://download.01.org/0day-ci/archive/20260716/202607161204.E9jg2GVf-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#162: FILE: drivers/gpu/drm/amd/include/mes_v11_api_def.h:534:
+ * use MES_API_QUERY_MES__CAPS instead
+*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
