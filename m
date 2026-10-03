Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C186547F2F9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 16:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791044446; cv=none; b=dHJ0sYXQiulqHt0WiP2S4trW9RWMsgKwkAuuGo+w213Fr/FI8YjEbllaP8oqhZ3u+pmR0eBfInKFUIsuEGlaQ+RvfWzdppIP85azoMuCvn+394pr+fKf7GGREOy7aoLk+xLYyS9AqN8b8CtseZ/oTbjyBB4dOod8UE/DeZXJPXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791044446; c=relaxed/simple;
	bh=GIeMCZjn0exVWznnkOU0afnEMeTwNuCu7t67KJ8qco8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eRGE1wpbEplxBfirOwEsmZmNgpZRP33l5lz7Yq27mwktAEa4t8rBlnRTG1aM17SoQ9iYTf4/5XXlXCpAWc+GB03ZlmpgTvC7mVTzRqqKpuKJialRvjMYhfHNH+hMEllbTN31RRFb39s7yqWaugIBnHS7XSUgKZXcXnhYxLne10I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOCv4uWQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOCv4uWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791044445; x=1822580445;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GIeMCZjn0exVWznnkOU0afnEMeTwNuCu7t67KJ8qco8=;
  b=FOCv4uWQ1UuIicjo6ElJsp2QzGgbizKS+pTx+KHiMcq3rsli8cb9Ill6
   iZstrtifx3SUoF01NAr7WJIoKw4hWuGoTiSC3SK6hhWSV1xIXu3AZHQKE
   J6Ay8Ml6VCuzsDInaUh1TmMAXES2llgwyVocwidXcloFSa7ARcztHWlqb
   IRfReSakI/3yFmzNsGY2tOrSyViCjFRvabgxbinGDWrLomK/BiyHNTSJI
   NA94HPtNKrrK6d7NqXG+zdDBw2MO4PuM4Ci4D7hwqq7RnzHnvxxvupM26
   atEs9ZaHiq++l3EvCQ95gwbuu4Vo7F2O5uODODWfACKACFrQSvLNbeUVt
   Q==;
X-CSE-ConnectionGUID: H4JitkpiT/i6FKpeJBFrBQ==
X-CSE-MsgGUID: gPyR25/BSyaeSw+/AUd4/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="91885727"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="91885727"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 09:20:42 -0700
X-CSE-ConnectionGUID: je1LqHNXSyWg+1NztxAkZQ==
X-CSE-MsgGUID: gFT25ORMSa2gsajVgzMZ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="275989037"
Received: from igk-lkp-server01.igk.intel.com (HELO 2bff737dfedc) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 03 Oct 2026 09:20:41 -0700
Received: from kbuild by 2bff737dfedc with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xD2TW-0000000003d-0PCv;
	Sat, 03 Oct 2026 16:20:38 +0000
Date: Sat, 03 Oct 2026 18:20:23 +0200
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 85/142] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202610031848.IB3Mr5Ko-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   7998b6e929bb20ed66acafa33720d8e3533e1598
commit: 7ae1023697440325da923bf10668f25017db293a [85/142] Add a ZTE RTC dri=
ver
reproduce: (https://download.01.org/0day-ci/archive/20261003/202610031848.I=
B3Mr5Ko-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#55: FILE: drivers/rtc/rtc-zx23.c:6:
+ * Copyright 2026 Stefan D=C3=B6singer
+*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
