Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AF81D04B4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 14:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727878435; cv=none; b=blWiV/sxmNpo6fcisuodfz5stp1Ia0QPUl14mQTvifwy3H/cjQv8j9Nx860QF6N+mr40O9dPQ4u22DaGHnlXPJ6Ln3yXwBDOcfKiCff3n/jsMJgoXhjXCd9BQqhZ045X5xZKYezCOpyn8U714HspsOMEx1z7OhdKjPg5+UvcHCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727878435; c=relaxed/simple;
	bh=sfsJ4vEHpyoNt3a39EIoxnocUdz5Wg3xnMMYLmWvGnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hzlubv49a/wuJeoXpA8FSzoZRiCBMRQJO6bTjzE7tZz95LWntyXtizVOuxjyn5z0XMeN8771shaUTxW4KB4phTOnwmqajiW0KfFW28KmWjeLfREf5D9yvbx1ZTKW09u8XZeCfmPzT1U2+2mSvv9KBOJs562do/+wM3gcIkU6PBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PrlP/vs6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PrlP/vs6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727878433; x=1759414433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sfsJ4vEHpyoNt3a39EIoxnocUdz5Wg3xnMMYLmWvGnw=;
  b=PrlP/vs6r+ESHBehWx3PuhwEdFyVv4Z3/xoNHfaT+lOp0XCqmQv7QKu8
   bXCjh4n/G/lNU1AUAIxYUoqJ7Qb8CIfFUbPwu6nZEwZF5ylL5MPfWUtEl
   nPAIZKHub8711FKjpKrHdXvM/hvkCkhgIpFmTDg53+TH8KCukjcgfGr15
   L8do2j7cGAnPcKTGZfxon9OzszRvyHpuG3JTTG5OCTsUNhx9rj39EkV+D
   0Eh/6Er+gfPLlaKQKfsFKndlURgVOs2L9zy5kVBUrv7qdaY63+Z2owktU
   445InKORK3+LnkekQceysBpJf/rP5doXoQD9kmy5cpR3mznBqeG11kz2p
   w==;
X-CSE-ConnectionGUID: ct7oekldRjOxvoQyHSHAMw==
X-CSE-MsgGUID: s69BXb4ESSeLwBBknB1RMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="37599674"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="37599674"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 07:13:52 -0700
X-CSE-ConnectionGUID: ZS+aio2MTzyyCfXhfUH+sQ==
X-CSE-MsgGUID: Rwq4Z1yfTdaX/E/2zIwArA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="74135327"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Oct 2024 07:13:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw06t-000TDb-1B;
	Wed, 02 Oct 2024 14:13:47 +0000
Date: Wed, 2 Oct 2024 22:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: Antonio Quartulli <antonio@openvpn.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	sd@queasysnail.net, ryazanov.s.a@gmail.com
Subject: Re: [PATCH net-next v8 03/24] ovpn: add basic netlink support
Message-ID: <202410022156.mxbRG3on-lkp@intel.com>
References: <20241002-b4-ovpn-v8-3-37ceffcffbde@openvpn.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002-b4-ovpn-v8-3-37ceffcffbde@openvpn.net>

Hi Antonio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 44badc908f2c85711cb18e45e13119c10ad3a05f]

url:    https://github.com/intel-lab-lkp/linux/commits/Antonio-Quartulli/netlink-add-NLA_POLICY_MAX_LEN-macro/20241002-172734
base:   44badc908f2c85711cb18e45e13119c10ad3a05f
patch link:    https://lore.kernel.org/r/20241002-b4-ovpn-v8-3-37ceffcffbde%40openvpn.net
patch subject: [PATCH net-next v8 03/24] ovpn: add basic netlink support
reproduce: (https://download.01.org/0day-ci/archive/20241002/202410022156.mxbRG3on-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410022156.mxbRG3on-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/netlink/spec/ovpn.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
