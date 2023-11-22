Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03F64D13A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 14:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjLH3ZeP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700664549; x=1732200549;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nQR97xFjLhUXzt4RJYiK2XWSOvLYdu+/d9Mchjb6W2A=;
  b=fjLH3ZePfJaL7kSJrHB6RVa/lfv0ognPiDwqdJXZ5/7dojks3x2c483r
   8qnzacewIQyupgcTdgtfNd0ztdgKAuT2CJra35X3JBcvoClazBsDhAZO2
   E4HqcMrSK70qDdeZUdal0xpUpWhP/4reakgKu7quSHa6Af81xkwT6adf/
   q+FhkLnt/P9jkN7ufosEzNdqitqfLYjldNtdtBlPfjUJ2fjuZLN1BUUwk
   1CWZPhWbBmoG+47TYsqG7Ly/51r+02OPfIoLOvYgDnVjTpAiXkPWu6GXK
   iq8n19HlbF9ENk9m47MXEAQC884S80O+R2Lhl8rZmG57yDE8ALjTSzSgJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478269618"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="478269618"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 06:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="15284541"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2023 06:49:04 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5oXG-0000ZX-0h;
	Wed, 22 Nov 2023 14:49:02 +0000
Date: Wed, 22 Nov 2023 22:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 10/19] kismet: WARNING: unmet direct dependencies
 detected for CRYPTO_SHA256 when selected by PCI_CMA
Message-ID: <202311221917.FEUjRkys-lkp@intel.com>
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
config: alpha-kismet-CONFIG_CRYPTO_SHA256-CONFIG_PCI_CMA-0-0 (https://downl=
oad.01.org/0day-ci/archive/20231122/202311221917.FEUjRkys-lkp@intel.com/con=
fig)
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311221917.F=
EUjRkys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221917.FEUjRkys-lkp@i=
ntel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_SHA256 wh=
en selected by PCI_CMA
   /usr/bin/grep: /db/releases/20231122101355/kernel-tests/etc/kcflags: No =
such file or directory
   {"timestamp":"2023-11-22 18:28:14 +0800", "level":"WARN", "event":"kbuil=
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
