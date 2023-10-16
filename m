Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F771FA9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 03:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUY2aidK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697427533; x=1728963533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sKG83oFhA/JbnMCTWIydC0NmVQthEgRQlRdHRlAo5lM=;
  b=SUY2aidKFb7LIdi24DG1k4F82qvHSp34RjSAnpezjM3GWqHIR9JIfCT8
   nmjLR04TuNdjLkPuerLWkMA2FJLWkzIdGpLw4rgFHe68Ivg+uxB5s0OY6
   +ap36TrhPDhxmGgtrOLd8KFeAxMVlFfF9Rp+PN0njisqUsujn0yRPH0qq
   BcCFsWOUNqvJzkqVJcWks6hedDl7Q619ufjxrMnCfk8cTUShC1TfRxIeu
   JTNu4ID63JiJvnjIUXY877DYwFRgFxXTzLb/i/1CdrDqmbuv24va+u8k0
   Ac4rRPR2GRyv1haZeGaMdxBiJb9sIkB5lJjRV5iyDSD+HPND3VMiFH5pG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="7007540"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="7007540"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 20:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="929213918"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="929213918"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Oct 2023 20:38:50 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsERM-00082v-1W;
	Mon, 16 Oct 2023 03:38:48 +0000
Date: Mon, 16 Oct 2023 11:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:can-clk-changes 2/7] dtbs_check:
 Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml:
 properties:clocks: {'maxItems': 2, 'items': [{'description': 'AHB peripheral
 clock'}, {'description': 'CAN bus clock'}]} should not be valid under
 {'required': ['maxItems']}
Message-ID: <202310161120.7M5YMCzP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git can-clk-changes
head:   46c6b04fed8775eefb9f33d13ac89604bbab8eee
commit: d12dbc9a4fc653d3870e4f0d614b196cd8680830 [2/7] dt-bindings: can: fix number of clocks for mpfs
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310161120.7M5YMCzP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161120.7M5YMCzP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/input/qcom,pm8921-keypad.yaml
>> Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml: properties:clocks: {'maxItems': 2, 'items': [{'description': 'AHB peripheral clock'}, {'description': 'CAN bus clock'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
