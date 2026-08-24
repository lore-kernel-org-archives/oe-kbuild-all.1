Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEB2364042
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 05:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548197; cv=none; b=N6bgj2YBZMYVJKZHt7Q23eFPlejjGfUEPKBETZQn0IvlubaIWGoRgpOW2TZTLJXnB+vKCQLsBfDDeKSU9rqOWlSJJuTTrfrCbpLlTv/ST6HVj11rtMWf+mk4SYd3+XHpD632+LnzRTFepi0pwuw3HK4yI1RnPZfbTzRad5flzGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548197; c=relaxed/simple;
	bh=GxNO+qsymD6De4pGyXfuYg9sTEiWod9UnJP0MPkHhyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Z01eZupvr0j7eevEICGkOgkq29pYnU7xxh5FfH1b+dWh0/0MJjRTZkQkEJRjmMIf5+WZq/vRZ8PIFOZeY76A7/o2oJ3ybutNpWJ9yWrMQOdpBXQf03omzgyp1tTVnQhzSLZwN58PcCo2c9aM86FpYTRrRbE9iusTL2AYVqZecsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4Lq0BPT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4Lq0BPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787548193; x=1819084193;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GxNO+qsymD6De4pGyXfuYg9sTEiWod9UnJP0MPkHhyA=;
  b=H4Lq0BPTBPF0UWSBBUe2q298ykKRahvLOmhfxjL/eLVtqiBx+fYooNzI
   piR+mWn5mT/6x54IgF82lfFEsjuVPN0+fUdkYNdLgy5ClgQrOrMu5GhG6
   6TlIes8Fk8pMtKFqyRaPD6Xg8SI4URdLyuOv6bowzOczxJutgylEDRW2w
   VVbhW7X1Wk3uKdi79B9ueE33RGjP0ai3NqL2eLCp+xWxLcQkIt3nNWzCP
   Qf+IKlHrcAnzLhtcvfpCBfTe8jTbClIq5OOYRsbqF2Bw+UJ1I/fZB+A3q
   IjHpLq7VxnHaf7Q7kCJrBruvXVF0jh1rWGXVE3EawlQjcyDZa75CMdGIN
   g==;
X-CSE-ConnectionGUID: 4pQDQZxoTwavSxoaLcHglA==
X-CSE-MsgGUID: uLbQb1TgSAWnBVXooqUlcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91665341"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="91665341"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 22:09:53 -0700
X-CSE-ConnectionGUID: UYxxw4D/QvyGWAwYyJNvxg==
X-CSE-MsgGUID: 0cF/qHWSQQWYH9wLjoB2Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="263623179"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 23 Aug 2026 22:09:51 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyMwP-000000000HH-3g0p;
	Mon, 24 Aug 2026 05:09:49 +0000
Date: Mon, 24 Aug 2026 07:08:56 +0200
From: kernel test robot <lkp@intel.com>
To: Weijie Yuan <wy@wyuan.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst:773:
 WARNING: duplicate label kernel_org_trust_repository, other instance in
 Documentation/process/maintainer-pgp-guide.rst
Message-ID: <202608240726.cBe6kj27-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/intel-lab-lkp/linux/commits/Weijie-Yuan/docs-zh_=
CN-clarify-free-Nitrokey-requirements/20260821-011321
head:   a88007053f65ab396839b4e3084e6925a9be0894
commit: a88007053f65ab396839b4e3084e6925a9be0894 docs/zh_CN: add kernel.org=
 trust repository reference
date:   3 days ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260824/202608240726.c=
Be6kj27-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240726.cBe6kj27-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
   WARNING: ./include/net/page_pool/types.h:105 Excess struct member 'fast'=
 description in 'page_pool_params' (did you mean one of: 'flags', 'offset')
   WARNING: ./include/net/page_pool/types.h:105 Excess struct member 'slow'=
 description in 'page_pool_params'
   WARNING: ./security/landlock/ruleset.h:48 Excess struct member 'quiet' d=
escription in 'landlock_layer' (did you mean one of: 'flags.quiet')
   WARNING: ./security/landlock/ruleset.h:48 Excess struct member 'quiet' d=
escription in 'landlock_layer' (did you mean one of: 'flags.quiet')
>> Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst:773: W=
ARNING: duplicate label kernel_org_trust_repository, other instance in Docu=
mentation/process/maintainer-pgp-guide.rst
   Documentation/userspace-api/landlock:550: ./security/landlock/errata/abi=
-4.h:5: ERROR: Unexpected section title.


vim +773 Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst

a88007053f65ab Weijie Yuan 2026-08-21  771 =20
87ef333c0c046b Yanteng Si  2023-11-20  772  =E4=BD=BF=E7=94=A8 kernel.org =
=E4=BF=A1=E4=BB=BB=E7=BD=91=E4=BB=93=E5=BA=93
87ef333c0c046b Yanteng Si  2023-11-20 @773  --------------------------
87ef333c0c046b Yanteng Si  2023-11-20  774 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
