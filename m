Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423E3377A93
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 07:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854062; cv=none; b=AIcwK1Qcu9mH0JAGj4ogRFy4aWffF6IbrVbU+IwZ9ouq2lfRhFpOzsoPzjb9vb+C1eSmX0ZC0OoFBUt5ei/oogOqUehR3B1ZdE6CB4BhtyRwiWtKzwJuziaSDmmKdGvI9P6Bchf4eiyRWW2T8WprdB29Qva9qQb3lRdTRAvrXi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854062; c=relaxed/simple;
	bh=51Qbz6sRBXQA80X5T2XmNfM0fDdZv4+5A6bPHm08Be4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YGniQMKM2cGoGStmJlgPFFcOZ6zBj/jC9VsZYbgBXTgtGd1OfQMF4+EUhLeMHuV35p8s6B2Of2/wXMYUaWpc8p2DMaUdVtsk08PxJEmJ1FzAV079T0hpuhTKNJq6TFsDr5MK8WpnxkHmvOYfUGAjaDbwCdUa78IncQmD7Y+Mlqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUSL1Yxc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUSL1Yxc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788854060; x=1820390060;
  h=date:from:to:cc:subject:message-id;
  bh=51Qbz6sRBXQA80X5T2XmNfM0fDdZv4+5A6bPHm08Be4=;
  b=aUSL1YxcbM6VdB/+w4Ga5TQeDFyQfiGulr853FFZ9qkvn7pLZP1wgpod
   iA8snBYe1ZTnyn9MQE8CTdhE+SzKUuHQoEt/Sf0+zrs9h35SYuvDVR5SN
   GEgxrrQQW1E4RB3v01Kc8VKvSroHtuv6PDcdJFvA3UxMtv6lrb6sisuPS
   dPla5fjEPoNUgZYtA85fkE1EeyGtLITFhJfCvUaiF0YTY4GTIYQs5uxZh
   litIHTC5XCCuHPxo5vaiAM+zc25FkPsJLzF39F+5PyTd4/h8FvX5w2OEq
   lix2S2+qyvZRe2AwahpfSPp5fPe1hhYlI02O1FORLN1T+LD1p/kEdHYbC
   g==;
X-CSE-ConnectionGUID: ICNl1nnxTOu/+ETK4uhZkg==
X-CSE-MsgGUID: 5Yq1Xa6aTi6MM/OlnfG4kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="91758119"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="91758119"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 00:54:20 -0700
X-CSE-ConnectionGUID: XVY5CnJZTheiLjchWRs/cA==
X-CSE-MsgGUID: 9L1IvGY0TvWNTF5Jrwoi8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="294405559"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Sep 2026 00:54:17 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3qel-000000001r7-04aZ;
	Tue, 08 Sep 2026 07:54:15 +0000
Date: Tue, 08 Sep 2026 15:53:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1] drivers/tty/n_gsm.c:4171:
 warning: Function parameter or member 'dlci' not described in
 'gsm_modem_send_initial_msc'
Message-ID: <202609081547.dxmH6T13-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   7c4d9544b5a66846a8522efb9935c50a56b8f1ec
commit: c36785f9de03df56ff9b8eca30fa681a12b2310d [0/1] tty: n_gsm: Don't block input queue by waiting MSC
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260908/202609081547.dxmH6T13-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081547.dxmH6T13-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609081547.dxmH6T13-lkp@intel.com/

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
