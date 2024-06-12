Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BCB3770D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 23:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718235020; cv=none; b=gfLecBXfLK+oFn5pAQDhvhfmD6K1TXJvBF+M7wgf96EJO7FREmeTgQbe3TpvCSTgYJjgcCcecHpxlIaJDYnMN5FJ76Bua0Vz5TMG4Tr+0j+pf3pZGA4jbMsI+KmCi0n2a/pfLjQpMzG3XSpa8ZMlLKYp6QpnwNQZYAhQPsUOZ3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718235020; c=relaxed/simple;
	bh=5O89Iz1JeGwAAI9YN2bxkUTOIRSUR37f+IrQ5GmLhec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aio074l64ornrknyitGAtqvPZt2qYHV/0Y6ecN8pyFdLeE/gLbO2IUToA0V09Mv9i2qX91R/FcoaHyzxksywaHbe0I2Y+erY8exR/+zVVS8OgtiO94rQGXalabecwJekorj1A7goGxHc+qmb8EevpSEH8KfnsC2lxiDaFhJZ1Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eaKLDzyv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eaKLDzyv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718235019; x=1749771019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5O89Iz1JeGwAAI9YN2bxkUTOIRSUR37f+IrQ5GmLhec=;
  b=eaKLDzyvyng/MrI/2jymMAIWuLuNnDwcYFVZBdp9ZaBuMlh7E9D3lOtA
   L83dxF1ITra3CtNv3rnT6es2BUvJ5W/BYtPzWENZxgxaaIoAEc00wf+GQ
   uU5i4QjhCV6leeAqFgUONsl3/L8ZraG8qP1mOhuqyfVVZD9Po+DiOHJRT
   uF4644Q7WLtiBkjeK0huQ1NvewTw+0MSF+7Z4td1mTZqSeUvbWcOrBJpX
   i39UUlVpJdCpS1LLwcgoaNfReoLqnVlG3JFB1MZXEZc0+6k+OWxm8UYbT
   tuTIU+8mcEFVq6ZZz0SeUnOYjorT9cfIwV5XxGnP0qyqJPMpQ+SrNpdb4
   Q==;
X-CSE-ConnectionGUID: 95VZ2ROsQGOURxMxKl7uvA==
X-CSE-MsgGUID: ZXjLXjjYRoSzQ/MxzD/jFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14750230"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="14750230"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 16:30:18 -0700
X-CSE-ConnectionGUID: MilZrOfASdGldhd8XtVWCQ==
X-CSE-MsgGUID: dvC24Y9yTDet0ugzc4ZO2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40054477"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jun 2024 16:30:17 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHXPz-00020R-0Z;
	Wed, 12 Jun 2024 23:30:15 +0000
Date: Thu, 13 Jun 2024 07:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-v6.10-rc3 34/73]
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: camera@10:
 'assigned-clocks' is a dependency of 'assigned-clock-rates'
Message-ID: <202406130739.alG68BhA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.10-rc3
head:   959d8c14d75729561f5ce6f4c79055e18dd652cb
commit: 2fe2031b6e80044f03c61e19cbb3863036e3f047 [34/73] arm64: dts: qcom: sc8280xp-x13s: enable camera
config: arm64-randconfig-051-20240612 (https://download.01.org/0day-ci/archive/20240613/202406130739.alG68BhA-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406130739.alG68BhA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130739.alG68BhA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4090.12-4094.7: Warning (graph_child_address): /soc@0/camss@ac5a000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: camera@10: 'assigned-clocks' is a dependency of 'assigned-clock-rates'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
