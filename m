Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2B8147C90
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 19:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718391859; cv=none; b=nqyo3+g1MCVmxue33V98xGbOvEsK4dzoUN+y5oKYbnmUn1v0sSkSFY1mKiOXXHn27GVK2b/FFil3cABnzeVsGpDY1HifYU7whNM6Z17Uq1A3c86HkVLgFItjbE5om0MfmHGg717tnq4Nd5jzFrCdTCwbDnfVSpZFJn+gCxQKerM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718391859; c=relaxed/simple;
	bh=grvb7aT8FRqdTmC7wNzYVq1+eSaO0o6xtc1I2qqZ954=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sTgDtd9rIxgXvvpxoh/VkLMJBDftOi4ixCZkmXfjZuxV7V3rhsX6RcUqWy7WwzKBU/Pk/1ugUWIHRbb+wh7ZNf7z2n+lfrBG82wkPvvpdkRkglOisZX3DSs/+0hecoDWtTS00+9xN3KQBAjypsFcfIEsnlqtS9uatq43tUY8BIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cA+s8sGd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cA+s8sGd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718391859; x=1749927859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=grvb7aT8FRqdTmC7wNzYVq1+eSaO0o6xtc1I2qqZ954=;
  b=cA+s8sGdbb8iaugxQEZ7WmvBHrygSTp2DIF6AVTnNXxp1AY2V6TA/mry
   3y2EN5Wc208/l1v2aJo2teniq75/lPB5Dw7c2q9FiFkDpXPb9EGk4FXXd
   4w0Sx9BOsicg2nUaM3f93rp8/ZU6AVNIj88jD176wdQPRIbWeNNzuTeTt
   uewsMo5FuCzNcg6nEHqQj5E6Ux4LWye2y7g9W1kIa7/wOjsxNJpeGOtZu
   RiW9Sj66qgPPetnJDCtTGOIhRjvSTtlUfd/vXkGuqM8VlJApWJ7p9gAe4
   lm7uegGf2HlvIFEu6BgAenbS9ypkHOl70igNIvYLv1tZMexC4I8GRIHg5
   Q==;
X-CSE-ConnectionGUID: SuQj+UBjQwij69t8FfoV/A==
X-CSE-MsgGUID: njNXoUHgTDesWNzXgtfCNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="12082120"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="12082120"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 12:04:18 -0700
X-CSE-ConnectionGUID: abob9a80SrOwSKspbhE1cw==
X-CSE-MsgGUID: xtxEt06nRMW2Hznx/AY0bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="40682777"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jun 2024 12:04:17 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sICDe-0001gd-2v;
	Fri, 14 Jun 2024 19:04:14 +0000
Date: Sat, 15 Jun 2024 03:03:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 87/91]
 arch/arm64/boot/dts/rockchip/overlays/odroidm1s/display_vu5s.dts:61.15-66.5:
 Warning (unit_address_vs_reg): /fragment@3/__overlay__: node has a reg or
 ranges property, but no unit name
Message-ID: <202406150336.gT7VC5da-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   a50c6922e2b4c1d7c895bde521d13096ba16a863
commit: b3726159d0e7eb27996b0dc0c4f5fccd182a6b25 [87/91] ODROID-M1S: dtb/dtbo: add device tree for ODROID-Vu5S
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240615/202406150336.gT7VC5da-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150336.gT7VC5da-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150336.gT7VC5da-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/overlays/odroidm1s/display_vu5s.dts:61.15-66.5: Warning (unit_address_vs_reg): /fragment@3/__overlay__: node has a reg or ranges property, but no unit name

vim +61 arch/arm64/boot/dts/rockchip/overlays/odroidm1s/display_vu5s.dts

    10	
    11	/{
    12		fragment@0 {
    13			target = <&backlight>;
    14	
    15			__overlay__ {
    16				status = "okay";
    17				brightness-levels = <
    18					1   2   3   4   5   6   7   8
    19					9   10  11  12  13  14  15  16
    20					17  18  19  20  21  22  23  24
    21					25  26  27  28  29  30  31  32
    22					33  34  35  36  37  38  39  40
    23					41  42  43  44  45  46  47  48
    24					49  50  51  52  53  54  55  56
    25					57  58  59  60  61  62  63  64
    26					65  66  67  68  69  70  71  72
    27					73  74  75  76  77  78  79  80
    28					81  82  83  84  85  86  87  88
    29					89  90  91  92  93  94  95  96
    30					97  98  99  100 101 102 103 104
    31					105 106 107 108 109 110 111 112
    32					113 114 115 116 117 118 119 120
    33					121 122 123 124 125 126 127 128
    34					>;
    35				default-brightness-level = <64>;
    36			};
    37		};
    38	
    39		fragment@1 {
    40			target = <&pwm4>;
    41	
    42			__overlay__ {
    43				status = "okay";
    44			};
    45		};
    46	
    47		fragment@2 {
    48			target = <&i2c2>;
    49	
    50			__overlay__ {
    51				status = "okay";
    52			};
    53		};
    54	
    55		fragment@3 {
    56			target = <&touchscreen>;
    57	
    58			#address-cells = <1>;
    59			#size-cells = <0>;
    60	
  > 61			__overlay__ {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
