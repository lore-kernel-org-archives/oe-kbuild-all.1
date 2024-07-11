Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E3629CF0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 12:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720699536; cv=none; b=J/slH326NM7/EnXH/W5akDp7yb4MqvcsBBJz9i1g9/Tk25CwPIuGCDNCpDnc+qTK38uJU8tP7AeovfccDHnGv3hblH+zzb0c9VuhuaqznQPLXnQq+b4SKgdNZJqWKcrc8UEIzSY8k/axv6nRF8djTORy/9odtr0mrJOesyh4yxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720699536; c=relaxed/simple;
	bh=m/6IS6urQ7Zch5a2CwK1wTIs2Y5v/g1deEUVpaVzyrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VGYKeJSX4EgMJJrQrYGqbGhBFzkTt9E/e4aXftNI32+DXtxbG5cVSdvUovcM9Rlvi2ZURP6j/eSflxUhlZNuL3rUrleyhIrckauv4JTP62Zdax7bd9VLStV1j1nLNpJFPa8ewEAipdAypNUXJ3u7h+RC9MbrseVbZyheUvitdW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZF7ev2Y; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZF7ev2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720699534; x=1752235534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m/6IS6urQ7Zch5a2CwK1wTIs2Y5v/g1deEUVpaVzyrc=;
  b=NZF7ev2YDN6BtyETNc0M46NBFDkW9WbZO8AWywGzFPT0AsievosC02mb
   PwBYkIzva+jyNcWjixbTf9/MLERaKr6QreDIi3NQpVPAid8lLmjAzSODD
   tTzGVbyQPk5TIZiyRpBayDBil+RHIh3PiKl9v2bct8RLmHWA49Hmu/dtk
   MI5mVtIazE2nISoQwpFiMRqkcedtS67tkEI4wtU90e/MT6etZDdacTqBg
   IUPQUUp1MweT9Kay1Gb0VfPIcq2PNBLK+usP/iLo1nyhxeiAD/jMM3ssy
   NHJ7t8Uu3R04QuYedKAwGvYnjUe3LK/lZhi8UiWQrzCe31qXKdRoKcWYo
   Q==;
X-CSE-ConnectionGUID: 4cns3AECTBu6CUkLQSlLLQ==
X-CSE-MsgGUID: W+4w2KbfRHeGeVxAoSandw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18213454"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="18213454"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 05:04:24 -0700
X-CSE-ConnectionGUID: 8peGVAPaS6G3iTWXx6Cjmg==
X-CSE-MsgGUID: 9ePA6tgZS+ek8MmPua1ghQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="48610089"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jul 2024 05:04:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRsX6-000ZF0-2k;
	Thu, 11 Jul 2024 12:04:20 +0000
Date: Thu, 11 Jul 2024 20:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11857/12643]
 arch/powerpc/boot/dts/warp.dts:177.14-210.7: Warning
 (avoid_unnecessary_addr_size): /plb/opb/ebc/ndfc@1,0: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202407111942.5BkdHMZW-lkp@intel.com>
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
config: powerpc-warp_defconfig (https://download.01.org/0day-ci/archive/20240711/202407111942.5BkdHMZW-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111942.5BkdHMZW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111942.5BkdHMZW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/warp.dts:45.9-48.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/warp.dts:116.13-301.5: Warning (unit_address_vs_reg): /plb/opb: node has a reg or ranges property, but no unit name
>> arch/powerpc/boot/dts/warp.dts:177.14-210.7: Warning (avoid_unnecessary_addr_size): /plb/opb/ebc/ndfc@1,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +177 arch/powerpc/boot/dts/warp.dts

71f349799b34c8 David Gibson   2008-05-15   13  
99192af00af3ba Sean MacLennan 2008-01-13   14  / {
99192af00af3ba Sean MacLennan 2008-01-13   15  	#address-cells = <2>;
99192af00af3ba Sean MacLennan 2008-01-13   16  	#size-cells = <1>;
99192af00af3ba Sean MacLennan 2008-01-13   17  	model = "pika,warp";
99192af00af3ba Sean MacLennan 2008-01-13   18  	compatible = "pika,warp";
71f349799b34c8 David Gibson   2008-05-15   19  	dcr-parent = <&{/cpus/cpu@0}>;
99192af00af3ba Sean MacLennan 2008-01-13   20  
99192af00af3ba Sean MacLennan 2008-01-13   21  	aliases {
99192af00af3ba Sean MacLennan 2008-01-13   22  		ethernet0 = &EMAC0;
99192af00af3ba Sean MacLennan 2008-01-13   23  		serial0 = &UART0;
99192af00af3ba Sean MacLennan 2008-01-13   24  	};
99192af00af3ba Sean MacLennan 2008-01-13   25  
99192af00af3ba Sean MacLennan 2008-01-13   26  	cpus {
99192af00af3ba Sean MacLennan 2008-01-13   27  		#address-cells = <1>;
99192af00af3ba Sean MacLennan 2008-01-13   28  		#size-cells = <0>;
99192af00af3ba Sean MacLennan 2008-01-13   29  
99192af00af3ba Sean MacLennan 2008-01-13   30  		cpu@0 {
99192af00af3ba Sean MacLennan 2008-01-13   31  			device_type = "cpu";
99192af00af3ba Sean MacLennan 2008-01-13   32  			model = "PowerPC,440EP";
71f349799b34c8 David Gibson   2008-05-15   33  			reg = <0x00000000>;
99192af00af3ba Sean MacLennan 2008-01-13   34  			clock-frequency = <0>; /* Filled in by zImage */
99192af00af3ba Sean MacLennan 2008-01-13   35  			timebase-frequency = <0>; /* Filled in by zImage */
71f349799b34c8 David Gibson   2008-05-15   36  			i-cache-line-size = <32>;
71f349799b34c8 David Gibson   2008-05-15   37  			d-cache-line-size = <32>;
71f349799b34c8 David Gibson   2008-05-15   38  			i-cache-size = <32768>;
71f349799b34c8 David Gibson   2008-05-15   39  			d-cache-size = <32768>;
99192af00af3ba Sean MacLennan 2008-01-13   40  			dcr-controller;
99192af00af3ba Sean MacLennan 2008-01-13   41  			dcr-access-method = "native";
99192af00af3ba Sean MacLennan 2008-01-13   42  		};
99192af00af3ba Sean MacLennan 2008-01-13   43  	};
99192af00af3ba Sean MacLennan 2008-01-13   44  
99192af00af3ba Sean MacLennan 2008-01-13   45  	memory {
99192af00af3ba Sean MacLennan 2008-01-13   46  		device_type = "memory";
71f349799b34c8 David Gibson   2008-05-15   47  		reg = <0x00000000 0x00000000 0x00000000>; /* Filled in by zImage */
99192af00af3ba Sean MacLennan 2008-01-13   48  	};
99192af00af3ba Sean MacLennan 2008-01-13   49  
99192af00af3ba Sean MacLennan 2008-01-13   50  	UIC0: interrupt-controller0 {
99192af00af3ba Sean MacLennan 2008-01-13   51  		compatible = "ibm,uic-440ep","ibm,uic";
99192af00af3ba Sean MacLennan 2008-01-13   52  		interrupt-controller;
99192af00af3ba Sean MacLennan 2008-01-13   53  		cell-index = <0>;
71f349799b34c8 David Gibson   2008-05-15   54  		dcr-reg = <0x0c0 0x009>;
99192af00af3ba Sean MacLennan 2008-01-13   55  		#address-cells = <0>;
99192af00af3ba Sean MacLennan 2008-01-13   56  		#size-cells = <0>;
99192af00af3ba Sean MacLennan 2008-01-13   57  		#interrupt-cells = <2>;
99192af00af3ba Sean MacLennan 2008-01-13   58  	};
99192af00af3ba Sean MacLennan 2008-01-13   59  
99192af00af3ba Sean MacLennan 2008-01-13   60  	UIC1: interrupt-controller1 {
99192af00af3ba Sean MacLennan 2008-01-13   61  		compatible = "ibm,uic-440ep","ibm,uic";
99192af00af3ba Sean MacLennan 2008-01-13   62  		interrupt-controller;
99192af00af3ba Sean MacLennan 2008-01-13   63  		cell-index = <1>;
71f349799b34c8 David Gibson   2008-05-15   64  		dcr-reg = <0x0d0 0x009>;
99192af00af3ba Sean MacLennan 2008-01-13   65  		#address-cells = <0>;
99192af00af3ba Sean MacLennan 2008-01-13   66  		#size-cells = <0>;
99192af00af3ba Sean MacLennan 2008-01-13   67  		#interrupt-cells = <2>;
71f349799b34c8 David Gibson   2008-05-15   68  		interrupts = <0x1e 0x4 0x1f 0x4>; /* cascade */
99192af00af3ba Sean MacLennan 2008-01-13   69  		interrupt-parent = <&UIC0>;
99192af00af3ba Sean MacLennan 2008-01-13   70  	};
99192af00af3ba Sean MacLennan 2008-01-13   71  
99192af00af3ba Sean MacLennan 2008-01-13   72  	SDR0: sdr {
99192af00af3ba Sean MacLennan 2008-01-13   73  		compatible = "ibm,sdr-440ep";
71f349799b34c8 David Gibson   2008-05-15   74  		dcr-reg = <0x00e 0x002>;
99192af00af3ba Sean MacLennan 2008-01-13   75  	};
99192af00af3ba Sean MacLennan 2008-01-13   76  
99192af00af3ba Sean MacLennan 2008-01-13   77  	CPR0: cpr {
99192af00af3ba Sean MacLennan 2008-01-13   78  		compatible = "ibm,cpr-440ep";
71f349799b34c8 David Gibson   2008-05-15   79  		dcr-reg = <0x00c 0x002>;
99192af00af3ba Sean MacLennan 2008-01-13   80  	};
99192af00af3ba Sean MacLennan 2008-01-13   81  
99192af00af3ba Sean MacLennan 2008-01-13   82  	plb {
99192af00af3ba Sean MacLennan 2008-01-13   83  		compatible = "ibm,plb-440ep", "ibm,plb-440gp", "ibm,plb4";
99192af00af3ba Sean MacLennan 2008-01-13   84  		#address-cells = <2>;
99192af00af3ba Sean MacLennan 2008-01-13   85  		#size-cells = <1>;
99192af00af3ba Sean MacLennan 2008-01-13   86  		ranges;
99192af00af3ba Sean MacLennan 2008-01-13   87  		clock-frequency = <0>; /* Filled in by zImage */
99192af00af3ba Sean MacLennan 2008-01-13   88  
99192af00af3ba Sean MacLennan 2008-01-13   89  		SDRAM0: sdram {
99192af00af3ba Sean MacLennan 2008-01-13   90  			compatible = "ibm,sdram-440ep", "ibm,sdram-405gp";
71f349799b34c8 David Gibson   2008-05-15   91  			dcr-reg = <0x010 0x002>;
99192af00af3ba Sean MacLennan 2008-01-13   92  		};
99192af00af3ba Sean MacLennan 2008-01-13   93  
99192af00af3ba Sean MacLennan 2008-01-13   94  		DMA0: dma {
99192af00af3ba Sean MacLennan 2008-01-13   95  			compatible = "ibm,dma-440ep", "ibm,dma-440gp";
71f349799b34c8 David Gibson   2008-05-15   96  			dcr-reg = <0x100 0x027>;
99192af00af3ba Sean MacLennan 2008-01-13   97  		};
99192af00af3ba Sean MacLennan 2008-01-13   98  
99192af00af3ba Sean MacLennan 2008-01-13   99  		MAL0: mcmal {
99192af00af3ba Sean MacLennan 2008-01-13  100  			compatible = "ibm,mcmal-440ep", "ibm,mcmal-440gp", "ibm,mcmal";
71f349799b34c8 David Gibson   2008-05-15  101  			dcr-reg = <0x180 0x062>;
99192af00af3ba Sean MacLennan 2008-01-13  102  			num-tx-chans = <4>;
99192af00af3ba Sean MacLennan 2008-01-13  103  			num-rx-chans = <2>;
99192af00af3ba Sean MacLennan 2008-01-13  104  			interrupt-parent = <&MAL0>;
71f349799b34c8 David Gibson   2008-05-15  105  			interrupts = <0x0 0x1 0x2 0x3 0x4>;
99192af00af3ba Sean MacLennan 2008-01-13  106  			#interrupt-cells = <1>;
99192af00af3ba Sean MacLennan 2008-01-13  107  			#address-cells = <0>;
99192af00af3ba Sean MacLennan 2008-01-13  108  			#size-cells = <0>;
71f349799b34c8 David Gibson   2008-05-15  109  			interrupt-map = </*TXEOB*/ 0x0 &UIC0 0xa 0x4
71f349799b34c8 David Gibson   2008-05-15  110  					/*RXEOB*/ 0x1 &UIC0 0xb 0x4
71f349799b34c8 David Gibson   2008-05-15  111  					/*SERR*/  0x2 &UIC1 0x0 0x4
71f349799b34c8 David Gibson   2008-05-15  112  					/*TXDE*/  0x3 &UIC1 0x1 0x4
71f349799b34c8 David Gibson   2008-05-15  113  					/*RXDE*/  0x4 &UIC1 0x2 0x4>;
99192af00af3ba Sean MacLennan 2008-01-13  114  		};
99192af00af3ba Sean MacLennan 2008-01-13  115  
99192af00af3ba Sean MacLennan 2008-01-13  116  		POB0: opb {
99192af00af3ba Sean MacLennan 2008-01-13  117  		  	compatible = "ibm,opb-440ep", "ibm,opb-440gp", "ibm,opb";
99192af00af3ba Sean MacLennan 2008-01-13  118  			#address-cells = <1>;
99192af00af3ba Sean MacLennan 2008-01-13  119  			#size-cells = <1>;
71f349799b34c8 David Gibson   2008-05-15  120  		  	ranges = <0x00000000 0x00000000 0x00000000 0x80000000
71f349799b34c8 David Gibson   2008-05-15  121  			          0x80000000 0x00000000 0x80000000 0x80000000>;
99192af00af3ba Sean MacLennan 2008-01-13  122  		  	interrupt-parent = <&UIC1>;
71f349799b34c8 David Gibson   2008-05-15  123  		  	interrupts = <0x7 0x4>;
99192af00af3ba Sean MacLennan 2008-01-13  124  		  	clock-frequency = <0>; /* Filled in by zImage */
99192af00af3ba Sean MacLennan 2008-01-13  125  
99192af00af3ba Sean MacLennan 2008-01-13  126  			EBC0: ebc {
99192af00af3ba Sean MacLennan 2008-01-13  127  				compatible = "ibm,ebc-440ep", "ibm,ebc-440gp", "ibm,ebc";
71f349799b34c8 David Gibson   2008-05-15  128  				dcr-reg = <0x012 0x002>;
99192af00af3ba Sean MacLennan 2008-01-13  129  				#address-cells = <2>;
99192af00af3ba Sean MacLennan 2008-01-13  130  				#size-cells = <1>;
99192af00af3ba Sean MacLennan 2008-01-13  131  				clock-frequency = <0>; /* Filled in by zImage */
71f349799b34c8 David Gibson   2008-05-15  132  				interrupts = <0x5 0x1>;
99192af00af3ba Sean MacLennan 2008-01-13  133  				interrupt-parent = <&UIC1>;
99192af00af3ba Sean MacLennan 2008-01-13  134  
99192af00af3ba Sean MacLennan 2008-01-13  135  				fpga@2,0 {
99192af00af3ba Sean MacLennan 2008-01-13  136  					compatible = "pika,fpga";
0393cb615f369b Sean MacLennan 2008-04-29  137  			   		reg = <0x00000002 0x00000000 0x00001000>;
71f349799b34c8 David Gibson   2008-05-15  138  					interrupts = <0x18 0x8>;
99192af00af3ba Sean MacLennan 2008-01-13  139  					interrupt-parent = <&UIC0>;
99192af00af3ba Sean MacLennan 2008-01-13  140  				};
99192af00af3ba Sean MacLennan 2008-01-13  141  
1d555cf168315c Sean MacLennan 2008-07-26  142  				fpga@2,2000 {
1d555cf168315c Sean MacLennan 2008-07-26  143  					compatible = "pika,fpga-sgl";
1d555cf168315c Sean MacLennan 2008-07-26  144  			   		reg = <0x00000002 0x00002000 0x00000200>;
1d555cf168315c Sean MacLennan 2008-07-26  145  				};
1d555cf168315c Sean MacLennan 2008-07-26  146  
0393cb615f369b Sean MacLennan 2008-04-29  147  				fpga@2,4000 {
0393cb615f369b Sean MacLennan 2008-04-29  148  					compatible = "pika,fpga-sd";
a18cb387e5c29b Sean MacLennan 2009-12-08  149  					reg = <0x00000002 0x00004000 0x00004000>;
0393cb615f369b Sean MacLennan 2008-04-29  150  				};
0393cb615f369b Sean MacLennan 2008-04-29  151  
e275e023aa69bd Sean MacLennan 2009-01-09  152  				nor@0,0 {
0393cb615f369b Sean MacLennan 2008-04-29  153  					compatible = "amd,s29gl032a", "cfi-flash";
99192af00af3ba Sean MacLennan 2008-01-13  154  					bank-width = <2>;
0393cb615f369b Sean MacLennan 2008-04-29  155  					reg = <0x00000000 0x00000000 0x00400000>;
99192af00af3ba Sean MacLennan 2008-01-13  156  					#address-cells = <1>;
99192af00af3ba Sean MacLennan 2008-01-13  157  					#size-cells = <1>;
e275e023aa69bd Sean MacLennan 2009-01-09  158  
e275e023aa69bd Sean MacLennan 2009-01-09  159  					partition@0 {
e275e023aa69bd Sean MacLennan 2009-01-09  160  						label = "splash";
805e324b7fbddf Sean MacLennan 2009-04-06  161  						reg = <0x00000000 0x00010000>;
e275e023aa69bd Sean MacLennan 2009-01-09  162  					};
0393cb615f369b Sean MacLennan 2008-04-29  163  					partition@300000 {
99192af00af3ba Sean MacLennan 2008-01-13  164  						label = "fpga";
929badad6296c9 Sean MacLennan 2008-07-31  165  						reg = <0x0300000 0x00040000>;
99192af00af3ba Sean MacLennan 2008-01-13  166  					};
0393cb615f369b Sean MacLennan 2008-04-29  167  					partition@340000 {
99192af00af3ba Sean MacLennan 2008-01-13  168  						label = "env";
0393cb615f369b Sean MacLennan 2008-04-29  169  						reg = <0x0340000 0x00040000>;
99192af00af3ba Sean MacLennan 2008-01-13  170  					};
0393cb615f369b Sean MacLennan 2008-04-29  171  					partition@380000 {
99192af00af3ba Sean MacLennan 2008-01-13  172  						label = "u-boot";
0393cb615f369b Sean MacLennan 2008-04-29  173  						reg = <0x0380000 0x00080000>;
99192af00af3ba Sean MacLennan 2008-01-13  174  					};
99192af00af3ba Sean MacLennan 2008-01-13  175  				};
e275e023aa69bd Sean MacLennan 2009-01-09  176  
e275e023aa69bd Sean MacLennan 2009-01-09 @177  				ndfc@1,0 {

:::::: The code at line 177 was first introduced by commit
:::::: e275e023aa69bdc6a2f43b86ca3aa93a22e47837 powerpc/44x: Warp patches for the new NDFC driver

:::::: TO: Sean MacLennan <smaclennan@pikatech.com>
:::::: CC: Josh Boyer <jwboyer@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
