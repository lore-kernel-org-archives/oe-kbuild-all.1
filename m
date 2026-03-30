Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF57636492D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 06:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774853195; cv=none; b=n49twFwMEY6Yi4qJBwBssFMFtXGf1obpYIgbh9HW/47qPV3ry9HQpAVzHX9ghU0M5sKWxdXI23vr4UXvh3or/5MI+PpBarlDuL8mp5Kjx5JGNAO1n6gYJ6pxfPw+gS/RUk7RdTnFba/eED0K7aZPDJQOqbHlrlYDBmvKRN5UBtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774853195; c=relaxed/simple;
	bh=kitBqYMiv50onOVlaeK6fEo3IWDXneL5vSCzsu5nPYI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LQCIJ/oRBYwBd/SvvOVLJIFZAaPReVJgVupnPLCBVrcYoZK3RtGR5Ujlg8eHDsLgYt7ipFCyl80eDfrlNECPx6t5XHe6T2CQw+5bG6haJjF/IKuU6KQBe5mUZ7MXzylvi0yJERAQQfvl6wwPRHVEKPuva6+wfjTBAQzBFEWzIbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcgmG3Zk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcgmG3Zk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774853194; x=1806389194;
  h=date:from:to:cc:subject:message-id;
  bh=kitBqYMiv50onOVlaeK6fEo3IWDXneL5vSCzsu5nPYI=;
  b=gcgmG3ZkDk5ehEIf24zD7mO1WMyo2TB91pPkn8IP0vG9EtRC1bAX7cCQ
   aypivM6JY+9rpVxxXCpz9X6/s178xV+eDlgwl/p9q7PEDDfBFkKnWyXjm
   qmC8nhtouxqK3vVD+iabABTAEOImHpXxM5VkHA4ZAwh+IJOBxSmS7riT3
   xwC9N8QZ74dioLtUrgGZEnm+e0qdKlQbxy5GVIAUXryO8UpulLfjE0Kmw
   z5EmHtgfQLCAhKYpq7p5G8GE1+RCpvTi/JW84jxdm2vcAnlK6C2XqKBT6
   X/EHm8vrHICbL/CIXBEEKo9AXndFDLjgdnO3879GsxcoW3cuKEa130YPY
   Q==;
X-CSE-ConnectionGUID: Km0WCOzeT8ql8jlV1aOXMg==
X-CSE-MsgGUID: 3Fe7xerrSta3BdXRoHY9iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86455552"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="86455552"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 23:46:33 -0700
X-CSE-ConnectionGUID: c04MwXs9Tam0W8r0tx/d7g==
X-CSE-MsgGUID: yqWOtBAXQ/+gin7BjGO47g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="230432327"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Mar 2026 23:46:32 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w76OL-000000000mr-1lM6;
	Mon, 30 Mar 2026 06:46:29 +0000
Date: Mon, 30 Mar 2026 14:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 0/4]
 drivers/tty/n_gsm.c:4171: warning: Function parameter or struct member 'dlci'
 not described in 'gsm_modem_send_initial_msc'
Message-ID: <202603301423.aNQzrt7G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Seppo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: 5416e89b81b00443cb03c88df8da097ae091a141 [0/4] tty: n_gsm: Don't block input queue by waiting MSC
config: x86_64-randconfig-012-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301423.aNQzrt7G-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301423.aNQzrt7G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301423.aNQzrt7G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/n_gsm.c:4171: warning: Function parameter or struct member 'dlci' not described in 'gsm_modem_send_initial_msc'


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
