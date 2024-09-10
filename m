Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF33219F3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 05:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725944715; cv=none; b=sxm6zL1pFXeoi//IviaT/i293PT9mu+h10SWSOIel5GmFvN4Who+dg2hsLoULM5j2gqjCQgo2VdGXAoEnH86er0MXeyCsewmb0moszY9jrfLQ+ILytWaf01PggGceyiu02o7cY/VELtZaZn75k4Yy+gtpqiBJZTsOcCYAx9SP2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725944715; c=relaxed/simple;
	bh=uCo5M06O2HSECHkFl6O3zVBCWfZfG6cHawVFotkAV3E=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=VSZZlzgW+awQmeiIeVDdEjjqZG7IyklJ57u5RqhBFYoGU9StO9YcLdnfTlsIGmnhSDUdKfWd4GeZzPW4nqdwY4e+v50iO54Rs/VnyZMink7X5U2dm0bVgR7rp8non56BTYTx1tkiniRXM/GfwOrjkaKodgth1EMPrWrCR698pX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=JCGcA7Q8; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="JCGcA7Q8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8IlNRdZnleS0YR0q7MNfHiLXqbbjDyk109AJREa1AYA=;
  b=JCGcA7Q899SmRPN+eBWPzCWhqoG/3IJiyXagKgGDGvu5/UiMvtlSUt0z
   IO+cxprsn1ZAHzbGG8pSheHyVNrUCY3zUMfIbg7UHOlj6XcX3H6RvEzO4
   7Q7g8JvIcAqrJkZQjI9P+srcaIzHS+kpn2kBg6k+4cqh2/raBHXTr2AgM
   Q=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.10,216,1719871200"; 
   d="scan'208";a="182285512"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 07:04:02 +0200
Date: Tue, 10 Sep 2024 07:04:01 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Breno Leitao <leitao@debian.org>, Jakub Kicinski <kuba@kernel.org>, 
    Vladimir Oltean <vladimir.oltean@nxp.com>
cc: linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: drivers/soc/fsl/qbman/qman.c:2421:19-26: opportunity for
 str_plural(err_cnt) (fwd)
Message-ID: <alpine.DEB.2.22.394.2409100703150.3383@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Tue, 10 Sep 2024 11:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/soc/fsl/qbman/qman.c:2421:19-26: opportunity for
    str_plural(err_cnt)

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Breno Leitao <leitao@debian.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bc83b4d1f08695e85e85d36f7b803da58010161d
commit: 782fe08e9861d00ce8aca370453dd9ceb9a23d50 soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
date:   8 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 weeks ago
config: sparc-randconfig-r062-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101138.v3FBr5hk-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409101138.v3FBr5hk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/soc/fsl/qbman/qman.c:2421:19-26: opportunity for str_plural(err_cnt)

vim +2421 drivers/soc/fsl/qbman/qman.c

c535e923bb97a4 Claudiu Manoil 2016-09-22  2408
c535e923bb97a4 Claudiu Manoil 2016-09-22  2409  void qman_init_cgr_all(void)
c535e923bb97a4 Claudiu Manoil 2016-09-22  2410  {
c535e923bb97a4 Claudiu Manoil 2016-09-22  2411  	struct qman_cgr cgr;
c535e923bb97a4 Claudiu Manoil 2016-09-22  2412  	int err_cnt = 0;
c535e923bb97a4 Claudiu Manoil 2016-09-22  2413
c535e923bb97a4 Claudiu Manoil 2016-09-22  2414  	for (cgr.cgrid = 0; cgr.cgrid < CGR_NUM; cgr.cgrid++) {
c535e923bb97a4 Claudiu Manoil 2016-09-22  2415  		if (qm_modify_cgr(&cgr, QMAN_CGR_FLAG_USE_INIT, NULL))
c535e923bb97a4 Claudiu Manoil 2016-09-22  2416  			err_cnt++;
c535e923bb97a4 Claudiu Manoil 2016-09-22  2417  	}
c535e923bb97a4 Claudiu Manoil 2016-09-22  2418
c535e923bb97a4 Claudiu Manoil 2016-09-22  2419  	if (err_cnt)
c535e923bb97a4 Claudiu Manoil 2016-09-22  2420  		pr_err("Warning: %d error%s while initialising CGR h/w\n",
c535e923bb97a4 Claudiu Manoil 2016-09-22 @2421  		       err_cnt, (err_cnt > 1) ? "s" : "");
c535e923bb97a4 Claudiu Manoil 2016-09-22  2422  }
c535e923bb97a4 Claudiu Manoil 2016-09-22  2423

:::::: The code at line 2421 was first introduced by commit
:::::: c535e923bb97a4b361e89a6383693482057f8b0c soc/fsl: Introduce DPAA 1.x QMan device driver

:::::: TO: Claudiu Manoil <claudiu.manoil@nxp.com>
:::::: CC: Scott Wood <oss@buserror.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
