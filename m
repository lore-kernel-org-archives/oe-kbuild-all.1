Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70506161B60
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 20:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705435352; cv=none; b=cmgC1ZhGJUSZ4y05mVIRltaaW41LFzWI60QyG4c6IFLJ04PxCEs2kiRETpaUpzQdJyXHPBQpgE7x05cmVgmJqLQhlz63ZDYyJXaqTPWKc0/4j97U2rCLFGL0IfjCB6XEm4tOFeyelX3C3HNW9qIDVfv2xBuQcyWdCqdQTrGar3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705435352; c=relaxed/simple;
	bh=mgWRLW6Ah2V99pVHrf3i/qvzUrx+UR3CUPW5cqG3Ivw=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=FH9ziJOAK3O8Uxu9cGOfXB0KmkIkNJtP6zH7/vHt3SKJfqiY+/kdKbLY9IY92A7Ks2MndUoZeSp1p9SJyUvhoE2T8Uh6dRBwPJYjm75MssSd12XO9rk/W1RvbDyuyUxLoCbw4P6cKDNdvWn4rlQbIzi5eTrv0WoKQJK/jG8N1GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAxKZZkY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAxKZZkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705435350; x=1736971350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mgWRLW6Ah2V99pVHrf3i/qvzUrx+UR3CUPW5cqG3Ivw=;
  b=lAxKZZkYWjtgI4ng/THP0ABijLUe81npjw9uXOY1Fp74UrF+6pAPe0Cf
   iHvtS7OAO3rN01MnOq2xjCNkCgEZjLmNNdBUClP8+QTmQgdc/wfDFxBBT
   ppMNJqkdUcT3KN/UYT2fP3ZhGIkBEAafuJfbSkLYXPEmRpedTzqigeNnD
   Xs1QD7Irhp/A6qQRCXrK1egHd1eBMQZbqJesX4tTtBUR1fTa1IifYAYQ5
   RPu7rKbEhPxvu5zLk2oVx7sPTZA8BX9zIbUq6Fv+FO9VrtYdAeWmlzF4o
   9QnqbkjGWj2Z123W5dAu1nbkTOCvDwicDDer0+8UKJOF/6Blm89EAP0km
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6729792"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="6729792"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 12:02:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="787564544"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="787564544"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Jan 2024 12:02:28 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPpdi-0001Ak-1Y;
	Tue, 16 Jan 2024 20:02:26 +0000
Date: Wed, 17 Jan 2024 04:01:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 155/175]
 arch/arm64/kvm/hyp_trace.c:709:37: warning: unused variable
 'hyp_trace_raw_fops'
Message-ID: <202401170338.eKfo6cbs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   00d46b7d4ac191fcc28b0ea7cbdb8611a8628fce
commit: f833c4c66599d064f5f9b29f0d78e13d63cfb29f [155/175] ANDROID: KVM: arm64: Add raw interface to nVHE hyp tracing
config: arm64-randconfig-003-20240116 (https://download.01.org/0day-ci/archive/20240117/202401170338.eKfo6cbs-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401170338.eKfo6cbs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401170338.eKfo6cbs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_trace.c:709:37: warning: unused variable 'hyp_trace_raw_fops' [-Wunused-const-variable]
     709 | static const struct file_operations hyp_trace_raw_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/hyp_trace_raw_fops +709 arch/arm64/kvm/hyp_trace.c

   708	
 > 709	static const struct file_operations hyp_trace_raw_fops = {
   710		.open           = hyp_trace_raw_open,
   711		.read           = hyp_trace_raw_read,
   712		.release        = hyp_trace_raw_release,
   713		.llseek         = no_llseek,
   714	};
   715	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
