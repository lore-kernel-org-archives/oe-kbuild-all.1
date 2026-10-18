Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801203D5259
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 23:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364920; cv=none; b=HWjbMZHJek64oGNSN+tM2cVF+W1u/kYHyLgbJiHsiY0TmY3s+6WQnPK3jOrf2KYJ/JEQATx9xFz5JtkinC3vcJnXMv2S4kZOmH3rvitQgm8cUZwxK7qyR0894X6gX3fDOGgTHF5ubAIRpt319DJsGDCfiV6Lh97eZ3DAAcUnjrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364920; c=relaxed/simple;
	bh=dzotZDGNqHE6X/BdKs+nK1Ucbt6zVS2uwV/0vnN7HH4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NzHkZb1ugl8N5g1ND0u0kUMikmwhLy0y2DMEen9rM9+jl8EZ4R1asJD2v241WjRBEAwsASfvOTqgNOSaSSDwtUg+ZBLtg4g4WKNQZ5S3g/Nom5mPkkrpaKF1rxTMfECVzmwPUDxkeF5+TCpqSrE43Oba0gOBlbedB7YfvaKBgkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbVu1rkD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbVu1rkD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792364919; x=1823900919;
  h=date:from:to:cc:subject:message-id;
  bh=dzotZDGNqHE6X/BdKs+nK1Ucbt6zVS2uwV/0vnN7HH4=;
  b=SbVu1rkDPc2HjGdIV3YS2eFi9vco4k2n8OJVsakcyFCvjObOk3lSmLBb
   CG7GqVTy4WwHF69MRZ5MEBsk5J3hX7wjIp7tzxzGybmcP3/2U/0J0K7H2
   DX4yeGDqeM0OLsYTNTko874NV1os1KmMSk+flV3sqDoYarDN/j+5Xlxw3
   75LEc2IpKzIa9fvWcjFSXwEF77wlMxG68yxeGCO/PDwE0Li7Ih6rOqGH6
   WFjPKaF6vr88Nqrbvud8JddnBzauWsbyx6xhkUHEUo0yOtJILsrsxscAz
   RV14rhZPzSs1FhG6QvLoSZyqTJU62n7XXTCz/RbunwZXnZVkkFL7mgsMp
   g==;
X-CSE-ConnectionGUID: hdi220bDRpiwGHvVnTrU8g==
X-CSE-MsgGUID: IqkrmXdKSbqeG2+H8dRkcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1065360"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1065360"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 16:08:38 -0700
X-CSE-ConnectionGUID: 7i02FZ3ESHuhapvHE7UJ9Q==
X-CSE-MsgGUID: jEp+GnJLQ/qUXH1b3AKjSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="4142078"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 18 Oct 2026 16:08:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIZzW-000000005Kn-33zl;
	Sun, 18 Oct 2026 23:08:34 +0000
Date: Mon, 19 Oct 2026 01:07:43 +0200
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:core/hotplug 45/49]
 kernel/irq_work.c:184:27: error: parameter name omitted
Message-ID: <202610190109.xBIsD07d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git core/hotplug
head:   6cbb08c40db1f93e15aaef964883729494f3a478
commit: 8b3cdb229529280585c5ac39daa446e735bce900 [45/49] irq_work: Introduce irq_work_kick_cpu()
config: arc-randconfig-2001-20261018 (https://download.01.org/0day-ci/archive/20261019/202610190109.xBIsD07d-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190109.xBIsD07d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190109.xBIsD07d-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/irq_work.c: In function 'irq_work_kick':
>> kernel/irq_work.c:184:27: error: parameter name omitted
     184 | static void irq_work_kick(struct irq_work *)
         |                           ^~~~~~~~~~~~~~~~~


vim +184 kernel/irq_work.c

   183	
 > 184	static void irq_work_kick(struct irq_work *)
   185	{
   186		/*
   187		 * Kick the CPU, typically so that it takes action:
   188		 * * On IRQ exit (nohz_full dependency changed and tick must be restarted)
   189		 * * On the idle path so that the next tick is re-evaluated.
   190		 */
   191	}
   192	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
