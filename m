Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690C28C06
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 00:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718066033; cv=none; b=IDUdObi5MGT5hhiepyQTvqHcHRNPEIvB2z0JclzujdN76NyL1/Z7eQakDUdoJ04oWu9mFqdLCjOnkzm9fiLrRsatFLhWB/1ilKqt+Gv1cB82ozXaDnQ5TQ/Q0XJBs2OwOc9/fB8muWEtiG8dFpMymlsXBlOjGnJ1mYumT2KXP38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718066033; c=relaxed/simple;
	bh=kvVxE8NUv6huejt4uZkDK8QT/0wyDEhruzWK/3r9HkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o7ImhgWivEPyRBC2O2v5MXRHe2BKapL3dqmx9I6bgBQU1c7q0hHxdsftpB4roLxxPVUfwisCdjV8ZnRFP2DbyfJJzkeB8FdME3xrBI+S7FcMcnKwjrmpWX0jkvrIR2/Q5O1/3FInKXEhOQq543KTi6o8UaQ5mB76oY4AGQYtDNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8nTdbRE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8nTdbRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718066031; x=1749602031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kvVxE8NUv6huejt4uZkDK8QT/0wyDEhruzWK/3r9HkI=;
  b=Q8nTdbRELd0mcXf0i1CvfzjjH4Wjz5vxi+sVaW7Ugfv6whu1PRiBGL1q
   gGGR83bzYHME4RA+khQDUrFe9LfJ+0383z3ASHoPOBGTix+J/iaJZd9y3
   IYOwNn320u9q+5EuUlwB0pNq8lkoirybFQVhp+IKImrih9ABWjPAzWab3
   EKARkKoELYbSzFV7YnGpiVsOF9QG6Z9xAEiBMlR0JM2MAhpDUyFfWDY2o
   rudNbw4fWCG4t5z1KdsccnjngWlaORVmkM9L+Uy77pZeicc3w+PkkOYdw
   cAMzUEeR+tIX66FxRiib73tXMC2abnkOH46ZP+HERO0BNU8p7f5flf1Vn
   g==;
X-CSE-ConnectionGUID: oGMaENfeQa652BSVrdzfNg==
X-CSE-MsgGUID: H9lyXsXiSPaTq0tMdTttjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="12008473"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="12008473"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 17:33:51 -0700
X-CSE-ConnectionGUID: ifYscZGWT06QX/n1QMfK5w==
X-CSE-MsgGUID: dkqSEhaAQYym4DfroCWYvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="70025498"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Jun 2024 17:33:49 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGpSN-0002dF-0d;
	Tue, 11 Jun 2024 00:33:47 +0000
Date: Tue, 11 Jun 2024 08:33:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>
Subject: [tglx-devel:devmsi-arm 10/25] drivers/irqchip/irq-mbigen.c:292:24:
 warning: unused variable 'parent'
Message-ID: <202406110832.9aohzWTW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git devmsi-arm
head:   c0f9480169244284eb4f7bc656ab52d03a5badd4
commit: 48fd467fc3eb4d5506e8c886269d9bb8ea276173 [10/25] irqchip/mbigen: Prepare for real per device MSI
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240611/202406110832.9aohzWTW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406110832.9aohzWTW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406110832.9aohzWTW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-mbigen.c: In function 'mbigen_of_create_domain':
>> drivers/irqchip/irq-mbigen.c:292:24: warning: unused variable 'parent' [-Wunused-variable]
     292 |         struct device *parent;
         |                        ^~~~~~


vim +/parent +292 drivers/irqchip/irq-mbigen.c

   286	
   287	static int mbigen_of_create_domain(struct platform_device *pdev,
   288					   struct mbigen_device *mgn_chip)
   289	{
   290		struct platform_device *child;
   291		struct device_node *np;
 > 292		struct device *parent;
   293		u32 num_pins;
   294		int ret = 0;
   295	
   296		for_each_child_of_node(pdev->dev.of_node, np) {
   297			if (!of_property_read_bool(np, "interrupt-controller"))
   298				continue;
   299	
   300			child = of_platform_device_create(np, NULL, NULL);
   301			if (!child) {
   302				ret = -ENOMEM;
   303				break;
   304			}
   305	
   306			if (of_property_read_u32(child->dev.of_node, "num-pins",
   307						 &num_pins) < 0) {
   308				dev_err(&pdev->dev, "No num-pins property\n");
   309				ret = -EINVAL;
   310				break;
   311			}
   312	
   313			if (!mbigen_create_device_domain(&child->dev, num_pins, mgn_chip)) {
   314				ret = -ENOMEM;
   315				break;
   316			}
   317		}
   318	
   319		if (ret)
   320			of_node_put(np);
   321	
   322		return ret;
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
