Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879862F066D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 17:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762190321; cv=none; b=Fq6+lEG24sqFFzdtlGMcWK8byA2Ej0Rn+n3P8q99OByKn7icOyY0Z7HRl1mss/I2yarlaRrDxS1SzHPFiOq5PYRqZMdOBsh9p1SrltpOLmZDPm7CceWsydCrlYZcx7w3TKlXpAEnhJPyexb0hHsnpT94CC9Em++dgki1NzAsNyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762190321; c=relaxed/simple;
	bh=5CNg3AYTg8+ZS/61RWGedkTTdIvENpfHniSYCnKBsv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W2cngsC1zwzHeR0H1DTKJzj9FtbiWRyTDZuQeNqGfzvu85d4/3otDeEAtEaxVtsn5H7NkIeJSHQ8yMqPmvIPnvoKVQIFA+Z7WIejPJU8hKST3OWLOJSe77tGqQA9/Zb3UQ2W/b/W+kPbXGjZe3RO9CHYhZsID6ACAHrV5rWJs4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cN9pLiKD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cN9pLiKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762190319; x=1793726319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5CNg3AYTg8+ZS/61RWGedkTTdIvENpfHniSYCnKBsv8=;
  b=cN9pLiKDBsI9CPgxPI03WWAwVRn1LlKxxyOg8G9VPVKObQGZe5RGTMsz
   GvkLYorlXiaGeUIPCsbtmJn+qBq1fTbjp9A6YZ2IZvytBN+w9F+DCXNjl
   PhaUW+IikSiHS9LkLY4LUfK+/lWaI2xsBl1Mhu3jwZ0oRIC3etALjCzmv
   3/qdYvt0QWRLUw9Lv+g5ldtvr+Fi1wCUIVRLSb29jqygAsfm7EVPZ+rAT
   +NomFmHq8ebNXkK/NRCxWH10CQAtnWjQBzN3l9AFU04NJc+bMudD7bX8W
   larXK4OW6m+w2EYY2GBTkyl9VKM7yxUrYuZc83hDOxycgtijKFSaFJeF1
   Q==;
X-CSE-ConnectionGUID: /XEl2MHHRV+xLvg/MB8O0g==
X-CSE-MsgGUID: m7KCcJHBRWeMV2U0a4vf2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64197695"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64197695"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 09:18:37 -0800
X-CSE-ConnectionGUID: 1dzt8Iv/Q1iBkoGmZ69N5w==
X-CSE-MsgGUID: 7qhGO14wQJqPRmKmMtlzuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="186872499"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Nov 2025 09:18:36 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFyCP-000QPg-1I;
	Mon, 03 Nov 2025 17:18:33 +0000
Date: Tue, 4 Nov 2025 01:18:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yi Yang <yiyang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] drivers/tty/n_gsm.c:4171: warning:
 Function parameter or member 'dlci' not described in
 'gsm_modem_send_initial_msc'
Message-ID: <202511040133.5KcpYIBK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a29fc03bd0ddaf7388cf31604ef5bd9807585109
commit: 0c1413eee50d3f2b8928d788d0df337a3ce85e42 [3098/3098] tty: n_gsm: Don't block input queue by waiting MSC
config: arm64-randconfig-001-20251103 (https://download.01.org/0day-ci/archive/20251104/202511040133.5KcpYIBK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040133.5KcpYIBK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040133.5KcpYIBK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/n_gsm.c:4171: warning: Function parameter or member 'dlci' not described in 'gsm_modem_send_initial_msc'


vim +4171 drivers/tty/n_gsm.c

  4159	
  4160	/**
  4161	 * gsm_modem_send_initial_msc - Send initial modem status message
  4162	 *
  4163	 * @dlci channel
  4164	 *
  4165	 * Send an initial MSC message after DLCI open to set the initial
  4166	 * modem status lines. This is only done for basic mode.
  4167	 * Does not wait for a response as we cannot block the input queue
  4168	 * processing.
  4169	 */
  4170	static int gsm_modem_send_initial_msc(struct gsm_dlci *dlci)
> 4171	{
  4172		u8 modembits[2];
  4173	
  4174		if (dlci->adaption != 1 || dlci->gsm->encoding != GSM_BASIC_OPT)
  4175			return 0;
  4176	
  4177		modembits[0] = (dlci->addr << 2) | 2 | EA; /* DLCI, Valid, EA */
  4178		modembits[1] = (gsm_encode_modem(dlci) << 1) | EA;
  4179		return gsm_control_command(dlci->gsm, CMD_MSC, (const u8 *)&modembits, 2);
  4180	}
  4181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
