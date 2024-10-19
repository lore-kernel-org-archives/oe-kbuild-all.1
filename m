Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0441D45E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 07:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729321228; cv=none; b=FWvJuQuBOpdvxNwSwimNQCpfOkEx4O+MRbMLo4torrKjZar+xHLHbbDd5Du3IQecZxPER+hYrLEO1B9ZERY5AJM+BtXWa+x8AuSI0VdVic0IEzDB84RTWgbZ4DPTgkoCyX9Ybhotdw9gCqhe0xu75b/aRaMvX+RuQMx2A228RYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729321228; c=relaxed/simple;
	bh=P68SJ/B1Z5o+pJY0zB9bAU3nnKMQVjOdFwuuKa5TdM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iMg+FzVSFV0q4ETcp2sA7rcCRfPZqYea5E8VmVxlvloo8jGQ1yByRq/UZR8udGeBDXQ64vBJXyLfsOKoCAxUw07cezF44WKuVWSUmewSo1zSnEUBIip6/TSlYwyG9gYw/W1kwe010InCSV6k28WiMwq1W7mfly/OG1ZFg8HCKcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilYNqLlu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilYNqLlu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729321227; x=1760857227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P68SJ/B1Z5o+pJY0zB9bAU3nnKMQVjOdFwuuKa5TdM4=;
  b=ilYNqLluoQIYmLOhAg93c7OXaFNkT1ZM2rrtaVpDmL/U9cxr4ECXzwYH
   Q9U0uOCWeXVf6Ts7ZF914Z67O/l20/AM/gWjnhFqFUg4ME5khLo+7nJ18
   /XWQxO1CwzHN9cQ46ql+IfUYUeKh+iyVvawgmeYq9ewrMZ39j1HDDI1NK
   gjuhFZLPE6Wz0gFijxwOsLOoQ2n8XiGq1T+HCpJ6/Jy1KY4ZqH/Z4qy9h
   TD4GDAVuVQ4ippiwFTNTSMsBYnnkgKUGeu+Fg3mKx/D0VVXBts5LEWvk2
   0nN00N86I1Gy7TW7SYW9YTeuHZiK5qOVReomUm+uOZFXiz/X78lZceHBe
   Q==;
X-CSE-ConnectionGUID: oT5UYqQlTIq/aAsqpGQhGg==
X-CSE-MsgGUID: 3fuVVSOzTtGu6cZouDd6Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28952294"
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="28952294"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 00:00:26 -0700
X-CSE-ConnectionGUID: r1BmsvCBTbywLhLu9kYmBQ==
X-CSE-MsgGUID: SsnPVXKQTrqDLeIguEjilw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="79206872"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Oct 2024 00:00:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t23Rm-000Oln-0T;
	Sat, 19 Oct 2024 07:00:22 +0000
Date: Sat, 19 Oct 2024 15:00:19 +0800
From: kernel test robot <lkp@intel.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>, Bryan Brattlof <bb@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 18/37]
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts:426.10-435.6: Warning
 (graph_child_address): /bus@f0000/i2c@20000000/tps6598x@3f/connector/ports:
 graph node has single child node 'port@0', #address-cells/#size-cells are
 not necessary
Message-ID: <202410191454.44Au4O9C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   ee0a094f731021562a251457045ff8a34fb9dac0
commit: 897042819a3855e3822fa9da90b45d526e5d10af [18/37] arm64: dts: ti: k3-am62p: add the USB sub-system
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241019/202410191454.44Au4O9C-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191454.44Au4O9C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191454.44Au4O9C-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dts:426.10-435.6: Warning (graph_child_address): /bus@f0000/i2c@20000000/tps6598x@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/ti/k3-am62p-main.dtsi:579.22-587.5: Warning (graph_child_address): /bus@f0000/dwc3-usb@f900000/usb@31000000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +426 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts

   409	
   410	&main_i2c0 {
   411		status = "okay";
   412		pinctrl-names = "default";
   413		pinctrl-0 = <&main_i2c0_pins_default>;
   414		clock-frequency = <400000>;
   415	
   416		typec_pd0: tps6598x@3f {
   417			compatible = "ti,tps6598x";
   418			reg = <0x3f>;
   419	
   420			connector {
   421				compatible = "usb-c-connector";
   422				label = "USB-C";
   423				self-powered;
   424				data-role = "dual";
   425				power-role = "sink";
 > 426				ports {
   427					#address-cells = <1>;
   428					#size-cells = <0>;
   429					port@0 {
   430						reg = <0>;
   431						usb_con_hs: endpoint {
   432							remote-endpoint = <&usb0_hs_ep>;
   433						};
   434					};
   435				};
   436			};
   437		};
   438	};
   439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
