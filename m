Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242D536B048
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 03:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783480597; cv=none; b=Pc6A4jjDYm5Eq7QzR1Z5WjhlqlbDGmJmyqGGLxynrE2M54sIB+jx52OGHke26vq+zYhRo2JUcMJzNiF6TYweq9ip/DqdlnvAYvnzx3AOz4wJ5JIYBxuvb5aQIzJTR6es9xSW/RlpLGhdpAeBQVFEh/OoWScuEeseaGPFfjzy2c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783480597; c=relaxed/simple;
	bh=XlsK4hNWVnXPmqxigFzPUlILMnJspEgGpdmnf2yBxrQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JLWvNCjs0Exnzls4OhxurSvjJvDynXqt+cFPoC2ilLqWGKuB2MIavJkkuYLyAc++yCRiiUUAjqETwUjWqMLcQlu/4FXfC7Dwwfnjcf3rVKzUkT/C3WWv6D84twb1gAwHitsPuiN4PWoV6lcKxaJy3g5lULbsH/chfU9nZHrxlSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bF8rS4vu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bF8rS4vu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783480595; x=1815016595;
  h=date:from:to:cc:subject:message-id;
  bh=XlsK4hNWVnXPmqxigFzPUlILMnJspEgGpdmnf2yBxrQ=;
  b=bF8rS4vu18Hr4pcLL5u8bMxmsd0VNJMWcO2/GeaxjN19CcljyuYLXb3S
   JADLWi1GKqj9CY7b9i7EobmpfCRE/VxwoqRmjY5DDTZw+0tlr+LCCWSGE
   qTPkx96AGvTPEt5TBHYGROvePmtIQhWgTgqIRxpf/SuNvTWq66EAUIbLt
   O3e+DqZu5aqUCQ6V4onKa+jQBiI9AoxN3lWENzyfgmo1TaEwI5WttfXVv
   9XrCXHnB2UpoTRTSBxCfQ/fl+1qV9d9OqtG6zVTVO48SIgdwsn6Q7jYQy
   hEhPBSRiq0znwzN0XJEmlc1BcHIi/gyghj+5tAEcMA8Nk8HTifFWummJS
   g==;
X-CSE-ConnectionGUID: O4frjx1KQvuPqtddmmZ1Rw==
X-CSE-MsgGUID: EcnW+DBKQyG1VFRtS5e4Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84232711"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84232711"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 20:16:32 -0700
X-CSE-ConnectionGUID: KAvFmwDkT+auDyQHVE7EaA==
X-CSE-MsgGUID: P+cdaUN2TI+KvTBoPTzmqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="277372453"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jul 2026 20:16:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whIlu-00000000Fz3-1Lte;
	Wed, 08 Jul 2026 03:16:26 +0000
Date: Wed, 08 Jul 2026 11:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>
Subject: net/ipv4/esp4.c:237: Warning: missing closing `"'
Message-ID: <202607081144.nNPpRBhx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: 18ec6c5d7ec6c73ccff616041d75b6ea30a9a36e s390/percpu: Use new percpu code section for arch_this_cpu_add()
date:   5 weeks ago
config: s390-randconfig-r054-20260708 (https://download.01.org/0day-ci/archive/20260708/202607081144.nNPpRBhx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081144.nNPpRBhx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 18ec6c5d7ec6 ("s390/percpu: Use new percpu code section for arch_this_cpu_add()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081144.nNPpRBhx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv4/esp4.c: Assembler messages:
>> net/ipv4/esp4.c:237: Warning: missing closing `"'
>> net/ipv4/esp4.c:237: Warning: missing closing `"'
>> net/ipv4/esp4.c:237: Warning: missing closing `"'
>> net/ipv4/esp4.c:237: Warning: missing closing `"'
>> net/ipv4/esp4.c:237: Warning: missing closing `"'
>> net/ipv4/esp4.c:237: Warning: missing closing `"'
>> net/ipv4/esp4.c:237: Warning: missing closing `"'
>> net/ipv4/esp4.c:237: Warning: missing closing `"'
>> net/ipv4/esp4.c:237: Warning: missing closing `"'
>> net/ipv4/esp4.c:237: Warning: missing closing `"'
>> net/ipv4/esp4.c:237: Warning: missing closing `"'
>> net/ipv4/esp4.c:237: Warning: missing closing `"'
>> net/ipv4/esp4.c:237: Warning: missing closing `"'
>> net/ipv4/esp4.c:237: Warning: missing closing `"'
>> net/ipv4/esp4.c:237: Warning: missing closing `"'
>> net/ipv4/esp4.c:237: Warning: missing closing `"'
>> net/ipv4/esp4.c:237: Warning: missing closing `"'
   net/ipv4/esp4.c:242: Warning: missing closing `"'
   net/ipv4/esp4.c:242: Warning: missing closing `"'
   net/ipv4/esp4.c:242: Warning: missing closing `"'
   net/ipv4/esp4.c:242: Warning: missing closing `"'
   net/ipv4/esp4.c:242: Warning: missing closing `"'
   net/ipv4/esp4.c:242: Warning: missing closing `"'
   net/ipv4/esp4.c:242: Warning: missing closing `"'
   net/ipv4/esp4.c:242: Warning: missing closing `"'
   net/ipv4/esp4.c:242: Warning: missing closing `"'
   net/ipv4/esp4.c:242: Warning: missing closing `"'
   net/ipv4/esp4.c:242: Warning: missing closing `"'
   net/ipv4/esp4.c:242: Warning: missing closing `"'
   net/ipv4/esp4.c:242: Warning: missing closing `"'
   net/ipv4/esp4.c:242: Warning: missing closing `"'
   net/ipv4/esp4.c:242: Warning: missing closing `"'
   net/ipv4/esp4.c:242: Warning: missing closing `"'
   net/ipv4/esp4.c:242: Warning: missing closing `"'
--
   net/ipv6/xfrm6_input.c: Assembler messages:
>> net/ipv6/xfrm6_input.c:315: Warning: missing closing `"'
>> net/ipv6/xfrm6_input.c:315: Warning: missing closing `"'
>> net/ipv6/xfrm6_input.c:315: Warning: missing closing `"'
>> net/ipv6/xfrm6_input.c:315: Warning: missing closing `"'
>> net/ipv6/xfrm6_input.c:315: Warning: missing closing `"'
>> net/ipv6/xfrm6_input.c:315: Warning: missing closing `"'
>> net/ipv6/xfrm6_input.c:315: Warning: missing closing `"'
>> net/ipv6/xfrm6_input.c:315: Warning: missing closing `"'
>> net/ipv6/xfrm6_input.c:315: Warning: missing closing `"'
>> net/ipv6/xfrm6_input.c:315: Warning: missing closing `"'
>> net/ipv6/xfrm6_input.c:315: Warning: missing closing `"'
>> net/ipv6/xfrm6_input.c:315: Warning: missing closing `"'
>> net/ipv6/xfrm6_input.c:315: Warning: missing closing `"'
>> net/ipv6/xfrm6_input.c:315: Warning: missing closing `"'
>> net/ipv6/xfrm6_input.c:315: Warning: missing closing `"'
>> net/ipv6/xfrm6_input.c:315: Warning: missing closing `"'
>> net/ipv6/xfrm6_input.c:315: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:320: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:320: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:320: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:320: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:320: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:320: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:320: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:320: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:320: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:320: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:320: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:320: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:320: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:320: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:320: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:320: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:320: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:291: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:291: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:291: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:291: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:291: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:291: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:291: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:291: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:291: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:291: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:291: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:291: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:291: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:291: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:291: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:291: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:291: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:296: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:296: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:296: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:296: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:296: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:296: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:296: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:296: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:296: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:296: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:296: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:296: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:296: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:296: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:296: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:296: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:296: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:257: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:257: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:257: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:257: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:257: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:257: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:257: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:257: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:257: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:257: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:257: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:257: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:257: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:257: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:257: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:257: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:257: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
   net/ipv6/xfrm6_input.c:262: Warning: missing closing `"'
--
   net/ipv6/esp6.c: Assembler messages:
>> net/ipv6/esp6.c:273: Warning: missing closing `"'
>> net/ipv6/esp6.c:273: Warning: missing closing `"'
>> net/ipv6/esp6.c:273: Warning: missing closing `"'
>> net/ipv6/esp6.c:273: Warning: missing closing `"'
>> net/ipv6/esp6.c:273: Warning: missing closing `"'
>> net/ipv6/esp6.c:273: Warning: missing closing `"'
>> net/ipv6/esp6.c:273: Warning: missing closing `"'
>> net/ipv6/esp6.c:273: Warning: missing closing `"'
>> net/ipv6/esp6.c:273: Warning: missing closing `"'
>> net/ipv6/esp6.c:273: Warning: missing closing `"'
>> net/ipv6/esp6.c:273: Warning: missing closing `"'
>> net/ipv6/esp6.c:273: Warning: missing closing `"'
>> net/ipv6/esp6.c:273: Warning: missing closing `"'
>> net/ipv6/esp6.c:273: Warning: missing closing `"'
>> net/ipv6/esp6.c:273: Warning: missing closing `"'
>> net/ipv6/esp6.c:273: Warning: missing closing `"'
>> net/ipv6/esp6.c:273: Warning: missing closing `"'
   net/ipv6/esp6.c:278: Warning: missing closing `"'
   net/ipv6/esp6.c:278: Warning: missing closing `"'
   net/ipv6/esp6.c:278: Warning: missing closing `"'
   net/ipv6/esp6.c:278: Warning: missing closing `"'
   net/ipv6/esp6.c:278: Warning: missing closing `"'
   net/ipv6/esp6.c:278: Warning: missing closing `"'
   net/ipv6/esp6.c:278: Warning: missing closing `"'
   net/ipv6/esp6.c:278: Warning: missing closing `"'
   net/ipv6/esp6.c:278: Warning: missing closing `"'
   net/ipv6/esp6.c:278: Warning: missing closing `"'
   net/ipv6/esp6.c:278: Warning: missing closing `"'
   net/ipv6/esp6.c:278: Warning: missing closing `"'
   net/ipv6/esp6.c:278: Warning: missing closing `"'
   net/ipv6/esp6.c:278: Warning: missing closing `"'
   net/ipv6/esp6.c:278: Warning: missing closing `"'
   net/ipv6/esp6.c:278: Warning: missing closing `"'
   net/ipv6/esp6.c:278: Warning: missing closing `"'
--
   net/mpls/af_mpls.c: Assembler messages:
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
>> net/mpls/af_mpls.c:176: Warning: missing closing `"'
   net/mpls/af_mpls.c:176: Warning: missing closing `"'
   net/mpls/af_mpls.c:176: Warning: missing closing `"'
   net/mpls/af_mpls.c:176: Warning: missing closing `"'
   net/mpls/af_mpls.c:176: Warning: missing closing `"'
   net/mpls/af_mpls.c:176: Warning: missing closing `"'
   net/mpls/af_mpls.c:176: Warning: missing closing `"'
   net/mpls/af_mpls.c:176: Warning: missing closing `"'
   net/mpls/af_mpls.c:176: Warning: missing closing `"'
   net/mpls/af_mpls.c:176: Warning: missing closing `"'
   net/mpls/af_mpls.c:176: Warning: missing closing `"'
   net/mpls/af_mpls.c:176: Warning: missing closing `"'
   net/mpls/af_mpls.c:176: Warning: missing closing `"'
   net/mpls/af_mpls.c:176: Warning: missing closing `"'
   net/mpls/af_mpls.c:176: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:181: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:172: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:177: Warning: missing closing `"'
   net/mpls/af_mpls.c:182: Warning: missing closing `"'
..


vim +237 net/ipv4/esp4.c

e27cca96cd68fa2 Sabrina Dubroca  2019-11-25  206  
fd5dabf764f79ce Herbert Xu       2023-02-06  207  static void esp_output_done(void *data, int err)
38320c70d282be1 Herbert Xu       2008-01-28  208  {
fd5dabf764f79ce Herbert Xu       2023-02-06  209  	struct sk_buff *skb = data;
f53c723902d1ac5 Steffen Klassert 2017-12-20  210  	struct xfrm_offload *xo = xfrm_offload(skb);
cac2661c53f35cb Steffen Klassert 2017-01-17  211  	void *tmp;
f53c723902d1ac5 Steffen Klassert 2017-12-20  212  	struct xfrm_state *x;
f53c723902d1ac5 Steffen Klassert 2017-12-20  213  
2294be0f11e22b6 Florian Westphal 2018-12-18  214  	if (xo && (xo->flags & XFRM_DEV_RESUME)) {
2294be0f11e22b6 Florian Westphal 2018-12-18  215  		struct sec_path *sp = skb_sec_path(skb);
2294be0f11e22b6 Florian Westphal 2018-12-18  216  
2294be0f11e22b6 Florian Westphal 2018-12-18  217  		x = sp->xvec[sp->len - 1];
2294be0f11e22b6 Florian Westphal 2018-12-18  218  	} else {
f53c723902d1ac5 Steffen Klassert 2017-12-20  219  		x = skb_dst(skb)->xfrm;
2294be0f11e22b6 Florian Westphal 2018-12-18  220  	}
38320c70d282be1 Herbert Xu       2008-01-28  221  
cac2661c53f35cb Steffen Klassert 2017-01-17  222  	tmp = ESP_SKB_CB(skb)->tmp;
c3198822c6cb9fb Dragos Tatulea   2024-03-08  223  	esp_ssg_unref(x, tmp, skb);
cac2661c53f35cb Steffen Klassert 2017-01-17  224  	kfree(tmp);
f53c723902d1ac5 Steffen Klassert 2017-12-20  225  
f53c723902d1ac5 Steffen Klassert 2017-12-20  226  	if (xo && (xo->flags & XFRM_DEV_RESUME)) {
f53c723902d1ac5 Steffen Klassert 2017-12-20  227  		if (err) {
f53c723902d1ac5 Steffen Klassert 2017-12-20  228  			XFRM_INC_STATS(xs_net(x), LINUX_MIB_XFRMOUTSTATEPROTOERROR);
f53c723902d1ac5 Steffen Klassert 2017-12-20  229  			kfree_skb(skb);
f53c723902d1ac5 Steffen Klassert 2017-12-20  230  			return;
f53c723902d1ac5 Steffen Klassert 2017-12-20  231  		}
f53c723902d1ac5 Steffen Klassert 2017-12-20  232  
f53c723902d1ac5 Steffen Klassert 2017-12-20  233  		skb_push(skb, skb->data - skb_mac_header(skb));
f53c723902d1ac5 Steffen Klassert 2017-12-20  234  		secpath_reset(skb);
f53c723902d1ac5 Steffen Klassert 2017-12-20  235  		xfrm_dev_resume(skb);
f53c723902d1ac5 Steffen Klassert 2017-12-20  236  	} else {
e27cca96cd68fa2 Sabrina Dubroca  2019-11-25 @237  		if (!err &&
0c0eef8ccd2413b Sabrina Dubroca  2026-02-24  238  		    x->encap && x->encap->encap_type == TCP_ENCAP_ESPINTCP) {
0c0eef8ccd2413b Sabrina Dubroca  2026-02-24  239  			err = esp_output_tail_tcp(x, skb);
0c0eef8ccd2413b Sabrina Dubroca  2026-02-24  240  			if (err != -EINPROGRESS)
0c0eef8ccd2413b Sabrina Dubroca  2026-02-24  241  				kfree_skb(skb);
0c0eef8ccd2413b Sabrina Dubroca  2026-02-24  242  		} else {
1620c88887b1694 Steffen Klassert 2025-01-16  243  			xfrm_output_resume(skb_to_full_sk(skb), skb, err);
38320c70d282be1 Herbert Xu       2008-01-28  244  		}
f53c723902d1ac5 Steffen Klassert 2017-12-20  245  	}
0c0eef8ccd2413b Sabrina Dubroca  2026-02-24  246  }
38320c70d282be1 Herbert Xu       2008-01-28  247  

:::::: The code at line 237 was first introduced by commit
:::::: e27cca96cd68fa2c6814c90f9a1cfd36bb68c593 xfrm: add espintcp (RFC 8229)

:::::: TO: Sabrina Dubroca <sd@queasysnail.net>
:::::: CC: Steffen Klassert <steffen.klassert@secunet.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
