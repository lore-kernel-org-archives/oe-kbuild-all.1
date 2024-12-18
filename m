Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52D019A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 06:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734503717; cv=none; b=FdLDe19aN+iQga4d6Zs/Jj7tClxop1amns/xAQE+79OARLMVMZoCKOPV+nGntuKoejumKX7sQfRLDwV2Q6wLDkg8DKBmTs9zY3eB6/EKSGBKCcRQdrxB+DcssLFFcUbc/HSzErIiKpYdWBhOzJMOp92yIx5p5S1hB1DxI3xZV6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734503717; c=relaxed/simple;
	bh=nIhca6dFPdehfPioCdVRlv65tO18N6wNh9Y7YKETetI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KyHuiZU7x9TJzPUQAdoiM/Q3YNWU7whIGwWfvKB1rpVpb7gCb602H+OWgICZE2uES1ThVgpaNE9RikB67/CfLRGG+5ANbtrl8NCoDNNtK9mE9YKCpxWCSQMbcALNq9TW3d+M7F04IdToSq4OMFMJkr4KDt0PJChLJ8m0oYZojqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hy9HjBrz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hy9HjBrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734503714; x=1766039714;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=nIhca6dFPdehfPioCdVRlv65tO18N6wNh9Y7YKETetI=;
  b=Hy9HjBrzPdzW6eQTlRPyxMq8SA39y4n8pmZyttGdZZdLF1hKz3Bobl2f
   XmzlTd6z0wWs8UiKoVvclRxpMgh99eEAC9A5cYSYGWS8pidlwDXSrgwoH
   wqIy6KU8TcFi26At0oQqPbQXCBGdc6Wv3cSqnu4AdBEr+8bKwF1PFMcmv
   K47PHBtTWHagIzi+F3En5HUX7BtXy9gl3JDoZQrtLB3ZCQrdEnJakFPFv
   MWxG1htkyE9hYbetmL0DTsW6hGo27kYTi2pL0XP9JSScGpZz/HQ71fMvQ
   IO5EEDU8FCxgFoIo5VNodjtfqL3c4Eddt8BzAA04f0A08YYude1SlM8lB
   Q==;
X-CSE-ConnectionGUID: 8UdirRrRRBygcotC0lgvAg==
X-CSE-MsgGUID: pxI4ZnJgSPSAjrH5B0WJtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34844103"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="34844103"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 22:35:14 -0800
X-CSE-ConnectionGUID: 4CdvrCrVSlijyUcNcbvrgQ==
X-CSE-MsgGUID: 9kOStjoqT/25GnMklkaL+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98225557"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Dec 2024 22:35:14 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNneJ-000G9q-0P;
	Wed, 18 Dec 2024 06:35:11 +0000
Date: Wed, 18 Dec 2024 14:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: yangge1116@126.com
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] replace free hugepage folios after migration
Message-ID: <Z2Js7fFgqOjnD020@e44086dd48ba>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1734503588-16254-1-git-send-email-yangge1116@126.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] replace free hugepage folios after migration
Link: https://lore.kernel.org/stable/1734503588-16254-1-git-send-email-yangge1116%40126.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



