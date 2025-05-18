Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D5821771F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 10:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565666; cv=none; b=A9sqtMxKR/kVm2OGArb0QB4BbvzJYnlEDXwziw7Jxqq7VF2i7MBwh4CvU+wtzAO50FVtdelDQDoGkmi4WG0PuJJL6Ub8x0DtvKjTKvUK9SlnmdNc2HChux2WxM2AULlVBaXxdRP5LjdzDb/cgPZ9ouUglM6kMC7bvhv027jGnlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565666; c=relaxed/simple;
	bh=f9+6lJcYol3jp1fcgQ6ZYxJLTwEocCLwPQp/RuchLl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgmsUBmwXKhe8p9gak0/ax8Ncq7duliLV5ylhPS9+RQZ3zcZRANI9bz70Dljya2r3mDEI0C0IlLEGn7na1pi8W4o2zhiSgK7XJrNrQXwn6n495OjTvFipyvfMmJtWnT1A8oB1qA/SSRRa965X3hlSYyyqWmPIQMPXRFBlbyHkko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHoYzScI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHoYzScI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747565666; x=1779101666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f9+6lJcYol3jp1fcgQ6ZYxJLTwEocCLwPQp/RuchLl4=;
  b=XHoYzScIW1YhL9fCSm1D8SDS21ldsrQP3D+QLhzRO8tfBXo1X7sSrtzv
   kRiLnwOWIlDwewlX+QJnX+zpL5njnls9x9h4i4MjLZKns0JoD4Nlp6WkL
   KOfXrbkVNd423eVQaik9ko2eG2C66PZwTseebFFT5R3ZufpjcagR9vV4I
   KIeccBtErZSZCxM6Zx2ewbIJIzxxiLu9+X6cProgZDhl/mlooKNrqZBQX
   cM1iiXutZraLKo26NDAPNYsw4QWuI6gw/7q+AOfNANfvc+SdtCXrWzF1Y
   MoN4woqZ/CaU/P1tGBBdS2HnQM11A3bekinrDpRubiQmA26iO8fnR6YGr
   g==;
X-CSE-ConnectionGUID: dpTgDkE5SjGuc+wt0tC3FQ==
X-CSE-MsgGUID: NUrh4CtZTueikYxYFpu+sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49634334"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="49634334"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 03:54:23 -0700
X-CSE-ConnectionGUID: C0CJ6k1IS7y4HDbGI26wYQ==
X-CSE-MsgGUID: 1Tn86WfATlOK1AyqZjRgMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139154387"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 May 2025 03:54:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGbes-000Kkx-2w;
	Sun, 18 May 2025 10:54:18 +0000
Date: Sun, 18 May 2025 18:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: Antonio Quartulli <antonio@openvpn.net>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Antonio Quartulli <antonio@openvpn.net>,
	David Ahern <dsahern@kernel.org>
Subject: Re: [PATCH net-next] ovpn: properly deconfigure UDP-tunnel
Message-ID: <202505182055.9AF6d1fu-lkp@intel.com>
References: <20250514095842.12067-1-antonio@openvpn.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514095842.12067-1-antonio@openvpn.net>

Hi Antonio,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Antonio-Quartulli/ovpn-properly-deconfigure-UDP-tunnel/20250514-180029
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250514095842.12067-1-antonio%40openvpn.net
patch subject: [PATCH net-next] ovpn: properly deconfigure UDP-tunnel
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250518/202505182055.9AF6d1fu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505182055.9AF6d1fu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505182055.9AF6d1fu-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "udpv6_encap_needed_key" [net/ipv4/udp_tunnel.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
