Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A0D1119A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 02:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728614931; cv=none; b=CXUqdzbHsAGz+YGtlxkKIxEtJCEyjO/CocA9SAoJ7Ap7ZxttF57e4PXaC+eBBW2+AoVQlIrkolARBNSwWvuuH8WxksJe2GFfhqwRYMNBcMLqT0u4qWq/PLkSxifLdic+NvKDgXI44m8cW8JAP2LjL4LX9H7/fseti76+wRiJdaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728614931; c=relaxed/simple;
	bh=TaQYjCZpb7UEfO8mRIT40BGGQK+zc08IjUyNgdwVEKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5XWK12E2B6uVBzmbS2/yKtunGlBXTUBhitzRpAhHFeYaCGm04Jq8LvBMxx1k5xx0yDxu5OhEooLHRoD2E8YGfaaZANzii1sgDsU+G4DN6KP1dBGBMsFbo34VW93mrKmi6af4ixG+FP0sZ9gI1ILn1yfrMPXILs9/dhWBHEfo2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HueHxCpl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HueHxCpl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728614930; x=1760150930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TaQYjCZpb7UEfO8mRIT40BGGQK+zc08IjUyNgdwVEKY=;
  b=HueHxCplQ3XA1agURDREsHlCoMPiCpvtWFABQ4NM9U2X9113A0eIBRDa
   SE7Jxahu7dz4c2YXlBlC8R7NkOGx9lom1acLLZVDcIl3ZZxqJkfbWfkk1
   7Wd9c8VQ905/+9qnFkrd0rKtARCxvAwao04KBZmWRLHWinKtXkk0KQLix
   vd2CfMY3COvlSXaiosa10/47QFaPg5zUEY/t3ajxD84vx2n/oWyTK8xJk
   ZXbI7tdj1YwQ5PFe1lxTarb3z2jYVWmarqaTWJDlb6giBkRjAXkQ28zJ8
   Agmrwui8zha+8gkVxuuhX2JBw9IwHUt3p8UEopEFK+YIf+tUgMN8rH80P
   Q==;
X-CSE-ConnectionGUID: dTJVkGHyTtiiXAokG4mplA==
X-CSE-MsgGUID: qIEHoS0mTuiPxxtaCkvclg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28116157"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="28116157"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 19:48:49 -0700
X-CSE-ConnectionGUID: pOeMVdeqT5SNG0T47RUcbA==
X-CSE-MsgGUID: FF1qwovXTc+9mI9tdqS5IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="107652248"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Oct 2024 19:48:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz5ht-000BeD-2S;
	Fri, 11 Oct 2024 02:48:45 +0000
Date: Fri, 11 Oct 2024 10:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 2/2] dt-bindings: clock: ti: Convert divider.txt
 to json-schema
Message-ID: <202410111053.aCNQ8jm4-lkp@intel.com>
References: <20241009205619.16250-3-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009205619.16250-3-andreas@kemnade.info>

Hi Andreas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.12-rc2 next-20241010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/dt-bindings-clock-ti-Convert-interface-txt-to-json-schema/20241010-045711
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20241009205619.16250-3-andreas%40kemnade.info
patch subject: [PATCH RFC v2 2/2] dt-bindings: clock: ti: Convert divider.txt to json-schema
reproduce: (https://download.01.org/0day-ci/archive/20241011/202410111053.aCNQ8jm4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111053.aCNQ8jm4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
>> Warning: Documentation/devicetree/bindings/clock/ti/composite.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/divider.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
