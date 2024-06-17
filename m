Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3570B374D9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718615238; cv=none; b=jZbQOL+S1ALruPkwSQkJAdtSHadkGWn4r2T2K16PYAFN31OSdGWN1GxR32RlhVyb7YDFA0MLOhwGi/zmdqOIPhB58Ws9o3KGeawyx+kFQlddheJKhy/LJQ3AY5KXI7aYf7j823uXnifu8b2s0TRTimcd5AItL6Nos+gIQg0U0hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718615238; c=relaxed/simple;
	bh=uAQbbcIqNpXnkSCnO6//UjEy+YKXYTzeRlkoVBc1lrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ldELO8zsgR1GN+CJiSywkiDL8cfQ5TApKlhlItXu/R9eF/LCCwxgqYKXlYwBQzL0rMUkHrkxQQke7f/kLufa0vEzSFW396D0jdtmsexhJOvUEsOqEhm2wiA0cRT7MnCYJRgPVhOtVuYfUcqGQHYhxkADySIJMorbop5w7bUM9ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rj/n7+XC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rj/n7+XC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718615236; x=1750151236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uAQbbcIqNpXnkSCnO6//UjEy+YKXYTzeRlkoVBc1lrI=;
  b=Rj/n7+XCTWUaPiwUsK0+l8QERVB3EXnZy/+X9l+sbSbt+X8/c9dRiiS0
   fnFCvFtNAq9oQXnSPOr69pLHfHyMJbPgRt05zBcRSI3OZ5MVSuSMI6Ngp
   QWs+TgYwO8w9zS679giDWJqqe6jmtMMJaQ9n4aLADON2ELCwvYcJfWyQD
   LIpZM2rOWZIDyD+6q9iGX82pl1/n2J+vGgUIEVcQd7SIwoxsGpRSIbDOq
   a0GU62x0jDPIGQfc6BlYqCV8g0D0Y3eZVEbcR2AonpcdRRbP0I5OTXiw9
   cNIhcN0cG/SK4P6W1WtaRFa6vvACJHNsXFWyYpSZb20l8xEw5xCiTEZsv
   Q==;
X-CSE-ConnectionGUID: GAsnc64GSzOsuPPIYjYOcg==
X-CSE-MsgGUID: CPsS1EbIQSiPfZ5BOh7K/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="19218173"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="19218173"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 02:07:15 -0700
X-CSE-ConnectionGUID: i1m0ZUiVRaefJ0sQsDtNuw==
X-CSE-MsgGUID: 3qT0YW8HTfS51l6xuT8uJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="71905559"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Jun 2024 02:07:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ8KW-00045C-15;
	Mon, 17 Jun 2024 09:07:12 +0000
Date: Mon, 17 Jun 2024 17:06:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-ak4619-for-upstream-2024-06-17-2 9/11]
 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: ak4619@10:
 Unevaluated properties are not allowed ('clock-names', 'clocks' were
 unexpected)
Message-ID: <202406171614.rGKOLcGD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-ak4619-for-upstream-2024-06-17-2
head:   004e7f70e20761ef45826aaf35289dcd0be4e73d
commit: d90489e8af6381bf640917e9fc7f85a389877c08 [9/11] arm64: dts: renesas: gray-hawk-single: Add Sound support
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240617/202406171614.rGKOLcGD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171614.rGKOLcGD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171614.rGKOLcGD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: ak4619@10: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ak4619.yaml#
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: mux: 'mux-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/simple-audio-mux.yaml#
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: mux: 'mux-gpio' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-audio-mux.yaml#
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: sound: 'aux-devs' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/audio-graph-card2.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
