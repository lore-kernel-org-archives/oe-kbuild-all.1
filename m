Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE69C146D60
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 09:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718357871; cv=none; b=szoAqUz8BVTEeSqGcfTPDmVXz1AVf2VosMVoAbI1ZJZ+hi+kSHOax11eV0WB9YdJR1tB3gWbYGxSIv7DT2M37XS9K6EXf2e86tVKm+/V1ZcatOKBP+hcPkJFvesPZEaFjbn0Cn03hvOyDjNb4JZJ8MQkbt13sfEjfzRmqwpNH0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718357871; c=relaxed/simple;
	bh=epqbN5p84oyxTVRzwMGry++yfmfVkv4lMlWjsopMEd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jeBa4hsKlrePyr7Hi0g/0UpXilmDQjKD7SeB+pOt9vYV6eX55q7p9ihCTy68HNX0V5ihp6fBEZPfbYY20r8kOBqCXg/ENLsSyNNd3lgZP6p219cvAPJMWL1os5cFVKzjWyTIGhSp901j+TrNl1OJvBVzaAhQ3I9w5aPxw7VgnD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EOC3Sq9W; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EOC3Sq9W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718357870; x=1749893870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=epqbN5p84oyxTVRzwMGry++yfmfVkv4lMlWjsopMEd8=;
  b=EOC3Sq9W766xzRCeMrutfgP2YelDtjKAbmvWUHaCKE9EMxLQJUrb4jsD
   h1I0xcEMgc3ZzaTNLYRNSRu9zeXvRuY6VGQD6uOeh+AnfXZIvbFvaezq5
   lIiztd3fXQAewobBBR8F7YLWqwKKeZ8XL2sCeISDE5WNT9op0KTpefJmI
   O/Yrn/PMPImu4LToU4x+YoeRDEUVZRV0JRSaKn6ZK+FmaWGRzuCkyLCFM
   Tq4+wlm3Nq74CIsATDWKu1lySKm28LmYK7YAKKKMgQcJEx17ALycgiM2z
   2tNdmazgWBimQThoYbe3ikV0/uCwMqPnuiLWsvTmQT2GbJ4noTNVd9rjq
   g==;
X-CSE-ConnectionGUID: zfBsg/cdTeeyT0JZ8li1uA==
X-CSE-MsgGUID: diaOIZaqTU2+FV25ZT8I3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="12071991"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="12071991"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 02:37:49 -0700
X-CSE-ConnectionGUID: VmuQK+8HQeaGImkZdIpFfQ==
X-CSE-MsgGUID: q2aP1gBdRXaRa1gKjaO9Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="63650208"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jun 2024 02:37:48 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI3NS-000162-1D;
	Fri, 14 Jun 2024 09:37:46 +0000
Date: Fri, 14 Jun 2024 17:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 87/91]
 arch/arm64/boot/dts/rockchip/overlays/odroidm1s/display_vu5s.dts:61.15-66.5:
 Warning (unit_address_vs_reg): /fragment@3/__overlay__: node has a reg or
 ranges property, but no unit name
Message-ID: <202406141716.ZnsPgyNE-lkp@intel.com>
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
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240614/202406141716.ZnsPgyNE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141716.ZnsPgyNE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141716.ZnsPgyNE-lkp@intel.com/

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
