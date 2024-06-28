Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912FDDDBD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 01:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719536864; cv=none; b=DDe1AnMAiAmwpbCo0CFlVhQRr3XZmw33SSGqfXouEiD60BAqEl4Yi1hH7bsZ4wg9LBLKO2uG+bmIgba8hltXKMfvMgVzxNyeRQTBXvNrxlp3zvcNwe2I9TrS2zldm+RLXU7X+aw3levmUSvkwJlMY7Vls8k6xfXrnoelAFWiXvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719536864; c=relaxed/simple;
	bh=WNaFXYjfFm2ZmfRVIPp0Ko1d8TjHQPVGhq6qdwc5pjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dCM1TvqSnToc0sng9bVCZxojo3FyulFUaMTIvn/txjVxrsIr9Au2gEI4D8hFIJhd2UZ7c4PaRDMfmXCFi0G1Eb3l0/rpoh0Ah0n3A6C0aeH8LuD+oqY7tucLt4SbLjHUgPbND0VLsCwyDjHbarAZNcHxYyOVP73zXDUhZMQnVsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfolPWY0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfolPWY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719536862; x=1751072862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WNaFXYjfFm2ZmfRVIPp0Ko1d8TjHQPVGhq6qdwc5pjQ=;
  b=FfolPWY0tSP0vMXiT644d9MZ5dt1lavoyqzATkkY76k/2IOAnAtOlLlw
   5hg4QdRqfXeK8qjEujHod8CwjMiNzlqNjBwagcJo8Y0I8pJGYySLXYbqP
   1yRDCCBLIV25DluZPMgGB08nybbeFOzReJJ/NA/P1UAtRgcBpDkygE7d3
   WCvfyGTev6uaGCKgYdtqgOLGLkUx1OQ8R4y/Puft5AUdleoYsibWkyDn8
   pKHqOgGrJ4EUDxrt/Jylgc7Hvs9WIUglLo2kpQZQi/1gQmL9KttS8+fAv
   W6Qkyx8RFrLTj7G6bB0NrLSN3va5iJYLM6CIXRLd8ayP7I0SQFocwcvMi
   A==;
X-CSE-ConnectionGUID: 8GKDUminSTStI3pBBXDmQQ==
X-CSE-MsgGUID: q7pfLGPjRuK2rSzKL8akrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="42122691"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="42122691"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 18:07:40 -0700
X-CSE-ConnectionGUID: PLal0/QER1Gli09g65Jvkg==
X-CSE-MsgGUID: kZYQqlsrQHGaeVmJcQ7aeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="44665145"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jun 2024 18:07:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN05Q-000GgX-2w;
	Fri, 28 Jun 2024 01:07:36 +0000
Date: Fri, 28 Jun 2024 09:06:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 8957/9027]
 arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: pinctrl@f4000:
 'gpmc0-pins-default' does not match any of the regexes:
 '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
Message-ID: <202406280912.CCQfYTkq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   642a16ca7994a50d7de85715996a8ce171a5bdfb
commit: 8d2bf5a527a48ac9f6855467768c91eeece46b62 [8957/9027] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
config: arm64-randconfig-051-20240628 (https://download.01.org/0day-ci/archive/20240628/202406280912.CCQfYTkq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev2+g3b69bad
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280912.CCQfYTkq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280912.CCQfYTkq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: pinctrl@f4000: 'gpmc0-pins-default' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: gpio@600000: 'gpio0-36' does not match any of the regexes: '^(.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-davinci.yaml#
>> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: gpio0-36: $nodename:0: 'gpio0-36' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: adc: 'ti,adc-channels' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/adc/ti,am3359-adc.yaml#
>> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: nand@0,0: Unevaluated properties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/ti,gpmc-nand.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
