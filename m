Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62C1288CC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 15:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754580818; cv=none; b=tCUk62t1R6AOEaPxA9J10i3Qi5TEpQ/zAT4eozB/4V3S+Re3I45O2B1Ee3iG55zsiEfVSdSL9lNI2W92EBTv9XXZgklZl8s1nNYwODolyhEdhXIWQYFGkfHvJfujeqv2g9bBjEqnkuyubkYcu9CcgNeU1zymbX5kx5vP7RRDjZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754580818; c=relaxed/simple;
	bh=FnUPB7qv30FA9oqfJQeIo6iP24gxoG1IpXSWOd8UpiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u0P5W2yzrnJ0dArqxQdc7rS6a+da+kK/dchxdKY9f+Vxhjfj55oz4gMgXywcwT5B5EdkxwqtvD98otc6dmUV/99O3OJ/U2JTtW5qyOjbgaDsSvarHZE4joIFaBsTErbcQvdmj7kEi21A4zPSrqVMbfMv3sE2iQmoBumu2THanVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oF/U8Kbr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oF/U8Kbr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754580817; x=1786116817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FnUPB7qv30FA9oqfJQeIo6iP24gxoG1IpXSWOd8UpiQ=;
  b=oF/U8KbrNAOEnpXdiLIpGttwKdJMiOfBIrE+8cRFPadwg5VZmfwLqBa6
   YxI5Cp5m9cZ4wfjwVCQd5gLbE3d+UHoP27UtjFV5GZXtSu5QfTYplu+Ez
   /VnNBHyz7bmwJhl+pZm0tWcooUEvanuHrTuM6fyu8czeXt8FNCSmTpsFo
   UIgv+TohuzuUJ3PQfy5U1pDa4anf/vdUBfQc2Z1uiFOuv80abS+VeHJt2
   ghunuMu40FqvA6ayKhlrjPv4bI6luRX0SD6Um9eINxjtZe4/qLBM5GJeU
   nAcv/5HF7AP5R11r1tYFAz1ROdfoozaafatKv5VRHkrHmJ0hHVHUj+Bp4
   Q==;
X-CSE-ConnectionGUID: +lpqQ0JBQT6JgAqtJ6t2ng==
X-CSE-MsgGUID: 4W2KTo8CQs+Z0MZTuRwQIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74374971"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="74374971"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 08:33:35 -0700
X-CSE-ConnectionGUID: o1CHXdWvQDSW10VkV6+4Rw==
X-CSE-MsgGUID: dkmXxvFfTbqS9ZMXUrL3SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165097478"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 07 Aug 2025 08:33:34 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk2cV-0002UF-2w;
	Thu, 07 Aug 2025 15:33:31 +0000
Date: Thu, 7 Aug 2025 17:32:42 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 186/801] htmldocs: Warning:
 Documentation/hwmon/vexpress.rst references a file that doesn't exist:
 Documentation/devicetree/bindings/hwmon/vexpress.txt
Message-ID: <202508071725.Rt2GN27p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 8aeff7f162304fd086eb251accbf61a6e5364d7a [186/801] dt-bindings: hwmon: Convert vexpress to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20250807/202508071725.Rt2GN27p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071725.Rt2GN27p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/keystone-gate.txt
   Warning: Documentation/devicetree/bindings/thermal/armada-thermal.txt references a file that doesn't exist: Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt
   Warning: Documentation/devicetree/bindings/thermal/armada-thermal.txt references a file that doesn't exist: Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> Warning: Documentation/hwmon/vexpress.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/vexpress.txt
   Warning: Documentation/trace/rv/da_monitor_instrumentation.rst references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
