Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8A51AD9D9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jul 2024 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722431506; cv=none; b=tSrUJpIJt1mgVzmx8lG6hTyLT0S4jPam+8K6SBxTyiyMZyx20FUkI9PZXENS7Z85LNggYnD3incMWuotZj3B5Zv4HasMj6McIO3zHWPNAhdIwcFQfyOGu4q9HvL402+FqJaWDE/SoQOk0aTUjEJgFSUi6lVim+53/NTF2XXHnCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722431506; c=relaxed/simple;
	bh=By9ZMF8i7bFnJ7oseZVgZ4Ip5ORUl4uzykyHVIscDAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GrxzWmnUHlGzXLjU5w41QkSaVpWnJ3GuZpbsTH7569ci6EqDuOWRyANVxSwUTsQIJsJQTJTKWwsucrnpzyRoz1DbD5LMn6tB1b063C33Q2br91JvznI37lyxiWYbqTLmXFaZY7juL9LUpl4Z3U7b6w/2Jz0WCqxGXyjI4tZqo3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hc+RXQAR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hc+RXQAR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722431502; x=1753967502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=By9ZMF8i7bFnJ7oseZVgZ4Ip5ORUl4uzykyHVIscDAk=;
  b=hc+RXQARdD2q+LX0ZE6z5oYMLmR/+jGD4JMpkd1KGRy3TiLbNEhaWyxH
   pOKvKj8w0O4RE6aeVZEhxuXOLtHFIx07vNfPSmHpqALahPcglg/ghNrIz
   q+ioAB0bw+JPFfzulvtZ+mIHaj2gXsenKB2+gHazkMv4aP93hq/N3Vu0R
   s9cU18t5Eye9nRbecu6kWiCr9P7WNbE1p5F+1o4Cv7GSlN0awxNOxxW4Y
   +wHt4CFX7CEs4IvPE5CQoxd7E6MwbnTbHUyWI7h5oeMgSueeoCBRHpCca
   Fl33mVCsZngAxD6mMeo8YAK42krS2kxGdJiMTMPRMmKEwuFEFb6TPQ3tU
   A==;
X-CSE-ConnectionGUID: ITcCdzkWQNqYy/8NvzUB9w==
X-CSE-MsgGUID: yDBlt09HTHKmotpsdaPwgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20123829"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="20123829"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 06:11:41 -0700
X-CSE-ConnectionGUID: OnS/ziWdRSquaFGaWA72RQ==
X-CSE-MsgGUID: 6Vz6zhDURsKn0XQvJicp9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="59484831"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Jul 2024 06:11:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ97B-000uM0-07;
	Wed, 31 Jul 2024 13:11:37 +0000
Date: Wed, 31 Jul 2024 21:11:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20240729-cbc-2 8/9]
 ./usr/include/scsi/fc/fc_els.h:1130:16: error: implicit declaration of
 function 'offsetof'
Message-ID: <202407312111.pIdI9KGE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20240729-cbc-2
head:   7028047dd569cc1fc6fcda22626a7c85347fadbd
commit: 06621fb3befe6bcfd46d10a14ea18b22b9daa740 [8/9] scsi: fc: Avoid -Wflex-array-member-not-at-end warnings
config: x86_64-buildonly-randconfig-004-20240731 (https://download.01.org/0day-ci/archive/20240731/202407312111.pIdI9KGE-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407312111.pIdI9KGE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407312111.pIdI9KGE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/scsi/fc/fc_els.h:1130:16: error: implicit declaration of function 'offsetof' [-Werror=implicit-function-declaration]
    1130 | _Static_assert(offsetof(struct fc_df_desc_fpin_reg, desc_tags) == sizeof(struct fc_df_desc_fpin_reg_hdr),
         |                ^~~~~~~~
   ./usr/include/scsi/fc/fc_els.h:13:1: note: 'offsetof' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
      12 | #include <asm/byteorder.h>
     +++ |+#include <stddef.h>
      13 | 
>> ./usr/include/scsi/fc/fc_els.h:1130:25: error: expected expression before 'struct'
    1130 | _Static_assert(offsetof(struct fc_df_desc_fpin_reg, desc_tags) == sizeof(struct fc_df_desc_fpin_reg_hdr),
         |                         ^~~~~~
>> ./usr/include/scsi/fc/fc_els.h:1130:16: error: expression in static assertion is not an integer
    1130 | _Static_assert(offsetof(struct fc_df_desc_fpin_reg, desc_tags) == sizeof(struct fc_df_desc_fpin_reg_hdr),
         |                ^~~~~~~~
   ./usr/include/scsi/fc/fc_els.h:1148:25: error: expected expression before 'struct'
    1148 | _Static_assert(offsetof(struct fc_els_rdf, desc) == sizeof(struct fc_els_rdf_hdr),
         |                         ^~~~~~
   ./usr/include/scsi/fc/fc_els.h:1148:16: error: expression in static assertion is not an integer
    1148 | _Static_assert(offsetof(struct fc_els_rdf, desc) == sizeof(struct fc_els_rdf_hdr),
         |                ^~~~~~~~
   cc1: some warnings being treated as errors

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
