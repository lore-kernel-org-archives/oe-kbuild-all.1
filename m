Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3B32B9D7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 May 2024 18:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715709652; cv=none; b=dTfGvjXOyIFwwieQxIbXe7olsRucMeMnjMKrQjSU6zE9V9PzXXHp7e+B1UZkGuccLd0XmQJ7axDGxHB5O2lq+QkAkDIwY71T8A2Ncut4XCeTXm0zqyBEjDYjXtGxaYLbIix/2GzCNcUtXDOXQdKLM533KvvegvWcP4gpQkh28Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715709652; c=relaxed/simple;
	bh=OGpRyZ/xPMIHRsmi6c1eJ2/kfWZqx2qI9L8FodeyrWI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y2pzavoxokPB1olXsG1u0ndAQkqxptnhRo/xH+YMzPwHogmvan/bc2v/lzJD1ksYeAgQoS8HFZ8z3KLAIqK0+f8bVq+jySVUX5lobxlEhe5hgOmGpgI1AThb+HP47yQKpOFRKPHRykd/E1925YL6r/XvaPmouufbWvWjGAHu8wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UnxAoTbT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UnxAoTbT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715709651; x=1747245651;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=OGpRyZ/xPMIHRsmi6c1eJ2/kfWZqx2qI9L8FodeyrWI=;
  b=UnxAoTbTUOWG1U6KC/lwHxn0pQIg/p2/aLBxEZUTN2mysCqaUwk50zQS
   ay3sNTeTSYkbOQkr1VWFChWDORxPmVc2woUD5ZdoLqk0Lve+ftd2/XPua
   YNx31CX1ky5aM2zS0Ur+afKC8hd+EYTni10JWCoAb0IEVaVXT8apjU1AB
   wYRaw1PeXkNhaH7KFN1XVDo4y6IZqIduJc3Q/zAgK11UsRRHiHibQCfjT
   YEqnidBHyeU4WKZ9Q5X5yesPj3HNMDSulz2BsfWFoFiVYf4XfUPlnSQQ/
   d5IyTqM9xWptuE2CGnjGM6JdqZivQxMAq/gQLztFee6xxtcqfdH0YYREK
   Q==;
X-CSE-ConnectionGUID: /H9xhQygQbaeQkqv832Qtw==
X-CSE-MsgGUID: ncOYsB0bQfyfaW7k5JUjgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="34226050"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="34226050"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 11:00:50 -0700
X-CSE-ConnectionGUID: Yj5QTkj2T5mBOiAEIF8K4Q==
X-CSE-MsgGUID: Yo9PBNzwTkmEhaVuwY7mVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="35645007"
Received: from spandruv-desk1.amr.corp.intel.com ([10.255.230.54])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 11:00:50 -0700
Message-ID: <2880b55bbe08e3ef7762b47b3531cd29f785eedd.camel@linux.intel.com>
Subject: Re: [linux-next:master 8353/12793]
 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.o: warning:
 objtool: map_partition_power_domain_id() falls through to next function
 get_instance()
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Linux Memory Management List
	 <linux-mm@kvack.org>, Hans de Goede <hdegoede@redhat.com>, Zhang Rui
	 <rui.zhang@intel.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>
Date: Tue, 14 May 2024 11:00:50 -0700
In-Reply-To: <202405141321.RQmskiTj-lkp@intel.com>
References: <202405141321.RQmskiTj-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2024-05-14 at 14:05 +0800, kernel test robot wrote:
> tree:=C2=A0=C2=A0
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=C2=A0=
m
> aster
> head:=C2=A0=C2=A0 6ba6c795dc73c22ce2c86006f17c4aa802db2a60
> commit: 9d1d36268f3d8276aefd1fad4e0a415dc8c36edd [8353/12793]
> platform/x86: ISST: Support partitioned systems
> config: x86_64-randconfig-101-20240514
> (https://download.01.org/0day-ci/archive/20240514/202405141321.RQmski
> Tj-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=3D1 build):
> (https://download.01.org/0day-ci/archive/20240514/202405141321.RQmski
> Tj-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes:
> > https://lore.kernel.org/oe-kbuild-all/202405141321.RQmskiTj-lkp@intel.c=
om/
>=20
> All warnings (new ones prefixed by >>):
>=20
> > > drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.o:
> > > warning: objtool: map_partition_power_domain_id() falls through
> > > to next function get_instance()
>=20

Not able to reproduce on two gcc versions on Fedora and Ubuntu
distribution.
gcc --version
gcc (GCC) 13.2.1 20240316 (Red Hat 13.2.1-7)

gcc --version
gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0


The documentation for this error:
https://elixir.bootlin.com/linux/latest/source/tools/objtool/Documentation/=
objtool.txt

"
8. file.o: warning: objtool: funcA() falls through to next function
funcB()

 This means that funcA() doesn't end with a return instruction or an
  unconditional jump, and that objtool has determined that the function
   can fall through into the next function.

"

This function ends with " return -EINVAL;"

Also the three reasons in the documentation is also not met.



make W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash
make[1]: Entering directory '/home/spandruv/development/linux-
next/build_dir'
  GEN     Makefile
  CALL    ../scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  DESCEND bpf/resolve_btfids
  INSTALL libsubcmd_headers
  CHK     kernel/kheaders_data.tar.xz
  CC [M]  drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.o
  MODPOST Module.symvers
...

  TEST    posttest
arch/x86/tools/insn_decoder_test: success: Decoded and checked 8715543
instructions
  TEST    posttest
arch/x86/tools/insn_sanity: Success: decoded and checked 1000000 random
instructions with 0 errors (seed:0x5e80fa20)
Kernel: arch/x86/boot/bzImage is ready  (#1)
  LD [M]  drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.ko
  BTF [M] drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.ko
..
make[1]: Leaving directory '/home/spandruv/development/linux-
next/build_dir'


Thanks,
Srinivas

