Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FBB210EF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 08:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/izJAEe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700640541; x=1732176541;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nek6soKSopcJV/8dVbzp05Yd9W9v1jwhcG1a6uJG9UI=;
  b=d/izJAEeJXwpLYLVUgyRo9OXodb8LvwhnILpXzdOEkg/Yi6/jnlu7TCB
   7o4BzXTRoWBrCplaibBC5Se4MF9+DnZB9DjXaiG5N9PdyYxgPRmjcOWVp
   z30KssxpDRg6EcaKAtG+uKiANpciVTJehckbGeddEzR/V6eOz0+wKEemf
   G8cEeSMo/A0xY5CtYZF5i49H0FIcPMeQFgKYdymhugtKSsnLv+iMud5ny
   mjslbpvK0Ql83mizxhEFps/12qUoA+8QMDyKi30pQZGQ3LcYAqAhIvlKX
   usCy7H0Wn9kIFjaBUq3zuoISd59SkQLxuvvSPw1S0olefpC3jNNwuO7H6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="10670214"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="10670214"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 00:08:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="743319820"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="743319820"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Nov 2023 00:08:56 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5iI2-0000Fp-19;
	Wed, 22 Nov 2023 08:08:54 +0000
Date: Wed, 22 Nov 2023 16:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 10/19] kismet: WARNING: unmet direct dependencies
 detected for CRYPTO_RSA when selected by PCI_CMA
Message-ID: <202311221438.5tWqv7Cc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/l1k/linux spdm-future
head:   cbb2ced8afdead342cd231ec248f9ea65353ab1e
commit: c0c99a1cfb6a7a8fba75aa194c89d9a5f531af6c [10/19] PCI/CMA: Authentic=
ate devices on enumeration
config: alpha-kismet-CONFIG_CRYPTO_RSA-CONFIG_PCI_CMA-0-0 (https://download=
=2E01.org/0day-ci/archive/20231122/202311221438.5tWqv7Cc-lkp@intel.com/conf=
ig)
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311221438.5=
tWqv7Cc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221438.5tWqv7Cc-lkp@i=
ntel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_RSA when =
selected by PCI_CMA
   /usr/bin/grep: /db/releases/20231122101355/kernel-tests/etc/kcflags: No =
such file or directory
   {"timestamp":"2023-11-22 13:50:00 +0800", "level":"WARN", "event":"kbuil=
d.sh:3942:in `add_etc_kcflags': grep exit 2 (ShellError)", "detail":"cmd: '=
/usr/bin/grep' '-v' '-e' '^#' '-e' '^$' '/db/releases/20231122101355/kernel=
-tests/etc/kcflags' \nstderr: /usr/bin/grep: /db/releases/20231122101355/ke=
rnel-tests/etc/kcflags: No such file or directory\n\n", "hostname":"communi=
ty-kbuild-consumer-148", "host_hostname":"lkp-worker55", "call_stack":"/zda=
y/kernel-tests/lib/kbuild.sh:3942:in `add_etc_kcflags': /usr/bin/grep: /db/=
releases/20231122101355/kernel-tests/etc/kcflags: No such file or directory=
 (ShellError 2)\n  from /zday/kernel-tests/lib/kbuild.sh:3971: setup_kcflag=
s\n  from /zday/kernel-tests/lib/kbuild.sh:4016: invoke_make\n  from /zday/=
kernel-tests/lib/kbuild.sh:4122: make\n  from /zday/kernel-tests/lib/kbuild=
=2Esh:5623: make_config_allyes\n  from /zday/kernel-tests/common.sh:209: re=
direct_error_to_screen\n  from /zday/kernel-tests/common.sh:217: redirect_c=
ommand_errors\n  from /zday/kernel-tests/lib/kbuild.sh:5630: make_config\n =
 from /zday/kernel-tests/lib/builder/kismet.sh:156: generate_make_olddefcon=
fig_warnings\n  from /zday/kernel-tests/lib/builder/kismet.sh:297: builder_=
compile\n  from /zday/kernel-tests/bisect-test-build-error.sh:94: main\n"}
  =20
   WARNING: unmet direct dependencies detected for CRYPTO_ECDSA
     Depends on [n]: CRYPTO [=3Dn]
     Selected by [y]:
     - PCI_CMA [=3Dy] && PCI [=3Dy]
  =20
   WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE
     Depends on [n]: CRYPTO [=3Dn] && KEYS [=3Dy]
     Selected by [y]:
     - SPDM_REQUESTER [=3Dy]
  =20
   WARNING: unmet direct dependencies detected for ASYMMETRIC_PUBLIC_KEY_SU=
BTYPE
     Depends on [n]: CRYPTO [=3Dn] && ASYMMETRIC_KEY_TYPE [=3Dy]
     Selected by [y]:
     - SPDM_REQUESTER [=3Dy]
  =20
   WARNING: unmet direct dependencies detected for X509_CERTIFICATE_PARSER
     Depends on [n]: CRYPTO [=3Dn] && ASYMMETRIC_KEY_TYPE [=3Dy] && ASYMMET=
RIC_PUBLIC_KEY_SUBTYPE [=3Dy]
     Selected by [y]:
     - SPDM_REQUESTER [=3Dy]
  =20
   WARNING: unmet direct dependencies detected for CRYPTO_RSA
     Depends on [n]: CRYPTO [=3Dn]
     Selected by [y]:
     - PCI_CMA [=3Dy] && PCI [=3Dy]
  =20
   WARNING: unmet direct dependencies detected for CRYPTO_SHA512
     Depends on [n]: CRYPTO [=3Dn]
     Selected by [y]:
     - PCI_CMA [=3Dy] && PCI [=3Dy]
  =20
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=3Dn]
     Selected by [y]:
     - PCI_CMA [=3Dy] && PCI [=3Dy]

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
