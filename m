Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B582222C4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 05:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766121355; cv=none; b=tHXuG3WZ+OUA8jQfYHS1Vfi2zz9/XKb03kLyHvk/d9Jckyb3OncU/tsXiahMRLCVO+6VKGYYOIbpw/czHHkFY4PbNlAVdrbXdTrJVjBD5FnWxqJLzB2xnlHtVCWkMusFDeTZDCXAX1Zy+pVkrTfYpLPR2+nDafHakHKmBJYcWe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766121355; c=relaxed/simple;
	bh=dfu07EkKUK9nDCN1x0Fp49OW9Sr4usulPWPucEOEh0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HIwAQ8gX4QP+X1vfuvK4/iN1ZoeczAicFSm+4zxQ0jUIOMgri+S7JaCDsKIDhVCd35FpBd1uj7GSB26/HDaWt4q3MylKrlMtc3S6cJSWdUiAxiKq1yjdYfhZBdzW/OLLMWjOwkoY4c/0ur9R61RDDz3fRlHmEkWaC8G7y/SMuQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bv/wBbC4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bv/wBbC4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766121354; x=1797657354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dfu07EkKUK9nDCN1x0Fp49OW9Sr4usulPWPucEOEh0g=;
  b=bv/wBbC44rl5899T7nAI12+euDK1x7faaDWmKq3jjHo8XTgw5Dh1DOs+
   iF0NE1vM+fV1ENI4wrBEHmtJsujp5a6b8C43ewhM9N9c1YEYSVT54naVg
   ONfCj9euHblq/BP9h3wbiH/M/nzds6JXArjXLrz3AZKyRUZ5TPil0GtOJ
   J7UepJ1lxU+4clfxdyj/4287accmk37+QAoUdZGl/iVqbsw0ZHjwIj2s/
   2x/k3+j7Z6mfcx300KOFJets0CQ77XaWQYtvHObnhWq+hk5cwU2XJXdT/
   AdUrYLlguHBb0wI4wf7ZLBvDWHvbxQpQExdXJBrT8/oN9mZbIzDWEeCpm
   A==;
X-CSE-ConnectionGUID: 3GPp/HfbTRSsYsoTWqxuGg==
X-CSE-MsgGUID: W6PTHwqORMa1pmTstyrOZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93556428"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="93556428"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 21:15:53 -0800
X-CSE-ConnectionGUID: nAesBqzORbedmPNy45ZSCg==
X-CSE-MsgGUID: iASSR9tATOuAPyq3fuM8FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198372334"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Dec 2025 21:15:52 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWSqE-0000000033T-2Qiy;
	Fri, 19 Dec 2025 05:15:50 +0000
Date: Fri, 19 Dec 2025 13:15:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 43/43]
 arch/arm64/kvm/hyp_trace.c:595:36: warning: 'hyp_trace_ops' defined but not
 used
Message-ID: <202512191325.QIKpJD9Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: a6af57723d00e6d80d21f6171f3cb4574aba159d [43/43] ANDROID: KVM: arm64: Remove the non-consuming hyp trace interface
config: arm64-randconfig-r123-20251217 (https://download.01.org/0day-ci/archive/20251219/202512191325.QIKpJD9Y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191325.QIKpJD9Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191325.QIKpJD9Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp_trace.c:245:6: warning: no previous prototype for 'hyp_poke_tracing' [-Wmissing-prototypes]
     245 | void hyp_poke_tracing(int cpu, const struct cpumask *cpus)
         |      ^~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp_trace.c:595:36: warning: 'hyp_trace_ops' defined but not used [-Wunused-const-variable=]
     595 | static const struct seq_operations hyp_trace_ops = {
         |                                    ^~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/hyp_trace_ops +595 arch/arm64/kvm/hyp_trace.c

34305ad4b1bbf0 Vincent Donnefort 2022-08-25  594  
34305ad4b1bbf0 Vincent Donnefort 2022-08-25 @595  static const struct seq_operations hyp_trace_ops = {
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  596  	.start	= ht_start,
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  597  	.next	= ht_next,
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  598  	.stop	= ht_stop,
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  599  	.show	= ht_show,
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  600  };
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  601  

:::::: The code at line 595 was first introduced by commit
:::::: 34305ad4b1bbf0b1938712ef0070a78d8b2c3583 ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Vincent Donnefort <vdonnefort@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
