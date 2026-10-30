Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397011;
	b=zCdUCRU+TYybtsimORRgcbq0WV3jE1pPNKjV/VoTHjtdz8AkJkdAUnBODkuNGFZQsv6x
	 gbSfoaEzePg+RR7vew9EUpXUpWrLwtWnuBJi9m4WYjH1vTwluDR82EsckFsSpJYUf4NWs
	 tt6J4FeRbDwQGkERcUodcbe6lp+aTEgn5BJPw6mhU2gECJvEeCLqGlMXb2SWnzAwT1/BY
	 v/VrAClPS2BXXM1ftTEe8TdnYShvgqHZgvz2irKqE+ChqcPqMuPXXRtnx4ndr8mat7pRk
	 GbsswM8uSSmiXGV4sM6ZBGN5QQ/zkveZLSIgtfNPp/PtzfLASfI2v21vvacfh3SmMTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397011;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=F70gIwgZ1AIc0esVPNFxexisouK3InPKKs0HU/1v7Rg=;
	b=SEmCq+jxh/PTcuDO6wGT+WIj4KuCbobZxAkjzzHcKnTjL8EF+mWpbWGu40pgL0a43vej
	 sUKRSn9l3wvi1zyeFgHu1DmQ/+p6h5cNjnIBdeQu4TryKtKLM8U5GzIcvygJdQFKdpbH0
	 Mgut/IeR30jtxLT/Fwsk9BpWCsfAzIxNZ4D3FhB45ytT0+7a/kaUnHa2fvUsvgmWxrwI2
	 z5DwSK2Ve5jghxpz8TsgLh9WHpE4eNR8mCB2Qwoo/tymTyrEPtFyZOmiQeznh6Cf9Oete
	 Ns3p5FlIvn64Kqx8ISex73L1DTlFbi25aLiA8P7XkcDTiPAEKA8HFblLtUhXGT9HUNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kTukYz5P;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC13D606A31E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 21:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC13D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kTukYz5P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793397009; x=1824933009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GKLx77do1ym/bkZyNKLZrHNEuYscbJOKYkmhw++EjI0=;
  b=kTukYz5PQ+r2dNX5Grb8m5Qz0L0zGFg4tMxbgt4GY6GDKfPafGrLbIB6
   IC7heZvQgPyUG4HP4MLqaWMiysyoafl2IxVgMn1Tk3rbXu5+RZ5mQvcQR
   75u6JAC6pcz3ZfRZNXV+/rvzcgIk+Pfw9Mzo1rpYTIWo0hYA4Q03qzOFb
   dJodbOcM3JVVXkNIHNf2mU9wUNRYiZVlW4e5B10ML8/pv5EJsdP6sZ+Ve
   8dWE4/XoVnsh/U5Xmktks8RHbv28yz6zwdP30NgHPzq2lQ3xVlocVaM8C
   fODkhRlXNVzGv5wJe82krkb2nlG9LknHXPKAW0TKJcTv1S0MeecouJums
   w==;
X-CSE-ConnectionGUID: iqveoHiTSg6TNSEfdjjmmg==
X-CSE-MsgGUID: keV0dXCDQue57LBqKRgf4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2174841"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2174841"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 14:50:09 -0700
X-CSE-ConnectionGUID: rE/zM/d2SOaEvZMTDbuwHA==
X-CSE-MsgGUID: mb1n3kecRtCvzzoLquf+Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5618458"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Oct 2026 14:50:05 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMuU6-00000000cH0-0Klx;
	Fri, 30 Oct 2026 21:50:02 +0000
Date: Sat, 31 Oct 2026 05:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: Chaoyi Chen <kernel@airkyi.com>, Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v2 1/3] drm/rockchip: vop2: Use
 drm_format_info_min_pitch() for plane offsets
Message-ID: <202610310517.O99iZZoW-lkp@intel.com>
References: <20261029081429.862-2-kernel@airkyi.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029081429.862-2-kernel@airkyi.com>

Hi Chaoyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on rockchip/for-next linus/master v7.3 next-20261029]
[cannot apply to linux-review/Chaoyi-Chen/drm-rockchip-vop2-Use-drm_format_info_min_pitch-for-plane-offsets/20261022-151735]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/drm-rockchip-vop2-Use-drm_format_info_min_pitch-for-plane-offsets/20261029-161427
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261029081429.862-2-kernel%40airkyi.com
patch subject: [PATCH v2 1/3] drm/rockchip: vop2: Use drm_format_info_min_pitch() for plane offsets
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261031/202610310517.O99iZZoW-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310517.O99iZZoW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310517.O99iZZoW-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/gpu/drm/rockchip/rockchipdrm.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
