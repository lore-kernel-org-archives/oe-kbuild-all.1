Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D016247293
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 06:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758693817; cv=none; b=O9wtDU7Jvlp9Z9M+A6lr9e3yeXJ7wR814EDgY07ZcgW4qffe5cB/37GIqeLCzaGkY3iAVPfC3Bwu6Tt6Z7ul6ieT+bxYUXChsjNL00yk2c+TdTrmjqRn/C0oIMlKGeq3NCG70KOk0DeC9iTTl3WdpLSl1rGO7omfvx+LveqLAhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758693817; c=relaxed/simple;
	bh=qLw/XpUDNjydbKVJDmSYD8KeiUiwlVa54MhovWDpivY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=a91g2d8JQ9F8P/UxEnYSl6weMLpIfbyU3KlGsW0edrQ4Tr9G7sMV2smAlZMKVu+Ihz23V7eoUYUCe1ZnKWck4kfY9s7V3tjl21KCuMgg1x469sMq0xCuB9MeCyolWEgA5Kco/0WP7kh9fyAT9dJhVP1VW3D5XZaDz+K9/0w3agw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B28hUVWG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B28hUVWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758693814; x=1790229814;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=qLw/XpUDNjydbKVJDmSYD8KeiUiwlVa54MhovWDpivY=;
  b=B28hUVWG3vI9sSZWPq0Up0ce9RBAIz6LplA7kHOv8DbZt7sq5AqaKWYY
   jTibYVjri2TT57Ft1ZxCUcJjzJMKW8+jHutpvLuHFXV/wUJsJnbmidCVn
   HOpCBA0jrNPV5vG74T+XYBLtp5Zivx/2XG8Iu0MrwYzg27tNR7iDSAOKL
   E6DUEM/mVHwjVsxwABy01lx2GLqHhuSKoWCs1NzZETPbh8dP96mGQhDle
   d5hwzYmpfzkB9oK4XOjZZTWqkTeuB2eUGy+F4HotEhni3nLPUfAQk/xW6
   RQskF16U+VIta7a/zGBZPqPnOsHSOe0lZKCZE3dCk6zUKrZfsToNNfg7t
   g==;
X-CSE-ConnectionGUID: fSAfTpQyR4C3GMvGkf0cFA==
X-CSE-MsgGUID: GolnIZSTSNGcfwpt7rWwLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64823433"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="64823433"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 23:03:34 -0700
X-CSE-ConnectionGUID: dTgNB2VQR6Kl0+4jak34rQ==
X-CSE-MsgGUID: 5jFWPLkYSpCRWVfEPBCMwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="177729591"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Sep 2025 23:03:33 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1IbC-0003q5-34;
	Wed, 24 Sep 2025 06:03:30 +0000
Date: Wed, 24 Sep 2025 14:02:47 +0800
From: kernel test robot <lkp@intel.com>
To: Xinhui Yang <cyan@cyano.uk>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 2/2] scsi: dc395x: improve code formatting for the
 macros
Message-ID: <aNOJhwUQDD4AP266@ffd18205fa77>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924055628.1929177-3-cyan@cyano.uk>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v4 2/2] scsi: dc395x: improve code formatting for the macros
Link: https://lore.kernel.org/stable/20250924055628.1929177-3-cyan%40cyano.uk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



