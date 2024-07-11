Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A6977115
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720691182; cv=none; b=HETSdhFUtOJB13aMOaOMWwHtZd4DRysh0AxrOJsnF0HxpBfkw6u+TXraai/4u9SGEzvvb8OMUyPrnDRDQYKjOH/d+dWLJNZN9kWuH7Az10+rDA3oAomFjUHYJsJw5AnuW+V4iXbiGtTlsULfWrBYipbbL8pkx1zgi9/bebbYlIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720691182; c=relaxed/simple;
	bh=Jfu94AZv3VcYlfboCqyyR03rNCW6Uq91TSmuJSu5U4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oqLrPigNCGFPZKP+Nal1FPp4AhV77ByYzHrl8B2QkQNHQLIFfQA4s5K3kWVklFAd/l/NyLT6GukiIdR6zwPkfrkfV6CXb55YjyrK+drV+A3vzqZB4uMBRPg1RlXymtViRLBepnDm+diJc7qQKAqdf9R0pStT1xOj39o2kbRwQ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2vL64uQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2vL64uQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720691180; x=1752227180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jfu94AZv3VcYlfboCqyyR03rNCW6Uq91TSmuJSu5U4w=;
  b=R2vL64uQ9SMKTdUrKqs6h4KoRHj3GXh31Y7SqOjm6xaOS+hz+ZjRG7bo
   a7O+kVVMd02w0axuaM8EP42Dlyr5i3WOE1B0uWVYJi86c4HCJvVF8gZ6W
   6Nmj1aUUez31fVque0QBLiBizpDITDtR5WVMnxlqBICzmQgvqr+frnDN4
   /1fFZ/YAi+3yWrgz+dXlQCi1eYTbQ8L8/sbcu4q2b1/SGRbn1r3OXyUY3
   JqaM039pugYVuL9c7nQcXegzzkx+fy4G5PaIMlRldY2kXO7vQKpO7aDPM
   EAMoY4pUb7yryd4G9hE/s1JdnRw3QogcyhH8HmpGMgmgsbnDlQA4HNL1j
   w==;
X-CSE-ConnectionGUID: wkm3lerYSbSCF2DL9IDdyg==
X-CSE-MsgGUID: 3twK8rDcQwCJ+WFo6B4FGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="29453998"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="29453998"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 02:46:19 -0700
X-CSE-ConnectionGUID: +pHZfU9iRS21BQ5Hp0hdrA==
X-CSE-MsgGUID: 864vJvjCRJ+urMjUlado/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="79634472"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jul 2024 02:46:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRqNU-000Z6q-0T;
	Thu, 11 Jul 2024 09:46:16 +0000
Date: Thu, 11 Jul 2024 17:45:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11857/12643]
 arch/mips/boot/dts/ralink/mt7628a.dtsi:44.21-135.5: Warning
 (avoid_unnecessary_addr_size): /palmbus@10000000/pinmux@60: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202407111707.ieNUbbCe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
commit: 12d638f48c082831388358cc12a1c6ee58185ad8 [11857/12643] scripts/dtc: Update to upstream version v1.7.0-93-g1df7b047fe43
config: mips-vocore2_defconfig (https://download.01.org/0day-ci/archive/20240711/202407111707.ieNUbbCe-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111707.ieNUbbCe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111707.ieNUbbCe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/mips/boot/dts/ralink/mt7628a.dtsi:44.21-135.5: Warning (avoid_unnecessary_addr_size): /palmbus@10000000/pinmux@60: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +44 arch/mips/boot/dts/ralink/mt7628a.dtsi

9ea34af728f720 Stefan Roese 2019-05-27   2  
7d4ad2e71d175b Harvey Hunt  2017-08-21   3  / {
7d4ad2e71d175b Harvey Hunt  2017-08-21   4  	#address-cells = <1>;
7d4ad2e71d175b Harvey Hunt  2017-08-21   5  	#size-cells = <1>;
7d4ad2e71d175b Harvey Hunt  2017-08-21   6  	compatible = "ralink,mt7628a-soc";
7d4ad2e71d175b Harvey Hunt  2017-08-21   7  
7d4ad2e71d175b Harvey Hunt  2017-08-21   8  	cpus {
7d4ad2e71d175b Harvey Hunt  2017-08-21   9  		#address-cells = <1>;
7d4ad2e71d175b Harvey Hunt  2017-08-21  10  		#size-cells = <0>;
7d4ad2e71d175b Harvey Hunt  2017-08-21  11  
7d4ad2e71d175b Harvey Hunt  2017-08-21  12  		cpu@0 {
7d4ad2e71d175b Harvey Hunt  2017-08-21  13  			compatible = "mti,mips24KEc";
7d4ad2e71d175b Harvey Hunt  2017-08-21  14  			device_type = "cpu";
7d4ad2e71d175b Harvey Hunt  2017-08-21  15  			reg = <0>;
7d4ad2e71d175b Harvey Hunt  2017-08-21  16  		};
7d4ad2e71d175b Harvey Hunt  2017-08-21  17  	};
7d4ad2e71d175b Harvey Hunt  2017-08-21  18  
7d4ad2e71d175b Harvey Hunt  2017-08-21  19  	resetc: reset-controller {
7d4ad2e71d175b Harvey Hunt  2017-08-21  20  		compatible = "ralink,rt2880-reset";
7d4ad2e71d175b Harvey Hunt  2017-08-21  21  		#reset-cells = <1>;
7d4ad2e71d175b Harvey Hunt  2017-08-21  22  	};
7d4ad2e71d175b Harvey Hunt  2017-08-21  23  
7d4ad2e71d175b Harvey Hunt  2017-08-21  24  	cpuintc: interrupt-controller {
7d4ad2e71d175b Harvey Hunt  2017-08-21  25  		#address-cells = <0>;
7d4ad2e71d175b Harvey Hunt  2017-08-21  26  		#interrupt-cells = <1>;
7d4ad2e71d175b Harvey Hunt  2017-08-21  27  		interrupt-controller;
7d4ad2e71d175b Harvey Hunt  2017-08-21  28  		compatible = "mti,cpu-interrupt-controller";
7d4ad2e71d175b Harvey Hunt  2017-08-21  29  	};
7d4ad2e71d175b Harvey Hunt  2017-08-21  30  
7d4ad2e71d175b Harvey Hunt  2017-08-21  31  	palmbus@10000000 {
7d4ad2e71d175b Harvey Hunt  2017-08-21  32  		compatible = "palmbus";
7d4ad2e71d175b Harvey Hunt  2017-08-21  33  		reg = <0x10000000 0x200000>;
7d4ad2e71d175b Harvey Hunt  2017-08-21  34  		ranges = <0x0 0x10000000 0x1FFFFF>;
7d4ad2e71d175b Harvey Hunt  2017-08-21  35  
7d4ad2e71d175b Harvey Hunt  2017-08-21  36  		#address-cells = <1>;
7d4ad2e71d175b Harvey Hunt  2017-08-21  37  		#size-cells = <1>;
7d4ad2e71d175b Harvey Hunt  2017-08-21  38  
7d4ad2e71d175b Harvey Hunt  2017-08-21  39  		sysc: system-controller@0 {
7d4ad2e71d175b Harvey Hunt  2017-08-21  40  			compatible = "ralink,mt7620a-sysc", "syscon";
380f072c57a590 Stefan Roese 2019-05-27  41  			reg = <0x0 0x60>;
380f072c57a590 Stefan Roese 2019-05-27  42  		};
380f072c57a590 Stefan Roese 2019-05-27  43  
380f072c57a590 Stefan Roese 2019-05-27 @44  		pinmux: pinmux@60 {

:::::: The code at line 44 was first introduced by commit
:::::: 380f072c57a590d7593050b8533d88e18b6a7daa MIPS: ralink: mt7628a.dtsi: Add pinmux DT node

:::::: TO: Stefan Roese <sr@denx.de>
:::::: CC: Paul Burton <paul.burton@mips.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
