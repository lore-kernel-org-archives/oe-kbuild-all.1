Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3DA79F2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 02:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764557785; cv=none; b=WgB1qrux3Gz6j/l6zlTMKMnQdSaxcd/4FWht9xuy5j/F4HO3JVVX2Y2AQNeL7hb+Tq2qvnWDXL3TfaAJnMIozpVeZUHjavJT8PrL/ZriqCqu4NHAwwh/+xJKkQnQ9jGA4bp893sa3PB7YdghrdoQ4LEMKbDpPbNFXSHwhTWEJkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764557785; c=relaxed/simple;
	bh=MlwwlhjS7FR2O91milX009UXD1cnGv0IKFvA+bgTM3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TFoFt8laFJ+DgyrOP6qz3PUir9JPKZaCVBc8sClyqkBWWAsh8PLpTI6EG6hJGtuxnYRf+sUFah1VKukOyuZUQoqjFc7z9NhgfNw5drbwYJs8zsI6iWcN9CW1DO0kCxczCo2/Zh50/CMjCSwVn2BjuAHYLw1ALwDIXOf4wyk3fdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5bcqYsg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5bcqYsg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764557784; x=1796093784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MlwwlhjS7FR2O91milX009UXD1cnGv0IKFvA+bgTM3Q=;
  b=H5bcqYsgCDfEDATemyID1qv1vZ12FoDXA9PjdwS5ASBOFFvucnTwUBrd
   fv4RZNv2wIssRcSq3QCqG14gb7ddlh5Wg7PzQRi4M5y637FIAtHstTiry
   ZKzjc03N2m+/tPdacGunag4hQGGIc1IlL8N96CY8Dmh7InNOMRhc57eju
   dGUSspbwgoi+v0pVAqk62MfQD5OwBP/Et/aXmyjElD0Kzn2XV2sQludyv
   7G2sF9p9vHpmRBvzyu4Wv2sGCiSdm7ssgbLRkibazRJq6cOJIZPoL5D12
   uDurTaLUTQWjtgvLAFfwmErK8H4U9XPJY8ikmssvS0EjvhDN4QwzrxvIz
   g==;
X-CSE-ConnectionGUID: UHP0BQy6RHGEgw2yN6NRkA==
X-CSE-MsgGUID: 3cIDlOKSTNSm/rfzGJqbMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="69078888"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="69078888"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 18:56:24 -0800
X-CSE-ConnectionGUID: m5btEOVZRFKn7l7qby5B4Q==
X-CSE-MsgGUID: g45udkRdT4qhgYdquSD0mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="199067416"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 30 Nov 2025 18:56:22 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPu5M-000000002cb-1h03;
	Mon, 01 Dec 2025 02:56:20 +0000
Date: Mon, 1 Dec 2025 03:55:50 +0100
From: kernel test robot <lkp@intel.com>
To: Konstantin Sinyuk <konstantin.sinyuk@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Koby Elbaz <koby.elbaz@intel.com>
Subject: [habanaai-drivers-accel-habanalabs:habanalabs-next 8/17]
 versioncheck: ./drivers/accel/habanalabs/common/habanalabs.h: 16
 linux/version.h not needed.
Message-ID: <202512010329.gMw4d14E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/HabanaAI/drivers.accel.habanalabs.kernel habanalabs-next
head:   7dafc58c0da3fa475f72a64c5dbdeaddea7a9583
commit: bd6c1eb119bea48bd1a1c29cf82c6965fae41cae [8/17] accel/habanalabs: add On-Demand Paging (ODP) infrastructure
reproduce: (https://download.01.org/0day-ci/archive/20251201/202512010329.gMw4d14E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512010329.gMw4d14E-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.0/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/accel/habanalabs/common/habanalabs.h: 16 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 449: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
