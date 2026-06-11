Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEB92EB0F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781167913; cv=none; b=OplDm9dB8IA1gEMmX/pe2eIjWkX2rqNP1I7py94pa309fFzu2EM0nB2pybZnq55OGzDv4wDcbNBijCJC28jie+nicNzIB2u/EcD3m4sdSy/Fu4oPjoJrP3865MrfPQIzOmX7bDOs79qhGjSbaWv78SMIA486BtDC1ybsJAVCzaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781167913; c=relaxed/simple;
	bh=Rf9w53DzS8YSl5uEIBc7whWlMoRNCmHbfxpATmc+jqM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QPZ24JJpK+DBOsElM1APtKpPCNgt8TQflY2QoSxJ7Ku5mNKJWNv4XDfiXn18jfC2RkJ2ILP4fvxif5xa38fEzuvJf+0iPuIFLiNNQPQv386oHsaUsxIAmqA5fue/mHtAR9msRJuhBu56iv+79hPWm0+ZnaWC62RAHgg+6HaFBPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOqg3Wet; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOqg3Wet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781167911; x=1812703911;
  h=date:from:to:cc:subject:message-id;
  bh=Rf9w53DzS8YSl5uEIBc7whWlMoRNCmHbfxpATmc+jqM=;
  b=fOqg3WetOofHxIvJxK0CNC7rPz4dP3ySzp/2OTaqRGm6FT5iiGJg+sHJ
   rruLesTz+/neu5OgO0nSicLOaXDh62mhCABJYF/ZxnZtik7nZKiXlp2JH
   yQ1XjWLPmWD5df/8n5/EK/irceslk7rfxaGNdbprXGESrifNauzvNjmzT
   42Nfb2/ZMeoZMWBm08HY9A3A49WxtXf7RveHYbomcTjUv1FhsoYXR44El
   JXdG2zFgLEJtst0aObwLoncIcMRFWkBp+At8QUq5l0KE8g+csESyh9S6l
   crGoRy15K8rpwuiQNYJKuakCk0oo6qW83Mjoy+92fzdTzgU/ELKU5LPUi
   Q==;
X-CSE-ConnectionGUID: azy1CoRYQkSsl49Op9CErg==
X-CSE-MsgGUID: CMXLPL28Ryim2EVf2/qmLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82020079"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="82020079"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:51:51 -0700
X-CSE-ConnectionGUID: f3jzTRecTeSqsl43KVSdhg==
X-CSE-MsgGUID: hN3Pu0U9QWiPl01O5n+QNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="243475774"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jun 2026 01:51:50 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXb8d-000000003z5-3KVa;
	Thu, 11 Jun 2026 08:51:47 +0000
Date: Thu, 11 Jun 2026 10:51:27 +0200
From: kernel test robot <lkp@intel.com>
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ulfh-pm:next 3/12] checkpatch: WARNING:BLOCK_COMMENT_STYLE:
 Block comments should align the * on each line
Message-ID: <202606111051.SARHsio8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git next
head:   ea1ca762328194de780a8e92df0b2e41bf6eeed2
commit: fba9c703c18459e936c365442667c08ca40dadcb [3/12] pmdomain: arm_scmi: add support for domain hierarchies
reproduce: (https://download.01.org/0day-ci/archive/20260611/202606111051.SARHsio8-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#29: FILE: drivers/pmdomain/arm/scmi_pm_domain.c:120:
+	 * parent-child relationships.
+	*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
