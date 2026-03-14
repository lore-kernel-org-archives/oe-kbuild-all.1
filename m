Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E1340DFA1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Mar 2026 22:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773526228; cv=none; b=iQ3DlWRdBfMrDcDzzpXrVIoEOneGwt9vBj3j8aooZOQ9ddkebrufktuluSrnU2pgbuY+w3O2sAHWXLFBeAWIQl2QLCyNrV02EMM3v+IX0vh1H9f8PAcA6k7leA+i/lOtkPQOcIyOvieFn1v3gcqZfN4z15Gw+1rQENjaKuhUtvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773526228; c=relaxed/simple;
	bh=ljv+EXuBEEWbXLe8dZO93iErHCN0AyqUa381jkHq0co=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rjXOZN1mmfiRvqJv87qjHOAhx1dd+7CpqhxWX7/sHt/fGR9JKy6bw7tTKnSteXEVISkiHX+QhnaromQvuQIRpyvUIcMekBwVt2tKAFlpeUMNnzx7muV9G8oamTAnT57jycvzB+XS1ayJLVgc9xJLcbJEKWcBNY7Y65xAMv2mJbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heL2DPK7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heL2DPK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773526227; x=1805062227;
  h=date:from:to:cc:subject:message-id;
  bh=ljv+EXuBEEWbXLe8dZO93iErHCN0AyqUa381jkHq0co=;
  b=heL2DPK7dYBGCqNfFGSOt8jvIPVFFr8hiq8qAFwPHj3Cog8pVwU0aWv7
   xm2sc39y+8EEvh6qd2HJoRb0reaORpHJp4QVjFNRg9w8NRMFoZUVSGJgH
   l65nQXNsdDNCu1GJT3riieTc3a118GNERRiqEMcdytyPm39Rg7o7K38nz
   Tf8txa7l0pKJc6jQ/m+Uv7KygY2ZRyemNOUxO87sfha3JfDXJBFg3kA6e
   81IuelK2RlnqwTI0pV5fZoGr/5a4M1bhtcel+4hWlnL+PYbWkhR/2EM0/
   BLNW0vvhauoRfL4zGdwuI5/1JmqKeA7x7Zpd7KJr7QQXHCvEzAcYi4KYI
   Q==;
X-CSE-ConnectionGUID: bi0REXCXRyGo95qb6QbjKA==
X-CSE-MsgGUID: yiggH2GkSGmUbFQfhNM59g==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="100052596"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="100052596"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 15:10:26 -0700
X-CSE-ConnectionGUID: v6gfr2UySZ2B3R0o9DZvYw==
X-CSE-MsgGUID: 5zi7kG0jTrq++BVioKIm+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="219184840"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 14 Mar 2026 15:10:25 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1XBe-000000003rN-3cGF;
	Sat, 14 Mar 2026 22:10:22 +0000
Date: Sat, 14 Mar 2026 23:09:23 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 108/621] htmldocs: Warning:
 Documentation/devicetree/bindings/display/ti/ti,dra7-dss.yaml references a
 file that doesn't exist:
 Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
Message-ID: <202603142248.njXO20Ql-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: 7aeacb62dd3e8032032a52bdf75fb9fbcf198ef4 [108/621] dt-bindings: display: Convert ti/ti,omap-dss to DT schema
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260314/202603142248.njXO20Ql-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603142248.njXO20Ql-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,quadfs.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,flexgen.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-pll.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen.txt
   Warning: Documentation/devicetree/bindings/clock/ti/ti,dra7-apll-clock.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/dpll.txt
>> Warning: Documentation/devicetree/bindings/display/ti/ti,dra7-dss.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
>> Warning: Documentation/devicetree/bindings/display/ti/ti,omap2-dss.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
>> Warning: Documentation/devicetree/bindings/display/ti/ti,omap3-dss.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
>> Warning: Documentation/devicetree/bindings/display/ti/ti,omap4-dss.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
>> Warning: Documentation/devicetree/bindings/display/ti/ti,omap5-dss.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
   Warning: Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/reset/ti-syscon-reset.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
