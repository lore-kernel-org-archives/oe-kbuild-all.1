Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A578EEB2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Dec 2024 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733647355; cv=none; b=goH36j1ATdyfvhgHsqquEV/7GRfyWuMDm1GDlpMKSM5LB79jg0epFmlxdRYhv0lVMI3J1BlmGCyvmfcVM160p1WdW1DkIIr+1pMk/+64DFFTkvpeSPpYSAc8ei4bwA/oPZWESHBi8WgZDjwY1buQSCQygkLG3Dkson6pu9OraXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733647355; c=relaxed/simple;
	bh=3SILOxlr4HSIpqVt39VLzLEOwQ5O8x+XVZHUFlfldlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ud+9BFmCLfth09UnRIchyxqS/KUxe5ZB3u+OuszdFBzZKqzREYOnmLctVjJKr7JwgidQ4erR2OtuYBS5lWB0ggQOjms/q+qiBAiJ2Wt2KUuRa8P/I06BAptjCAQy/JT3Sjk0Q97uB6rZEGjhn4h5bn2sg+0XisJpFNmDHX+y3rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KV/E1/eY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KV/E1/eY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733647352; x=1765183352;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=3SILOxlr4HSIpqVt39VLzLEOwQ5O8x+XVZHUFlfldlo=;
  b=KV/E1/eY5ePpD+byHhg7pO6vOmSSZkllCRo9vd/esWILRsoc5Zvo6c2g
   GzOUGqkfAWjHX0R73Rue6+8AuzYtqenEf9AG30YeX/Io72EjVgZl7DTdI
   5uOU3cpLkJS50xKDeDci7HRFZuxKOjqTkqaZMOWpNS3W3zCOObP6EK33i
   RrmxcuiZScZgoTfQB/p3adD73pHKlVI1+0bf2HxeDfBgkfFrgBI9KEkGb
   PlvZ5eOwHDBu4tSTxQOIQrrvHraaf+xa0+ZL3IccgeUmYCZTnug/95yVH
   Aby8B112nYa7Ql9bLIevd6hK92ZrPCBxRQW2y/qUSKMEt8qZyJOc6htxj
   A==;
X-CSE-ConnectionGUID: NI1k1MOxTnSD3NYDUkUx2g==
X-CSE-MsgGUID: k7zzx75tSEetClTRx+Co1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11279"; a="44557417"
X-IronPort-AV: E=Sophos;i="6.12,217,1728975600"; 
   d="scan'208";a="44557417"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 00:42:32 -0800
X-CSE-ConnectionGUID: OcWw+GkzTHWx2oEyPoOLNA==
X-CSE-MsgGUID: x/+lUL5zRXy2P4uouLvg0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,217,1728975600"; 
   d="scan'208";a="94888290"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2024 00:42:30 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKCs0-0003Dz-0R;
	Sun, 08 Dec 2024 08:42:28 +0000
Date: Sun, 8 Dec 2024 16:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: Nikolay Kuratov <kniv@yandex-team.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 6.6 6.12] KVM: x86/mmu: Ensure that
 kvm_release_pfn_clean() takes exact pfn from kvm_faultin_pfn()
Message-ID: <Z1Vb6K6y0T_xQvum@a512c14b2e7e>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241208083830.77587-1-kniv@yandex-team.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH v2 6.6 6.12] KVM: x86/mmu: Ensure that kvm_release_pfn_clean() takes exact pfn from kvm_faultin_pfn()
Link: https://lore.kernel.org/stable/20241208083830.77587-1-kniv%40yandex-team.ru

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



